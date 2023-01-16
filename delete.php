<?php
$connection = new mysqli("localhost","root","","datanilairapot");
$id = $_POST['id'];
$result = mysqli_query($connection, " delete from data_nilai where id=".$id);
if($result){
    echo json_encode({
        'message' => 'Data delete succesfully'
    });
}else{
    echo json_encode({
        'message' => 'Data failed to delete' 
    });
}
?>