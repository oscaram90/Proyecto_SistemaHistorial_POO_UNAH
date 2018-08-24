<?php
abstract class DB
{
protected $dbnombre = 'bd_proyecto';
protected $usuario = 'usuario_proyecto';
protected $host = 'localhost';
protected $password = 'Poo2018';

abstract protected function ConectarBD();

}
?>