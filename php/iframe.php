<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 
	
	// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php'); 
	}
	
	$errors = array();
	$no='';
	$type='';
	$title='';
	$content='';
	$reply='';
	$ap_status='';
	$file_location='';
	$files_locations_array=array();

		if (isset($_GET['no'])) {

			$no = $_GET['no'];

			$query = "SELECT * FROM emails WHERE no = {$_GET['no']} LIMIT 1";

			$result_set = mysqli_query($connection, $query);

			$result = mysqli_fetch_assoc($result_set);

			$content= $result["content"];
			$ap_status=$result['ap_status'];
			$file_location=$result['file_location'];

			$files_locations_array=explode(",", $file_location);

		}
	

	//chekong submit button pressed or not
	if (isset($_POST['submit'])) {

		$no =$_POST['no'];
		$ap_status=$_POST['ap_status'];
			$mail = "UPDATE  emails SET ap_status = '{$ap_status}' WHERE no = {$no} LIMIT 1";

			$send_email = mysqli_query($connection, $mail);

			//update approval status of the mail
			if ($send_email) {
				header("Location: iframe.php?no=".$no);
			}else{

				$errors[]= 'Failed to update approval status.';
			}

	}


	//chek reply button press or not and process sending reply
	if (isset($_POST['send_reply'])) {
		$no =$_POST['no'];
		$content=$_POST['content'];
		$reply=$_POST['reply'];
		$ap_status=$_POST['ap_status'];


		//checking user is student or not
		if (!strcmp($_SESSION['type'], 'Student')) {

			// checking required fields
			$req_fields = array('reply');
			$errors = array_merge($errors, check_req_fields($req_fields));

		}else{

			// checking required fields
			$req_fields = array('reply','ap_status');
			$errors = array_merge($errors, check_req_fields($req_fields));

		}
		


		if (empty($errors)) {

			if (!strcmp($_SESSION['gender'], "Male")) {
					$title = "Mr.";
				}else{
					$title = "Mrs.";
				}

			$date = date('Y/m/d ');
			$time = date('g:i a');
			$content_1= "<br>" . $content."<p><span>On: {$date}  </span><span> At: {$time} </span></p><p><b>{$title} {$_SESSION['full_name']}</b></p><br>" . $reply . "<br><br>";

			// no errors found... update records
			$content_1 = mysqli_real_escape_string($connection, $content_1);

//Upload new files
			if (!strcmp($_SESSION['type'], 'Student')){
				$countfiles = count($_FILES['fileToUpload']['name']);
				// echo "$countfiles";
				$upload_to='../submissions/';
				$file_location_array=array();
				for ($i=0; $i < $countfiles; $i++) { 
					$file_list=scandir('../submissions/');
					$file_number = count($file_list)-2;
					$file_name=$file_number.'~'.$_FILES['fileToUpload']['name'][$i];
					$file_type=$_FILES['fileToUpload']['type'][$i];
					$file_size=$_FILES['fileToUpload']['size'][$i];
					$temp_name=$_FILES['fileToUpload']['tmp_name'][$i];
					$uploaded=move_uploaded_file($temp_name, $upload_to.$file_name);
					if ($uploaded) {
						$file_location_array[] = $upload_to.$file_name;
					}
				}
				$files_locations=join(",",$file_location_array);
		}
			//choosing senedr is student or Lecturer and add the corresponding details to the query

			if (!strcmp($_SESSION['type'], 'Student')) {
			$mail = "UPDATE  emails SET content = '{$content_1}', date_time = NOW(), sender_is_read = 0 ,receiver_is_read = 1,file_location='{$files_locations}' WHERE no = {$no} LIMIT 1";

			}else{

				$mail = "UPDATE  emails SET content = '{$content_1}', date_time = NOW(), sender_is_read = 0 ,receiver_is_read = 1, ap_status = '{$ap_status}' WHERE no = {$no} LIMIT 1";

			}


			//update the email
			$send_email = mysqli_query($connection, $mail);

			if ($send_email) {
				header("Location: iframe.php?no=".$no);
			}else{

				$errors[]= 'Failed to Send Email.';
			}


		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:wght@600&display=swap" rel="stylesheet">
	<style type="text/css">
		body {
  			overflow: hidden; /* Hide scrollbars */
		}
	</style>
</head>
<body>
	
	<div class="chat">
		<form action="iframe.php" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no" value="<?php echo $no;?>">
			<input type="hidden" name="content" value="<?php echo $content ;?>">

				<div class="chat_History"><!--previous msg view-->
					<p>
						<?php echo $content?>
					</p>	
				</div><!--chat history-->
				
				<br>
			<p>
			<?php 
				if (!empty($errors)) {
					display_errors($errors);
				}

		 	?>
		 		
		 	</p>

		 	<?php  
		 	//make hidden to Studebt users
		 	if (strcmp($_SESSION['type'], 'Student')) {

		 		echo "<div style='padding: 10px; padding-left:150px; color:brown; font-size: 20px;font-weight: bold;''>
			 		<p> Approval Status  :&nbsp&nbsp 
			 		<select name='ap_status' style='width: 165px; padding:8px;outline: none; '>
			 		<option >Select</option>
					<option value=1 <?php echo ($ap_status == 1) ? 'selected' : '';?>>Missing infomation</option>
					<option value=2 <?php echo ($ap_status == 2) ? 'selected' : '';?>>Reject</option>
					<option value=3 <?php echo ($ap_status == 3) ? 'selected' : '';?>>Approve</option>
					</select>
					<button type='submit' name='submit' value='submit' style='color:white; background-color: maroon;padding: 9px;outline: none;'>Submit</button>
					</p>
			 	</div>";
			}	
		 	?>

			<textarea type="text" name="reply" id="rtext" rows="10" cols="80" placeholder="Enter your reply here."><?php echo  $reply ; ?></textarea><!--reply-->
			<button type="submit" name="send_reply" id="reply" value="reply">Reply</button>

			<div class="upload_new_files">
				<?php 
					if (strcmp($_SESSION['type'], 'Lecturer')){ 
						echo"<input class=\"upload file\" type=\"file\" name=\"fileToUpload[]\" id=\"fileToUpload\" size=\"60\" style=\"color: white;\"multiple>";
					}
				?>
			</div><!-- upload_new_files -->
		</form>
	</div><!--chat-->

	<div class="uploaded_files" style="color:white; position: relative; float: left; left: 250px; bottom: 200px;">
		
		<?php 
			if(strlen($file_location)){
				echo "<h4>Uploaded Files</h4><br>";
				foreach ($files_locations_array as $file) {
					$index=strpos($file, "~");
					$file_name=substr($file, $index+1);
					echo "<a href='{$file}' style='color:white;' download>{$file_name}</a><br>";
				}
			}
		 ?>
	</div><!-- uploaded_files -->
<!-- 	<div class="upload_new">
		<form action="iframe.php" method="post" enctype="multipart/form-data">
			
		</form>
	</div> -->
		
</body>
</html>