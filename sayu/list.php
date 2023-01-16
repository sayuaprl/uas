<?php 
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-headers: *");

$connection = new mysqli("localhost","root","","uas");
$data       = mysqli_query($connection, "select * from sayu");
$data       = mysqli_fetch_all($data, MYSQLI_ASSOC);

echo json_encode($data);