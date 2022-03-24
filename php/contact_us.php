<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 
	
	// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php');
	}


	$errors = array();
	$name ='';
	$email='';
	$user_id = '';
	$sender = '';
	$title='';
	$content='';

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
				$gender = $result['gender'];	
			}

		}else {
			// not looged in user return to logg in
			header('Location: login.php?err=query_failed');
		}
	}

	if (isset($_POST['submit'])) {
		$sender = $_POST['sender'];
		$email = $_POST['email'];
		$name = $_POST['name'];
		$content=$_POST['content'];

		// checking required fields
		$req_fields = array('name','email','content');
		$errors = array_merge($errors, check_req_fields($req_fields));

		if (empty($errors)) {

			if (!strcmp($_SESSION['gender'], "Male")) {
					$title = "Mr.";
				}else{
					$title = "Mrs.";
				}

			$date = date('Y/m/d ');
			$time = date('g:i a');
			$content_1="<p><span>On: {$date}  </span><span> At: {$time} </span></p><p><b>{$title} {$_SESSION['full_name']}</b></p><br>This is my  personal emal : {$email} <br>". $content . "<br>";
			
			// no errors found... adding new record

			$sender = mysqli_real_escape_string($connection, $_POST['sender']);
			$content_1 = mysqli_real_escape_string($connection, $content_1);
			$mail = "INSERT INTO emails (full_name, index_no, sender, receiver, type, content,  date_time, sender_is_read,receiver_is_read) VALUES ('{$_SESSION['full_name']}', '{$_SESSION['index_no']}','{$sender}', 'admin@emc.lk', 4, '{$content_1}', NOW(), 1, 0)";
			echo $mail;
			$send_email = mysqli_query($connection, $mail);

			if ($send_email) {

				header('Location:main.php?send_message=true');
			}else{

				$errors[]= 'Failed to Send Email.';
			}

		}
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, intial-scale=1.0">
	<title>Responsive Contact US Page</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
	<link rel="stylesheet" type="text/css" href="../css/contactus.css">
</head>
<body>
	<section class="contact">
		<div class="content">
			<h2>Contact Us</h2>
			<p>Don't hesitate to ask us something. Email us directly or call us. We're here to help and answewr any question you might have. We look forward to hearing from you</p>
		</div> <!-- content -->
		<div class="container">
			<div class="contactinfo">
				<div class="box">
					<!-- <div class="icon"><i class="fas fa-map-marked-alt"></i>
					</div> icon
					<div class="text">
						<h3>Address</h3>
						<p>64, 1st Lane, <br>Gothami Rd, <br>Borella</p>
					</div> text -->
				</div> <!-- box -->
				<div class="box">
					<div class="icon"><i class="fas fa-envelope-open-text"></i>
					</div> <!-- icon -->
					<div class="text">
						<h3>Email</h3>
						<p>sathira.19@cse.mrt.ac.lk</p>
						<p>yasith.19@cse.mrt.ac.lk</p>
						<p>harshani.19@cse.mrt.ac.lk</p>
						<p>vidulanka.19@cse.mrt.ac.lk</p>
						<p>sahanc.19@cse.mrt.ac.lk</p>
					</div> <!-- text -->
				</div> <!-- box -->
				<div class="box">
					<div class="icon"><i class="fas fa-phone-alt"></i>
					</div> <!-- icon -->
					<div class="text">
						<h3>Phone</h3>
						<p>0719955178</p>
						<p>0714748483</p>
						<p>0714629179</p>
						<p>0112678466</p>
						<p>0718949089</p>
					</div> <!-- text -->
				</div> <!-- box -->
			</div> <!-- contactinfo -->
			<div class="contactform">
				<form action="contact_us.php" method="post">
				<input type="hidden" name="sender" value="<?php echo $sender?>">

					<h2>Send Message</h2>
					<?php 

						if (!empty($errors)) {
							display_errors($errors);
						}

					?>

					<div class="inputbox">
						<input type="text" name="name" placeholder="Name" <?php echo 'value="' . $name . '"' ?>  >
						<!-- <span>Full Name</span> -->
					</div> <!-- inputbox -->
					<div class="inputbox">
						<input type="email" name="email" placeholder="Email" <?php echo 'value="' . $email . '"' ?> >
						<!-- <span>Email</span> -->
					</div> <!-- inputbox -->
					<div class="inputbox">
						<textarea name="content" placeholder="Message" <?php echo $content ?> ></textarea>
						<!-- <span>Type your Message...</span> -->
					</div> <!-- inputbox -->
					<button type="submit" name="submit" value="submit">Submit</button>&nbsp &nbsp<button type="button" onclick="if (confirm('are you sure you want to go back?')) location.href='main.php';" value="go to main">Back</button>
					<!-- <div class="inputbox">
						<input type="submit" name="" value="Send">
					</div> -->
				</form>
			</div> <!-- contactform -->
		</div> <!-- container -->
	</section>
</body>
</html>