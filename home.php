<?php 
require('connect.php');
if(isset($_POST["btn_login"])){
	$u_name=$_POST["uname"];
	$p_word=$_POST["pword"];
	$query1 = mysqli_query($con,"select count(id) as cntid, firstname,lastname from users where username='".$u_name."' and password='".md5($p_word)."'");
	$row = mysqli_fetch_array($query1); 
	$cntid =  $row["cntid"];
	$pname =  $row["firstname"]." ".$row["lastname"];

	if($cntid <> 0) {
		header("location:index.php?pname=$pname");
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>ACADEMY LMS</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="description" content="" />
	<meta name="keywords" content="">
	<meta name="author" content="Phoenixcoded" />
	<link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/fontawesome-6.4.2-web/css/all.min.css" />
	<script src="assets/js/jquery-3.1.1.js"></script>
	<script src="assets/js/md5.js"></script>
	<script src="assets/js/common.js"></script>
</head>
<body>
<div class="auth-wrapper">
	<div class="auth-content text-center">
		<div class="card borderless login-border">
			<div class="row align-items-center ">
				<div class="col-md-12">
					<div class="card-body">
						<h4 class="mb-3 f-w-400">Login</h4>
						<hr>
						<form method="POST">
							<div class="form-group mb-3">
								<input type="text" class="form-control" name="uname" placeholder="User Name" required>
							</div>
							<div class="form-group mb-4">
								<input type="password" class="form-control" name="pword"  password="password" placeholder="Password" required>
							</div>
							<button class="btn btn-block btn-primary mb-4" name='btn_login'>Login</button>
						</form>
						
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Required Js -->
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/js/plugins/bootstrap.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>

</body>
</html>
