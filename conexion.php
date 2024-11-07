<?php

    $host = "localhost";
    $user = "root";
    $clave = "";
    $bd = "sis_venta";

    $conexion = mysqli_connect($host,$user,$clave,$bd);


    
						// Consulta para obtener el valor de ventas_habilitadas
$sql = "SELECT ventas_habilitadas FROM configuracion WHERE id = 1"; // Reemplaza "1" por el ID específico
$resultado = $conexion->query($sql);

if ($resultado->num_rows > 0) {
    $fila = $resultado->fetch_assoc();
    $ventasHabilitadas = $fila['ventas_habilitadas'];

    // Verifica el valor de ventas_habilitadas
    if (!$ventasHabilitadas) {
        // Si es FALSE, muestra el mensaje
        echo "<script>alert('El sistema no està operativo en estas horas.');</script>";$conexion->close();
    } else {
        // Continúa con el proceso del sistema
       
    }
} else {
    echo "No se encontró la configuración.";
}


// Desactivar la visualización de errores
ini_set('display_errors', 0);
error_reporting(E_ALL);  // Log de todos los errores
    if (mysqli_connect_errno()){
        echo "No se pudo conectar a la base de datos";
        exit();
    }

    mysqli_select_db($conexion,$bd) or die("No se encuentra la base de datos");

    mysqli_set_charset($conexion,"utf8");


?>
