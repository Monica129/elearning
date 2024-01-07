<?php header('Content-Type: text/html; charset=iso-8859-15');
require('connect.php');
$id = "";
$student_id = "";
$firstname = "";
$middlename = "";
$lastname ="";
$email = "";
$contact = "";
$gender = "";
$address = "";
$class_no = "";

if(isset($_GET["id"])){
    $id = $_GET["id"];
    $student_id = $_GET["student_id"];
    $firstname = $_GET["student_firstname"];
    $middlename = $_GET["student_middlename"];
    $lastname = $_GET["student_lastname"];
    $email = $_GET["student_email"];
    $contact = $_GET["student_contact"];
    $gender = $_GET["student_gender"];
    $address = $_GET["address"];
    $class_no = $_GET["class_no"];

}


if (isset($_POST['delete'])) {
    $s_id = $_POST['s_id'];
    // FROM STORED PROCEDURE DeleteStudent
    $sql = "CALL DeleteStudent(?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $s_id);
    $stmt->execute();

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

if(isset($_POST["addstudent"])){
    $student_id = $_POST["student_id"];
    $firstname = $_POST["fname"];
    $mname = $_POST["mname"];
    $lname = $_POST["lname"];
    $emailaddr = $_POST["emailaddr"];
    $contact_no = $_POST["contact_no"];
    $gender = $_POST["gender"];
    $addr = $_POST["addr"];
    $class_no = $_POST["section"];

    // FROM STORED PROCEDURE AddNewStudent
    $sql = "CALL AddNewStudent ('".$student_id."','".$firstname."','".$mname."','".$lname."','".$emailaddr."','".$contact_no."','".$gender."','".$addr."','".$class_no."')";
    if (mysqli_query($con, $sql)) {
	 echo '<script>alert("data inserted")</Script>';
    }
}

if(isset($_POST["updatestudent"])){
    $s_id = $_POST["s_id"];
    $firstname = $_POST["fname"];
    $mname = $_POST["mname"];
    $lname = $_POST["lname"];
    $emailaddr = $_POST["emailaddr"];
    $contact_no = $_POST["contact_no"];
    $gender = $_POST["gender"];
    $addr = $_POST["addr"];
    $class_no = $_POST["section"];

    // FROM STORED PROCEDURE UpdateStudent
    $sql = "CALL UpdateStudent('".$s_id."', '".$firstname."', '".$mname."', '".$lname."', '".$emailaddr."', '".$contact_no."', '".$gender."', '".$addr."', '".$class_no."')";
    if (mysqli_query($con, $sql)) {
    echo '<script>alert("data updated")</Script>';
    }
}

if (isset($_POST['clear'])) {
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

$section = mysqli_query($con,"select class.id, course_id,course, level, section from class
left join course on class.course_id = course.id");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
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
    <script src="assets/js/common.js"></script>
</head>

<body class="">

    <div class="pcoded-content">
        <div class="page-header">
            <div class="page-block">
                <div class="row align-items-center">
                    <div class="col-md-12">
                        <div class="page-header-title"></div>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html"><i class="feather icon-home"></i></a></li>
                            <li class="breadcrumb-item"><a href="#!">Masterlist</a></li>
                            <li class="breadcrumb-item"><a href="#!">Students</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" id="frm_addstud">
            <div class="row">
                <div class="col-sm form-group">
                <input type="hidden" name="s_id" value="<?php echo $id; ?>">
                    <label for=""><b>Student ID</b></label>
                    <input type="text" class=" form-control form-control-sm" name="student_id" value="<?php echo $student_id; ?>" aria-describedby="" placeholder="Enter Student ID" required />
                </div>
                <div class="col-sm form-group">
                </div>
                <div class="col-sm form-group">
                </div>
            </div>
            <div class="row">
                <div class="col-sm form-group">
                    <label for=""><b>Firstname</b></label>
                        <input type="text" class=" form-control form-control-sm" name="fname" value="<?php echo $firstname; ?>" aria-describedby="" placeholder="Enter Firstname" required />
                    </div>
                    <div class="col-sm form-group">
                        <label for=""><b>Middlename</b></label>
                        <input type="text" class="form-control form-control-sm" name="mname" value="<?php echo $middlename; ?>" aria-describedby="" placeholder="Enter Middlename" required/>
                    </div>
                    <div class="col-sm form-group">
                        <label for=""><b>Lastname</b></label>
                        <input type="text" class="form-control form-control-sm" name="lname" value="<?php echo $lastname; ?>" placeholder="Enter Lastname" required/>
                    </div>
                    </div>
                    <div class="row">
                        <div class="col-sm form-group">
                            <label for=""><b>Email Address</b></label>
                            <input type="text" class="form-control form-control-sm" name="emailaddr" value="<?php echo $email; ?>"  aria-describedby="" placeholder="Enter Email Address" />
                        </div>
                        <div class="col-sm form-group">
                            <label for=""><b>Contact No.</b></label>
                            <input type="text" class="form-control form-control-sm" name="contact_no" value="<?php echo $contact; ?>" aria-describedby="" placeholder="Enter Contact No." />
                        </div>
                        <div class="col-sm form-group">
                            <label for=""><b>Gender</b></label>
                            <select class="form-control form-control-sm" name="gender">
                            <option value="M" <?php if($gender == 'M') {?> selected <?php }?>>Male</option>
                            <option value="F" <?php if($gender == 'F') {?> selected <?php }?>>Female</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm form-group">
                            <label for=""><b>Address</b></label>
                            <textarea rowspan="2" class="form-control form-control-sm" name="addr"  aria-describedby="" placeholder="Enter Address"><?php echo $address; ?></textarea>
                        </div>
                        <div class="col-sm form-group">
                        <label for=""><b>Section</b></label>
                        <select class="form-control form-control-sm" name="section">
                            <option value="" disabled selected>...</option>
                            <?php while($rowsec=mysqli_fetch_array($section)):?>
                            <option value="<?php echo $rowsec['id'];?>" <?php if($class_no == $rowsec['id']) {?> selected <?php }?>>
                                <?php echo $rowsec['course'].'-'.$rowsec['level'].$rowsec['section'];?>
                            </option>
                            <?php endwhile; ?>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm form-group">
                        <?php if(isset($_GET["id"])){ ?>
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="updatestudent">UPDATE</button>  
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="clear">REFRESH</button>   
                        <?php } else { ?>
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="addstudent">ADD NEW</button>
                        </div>
                        <?php } ?>
                    </div>  
                </div>   
        </form> 
    </div>
</div>
</div>  
    <div class="card card-outline cardprimary w-fluid">
    <div class="card-header">
        <h5 class="card-title">&nbsp;&nbsp;List of Students</h5>
    </div>
    <div class="card-body">
    <input type ="text" class="form-control" id="input1" onkeyup="myFunction()" placeholder = "SEARCH HERE.."  autofocus>
        <table class="table table-bordered table-compact table-stripped" style="text-align:center;font-size:13px">
            <thead>
                        <tr class="bg-dark text-white" class='text-center'>
                            <td width="10%"> Student ID </td>
                            <td width="20%"> First name </td>
                            <td width="20%"> Middle name </td>
                            <td width="20%"> Last name </td>
                            <td width="20%"> Current class </td>
                            <td colspan="2"  width="10%">... </td>
                        </tr>
            </thead>
        <tbody id="myTable">
                <?php
                //FROM VIEWS student_addlist
                $sql = "SELECT * FROM student_information"; 
                $result = mysqli_query($con, $sql);
                
                if (!$result) {
                    die("Query failed: " . mysqli_error($con));
                }
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<tr >";
                    echo "<td>" . $row['student_id'] . "</td>";
                    echo "<td>" . $row['firstname'] . "</td>";
                    echo "<td>" . $row['middlename'] . "</td>";
                    echo "<td>" . $row['lastname'] . "</td>";
                    echo "<td>" . $row['current_class'] . "</td>";
                    echo "<td><a href='students.php?id=".$row['id']."&student_id=".
                    $row['student_id']."&student_firstname=".
                    $row['firstname']."&student_middlename=".
                    $row['middlename']."&student_lastname=".
                    $row['lastname']."&student_email=".
                    $row['email']."&student_contact=".
                    $row['contact']."&student_gender=".
                    $row['gender']."&address=".
                    $row['address']."&class_no=".
                    $row['class_no']."'
                    class='btn-primary' style='padding-top:1px;padding-bottom:5px;padding-left:7px;padding-right:7px;'>&nbsp;&nbsp;Edit&nbsp;&nbsp;</a></td>"; 
                    echo "<td>
                    <form method='POST' onsubmit='return confirm(\"Are you sure you want to delete this record?\");'>
                        <input type='hidden' name='s_id' value='" . $row['id'] . "'>
                        <input type='submit' name='delete' class='btn-primary' value='Delete'>
                    </form>
                    </td>";
                    echo "</tr>";                           
                }
                ?>
            </tbody>
        </table>
    </div>
</div>

</body>
<script>
  function myFunction() {
    var input, filter, found, tbody, tr, td, i, j;
    input = document.getElementById("input1");
    filter = input.value.toUpperCase();
    tbody = document.getElementById("myTable");
    tr = tbody.getElementsByTagName("tr");
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for (j = 0; j < td.length; j++) {
            if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
                found = true;
            }
        }
        if (found) {
            tr[i].style.display = "";
            found = false;
        } else {
            tr[i].style.display = "none";
        }
    }
}
</script>
</html>
