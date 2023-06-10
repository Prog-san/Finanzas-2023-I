<?php
session_start();

// Verificar si el usuario ha iniciado sesión
if (!isset($_SESSION['id'])) {
    header("Location: login.html");
    exit();
}

// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "fin");

// Verificar si se produjo un error al conectarse a la base de datos
if (mysqli_connect_errno()) {
    echo "Error al conectarse a la base de datos: ". mysqli_connect_error();
    exit();
}

// Obtener los datos enviados desde el formulario
$tea = mysqli_real_escape_string($conexion, $_POST['tea']);
$cinicial = mysqli_real_escape_string($conexion, $_POST['cinicial']);
$monto=mysqli_real_escape_string($conexion, $_POST['monto']);
$pgracia=mysqli_real_escape_string($conexion, $_POST['periodogracia']);
$tcambio=mysqli_real_escape_string($conexion, $_POST['tcambio']);
$usuarioId = $_SESSION['id'];
// El usuario no existe, agregarlo a la base de datos
$insertar = "INSERT INTO d_inicial (usuario_id, tasa_deseada, cuota_inicial, monto, pgracia, tcambio) VALUES ('$usuarioId', '$tea', '$cinicial', '$monto', '$pgracia', '$tcambio')";
    if (mysqli_query($conexion, $insertar)) {
        // El usuario se agregó correctamente, mostrar un mensaje de éxito
        echo "El registro se realizo correctamente.";
        header("Location:resultado.php");
        exit();
    } else {
        // No se pudo agregar el usuario, mostrar un mensaje de error
        echo "Error al registrar el usuario: ". mysqli_error($conexion);
    }
// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>
