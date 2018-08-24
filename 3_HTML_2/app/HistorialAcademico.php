<?php
include_once('ConexionBD.php');
class HistorialAcademico extends ConexionBD{
    protected  $idEstudiante;
    
   public function __construct($idEstudiante) {
   
    $this->idEstudiante = $idEstudiante; 
    }
    public function IndiceGlobal($idEstudiante){
        $conexion = $this->ConectarBD();
        $query = "SELECT id_periodo FROM tbl_periodo";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_all($busqueda);
        $periodosActivos = 0;
        $arregloIdPeriodos;
        $indiceArreglo = 0;
        for ($i=0; $i < count($registros); $i++) { 
            $idPeriodo =$registros[$i]['id_periodo'];
            $queryVerificarPeriodos = "SELECT id_periodo FROM tbl_notas 
            WHERE id_estudiante='$idEstudiante' and id_periodo =$idPeriodo";
            $busquedaPeriodos = $this->Consulta($queryVerificarPeriodos);
            $registrosPeriodos = pg_fetch_all($busquedaPeriodos);
            if ($registrosPeriodos != null) {
                $arregloIdPeriodos[$indiceArreglo] = $idPeriodo;
                $indiceArreglo++;
                $periodosActivos++;
            }
        }       
        $notaGlobalPeriodo = 0;
        for ($i=0; $i < count($arregloIdPeriodos); $i++) { 
            $periodo = $arregloIdPeriodos[$i];  
            $notaGlobalPeriodo = $notaGlobalPeriodo + $this->IndicePeriodo($idEstudiante, $periodo); 
        }
       
       $indiceGlobal = $notaGlobalPeriodo/$periodosActivos;
       return $indiceGlobal;
       
    }
    public function ObtenerIdUltimoPeriodo($idEstudiante){
        $conexion = $this->ConectarBD();
        $query = "SELECT id_periodo FROM tbl_notas WHERE id_estudiante='$idEstudiante'";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_all($busqueda);
       
        $ultimoPeriodo = $registros[count($registros)-1]['id_periodo'];
        return $ultimoPeriodo;

    }
    public function IndicePeriodo($idEstudiante, $idPeriodo){
        $conexion = $this->ConectarBD();
        $query = "SELECT id_periodo FROM tbl_notas WHERE id_estudiante='$idEstudiante'";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_all($busqueda);
       
        $Periodo = $registros[$idPeriodo]['id_periodo'];
        $query = "SELECT id_clase, nota_final FROM tbl_notas WHERE id_estudiante='$idEstudiante' and
        id_periodo=$Periodo";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_all($busqueda);
        $indice = 0;
        $nota = 0;
        $uv = 0;
        for ($i=0; $i < (count($registros)); $i++) { 
            $nota = $nota + (($registros[$i]['nota_final'])*
            $this->LocalizarUVs($registros[$i]['id_clase'])) ;     
        }
       
        for ($i=0; $i < (count($registros)); $i++) { 
            $uv = $uv + $this->LocalizarUVs($registros[$i]['id_clase']) ;
        }
        $indice = ($nota/$uv);
        $indice = round($indice, 0);
        return $indice;
    }
    public function LocalizarUVs($clase){
        $conexion = $this->ConectarBD();
        $query = "SELECT unidades_valorativas FROM tbl_clases WHERE id_clase='$clase'";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_array($busqueda);
        return $registros[0];
    }
    public function LocalizarRegistros(){
        $conexion = $this->ConectarBD();
        $query = "SELECT id_clase, seccion, id_periodo, nota_final FROM tbl_notas 
        WHERE id_estudiante='$this->idEstudiante'";
        $busqueda = $this->Consulta($query);
        $registros = pg_fetch_all($busqueda);
        return $registros;
    }
    public function OBS($notaFinal){
        if ($notaFinal < 65) {
            echo "RPB";
        } else {
            echo "APR";
        }
    }
}
?>