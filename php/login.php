<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 

	// check for form submission
	if (isset($_POST['submit'])) {

		$errors = array();

		// check if the username and password has been entered
		if (!isset($_POST['user_name']) || strlen(trim($_POST['user_name'])) < 1 ) {
			$errors[] = 'Username is Missing or Invalid';
		}

		if (!isset($_POST['password']) || strlen(trim($_POST['password'])) < 1 ) {
			$errors[] = 'Password is Missing or Invalid';
		}

		// check if there are any errors in the form
		if (empty($errors)) {
			// save username and password into variables
			$email 		= mysqli_real_escape_string($connection, $_POST['user_name']);
			$password 	= mysqli_real_escape_string($connection, $_POST['password']);
			$hashed_password = sha1($password);

			// prepare database query
			$query = "SELECT * FROM user 
						WHERE email = '{$email}' 
						AND password = '{$hashed_password}' 
						LIMIT 1";

			$result_set = mysqli_query($connection, $query);

			verify_query($result_set);

			if (mysqli_num_rows($result_set) == 1) {
				// valid user found
				$user = mysqli_fetch_assoc($result_set);
				echo print_r($user);
				$_SESSION['user_id'] = $user['id'];
				$_SESSION['full_name'] = $full_name= ucwords($user['first_name']  . " " . $user['last_name']);
				$_SESSION['index_no']= $user['index_no'];
				$_SESSION['gender']= $user['gender'];
				$_SESSION['type']= $user['type'];

				//cheching user has permition to login 
				if(!strcmp('Lecturer', $user['type']) || !strcmp('Student', $user['type'])) {
				
					// updating last login
					$query = "UPDATE user SET last_login = NOW() WHERE id = {$_SESSION['user_id']} LIMIT 1";

					$result_set = mysqli_query($connection, $query);

					verify_query($result_set);

					// redirect to main.php
					header("Location: main.php");

				}else if (!strcmp('Admin', $user['type']) ) {
					// updating last login
					$query = "UPDATE user SET last_login = NOW() WHERE id = {$_SESSION['user_id']} LIMIT 1";

					$result_set = mysqli_query($connection, $query);

					verify_query($result_set);

					// redirect to users.php
					header("Location: admin.php?user= '{$_SESSION['user_id']}'");

				}else{
					$errors[]='Please log in later. You have not allowed to access yet.';
				}

			} else {
				// user name and password invalid
				$errors[] = 'Invalid Username or Password';
			}
		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<title>DBMS Log In</title>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="stylesheet" type="text/css" href="../css/login.css">
	<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:wght@400;700&family=Pirata+One&family=Playfair+Display&family=Redressed&display=swap" rel="stylesheet">
</head>
<body>
	<div class="topbanner">
		<h3 id="intro">DATABASE MANAGEMENT SYSTEM - UNIVERSITY OF MORATUWA</h3>
		<img src="../img/GroupPhotoWhite.png" id="logo">
	</div>
	<div class="loginbox border_">

		<form action="login.php" method="post">

				<?php 
					if (isset($errors) && !empty($errors)) {
						if (!strcmp(end($errors),'Please log in later. You have not allowed to access yet.')){
							echo '<p class="error">Please log in later.<br>You have not allowed to access yet.';
						}else{
						echo '<p class="error">Invalid Username or Password</p>';
						}
					}
				?>

				<?php 
					if (isset($_GET['logout'])) {
						echo '<p class="info">You have logged out from the system</p>';
					}
				?>

			<h4>Username &nbsp&nbsp<input type="text" name="user_name" class="inputbox border_"></h4>

			<h4>Password &nbsp&nbsp<input type="password" name="password" class="inputbox border_" id="password_"></h4>
			
			<div class="check">
			<p><input type="checkbox" name="S_password" id="S_password">Show Password</p>
			</div>
			
			<button id="login" type="submit" name="submit" class="border_">Log In</button>
			<p style="color: blue;"><a href="Sign in.php" id="hyperlink">If you don't have an account, create an account</a></p>
		
		</form>
	</div>

	<script src="../js/jquery.js"></script>
	<script>
		$(document).ready(function(){
			$('#S_password').click(function(){
				if ( $('#S_password').is(':checked') ) {
					$('#password_').attr('type','text');
				} else {
					$('#password_').attr('type','password');
				}
			});
		});
	</script>

</body>
</html>