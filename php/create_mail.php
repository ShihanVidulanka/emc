<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 

// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php');
	}

	 
	$errors = array();
	$type='';
	$user_id = '';
	$last_login='';
	$sender = '';
	$name='';
	$index_no ='';
	$content='';
	$receiver='';

	if (isset($_SESSION['user_id'])) {
		// getting the user information
		$user_id = mysqli_real_escape_string($connection, $_SESSION['user_id']);
		$query = "SELECT * FROM user WHERE id = {$user_id} LIMIT 1";

		$result_set = mysqli_query($connection, $query);

		if ($result_set) {
			if (mysqli_num_rows($result_set) == 1) {
				// user found
				$result = mysqli_fetch_assoc($result_set);
				$sender = $result['email'];
				$last_login=$result['last_login'];
			}

		}else {
			// not looged in user return to logg in
			header('Location: login.php?err=query_failed');
		}
	} 
	if (isset($_POST['send'])) {
		$type=$_POST['type'];
		$sender = $_POST['sender'];
		$name =$_POST['name'];
		$index_no =$_POST['index_no'];
		$content=$_POST['content'];
		$receiver=$_POST['receiver'];

		// checking required fields
		$req_fields = array('name','index_no','type','receiver','content');
		$errors = array_merge($errors, check_req_fields($req_fields));


		// checking email address
		if (!is_email($_POST['receiver'])) {
			$errors[] = 'Email address is invalid.';
		}

		// checking if email address already exists
		$email_1 = mysqli_real_escape_string($connection, $receiver);
		$query_1= "SELECT * FROM user WHERE email = '{$email_1}' LIMIT 1";

		$result_set_1 = mysqli_query($connection, $query_1);

		if ($result_set_1) {
			if (!(mysqli_num_rows($result_set_1) == 1)) {
				$errors[]="Email not exist";

			}else{

				//remove the ability of sending email between students

				$result_1 = mysqli_fetch_assoc($result_set_1);
				// print_r($result_1);
				if((strcmp( $result_1['type'], 'Lecturer') && strcmp( $result_1['type'], 'Admin'))){
					$errors[] = "You cannot send mails to Students.";
				}
			}
		}	

		if (empty($errors)) {

			if (!strcmp($_SESSION['gender'], "Male")) {
					$title = "Mr.";
				}else{
					$title = "Mrs.";
				}

			$date = date('Y/m/d ');
			$time = date('g:i a');
			$content_1="<p><span>On: {$date}  </span><span> At: {$time} </span></p><p><b>{$title} {$_SESSION['full_name']}</b></p><br>" . $content . "<br><br>";
			// no errors found... adding new record
			$sender = mysqli_real_escape_string($connection, $_POST['sender']);
			$type = mysqli_real_escape_string($connection, $_POST['type']);
			$content_1 = mysqli_real_escape_string($connection, $content_1);

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


			// echo("<pre>");
			// print_r($file_location_array);
			// echo "</pre>";
			$files_locations=join(",",$file_location_array);
			echo "$files_locations";

			$mail = "INSERT INTO emails (full_name, index_no, sender, receiver, type, content,  date_time, sender_is_read,receiver_is_read,file_location) VALUES ('{$_SESSION['full_name']}', '{$_SESSION['index_no']}','{$sender}', '{$receiver}', '{$type}', '{$content_1}', NOW(), 1, 0,'{$files_locations}')";


			$send_email = mysqli_query($connection, $mail);

			

			if ($send_email) {

				header('Location:main.php?send_mail=true');
			}else{

				$errors[]= 'Failed to Send Email.';
			}

		}
	}
	// if (isset($_POST['send'])) {
	// 	// echo "<pre>";
	// 	// print_r($_FILES);
	// 	// echo "</pre>";


		
	// }
?>


<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="../css/create_mail.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:wght@600&display=swap" rel="stylesheet">
</head>
<body>
	<div class="profile">
		<img src="../img/userimage.png" id="propic"><!--Profile Picture-->
		<p style="color: white" text align="center"><?php echo $last_login; ?> </p>

		<img src="../img/GroupPhotoWhite.png" id="logo"><!--Logo-->

		<div class="info dropdown"><!--Account name, Id no, Dropdown -->

			<div class="dropbtn"><!--This is for drop down list icon-->

				<h3><?php  echo $_SESSION['index_no']?></h3>
				<h3><?php  echo $_SESSION['full_name']?>
				<i class="fa fa-caret-down"></i>
				</h3>
			</div><!--dropbtn-->
			
			<div class="dropdown-content"><!--DropDown mwnu content-->
	      		<h3><a href="user info.php">Profile</a></h3>
	      		<h3><a href="contact_us.php">Contact us</a></h3>
	      		<h3><a href="aboutus.php">About Us</a></h3>
	    	</div><!--dropdown-content-->

		</div><!--info-->
	</div><!--profile-->
				
	<div>
	<form action="create_mail.php" method="post" enctype="multipart/form-data">
		<div class="send_detail"><!--Msg title list in left side-->
			<input type="hidden" name="sender" value="<?php echo $sender; ?>">
			<?php 
				if (!empty($errors)) {
					display_errors($errors);
				}

		 	?>
			<p>
				<label for="">Enter Name  &emsp;&emsp;&emsp;&ensp;&ensp;: &ensp; </label>
				<input type="text" class="box" name="name" id="" placeholder=" Your Name" required <?php echo 'value="' . $name . '"'; ?>>
			</p>

			<p>
				<label for="">Enter Index Number&ensp;:&ensp;&nbsp;</label>
				<input type="text" class="box" name="index_no" id="" placeholder="ID Number" required <?php echo 'value="' . $index_no . '"'; ?>>
			</p>

			<div class="sel_request">
				<p>
					Select Request Type&ensp;&ensp;:&ensp;&nbsp;
					<select name="type" >
					<option value="0"<?php echo (isset($_POST['type']) && $_POST['type'] == 0) ? 'selected' : '';?>>Select</option>
					<option value="1" <?php echo (isset($_POST['type']) && $_POST['type'] == 1) ? 'selected' : '';?>>Late Add/Drop </option>
					<option value="2" <?php echo (isset($_POST['type']) && $_POST['type'] == 2) ? 'selected' : '';?>>Extend Assignment Submission Deadlines</option>
					<option value="3" <?php echo (isset($_POST['type']) && $_POST['type'] == 3) ? 'selected' : '';?>>Repeat Exams as First Attempt With the Next Batch</option>
					<option value="4" <?php echo (isset($_POST['type']) && $_POST['type'] == 4) ? 'selected' : '';?>>Other</option>
					</select>
				</p>
			</div><!--select_request-->

			<div>
				<p>
					Select Image to Upload&ensp;:<br><br>&emsp;&emsp;&emsp;&emsp;
					<input class="upload file" type="file" name="fileToUpload[]" id="fileToUpload" size="60" multiple>
				</p>
			</div>

			<div class="buttons">
				<button type="button" name="back" class="back" id="back" onclick="if (confirm('are you sure you want to go back?')) location.href='main.php';">Back</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<button type="submit" name="send" class="send" id="send" value="submit" onclick="return confirm('Are you sure you want to send the mail?')" >Send</button>
			</div>
						
		</div>

	<div class="message"><!--sending-->
			
			<div class="chat">
			<h2 class="sender">&emsp;&emsp;&emsp;&emsp;To&emsp;:&emsp; <input size="50" type="email" name="receiver" style="outline: none;" <?php echo 'value="' . $receiver . '"'; ?>></h2>
			<textarea type="text" name="content" id="request" rows="10" cols="80" placeholder="Write your request here"><?php echo  $content ; ?></textarea> <!--reply-->
			</div><!--chat-->
	</div><!--Message-->
	</form>
	</div>

</body>
</html>