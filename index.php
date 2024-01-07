<?php
require('connect.php');
if(isset($_GET["pname"])){
    $pname = $_GET["pname"];
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
</head>
<body class="">
	<!-- [ navigation menu ] start -->
	<nav class="pcoded-navbar  ">
		<div class="navbar-wrapper  ">
			<div class="navbar-content scroll-div " >
				<div class="">
					<div class="main-menu-header">
						<img class="img-radius" src="img/avatar.jpg" alt="User-Profile-Image">
						<div class="user-details">
							<span><?php echo $pname;?></span>
						</div>
					</div>
					<div class="collapse" id="nav-user-link">
						<ul class="list-unstyled">
							<li class="list-group-item"><a href="user-profile.html"><i class="feather icon-user m-r-5"></i>View Profile</a></li>
							<li class="list-group-item"><a href="#!"><i class="feather icon-settings m-r-5"></i>Settings</a></li>
							<li class="list-group-item"><a href="auth-normal-sign-in.html"><i class="feather icon-log-out m-r-5"></i>Logout</a></li>
						</ul>
					</div>
				</div>
				<ul class="nav pcoded-inner-navbar ">
					<li class="nav-item pcoded-menu-caption">
					</li>
					<li class="nav-item">
					    <a href="dashboard.php" class="nav-link" target="iframe_a"><span class="pcoded-micon" ><i class="feather icon-home"></i></span><span class="pcoded-mtext">Dashboard</span></a>
					</li>
					<li class="nav-item pcoded-hasmenu">
						<a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-briefcase"></i></span><span class="pcoded-mtext">Masterlist</span></a>
						<ul class="pcoded-submenu">
							<li id='li_trans_quot'><a href="students.php" target="iframe_a">Students</a></li>
							<li id='li_trans_so'><a href="faculty.php" target="iframe_a">Faculty</a></li>
						</ul>
					</li>
                    <li class="nav-item pcoded-hasmenu" id='li_acc'>
                        <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-file-invoice"></i></span><span class="pcoded-mtext">Informations</span></a>
                        <ul class="pcoded-submenu">
                        <li><a href="studinfo.php" target="iframe_a">Student Informations</a></li>
                        <li><a href="Facultyinfo.php" target="iframe_a">Faculty Informations</a></li>
                        </ul>
                    </li>
                    <li class="nav-item pcoded-hasmenu" id='li_acc'>
                        <a href="#!" class="nav-link "><span class="pcoded-micon"><i class="fa-solid fa-file-invoice"></i></span><span class="pcoded-mtext">Library</span></a>
                        <ul class="pcoded-submenu">
                        <li id='li_acc_cdnvat'><a href="department.php" target="iframe_a">Department</a></li>
                        <li id='li_acc_cdnvat'><a href="course.php" target="iframe_a">Course</a></li>
                        <li id='li_acc_cdnvat'><a href="class.php" target="iframe_a">Class</a></li>
                        <li id='li_acc_cdnvat'><a href="subject.php" target="iframe_a">Subjects</a></li>
                        
                        </ul>
                    </li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- [ navigation menu ] end -->
	<!-- [ Header ] start -->
	<header class="navbar pcoded-header navbar-expand-lg navbar-light header-dark">
		<div class="m-header">
            <a class="mobile-menu" id="mobile-collapse" href="#!"><span></span></a>
            <a href="#!" class="b-brand">
               <img src="img/logo.png" alt="" class="logo" style="float:left;height:50px;width:50px;">&nbsp;ACADEMY LMS
                <img src="assets/images/logo-icon.png" alt="" class="logo-thumb">
            </a>
            <a href="#!" class="mob-toggler">
                <i class="feather icon-more-vertical"></i>
            </a>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item"></li>
                <li class="nav-item"></li>
                <li class="nav-item"></li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li>
                    <div class="dropdown drp-user">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="feather icon-user"></i>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-notification">
                            <div class="pro-head">
                                <img src="img/avatar.jpg" class="img-radius" alt="User-Profile-Image">
                                <span><?php echo $pname;?></span>
                                <a href="home.php" class="dud-logout" title="Logout">
                                    <i class="feather icon-log-out"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>		
	</header>
	<!-- [ Header ] end -->
	
<!-- [ Main Content ] start -->
<div class="pcoded-main-container">
    <div class="pcoded-content">
    <iframe src="dashboard.php" name="iframe_a" height="1200px" width="100%" frameborder="0" title="Iframe Example"></iframe>
    </div>
</div>

<!-- Required Js -->
<script src="assets/js/vendor-all.min.js"></script>
<script src="assets/js/plugins/bootstrap.min.js"></script>
<script src="assets/js/pcoded.min.js"></script>

<!-- Apex Chart -->
<script src="assets/js/plugins/apexcharts.min.js"></script>

<!-- custom-chart js -->
<script src="assets/js/pages/dashboard-main.js"></script>
</body>
</html>
