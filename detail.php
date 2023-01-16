<?php
$connection = mysqli_connect("localhost","root","","datanilairaport");
$data = mysqli_query($connection, "select * from data_nilai");
$datas = mysqli_fetch_array($data, MYSQLI_ASSOC);

echo json_encode($datas);
?>