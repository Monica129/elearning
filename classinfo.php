<!DOCTYPE html>
<html lang="en">
<head>
    <title>Class Informations</title>
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

<?php
    require('connect.php');
?>

<div class="card card-outline cardprimary w-fluid">
    <div class="card-header">
        <h3 class="card-title">Class Informations</h3>
        <div class="card-tools">
        </div>
    </div>
    <div class="card-body">
        <table class="table table-bordered table-compact table-stripped">
            <thead>
                <tr class='text-center'>
                    <th>#</th>
                    <th>level</th>
                    <th>section</th>
                    <th>course</th>
                    <th>subject_description</th>
                </tr>
            </thead>
            <tbody>
                <?php 
                $i =1;
                $qry = $con->query("SELECT * FROM class_information"); 
                while($row=$qry->fetch_assoc()):
                ?>
                <tr class='text-center'>
                    <td><?php echo $i++ ?></td>
                    <td><?php echo $row['level'] ?></td>
                    <td><?php echo $row['section'] ?></td>
                    <td><?php echo $row['course'] ?></td>
                    <td><?php echo $row['subject_description'] ?></td>
                </tr>
                <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>