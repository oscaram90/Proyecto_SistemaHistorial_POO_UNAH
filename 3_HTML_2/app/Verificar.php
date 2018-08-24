<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
?>

<?php

include('ConexionBD.php');
session_start();
$idEstudiante = $_POST['cuenta'];
$password = $_POST['pass'];
$con = new ConexionBD;
$conexion = $con->ConectarBD();
$query = "SELECT id_estudiante, password FROM tbl_estudiantes WHERE id_estudiante='$idEstudiante' and
password='$password'";
$busqueda = $con->Consulta($query);
$verificar = pg_fetch_array($busqueda);
if ($verificar["id_estudiante"]==$idEstudiante && $verificar["password"] == $password) {
    $query = "SELECT * FROM tbl_estudiantes WHERE id_estudiante='$idEstudiante'";
    $busqueda = $con->Consulta($query);
    $registro = pg_fetch_array($busqueda);
    $_SESSION["id_estudiante"] = $idEstudiante;
    $_SESSION["password"] = $password;
    $_SESSION["nombres"] = $registro["nombres"];
    $_SESSION["apellidos"] = $registro["apellidos"];
    $_SESSION["centro"] = $registro["id_centro_universitario"];
    $_SESSION["carrera"] = $registro["id_carrera"];

    header('Location: ../PaginaMenuPrincipal/menuPrincipal.php');
} else {
    
    header('Location: ../PaginaLogin/index.php');
}

?>