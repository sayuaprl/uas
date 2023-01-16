<?php
$connection = mysqli_connect("localhost","root","","datanilairaport");
$data = mysqli_query($connection, "select * from data_nilai");
$data = mysqli_fetch_all($data, MYSQLI_ASSOC);
echo json_encode($data);
?>