<?php
$query100   =   mysql_query("SELECT * FROM `permissions` WHERE user = '$u'");
$r100       =   mysql_fetch_array($query100);
$c          =   $r100['finanzas'];
$c1         =   $r100['finanzas_cxc'];
$c2         =   $r100['finanzas_clientes'];
$ct         =   0;

$admin      =   $r100['administracion'];
$admin1     =   $r100['admin_c_u'];
$admin2     =   $r100['admin_e_u'];
$admin3     =   $r100['admin_ar'];
$admin4     =   $r100['admin_reportes'];
$admin5     =   $r100['admin_tipo_creditos'];
$admint     =   0;


if($security == 'go'){ 
    
echo '
<div id="sidebar-left" class="span2">
    <div class="nav-collapse sidebar-nav">
        <ul class="nav nav-tabs nav-stacked main-menu">
        ';
    if ($c > 0){ 
        $ct=$c1+$c2 ;
        echo '
            <li>
                <a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Finanzas</span><span class="label label-important"> '.$ct.' </span></a>
                <ul>
                ';
            if($c1 > 0){
                echo '
                    <li><a class="submenu" href="manto_cxc.php"><i class="icon-file-alt"></i><span class="hidden-tablet">Cuentas Por Cobrar</span></a></li>';
            }
            if($c2 > 0){
                echo'
                    <li><a class="submenu" href="manto_clientes.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Listado de Clientes</span></a></li>';
            }
            
           
        echo'
                </ul>	
            </li>
            ';
    }
	
	
    
	   
    
if ($admin > 0){ 
        $admint=$admin1+$admin2+$admin3+$admin4+$admin5;
    echo '
            <li>
                <a class="dropmenu" href="#"><i class="icon-folder-close-alt"></i><span class="hidden-tablet"> Administración</span><span class="label label-important"> '.$admint.' </span></a>
				<ul>';
    if($admin1 > 0){
            echo'
				    <li><a class="submenu" href="creacion_usuarios.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Creación de usuarios</span></a></li>';
    }
    if($admin2 > 0){
            echo'
				    <li><a class="submenu" href="eliminar_usuarios.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Eliminación de usuarios</span></a></li>';
    }
    if($admin3 > 0){
            echo'
                    <!--<li><a class="submenu" href="manto_roles.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Asignación de roles</span></a></li>-->
                    <li><a class="submenu" href="manto_roles.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Asignación de roles</span></a></li>
                    ';
    }
    if($admin4 > 0){
            echo'
                    <!--<li><a class="submenu" href="logs.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Bancos</span></a></li>-->
                    <li><a class="submenu" href="estado_de_cuenta_bancos.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Reporte de vendedores</span></a></li>
                    ';
    }

    if($admin5 > 0){
            echo'
                    
                    <li><a class="submenu" href="manto_tipo_creditos.php"><i class="icon-file-alt"></i><span class="hidden-tablet"> Tipo de creditos</span></a></li>
                    ';
    }
    
    echo'
				</ul>	
            </li>';
}
    echo'
            <li>
                <a href="index.php">
                    <i class="icon-lock"></i>
                        <span class="hidden-tablet"> Cerrar Sesión</span>
                </a>
            </li>
        </ul>
    </div>
</div>
';
}else{
    echo "Usuario no autorizado!";
}
?>