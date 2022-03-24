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
	$first_name = '';
	$last_name = '';
	$email = '';
	$index_no ='';
	$current_password='';
	$Previous_password='';
	$gender='';
	$birthday='';
	$address='';
	$about_me='';

		// getting the user information
		$user_id = mysqli_real_escape_string($connection, $_SESSION['user_id']);
		$query = "SELECT * FROM user WHERE id = {$user_id} LIMIT 1";
		$result_set = mysqli_query($connection, $query);

		if ($result_set) {
			if (mysqli_num_rows($result_set) == 1) {
				// user found
				$result = mysqli_fetch_assoc($result_set);
				
				$type = $result['type'];
				$first_name = $result['first_name'];
				$last_name = $result['last_name'];
				$email = $result['email'];
				$index_no =$result['index_no'];
				$gender =$result['gender'];
				$Previous_password = $result['password'];
				$address= $result['address'];
				$birthday=$result['birthday'];
				$aboutme = $result['about_me'];
			} else {
				// user not found
				header('Location: main.php?err=user_not_found');	
			}
		} else {
			// query unsuccessful
			header('Location: main.php?err=query_failed');
		}

	if (isset($_POST['submit'])) {
		$type = $_POST['type'];
		$user_id = $_POST['user_id'];
		$first_name = $_POST['first_name'];
		$last_name = $_POST['last_name'];
		$email = $_POST['email'];
		$gender =$_POST['gender'];
		$address= $_POST['address'];
		$birthday=$_POST['birthday'];
		$Previous_password=$_POST['Previous_password'];
		$current_password=sha1($_POST['current_password']);
		$password=$_POST['password'];
		$Con_password=$_POST['Con_password'];
		$aboutme = $_POST['about_me'];

		// checking required fields
		$req_fields = array('user_id', 'first_name', 'last_name', 'email','address','birthday','about_me');
		$errors = array_merge($errors, check_req_fields($req_fields));

		// checking max length
		$max_len_fields = array('first_name' => 50, 'last_name' =>100, 'email' => 100,'address'=>200, 'about_me'=>100);
		$errors = array_merge($errors, check_max_len($max_len_fields));

		//check previous password is correct or not
		if(strcmp($Previous_password, $current_password)){
			$errors[] = 'Check your current password again.';
		}

		//check entered tow passqords different from each other
		if(strcmp($password, $Con_password)){
			$errors[] = 'Do not match your passwords. Please Check your passwords again.';
		}

		// checking email address
		if (!is_email($_POST['email'])) {
			$errors[] = 'Email address is invalid.';
		}

		// checking if email address already exists
		$email = mysqli_real_escape_string($connection, $_POST['email']);
		$query = "SELECT * FROM user WHERE email = '{$email}' AND id != {$user_id} LIMIT 1";

		$result_set = mysqli_query($connection, $query);

		if ($result_set) {
			if (mysqli_num_rows($result_set) == 1) {
				$errors[] = 'Email address already exists';
			}
		}

		if (empty($errors)) {
			// no errors found... adding new record

			$first_name = mysqli_real_escape_string($connection, $_POST['first_name']);
			$last_name = mysqli_real_escape_string($connection, $_POST['last_name']);
			$address = mysqli_real_escape_string($connection, $_POST['address']);
			$birthday = mysqli_real_escape_string($connection, $_POST['birthday']);
			$about_me = mysqli_real_escape_string($connection, $_POST['about_me']);
			$password = mysqli_real_escape_string($connection, $_POST['password']);
			$hashedpasword= sha1($password);

			// email address is already sanitized

			$query = "UPDATE user SET first_name = '{$first_name}', last_name = '{$last_name}', email = '{$email}', address='{$address}',birthday='{$birthday}', about_me='{$about_me}', password='{$hashedpasword}' WHERE id = {$user_id} LIMIT 1";

			$result = mysqli_query($connection, $query);

			if ($result) {
				// query successful... redirecting to users page
				header('Location: user info.php?user_modified=true&user_id=2');
			} else {
				$errors[] = 'Failed to modify the record.';
			}


		}
	}

$username= ucwords($first_name." ".$last_name);

?>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
	<title>USER INFORMATION</title>
	<link rel="stylesheet" type="text/css" href="../css/userinfo.css">
</head>
<body>
	<!--frist header-->
	<h1 style="color: white; background-image: linear-gradient(to bottom right, black, blue);font-family: verdan">&emsp;User Profile<img src="../img/userimage.png" style="float: right;width:35px;height: 37px;"></h1>
	<!--text box-->
	<div class="cont">
		<form action="User info.php" method="post">
		<input type="hidden" name="user_id" value="<?php echo $user_id; ?>">
		<input type="hidden" name="Previous_password" value="<?php echo $Previous_password; ?>">
		<input type="hidden" name="gender" value="<?php echo $gender; ?>">
		<input type="hidden" name="type" value="<?php echo $type; ?>">

		<!--text box-->
		<div class="transbox">
			
			<center><img src="../img/userimage.png"alt="USER"style="width:150px; height:150px;"style="vertical-align:middle;"> </center>

    		<ul>
	  			<li>User Name :<div class="box"><p><?php echo $username ?></p></div></li>

	  			<li>Email :<div class="box"><p><?php echo $email ?></p></div></li>

	  			<li>Password :<div class="box"><p>********</p></div></li>

	  			<li>Gender :<div class="box"><p><?php echo $gender ?></p></div></li>
	  			
	  			<li>role :<div class="box"><p><?php echo $type ?></p></div></li>
  	
			</ul>
		</div>
    	   	
    	<!--text box-->
    	<div class="transbox1" style="right: ">


			<center><div class="box"><p style="color: black ;font-family: verdan">Edit My Profile</p></div></center>

			<?php 

				if (!empty($errors)) {
					display_errors($errors);
				}

		 	?>

			<ul>
				<li><span>User Name : <span><?php echo $username ?></span>&nbsp &nbsp<span style="float:right"><?php echo $index_no ?> &nbsp &nbsp &nbsp</span></li><br>
				<li><input placeholder="User Name" class="inputbox border" class="username" <?php echo 'value="' . $username . '"'; ?>  ></li><br>

	  			<li><input name="first_name" placeholder="Frist Name" class="inputbox border username"  <?php echo 'value="' . $first_name . '"'; ?> > &nbsp  &nbsp  &nbsp  &nbsp<input name="last_name" placeholder="Last name" class="inputbox border username"  <?php echo 'value="' . $last_name . '"'; ?> ></li><br>

	  			<li><input name="address" placeholder="Adress" class="inputbox border Adress"  <?php echo 'value="' . $address . '"'; ?> ></li><br>

	  			<li>Birthday : <input name="birthday" type="date" id="birthday" name="birthday"  <?php echo 'value="' . $birthday . '"'; ?> ></li><br>

	  			<li><input name="email" placeholder="Email" class="inputbox border Email"  <?php echo 'value="' . $email . '"'; ?> ></li><br>

	  			<li><input name="current_password" placeholder="Current Password" class="inputbox border Password" ></li><br>

	  			<li><input name="password" placeholder="New Password" class="inputbox border Password" ></li><br>

	  			<li><input name="Con_password" placeholder="Re Enter Password" class="inputbox border Password" ></li><br>

	  			<li><input name="about_me" placeholder="About Me" class="inputbox border texta"  <?php echo 'value="' . $about_me . '"'; ?> ><br><br></li>

	  			<center><input name="submit" type="submit" value="Submit" style="background-image: linear-gradient(to bottom right, #F52E1D, yellow); width: 100px; height: 40px; font-size: 120%; border-radius: 20%; opacity: 1;"></center>
	  		</ul>	


		</div> 
    	</form>
    </div>	
    <div class="textbody">
    <button class="btn" type="button" onclick="if (confirm('are you sure you want to go back?')) location.href='main.php';" value="go main" />Back</button>
	</div>
</body>
</html>