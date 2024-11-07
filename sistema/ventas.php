<?php include_once "includes/header.php"; ?>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">Panel de Administración</h1>
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="table-responsive">
				<table class="table table-striped table-bordered" id="table">
					<thead class="thead-dark">
						<tr>
							<th>Id</th>
							<th>Fecha</th>
							<th>Total</th>
							<th>Acciones</th>
						</tr>
					</thead>
					<tbody>
						<?php
						require "../conexion.php";
						// Consulta para obtener el valor de ventas_habilitadas
$sql = "SELECT ventas_habilitadas FROM configuracion WHERE id = 1"; // Reemplaza "1" por el ID específico
$resultado = $conexion->query($sql);

if ($resultado->num_rows > 0) {
    $fila = $resultado->fetch_assoc();
    $ventasHabilitadas = $fila['ventas_habilitadas'];

    // Verifica el valor de ventas_habilitadas
    if (!$ventasHabilitadas) {
        // Si es FALSE, muestra el mensaje
        echo "<script>alert('La venta no puede hacerse en estas horas.');</script>";$conexion->close();
    } else {
        // Continúa con el proceso de venta
        
    }
} else {
    echo "No se encontró la configuración.";
}


// Desactivar la visualización de errores
ini_set('display_errors', 0);
error_reporting(E_ALL);  // Log de todos los errores
						$query = mysqli_query($conexion, "SELECT nofactura, fecha,codcliente, totalfactura, estado FROM factura ORDER BY nofactura DESC");
						mysqli_close($conexion);
						$cli = mysqli_num_rows($query);

						if ($cli > 0) {
							while ($dato = mysqli_fetch_array($query)) {
						?>
								<tr>
									<td><?php echo $dato['nofactura']; ?></td>
									<td><?php echo $dato['fecha']; ?></td>
									<td><?php echo $dato['totalfactura']; ?></td>
									<td>
										<button type="button" class="btn btn-primary view_factura" cl="<?php echo $dato['codcliente'];  ?>" f="<?php echo $dato['nofactura']; ?>">Ver</button>
									</td>
								</tr>
						<?php }
						} ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>



</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->


<?php include_once "includes/footer.php"; ?>