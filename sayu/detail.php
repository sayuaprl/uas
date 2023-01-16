<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-headers: *");

$connection = new mysqli("localhost","root","","uas");
$data       = mysqli_query($connection, "select * from sayu where id=".$_GET['id']);
$data       = mysqli_fetch_array($data, MYSQLI_ASSOC);

echo json_encode($data);