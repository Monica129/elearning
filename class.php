<?php header('Content-Type: text/html; charset=iso-8859-15');
require('connect.php');
$id = "";
$department_id = "";
$course_id = "";
$level ="";
$section = "";

if(isset($_GET["id"])){
    $id = $_GET["id"];
    $department_id = $_GET["department"];
    $course_id = $_GET["course"];
    $level = $_GET["level"];
    $section = $_GET["section"];
}


if (isset($_POST['delete'])) {
    $c_id = $_POST['id'];
    // FROM STORED PROCEDURE DeleteClass
    $sql = "CALL DeleteClass(?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $c_id);
    $stmt->execute();

    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

if(isset($_POST["addclass"])){
    $department_id = $_POST["department"];
    $course_id = $_POST["course"];
    $level = $_POST["level"];
    $section = $_POST["section"];


    // FROM STORED PROCEDURE AddNewClass
    $sql = "CALL AddNewClass ('".$department_id."','".$course_id."','".$level."','".$section."')";
    if (mysqli_query($con, $sql)) {
	 echo '<script>alert("data inserted")</Script>';
    }
}

if(isset($_POST["updateclass"])){
    $id = $_POST["c_id"];
    $department_id = $_POST["department"];
    $course_id = $_POST["course"];
    $level = $_POST["level"];
    $section = $_POST["section"];


    // FROM STORED PROCEDURE UpdateClass
    $sql = "CALL UpdateClass('".$id."', '".$department_id."', '".$course_id."', '".$level."', '".$section."')";
    if (mysqli_query($con, $sql)) {
    echo '<script>alert("data updated")</Script>';
    }
}

if (isset($_POST['clear'])) {
    header("Location: " . $_SERVER['PHP_SELF']);
    exit;
}

$dep = mysqli_query($con,"SELECT * from department  order by department");
$course = mysqli_query($con,"SELECT * from course  order by course");
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
                            <li class="breadcrumb-item"><a href="#!">Library</a></li>
                            <li class="breadcrumb-item"><a href="#!">Class</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <form method="POST" id="frm_addstud">
        <input type="hidden" name="c_id" value="<?php echo $id; ?>">
            <div class="row">
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
                <div class="col-sm form-group">
                    <label for=""><b>Course</b></label>
                    <select class="form-control form-control-sm" name="course">
                    <option value="" disabled selected>...</option>
                    <?php while($rowcourse=mysqli_fetch_array($course)):?>
                    <option value="<?php echo $rowcourse['id'];?>" <?php if($course_id == $rowcourse['id']) {?> selected <?php }?>>
                    <?php echo $rowcourse['course'];?>
                    </option>
                    <?php endwhile; ?>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-sm form-group">
                    <label for=""><b>Level</b></label>
                    <input type="text" class="form-control form-control-sm" name="level" value="<?php echo $level; ?>" required/>
                </div>
                <div class="col-sm form-group">
                    <label for=""><b>Section</b></label>
                    <input type="text" class="form-control form-control-sm" name="section" value="<?php echo $section; ?>" required/>
                </div>
            </div>
            <div class="row">
                <div class="col-sm form-group">
                    <?php if(isset($_GET["id"])){ ?>
                    <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="updateclass">UPDATE</button>  
                    <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="clear">REFRESH</button>   
                    <?php } else { ?>
                    <button type="submit" class="mb-3  form-control-smbtn  btn-primary" name="addclass">ADD NEW</button>
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
        <h5 class="card-title">&nbsp;&nbsp;List of Class</h5>
    </div>
    <div class="card-body">
    <input type ="text" class="form-control" id="input1" onkeyup="myFunction()" placeholder = "SEARCH HERE.."  autofocus>
        <table class="table table-bordered table-compact table-stripped" style="text-align:center;font-size:13px">
            <thead>
                        <tr class="bg-dark text-white" class='text-center'>
                            <td> Class ID </td>
                            <td> Department </td>
                            <td> Class</td>
                            <td colspan="2"  width="10%">... </td>        
                        </tr>
            </thead>
            <tbody id="myTable">
                <?php
                //FROM VIEWS student_addlist
                $sql = "SELECT * FROM class_information"; 
                $result = mysqli_query($con, $sql);
                
                if (!$result) {
                    die("Query failed: " . mysqli_error($con));
                }
                while($row = mysqli_fetch_assoc($result)) {
                    echo "<tr >";
                    echo "<td>" . $row['id'] . "</td>";
                    echo "<td>" . $row['department'] . "</td>";
                    echo "<td>" . $row['course'] ." ".$row['level'].$row['section']."</td>";
                     echo "<td><a href='class.php?id=".$row['id']."&department=".
                    $row['department_id']."&course=".
                    $row['course_id']."&level=".
                    $row['level']."&section=".
                    $row['section']."'
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