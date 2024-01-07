<?php header('Content-Type: text/html; charset=iso-8859-15');
require('connect.php');
$id = "";
$faculty_id = "";
$firstname = "";
$middlename = "";
$lastname ="";
$email = "";
$contact = "";
$gender = "";
$address = "";
$department_id = "";

if(isset($_GET["id"])){
    $id = $_GET["id"];
    $firstname = $_GET["firstname"];
    $middlename = $_GET["middlename"];
    $lastname = $_GET["lastname"];
    $email = $_GET["email"];
    $contact = $_GET["contact"];
    $gender = $_GET["gender"];
    $address = $_GET["address"];
    $department_id = $_GET["department"];

}


if (isset($_POST['delete'])) {
    $f_id = $_POST['id'];
    // FROM STORED PROCEDURE DeleteFaculty 
    $sql = "CALL DeleteFaculty(?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $f_id);
    $stmt->execute();

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

if(isset($_POST["addfaculty"])){
    $firstname = $_POST["fname"];
    $mname = $_POST["mname"];
    $lname = $_POST["lname"];
    $emailaddr = $_POST["emailaddr"];
    $contact_no = $_POST["contact_no"];
    $gender = $_POST["gender"];
    $addr = $_POST["addr"];
    $department_id = $_POST["department"];

    // FROM STORED PROCEDURE AddNewFaculty
    $sql = "CALL AddNewFaculty ('".$firstname."','".$mname."','".$lname."','".$emailaddr."','".$contact_no."','".$gender."','".$addr."','".$department_id."')";
    if (mysqli_query($con, $sql)) {
	 echo '<script>alert("data inserted")</Script>';
    }
}

if(isset($_POST["updatefaculty"])){
    $id = $_POST["f_id"];
    $firstname = $_POST["fname"];
    $mname = $_POST["mname"];
    $lname = $_POST["lname"];
    $emailaddr = $_POST["emailaddr"];
    $contact_no = $_POST["contact_no"];
    $gender = $_POST["gender"];
    $addr = $_POST["addr"];
    $department_id = $_POST["department"];

    // FROM STORED PROCEDURE UpdateFaculty
    $sql = "CALL UpdateFaculty('".$id."', '".$firstname."', '".$mname."', '".$lname."', '".$emailaddr."', '".$contact_no."', '".$gender."', '".$addr."', '".$department_id."')";
    if (mysqli_query($con, $sql)) {
    echo '<script>alert("data updated")</Script>';
    }
}

if (isset($_POST['clear'])) {
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

$dep = mysqli_query($con,"SELECT * from department  order by department");
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
                            <li class="breadcrumb-item"><a href="#!">Faculty</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" id="frm_addstud">
        <input type="hidden" name="f_id" value="<?php echo $id; ?>">
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
                        <label for=""><b>Department</b></label>
                        <select class="form-control form-control-sm" name="department">
                            <option value="" disabled selected>...</option>
                            <?php while($rowdep=mysqli_fetch_array($dep)):?>
                            <option value="<?php echo $rowdep['id'];?>" <?php if($department_id == $rowdep['id']) {?> selected <?php }?>>
                                <?php echo $rowdep['department'];?>
                            </option>
                            <?php endwhile; ?>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm form-group">
                        <?php if(isset($_GET["id"])){ ?>
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="updatefaculty">UPDATE</button>  
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="clear">REFRESH</button>   
                        <?php } else { ?>
                        <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="addfaculty">ADD NEW</button>
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
        <h5 class="card-title">&nbsp;&nbsp;List of Faculty</h5>
    </div>
    <div class="card-body">
    <input type ="text" class="form-control" id="input1" onkeyup="myFunction()" placeholder = "SEARCH HERE.."  autofocus>
        <table class="table table-bordered table-compact table-stripped" style="text-align:center;font-size:13px">
            <thead>
                        <tr class="bg-dark text-white" class='text-center'>
                            <td> Faculty ID </td>
                            <td> First name </td>
                            <td> Middle name </td>
                            <td> Last name </td>
                            <td> Current class </td>
                            <td colspan="2"  width="10%">... </td>        
                        </tr>
            </thead>
            <tbody id="myTable">
                <?php
                //FROM VIEWS faculty_information
                $sql = "SELECT * FROM faculty_information"; 
                $result = mysqli_query($con, $sql);
                
                if (!$result) {
                    die("Query failed: " . mysqli_error($con));
                }
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<tr >";
                    echo "<td>" . $row['id'] . "</td>";
                    echo "<td>" . $row['firstname'] . "</td>";
                    echo "<td>" . $row['middlename'] . "</td>";
                    echo "<td>" . $row['lastname'] . "</td>";
                    echo "<td>" . $row['department'] . "</td>";
                    echo "<td><a href='faculty.php?id=".$row['id']."&firstname=".
                    $row['firstname']."&middlename=".
                    $row['middlename']."&lastname=".
                    $row['lastname']."&email=".
                    $row['email']."&contact=".
                    $row['contact']."&gender=".
                    $row['gender']."&address=".
                    $row['address']."&department=".
                    $row['department_id']."'
                    class='btn-primary' style='padding-top:1px;padding-bottom:5px;padding-left:7px;padding-right:7px;'><span>&nbsp;&nbsp;Edit&nbsp;&nbsp;</span></a ></td>"; 
                    echo "<td>
                    <form method='POST' action='' onsubmit='return confirm(\"Are you sure you want to delete this record?\");'>
                        <input type='hidden' name='id' value='" . $row['id'] . "'>
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