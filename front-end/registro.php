<?php
// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "fin");

// Verificar si se produjo un error al conectarse a la base de datos
if (mysqli_connect_errno()) {
    echo "Error al conectarse a la base de datos: ". mysqli_connect_error();
    exit();
}

// Obtener los datos enviados desde el formulario
$nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
$contrasena = mysqli_real_escape_string($conexion, $_POST['contrasena']);
$apellido=mysqli_real_escape_string($conexion, $_POST['apellido']);
$dni=mysqli_real_escape_string($conexion, $_POST['dni']);
$telefono=mysqli_real_escape_string($conexion, $_POST['telefono']);


// Verificar si el usuario ya existe en la base de datos
$consulta = "SELECT * FROM usuarios WHERE usuarios.dni = '$dni'";
$resultado = mysqli_query($conexion, $consulta);
if (mysqli_num_rows($resultado) > 0) {
    // El usuario ya existe, mostrar un mensaje de error
    echo "Este usuario ya existe";
} else {
    // El usuario no existe, agregarlo a la base de datos
    $insertar = "INSERT INTO usuarios (nombre, apellido, dni, telefono, contrasena) VALUES ('$nombre', '$apellido','$dni','$telefono','$contrasena')";
    if (mysqli_query($conexion, $insertar)) {
        // El usuario se agregó correctamente, mostrar un mensaje de éxito
        echo "El usuario se registró correctamente.";
        header("Location:login.html");
        exit();
    } else {
        // No se pudo agregar el usuario, mostrar un mensaje de error
        echo "Error al registrar el usuario: ". mysqli_error($conexion);
    }
}

// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>
