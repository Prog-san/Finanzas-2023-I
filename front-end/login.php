
<?php
// Conexión a la base de datos
$conexion = mysqli_connect("localhost", "root", "", "fin");

// Verificar si se produjo un error al conectarse a la base de datos
if (mysqli_connect_errno()) {
    echo "Error al conectarse a la base de datos: ". mysqli_connect_error();
    exit();
}
// Obtener los datos enviados desde el formulario
$usuario = mysqli_real_escape_string($conexion, $_POST['nombre']);
$contrasena = mysqli_real_escape_string($conexion, $_POST['password']);

// Buscar al usuario en la base de datos
$consulta = "SELECT * FROM usuarios WHERE usuarios.nombre = '$usuario'";
$resultado = mysqli_query($conexion, $consulta);
$consulta1 = "SELECT * FROM usuarios WHERE contrasena = '$contrasena'";
$resultado1= mysqli_query($conexion, $consulta1);
// Verificar si se encontró al usuario y la contraseña es correcta
if ($fila = mysqli_fetch_assoc($resultado)) {
// Se encontró al usuario, verificar la contraseña
if ($fila1 = mysqli_fetch_assoc($resultado1)) {
    // La contraseña es correcta, iniciar sesión para el usuario
    session_start();
    $_SESSION['nombre'] = $fila['nombre'];
    $_SESSION['id'] = $fila['id'];
    header("Location:DatosIniciales.html");
    exit();
} else {
    // La contraseña es incorrecta, mostrar un mensaje de error
    echo "El nombre de usuario o la contraseña son incorrectos.";

}
} else {
// No se encontró al usuario, mostrar un mensaje de error
echo "El nombre de usuario o la contraseña son incorrectos.";
}
// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>


