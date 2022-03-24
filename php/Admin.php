<?php session_start(); ?>
<?php require_once('../inc/connection.php'); ?>
<?php require_once('../inc/functions.php'); ?>
<?php 
	// checking if a user is logged in
	if (!isset($_SESSION['user_id'])) {
		header('Location: login.php');
	}

	$user_list = '';
	$search = '';

		//logout user
	if (isset($_GET['logout'])) {

		$_SESSION = array();

		session_destroy();

		// redirecting the user to the login page
		header('Location: login.php?logout="yes"');

	}

	// getting the list of users
	if (isset($_GET['user'])) {

		if (isset($_GET['reset'])) {
			$password = sha1('password');
			$mail = "UPDATE  user SET password = '{$password}' WHERE id = {$_GET['reset']} LIMIT 1";

			$send_email = mysqli_query($connection, $mail);

			//update resetted password of user
			if ($send_email) {
				header("Location: admin.php?user='{$_SESSION['user_id']}'");
			}else{

				$errors[]= 'Failed to reset password status.';
			}

		}


		if ( isset($_GET['search']) ) {
			$search = mysqli_real_escape_string($connection, $_GET['search']);
			$query = "SELECT * FROM user WHERE (first_name LIKE '%{$search}%' OR last_name LIKE '%{$search}%' OR email LIKE '%{$search}%')  AND (type='Lecturer' OR type ='Student'  ) ORDER BY first_name";					
		} else {
			$query = "SELECT * FROM user WHERE type != 'notAllow' ORDER BY first_name";
		}
		
		$users = mysqli_query($connection, $query);

		verify_query($users);

		while ($user = mysqli_fetch_assoc($users)) {
			$user_list .= "<tr>";
			$user_list .= "<td>{$user['first_name']}</td>";
			$user_list .= "<td>{$user['last_name']}</td>";
			$user_list .= "<td>{$user['last_login']}</td>";
			$user_list .= "<td><a href=\"admin.php?reset={$user['id']}&user='0'\" 
						onclick=\"return confirm('Are you sure you want to reset password?');\" class='access'>Reset Password</a></td>";

			$user_list .= "</tr>";
		}

	}else if(isset($_GET['notCon'])){


		if (isset($_GET['accept'])) {
			
			$mail = "UPDATE  user SET type = 'Lecturer' WHERE id = {$_GET['accept']} LIMIT 1";

			$send_email = mysqli_query($connection, $mail);

			//update the type of the user.
			if ($send_email) {
				header("Location: admin.php?notCon='0'");
			}else{

				$errors[]= 'Failed to update type of user.';
			}

		}


		if ( isset($_GET['search']) ) {
			$search = mysqli_real_escape_string($connection, $_GET['search']);
			$query = "SELECT * FROM user WHERE (first_name LIKE '%{$search}%' OR last_name LIKE '%{$search}%' OR email LIKE '%{$search}%')AND type='notAllow' ORDER BY first_name";					
		} else {
			$query = "SELECT * FROM user WHERE is_deleted=0 AND type = 'notAllow' ORDER BY first_name";
		}
		
		$users = mysqli_query($connection, $query);

		verify_query($users);

		while ($user = mysqli_fetch_assoc($users)) {
			$sender=$user['email'];
			$mail = "SELECT * FROM emails WHERE sender = '{$sender}' LIMIT 1";

			$mail_set = mysqli_query($connection, $mail);

			$result_mail = mysqli_fetch_assoc($mail_set);

			$user_list .= "<tr>";
			$user_list .= "<td>{$user['first_name']}</td>";
			$user_list .= "<td>{$user['last_name']}</td>";
			$user_list .= "<td>{$user['last_login']}</td>";
			$user_list .= "<td><a href=\"admin.php?accept={$user['id']}&notCon=0\" 
						onclick=\"return confirm('Are you sure you want to accept?');\" class='access'>Accept</button></td>";
			$user_list .= "<td>{$result_mail['content']}</td>";
			$user_list .= "</tr>";

		}

	}else{

		if ( isset($_GET['search']) ) {
			$search = mysqli_real_escape_string($connection, $_GET['search']);
			$query = "SELECT * FROM emails WHERE (full_name LIKE '%{$search}%' OR index_no LIKE '%{$search}%' OR sender LIKE '%{$search}%') AND receiver ='admin@emc.lk' ORDER BY full_name";					
		} else {
			$query = "SELECT * FROM emails WHERE receiver = 'admin@emc.lk'  ORDER BY full_name";
		}
		
		$mail_set = mysqli_query($connection, $query);

		verify_query($mail_set);

		while ($mail = mysqli_fetch_assoc($mail_set)) {
			$user_list .= "<tr>";
			$user_list .= "<td>{$mail['full_name']}</td>";
			$user_list .= "<td>{$mail['index_no']}</td>";
			$user_list .= "<td>{$mail['sender']}</td>";
			$user_list .= "<td>{$mail['content']}</td>";
			$user_list .= "</tr>";
		}

	}
 ?>

 <!DOCTYPE html>
 <html>
 <head>
 	<link rel="stylesheet" type="text/css" href="../css/admin.css">
 	<title></title>
 </head>
 <body>
 
 
	<main>	

		<div class="search">
			<h1>
				<?php 

				if (isset($_GET['notCon'])) {
					echo "Not Confirmed Users";
				}else if(isset($_GET['user'])){
					echo "Users";
				}else{
					echo "Mails";
				}


				 ?>


			</h1>
			<form action="admin.php" method="get">
				<p>
					<ul class="nevigationbar">
					  <li><button type="submit" name="notCon" value=0 style="background-color: cyan;" ty>Not Confirmed User</button></li>
					  <li><button type="submit" name="user" value=1 style="background-color: forestgreen;">Users</button></li>
					  <li><button type="submit" name="submit" value=2 style="background-color: orange;">Mails</button></li>
					  <li><button type="submit" name="logout" value=2 style="background-color: red;" onclick="return confirm('Are you sure you want to send the mail?')" >Log out</button></li>

					</ul>
					</p>
				<p>
					<input type="text" name="search" id="" placeholder="Type First Name, Last Name or Email Address and Press Enter" value="<?php echo $search; ?>"  autofocus>
				</p>
			</form>
		</div>

		<table class="masterlist">
			<tr>
				<?php 
				if(!isset($_GET['submit'])){
					echo '<th>First Name</th>
						<th>Last Name</th>
						<th>Last Login</th>';
					if (isset($_GET['notCon'])) {

						echo '<th>Accept</th>';
						echo'<th>Requesting Mail</th>';
					
					}else{
						
						echo '<th>Reset Password</th>';
				
					}
				}else{
					echo '<th>Full Name</th>
						<th>Index Number</th>
						<th>Sender</th>
						<th>Mail</th>';
				}

				?>
			</tr>


			<?php echo $user_list; ?>

		</table>
		
		
	</main>

</body>
</html>