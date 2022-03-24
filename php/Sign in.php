 <?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 

	$errors = array();
	$first_name = '';
	$last_name = '';
	$email = '';
	$index_no='';
	$password = '';
	$Con_password='';
	$gender='';

	if (isset($_POST['submit'])) {
		
		$first_name = $_POST['first_name'];
		$last_name = $_POST['last_name'];
		$email = $_POST['username'];
		$index_no = $_POST['index_no'];
		$password = $_POST['password'];
		$Con_password=$_POST['Con_password'];
		$gender=$_POST['gender'];

		if(strcmp($password, $Con_password)){
			$errors[] = 'Check your password again.';
		}

		// checking required fields
		$req_fields = array('first_name', 'last_name', 'username', 'password','index_no');
		$errors = array_merge($errors, check_req_fields($req_fields));

		// checking max length
		$max_len_fields = array('first_name' => 50, 'last_name' =>100, 'username' => 100, 'password' => 40, 'index_no' => 8);
		$errors = array_merge($errors, check_max_len($max_len_fields));

		// checking email address
		if (!is_email($_POST['username'])) {
			$errors[] = 'Email address is invalid.';
		}

		// checking if email address already exists
		$email = mysqli_real_escape_string($connection, $_POST['username']);
		$index_no=mysqli_real_escape_string($connection, $_POST['index_no']);
		$query = "SELECT * FROM user WHERE email = '{$email}' OR index_no='{$index_no}' LIMIT 1";

		$result_set = mysqli_query($connection, $query);

		if ($result_set) {
			if (mysqli_num_rows($result_set) == 1) {
				$errors[] = 'Email address or Index No already exists';
			}
		}

		if (empty($errors)) {
			// no errors found... adding new record
			$type = mysqli_real_escape_string($connection, $_POST['typeradio']);
			$first_name = mysqli_real_escape_string($connection, $_POST['first_name']);
			$last_name = mysqli_real_escape_string($connection, $_POST['last_name']);
			$password = mysqli_real_escape_string($connection, $_POST['password']);
			// email address is already sanitized
			$hashed_password = sha1($password);
			$gender = mysqli_real_escape_string($connection, $_POST['gender']);
			$full_name = ucwords($first_name . ' ' . $last_name);

			$query = "INSERT INTO user ( type, first_name, last_name, email, index_no, password, gender, is_deleted) VALUES ('{$type}','{$first_name}', '{$last_name}', '{$email}','{$index_no}', '{$hashed_password}','{$gender}', 0)";

			$mail = "INSERT INTO emails (sender, receiver, type, full_name, index_no, content,date_time ,sender_is_read,receiver_is_read) VALUES ('{$email}', 'admin@emc.lk', 4, '{$full_name}',  '{$index_no}', 'Please can you give the permission to create a Lecture account.<br>thank you.', NOW(),1, 0)";

			if(!strcmp('notAllow', $type)) { 
				//send a email to admin

				$send_email = mysqli_query($connection, $mail);

				if ($send_email) {

					$result = mysqli_query($connection, $query);
					if ($result) {

						// query successful... redirecting to users page
						header('Location: login.php?user_added=true');
						
					} else {

						$errors[] = 'Failed to add the new record.';
					}
					
				}else{

					$errors[]= 'Failed to add the new record.1';

				}
			}else{
				$result = mysqli_query($connection, $query);
					if ($result) {

						// query successful... redirecting to users page
						header('Location: login.php?user_added=true');
						
					} else {

						$errors[] = 'Failed to add the new record.';
					}

			}


		}



	}


?>

<html>
<head>
	<title>DBMS : Sign In</title>
	<link rel="stylesheet" type="text/css" href="../css/signin.css">
	

<body>

	<div class="div1">

		<form action="Sign in.php" method="post" class="userform">
		<center>
		<h2><b>Sign In</b></h2>

		<!-- UOM icon image -->
		<img src="../img/Group_Logo_6-removebg copy.png" width="200px" height="200px">
		</center>

		<?php 

			if (!empty($errors)) {
				display_errors($errors);
			}

		 ?>

			<!-- Name and type input -->
			<div class="Names_and_type"> 
				<!-- radio buttons  -->
				<h4 class="signinas">Sign in as : &nbsp&nbsp an Undergraduate <input  type="radio" name="typeradio" value= "Student"  checked> &nbsp&nbsp a Lecturer <input type="radio" name="typeradio" value= "notAllow" > </h4>
				
				<input name="first_name" class="inputbox border" placeholder="First Name" <?php echo 'value="' . $first_name . '"'; ?> autofocus >&nbsp&nbsp<input name="last_name" class="inputbox border" placeholder="Last Name"<?php echo 'value="' . $last_name . '"'; ?> >

			</div>

			<!-- gender selection frop box -->
			<h4 class="dropboxline">Gender&nbsp : &nbsp&nbsp

				<select name="gender" class="dropbox border" id="selection">
					<option value="Male" class="option">Male</option>
					<option value="Female">Female</option>
				</select>
			</h4>

			<!-- username -->
			<input name="username"  type="text" class="inputbox border username"  placeholder="Username"<?php echo 'value="' . $email . '"'; ?>>&nbsp&nbsp<input name="index_no"  type="text" class="inputbox border username"  placeholder="Index No"<?php echo 'value="' . $index_no . '"'; ?>><br><br>

			<!-- password and confirm-->
			<input name="password" type="password" placeholder="Password" class="inputbox border" id="password_1">&nbsp&nbsp<input name="Con_password" type="password" class="inputbox border" placeholder="Confirm your password" id="password_2">

			<!-- show hide password-->
			<!--<div class="check">
			<p><input type="checkbox" name="S_password" id="S_password">Show Password</p>
			</div>
			-->

			<!-- sign up button -->
			<button name="submit" type="submit" id="signin" class="border">Sign In</button>

		</form>
	</div>

<!--<script src="../js/jquery.js"></script>
	<script>
		$(document).ready(function(){
			$('#S_password').click(function(){
				if ( $('#S_password').is(':checked') ) {
					$('#password_1').attr('type','text');
					$('#password_2').attr('type','text');					
				} else {
					$('#password_1').attr('type','password');
					$('#password_2').attr('type','password');
				}
			});
		});
	</script>
-->

</body>

</html>