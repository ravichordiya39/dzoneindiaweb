<?php

require_once("_header.php");
$user_id = trim($_GET['id']);
$username = trim($_GET['user']);
if($user_id != "" AND $username != ""){
	$functions->start_session();
	$time = time();
	$_SESSION['username'] = $username;
	$_SESSION['user_id'] = $user_id;
	$_SESSION['user_logged_in'] = TRUE;
	header('Location: ../account');
}else{
	header('Location : users');
}

require_once("_header.php");
?>