<?php
session_start();
require_once "conexion.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
	$celular = $conexion->real_escape_string($_POST["celular"]);
	$sql = "SELECT * FROM usuarios WHERE celular = '$celular'";
	$resultado = $conexion->query($sql);
	if ($resultado && $resultado->num_rows === 1) {
		$_SESSION["celular"] = $celular;
		header("Location: transacciones.php");
		exit;
	} else {
		echo "<script>alert('Celular no registrado'); window.location.href='../frontend/index.html';</script>";
	}
}
