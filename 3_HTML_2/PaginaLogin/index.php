<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../PaginaPrincipal/img/Logo-IS.png">

    <title>Iniciar Sesión</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/Login.css" rel="stylesheet">
  </head>

  <body class="text-center">
    <form action="../app/Verificar.php" method="post" class="form-signin">
      <img class="mb-4" src="../PaginaPrincipal/img/Logo-IS.png" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesión</h1>

      <label for="inputName5" class="sr-only">No. de Cuenta</label>
      <input type="text" id="inputName" name="cuenta" class="form-control"placeholder="No. de cuenta" required autofocus>

      <label for="inputPassword" class="sr-only">Contraseña</label>
      <input type="password" id="inputPassword" name ="pass" class="form-control" placeholder="Contraseña" required>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me">Recordarme
        </label>
      </div>
      <input class="btn btn-lg btn-primary btn-block" type="submit" value="Ingresar" id="edit-submit">
      <p class="mt-5 mb-3 text-muted">&copy; POO - II periodo; 2018</p>
    </form>
  </body>
</html>
