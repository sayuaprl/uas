<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-headers: *");

    $connection = new mysqli("localhost", "root", "", "uas");
    $id      = $_POST['id']; 
    $nama    = $_POST['nama'];
    $nisn    = $_POST['nisn'];
    $kelas    = $_POST['kelas'];
    $mata_pelajaran    = $_POST['mata_pelajaran'];
    $nilai    = $_POST['nilai'];
        
    $result = mysqli_query($connection, "update sayu set nama='$nama', nisn='$nisn', kelas='$kelas', mata_pelajaran='$mata_pelajaran',  nilai='$nilai' where id='$id'");
        
    if($result){
        echo json_encode([
            'message' => 'Data edit successfully'
        ]);
    }else{
        echo json_encode([
            'message' => 'Data Failed to update'
        ]);
    }