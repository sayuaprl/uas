<?php
$connection = new mysqli("localhost","root","","uas_app");
$ip = $_POST['ip'];
$result = mysqli_query($connection, " insert into uas set nama='$nama', nim='$nim', ip='$ip'");
if($result){
    echo json_encode({
        'message' => 'Data input succesfully'
    });
}else{
    echo json_encode({
        'message' => 'Data failed to input' 
    });
}
?>