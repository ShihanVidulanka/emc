<?php session_start(); ?>
<?php 
	
	// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php');
	}

?>

<!DOCTYPE html>
<html>
<head>
	<title>About us</title>
	<link href="https://fonts.googleapis.com/css2?family=Exo+2:wght@100&family=Great+Vibes&display=swap" rel="stylesheet">
	<link rel="Stylesheet"	type="text/css" href="../css/aboutus.css">
</head>
<body>
	<!-------main_textbox------->
	<center>
	<div class="textbox">
		<!-------headline----->
		<h1>ABOUT US</h1>
		<!------paragraph------->
		<p >We are a group of undergraduates from the 19th batch of the Computer Science & Engineering Department,<br>University of Moratuwa. <br> We are aiming to overcome the difficulty of request handling and improve the communication between academic staff and undergraduates. <br> We designed this web application to overcome this obstacle by using a webmail system, which is easy to use and manage.</p>
	</div>
	</center>
	<div class="textbody">
    <button class="btn" type="button" onclick="if (confirm('are you sure you want to go back?')) location.href='main.php';" value="go main" />Back</button>
	</div>
</body>
</html>