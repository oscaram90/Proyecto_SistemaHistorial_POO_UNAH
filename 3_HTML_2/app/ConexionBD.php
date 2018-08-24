<?php
error_reporting(E_ALL);
ini_set('display_errors', '1');
?>

<?php
include('DB.php');
class ConexionBD extends DB{
   
    public function ConectarBD(){
        $dbconn = pg_connect("host=$this->host dbname=$this->dbnombre user=$this->usuario password=$this->password") or
        die('No se ha podido conectar: '.pg_last_error()) ;
        return $dbconn;
    }
    public function Consulta($query){
        $resultado = pg_query($query) or die ('La consulta falló: '.pg_last_error());
        return $resultado;
    }
    
    public function cerrarBD($dbconn){
        pg_close($dbconn);
    }
}



?>