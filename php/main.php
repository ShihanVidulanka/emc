<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 
	
	//logout user
	if (isset($_GET['logout'])) {

		$_SESSION = array();

		session_destroy();

		// redirecting the user to the login page
		header('Location: login.php?logout="yes"');

		
	}else{


	// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php');
	}


	$errors = array();
	$user_id = '';
	$lasst_login='';
	$sender = '';
	$index_no ='';
	$receiver='';
	$sort_type=0;
	$type='';
	$sort_status=0;
	$mail_list='';
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
				$lasst_login=$result['last_login'];
				$type =$result['type'];

			}
		}else {
			// not looged in user return to logg in
			header('Location: login.php?err=query_failed');
		}
	} 



	//flter emails in the database
	if (isset($_POST['filter'])) {
		$sender = $_POST['sender'];
		$index_no =$_POST['index_no'];
		$sort_type=$_POST['sort_type'];
		$sort_status =$_POST['sort_status'];
		$type=$_POST['type'];	
		$receiver=$_POST['receiver'];
		//if we press the filter then after that calling filterng functioning
		$mail_list = filter($sender,$receiver,$index_no,$sort_type,$sort_status,$type);
		// if you enter in to the main function call to display all mails 
	}else{
		$mail_list = filter($sender,$receiver,$index_no,$sort_type,$sort_status,$type);
	}

}
?>



<!DOCTYPE html>
<html>
<head>
	<title>Main Page</title>
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Bodoni+Moda:wght@600&display=swap" rel="stylesheet">
</head>
<body>
	<div>
	<div class="profile">
		<img src="../img/userimage.png" id="propic"><!--Profile Picture-->
		<p style="color: white" text align="center"><?php echo $lasst_login ?></p>
		<div style=" float:right;">
			<a href="main.php?logout=true" id="logout" onclick="return confirm('Are you sure you want to logout?')" >
				<div class="logout">
					<p>Log Out</p>		
				</div>
			</a>
			<img src="../img/GroupPhotoWhite.png" id="logo"><!--Logo-->
		</div>
		<div class="info dropdown"><!--Account name, Id no, Dropdown -->
			<div class="dropbtn"><!--This is for drop down list icon-->

				<h3><?php echo $_SESSION['index_no'] ?></h3>
				<h3><?php echo $_SESSION['full_name'] ?>
				<i class="fa fa-caret-down"></i>
				</h3>
			</div><!--dropbtn-->
			
			<div class="dropdown-content"><!--DropDown mwnu content-->
	      		<h3><a href="user info.php?">Profile</a></h3>
	      		<h3><a href="contact_us.php?">Contact us</a></h3>
	      		<h3><a href="aboutus.php">About Us</a></h3>
	    	</div><!--dropdown-content-->

		</div><!--info-->
	</div><!--profile-->

	<div class="send_detail"><!--Msg title list in left side-->
		<form action="main.php" method="post">
		<input type="hidden" name="sender" value="<?php echo $sender; ?>">
		<input type="hidden" name="type" value="<?php echo $type; ?>">
		

		<?php 
			if (!strcmp($_SESSION['type'], 'Student')) {
			
				echo '<button type="button" id="create_new" style="color: black" onclick="location.href=\'create_mail.php\';" value="go create mail">Create New</button>';
			}

		?>

		
		<div class="sort">
			<p>
				<label for="" > Filter by Name  &emsp;:&emsp;&ensp; </label>
				<input type="text" class="box" name="receiver" id="" placeholder=" Your Name" size="18" <?php echo 'value="' . $receiver . '"'; ?> >
			</p>
			<p style="padding-left: 0px">
				<label for="" > Filter by  Index  &emsp;:&emsp;&ensp;</label>
				<input type="text" class="box" name="index_no" id="" placeholder=" Your Index" size="18" <?php echo 'value="' . $index_no . '"'; ?> >
			</p>

			<p>Sort by Type &emsp; &ensp;:&emsp; 
			<select name="sort_type" >
				<option value=0 <?php echo (isset($_POST['sort_type']) && $_POST['sort_type'] == 0) ? 'selected' : '';?>>None</option>
				<option value=1 <?php echo (isset($_POST['sort_type']) && $_POST['sort_type'] == 1) ? 'selected' : '';?>>Late add/drop </option>
				<option value=2 <?php echo (isset($_POST['sort_type']) && $_POST['sort_type'] == 2) ? 'selected' : '';?>>Extend assignment submission deadlines</option>
				<option value=3 <?php echo (isset($_POST['sort_type']) && $_POST['sort_type'] == 3) ? 'selected' : '';?>>Repeat exams as first attempt with the next batch</option>
				<option value=4 <?php echo (isset($_POST['sort_type']) && $_POST['sort_type'] == 4) ? 'selected' : '';?>>Others</option>
			</select>
			</p>

			<p>Sort by Status &emsp;&nbsp;:&emsp;
			<select name="sort_status" >
				<option value=0 <?php echo (isset($_POST['sort_status']) && $_POST['sort_status'] == 0) ? 'selected' : '';?>>None</option> 
				<option value=1 <?php echo (isset($_POST['sort_status']) && $_POST['sort_status'] == 1) ? 'selected' : '';?>>Missing infomation</option>
				<option value=2 <?php echo (isset($_POST['sort_status']) && $_POST['sort_status'] == 2) ? 'selected' : '';?>>Reject</option>
				<option value=3 <?php echo (isset($_POST['sort_status']) && $_POST['sort_status'] == 3) ? 'selected' : '';?>>Approve</option>
			</select>
			</p>

			<p>
				<button type="submit" name="filter" class="send" id="create_new1" value="submit">Filter</button>
			</p>
		</div><!--sort-->
		<table>
			<thead>
				<th style="padding: 10px; color: white; font-size:150% ">Messages</th>
			</thead>
			<?php echo $mail_list; ?>
		</table>
	</form>
	</div><!--sender_detail-->


	<div class="message"><!--Msg recieving/sending-->
		
		<iframe name="iframe_a" src="iframe.php"  style="height: 91.9vh;width: 99.6%;"></iframe>
	</div><!--Message-->
	</div>
</body>
</html>