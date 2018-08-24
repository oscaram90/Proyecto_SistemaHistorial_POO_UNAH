<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
?>

<?php
session_start();
include_once('../app/HistorialAcademico.php');
include_once('../app/ConexionBD.php');
$HistorialAcademico = new HistorialAcademico($_SESSION['id_estudiante']);
$registros = $HistorialAcademico->LocalizarRegistros();
?>

<html lang="en">
<head>
  <title>Historial Academico</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" href="../PaginaPrincipal/img/Logo-IS.png">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link href="css/cualidades.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
    <link href="blog.css" rel="stylesheet">
  
</head>
<body>
        <div class="container">
                <header class="blog-header py-3">
                  <div class="row flex-nowrap justify-content-between align-items-center"> 
                    <div class="col-12 text-center">
                      <a class="blog-header-logo text-dark" href="#">BIENVENIDO</a>
                    </div>   
                  </div>
                </header>
          
                <div class="nav-scroller py-1 mb-2">
                  <nav class="nav d-flex justify-content-between">
                    <a class="btn btn-light" href="#">Primer Ingreso</a>
                    <a class="btn btn-light" href="#">Sistema de Pregrado</a>
                    <a class="btn btn-light" href="#">Sistema de Postgrado</a>
                    <a class="btn btn-light" href="#">Administración</a>
                    <a class="btn btn-light" href="https://www.unah.edu.hn/oferta-academica" target="_blank">Oferta Academica</a>
                    <a class="btn btn-light" href="https://campusvirtual.unah.edu.hn/" target="_blank">Campus Virtual</a>
                    <a class="btn btn-light" href="https://mail.unah.edu.hn/" target="_blank">Correo Institucional</a>
                  </nav>
                </div><hr><br>
      <div class="text-right">
      <a href="menuPrincipal.php" class="btn btn-primary btn-sm active" role="button" aria-pressed="true">Atrás</a>
      <a href="../PaginaLogin/index.php" class="btn btn-secondary btn-sm"role="buttom" aria-pressed="true">Cerrar Sesión</a>
      </div>
<div class="container">
        <h2>INFORMACION GENERAL </h2>
        <table>
                <thead>
                    <tr>
                        <th></th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                  </thead>
                  <tbody>
                      <tr>
                              <td>Cuenta: </td>
                              <td><?php echo $_SESSION["id_estudiante"] ?></td>
                              <td>Centro: </td>
                              <td><?php echo $_SESSION["centro"] ?></td>      
                      </tr>
                      <tr>
                          <td>Nombre: </td>
                          <td><?php echo $_SESSION["nombres"] ." ". $_SESSION["apellidos"] . "  " ?></td>
                          <td>Indice Global:  </td>
                          <td><?php echo $HistorialAcademico->IndiceGlobal($_SESSION["id_estudiante"]); ?></td>
                      </tr>
                      <tr>
                          <td>Carrera: </td>
                          <td><?php echo $_SESSION["carrera"] ?></td>
                          <td>Indice Periodo: </td>
                          <td><?php echo $HistorialAcademico->IndicePeriodo($_SESSION["id_estudiante"], 
                          $HistorialAcademico->ObtenerIdUltimoPeriodo($_SESSION["id_estudiante"])); ?></td>
                      </tr>
                  </tbody>
            </table>
</div>
<hr>

<div class="container">
  <h2>Historial academico</h2>
  <p>Clases cursadas:</p>
  
  <table class="table table-bordered table-sm">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Asignatura</th>
        <th>UV</th>
        <th>Sección</th>
        <th>Año</th>
        <th>Periodo</th>
        <th>Calificacion</th>
        <th>Obs</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><?php echo $registros[0]['id_clase']?></td>
        <td><?php echo $registros[0]['id_clase']?></td>
        <td><?php echo $HistorialAcademico->LocalizarUVs($registros[0]['id_clase'])?></td>
        <td><?php echo $registros[0]['seccion']?></td>
        <td></td>
        <td><?php echo $registros[0]['id_periodo']?></td>
        <td><?php echo $registros[0]['nota_final']?></td>
        <td><?php $HistorialAcademico->OBS($registros[0]['nota_final'])?></td>
      </tr>
          <tr>
          <td><?php echo $registros[1]['id_clase']?></td>
        <td><?php echo $registros[1]['id_clase']?></td>
        <td><?php echo $HistorialAcademico->LocalizarUVs($registros[1]['id_clase'])?></td>
        <td><?php echo $registros[1]['seccion']?></td>
        <td></td>
        <td><?php echo $registros[1]['id_periodo']?></td>
        <td><?php echo $registros[1]['nota_final']?></td>
        <td><?php $HistorialAcademico->OBS($registros[1]['nota_final'])?></td>
          </tr>
              <tr>
        <td><?php echo $registros[2]['id_clase']?></td>
        <td><?php echo $registros[2]['id_clase']?></td>
        <td><?php echo $HistorialAcademico->LocalizarUVs($registros[2]['id_clase'])?></td>
        <td><?php echo $registros[2]['seccion']?></td>
        <td></td>
        <td><?php echo $registros[2]['id_periodo']?></td>
        <td><?php echo $registros[2]['nota_final']?></td>
        <td><?php $HistorialAcademico->OBS($registros[2]['nota_final'])?></td>
              </tr>
    </tbody>
  </table>
</div>
<footer class="blog-footer">
        <p>Derechos Reservados <a href="https://getbootstrap.com/">IS </a> por <a href="https://twitter.com">@OscarJosueJose</a>.</p>
        <p>
          <a href="#">UNAH - II Periodo 2018</a>
        </p>
      </footer>
  
      <!-- Bootstrap core JavaScript
      Placed at the end of the document so the pages load faster -->
      <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="js/jquery-slim.min.js"><\/script>')</script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.min.js"></script>
      <script src="js/holder.min.js"></script>

</body>
</html>
