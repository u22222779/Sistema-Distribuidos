<?php
session_start();
require_once "conexion.php";

if (!isset($_SESSION["celular"])) {
	header("Location: ../frontend/index.html");
	exit;
}

$celular = $_SESSION["celular"];

// Obtener datos del usuario
$sqlUsuario = "SELECT nombre, celular, saldo FROM usuarios WHERE celular = '$celular'";
$resultUsuario = $conexion->query($sqlUsuario);
$usuario = $resultUsuario->fetch_assoc();

// Obtener historial de transacciones donde el usuario es emisor
$sqlHistorial = "SELECT receptor, monto, fecha FROM transacciones WHERE emisor = '$celular' ORDER BY fecha DESC";
$resultHistorial = $conexion->query($sqlHistorial);
?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="UTF-8">
	<title>Historial de Transacciones</title>
	<style>
		body {
			font-family: Arial, sans-serif;
			margin: 20px;
		}

		h3 {
			margin-bottom: 10px;
		}

		table {
			border-collapse: collapse;
			width: 70%;
			margin-top: 15px;
		}

		th,
		td {
			border: 1px solid #ccc;
			padding: 8px;
			text-align: center;
		}

		th {
			background-color: #f2f2f2;
		}

		.info {
			border: 1px solid #ccc;
			padding: 10px;
			width: 70%;
			margin-bottom: 15px;
		}

		.info strong {
			display: inline-block;
			width: 100px;
		}

		.saldo {
			float: right;
			font-weight: bold;
		}
	</style>
</head>

<body>

	<h3>Propuesta de presentación del historial de transacciones</h3>

	<div class="info">
		<p><strong>Nombre:</strong> <?= htmlspecialchars($usuario['nombre']) ?></p>
		<p><strong>Celular:</strong> <?= htmlspecialchars($usuario['celular']) ?>
			<span class="saldo">Saldo: <?= number_format($usuario['saldo'], 2) ?></span>
		</p>
	</div>

	<table>
		<tr>
			<th>Receptor</th>
			<th>Monto</th>
			<th>Fecha</th>
		</tr>
		<?php if ($resultHistorial && $resultHistorial->num_rows > 0): ?>
			<?php while ($row = $resultHistorial->fetch_assoc()) { ?>
				<tr>
					<td><?= htmlspecialchars($row['receptor']) ?></td>
					<td><?= number_format($row['monto'], 2) ?></td>
					<td><?= htmlspecialchars($row['fecha']) ?></td>
				</tr>
			<?php } ?>
		<?php else: ?>
			<tr>
				<td colspan="3">No hay transacciones.</td>
			</tr>
		<?php endif; ?>
	</table>

	<a href="../frontend/index.html" style="display:block;margin-top:20px;">Cerrar sesión</a>
</body>

</html>
</body>

</html>