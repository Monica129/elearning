<?php  header('Content-Type: text/html; charset=iso-8859-15');
    require('connect.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Informations</title>
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
<style>
th { 
    font-size:13px;
    padding:5px; 
}
td { 
    font-size:13px;
    padding:5px; 
}
</style>
<body>


<div class="card card-outline cardprimary w-fluid">
    <div class="card-header">
        <h3 class="card-title">Student Informations</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
    <input type ="text" class="form-control" id="input1" onkeyup="myFunction()" placeholder = "SEARCH HERE.."  autofocus>
   <table class=" table-bordered table-compact table-stripped">
            <thead>
                <tr class='text-center' >
                    <th width="5%">STUDENT ID</th>
                    <th width="15%">FIRST NAME</th>
                    <th width="15%">MIDDLE NAME</th>
                    <th width="15%">LAST NAME</th>                    
                    <th width="10%">EMAIL</th>
                    <th width="10%">CONTACT</th>
                    <th width="5%">GENDER</th>
                    <th width="15%">ADDRESS</th>
                    <th width="10%">CURRENT CLASS</th>
                </tr>
            </thead>
            <tbody id="myTable">
                <?php 
                $i =1;
                //student_information is a view
                $qry = $con->query("SELECT * FROM student_information"); 
                while($row=$qry->fetch_assoc()):
                ?>
                <tr class='text-center'>
                    <td><?php echo $row['student_id'] ?></td>
                    <td><?php echo $row['firstname'] ?></td>
                    <td><?php echo $row['middlename'] ?></td>
                    <td><?php echo $row['lastname'] ?></td>                   
                    <td><?php echo $row['email'] ?></td>
                    <td><?php echo $row['contact'] ?></td>
                    <td><?php echo $row['gender'] ?></td>
                    <td><?php echo $row['address'] ?></td>
                    <td><?php echo $row['current_class'] ?></td> 
                </tr>
                <?php endwhile; ?>
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