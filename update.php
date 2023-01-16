<?php
$connection = new mysqli("localhost","root","","uas_app");
$id = $_POST['id'];
$result = mysqli_query($connection, " update uas set nama='$nama', alamat='$alamat', nohp ='$nohp', tingkatkursus='$tingkatkursus' where id='$id'");
if($result){
    echo json_encode({
        'message' => 'Data edit succesfully'
    });
}else{
    echo json_encode({
        'message' => 'Data failed to update' 
    });
}
?>