<?php
    require 'ini.php';
    require 'connection.php';
    require 'core.php';
    $monica = "no";
?>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<!-- start: Meta -->
	<meta charset="utf-8">
	<title><?php echo "$nombre_p"; ?></title>
	<meta name="description" content="Sistema de cobro diario">
	<meta name="author" content="Selvin Benito">
	<meta name="keyword" content="Dashboard, Admin">
	<!-- end: Meta -->
	
	<!-- start: Mobile Specific -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- end: Mobile Specific -->
	
	<!-- start: CSS -->
	<link id="bootstrap-style" href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
	<link id="base-style" href="css/style.css" rel="stylesheet">
	<link id="base-style-responsive" href="css/style-responsive.css" rel="stylesheet">
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
	<script type="text/javascript">function newDoc() {
    window.location.assign("manto_clientes.php")
}</script>	
		
		
</head>
    
    <?php
                if(empty($_POST)===false){
                    $codigo     =   $_POST['cod'];
                    $query1     =   mysql_query("SELECT * FROM `clientes` WHERE codigo = '$codigo'");
                    $r1         =   mysql_fetch_array($query1);
                    
                    $fecha                 =    $r1['fecha'];
                    $nombre     		   =    $r1['nombres'];
                    $apellidos             =    $r1['apellidos'];
                    $dpi    			   =    $r1['dpi'];
                    $direccion             =    $r1['direccion'];
                    $tel 			       =    $r1['tel'];
                    $nombre_fiador         =    $r1['nombre_fiador'];
                    $apellido_fiador       =    $r1['apellido_fiador'];
                    $dpi_fiador	           =    $r1['dpi_fiador'];
                    $direccion_fiador      =    $r1['direccion_fiador'];
                    $telefono_fiador       =    $r1['telefono_fiador'];
                    $id_vendedor           =    $r1['id_vendedor'];
                    $cat 				   =	$r1['cat'];

                    $sql_cat			   =	mysql_query("SELECT id_cat, catalogacion FROM `catalogacion` WHERE id_cat = '$cat'");
                    $rcat				   =	mysql_fetch_array($sql_cat);

                    $cat1 				   =	$rcat['catalogacion'];
                    $id_cat1 			   =	$rcat['id_cat'];
                    
                }
                if(empty($_POST)===false && $_POST['editar']=='edit'){
                    
                    $codigo                =    $_POST['codigo'];
                    $fecha                 =    $_POST['date01'];
                    $nombre_comercial      =    $_POST['n_comercial'];
                    $apellidos             =    $_POST['apellidos'];
                    $codigo                =    $_POST['codigo'];
                    $dpi                   =    $_POST['dpi'];
                    $direccion             =    $_POST['direccion'];
                    $tel                   =    $_POST['tel'];
                    $cat 				   =	$_POST['cat'];

                    $n_fiador              =    $_POST['n_fiador'];
                    $ape_fiador            =    $_POST['ape_fiador'];
                    $dpi_fiador            =    $_POST['dpi_fiador'];
                    $dir_fiador            =    $_POST['dir_fiador'];
                    $tel_fiador            =    $_POST['tel_fiador'];

                    
                    
                    $query      =   mysql_query("UPDATE `clientes` SET `nombres` = '$nombre_comercial', `apellidos` = '$apellidos', `dpi` = '$dpi', `direccion` = '$direccion', `tel` = '$tel', `nombre_fiador` = '$n_fiador', `apellido_fiador` = '$ape_fiador', `dpi_fiador` = '$dpi_fiador', `direccion_fiador` = '$dir_fiador', `telefono_fiador` = '$tel_fiador', `cat` = '$cat' WHERE `clientes`.`codigo` = '$codigo';");
                    
                    $fecha  =   date("m/d/Y");
                    
                    //$u      =   "Usuario registrado";
                    $d      =   "Actualizo el cliente: ";
                    $t      =   "clientes";
            
                    insert_logs($da, $u, $d, $t, $nombre_comercial);
                    
                    $monica =   "yes";
                }
            ?>

<body>
		<!-- start: Header -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse" data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</a>
				<a class="brand" href="one.php"><span><?php echo "$nombre_p"; ?></span></a>
								
				<!-- start: Header Menu --> 
		<?php
                require 'user.php';
        ?>
				<!-- end: Header Menu -->
				
			</div>
		</div>
	</div>
	<!-- start: Header -->
	
		<div class="container-fluid-full">
		<div class="row-fluid">
				
			<!-- start: MAIN MENU **************************************************** -->
			<?php
                require 'side_bar.php';
            ?>
			<!-- end: MAIN MENU ****************************************************** -->
			
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Advertencia!</h4>
					<p>Necesitas tener <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> habilitado en tu computadora!.</p>
				</div>
			</noscript>
			
			<!-- start: Content ****************************************************** - -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="one.php">Inicio</a> 
					<i class="icon-angle-right"></i>
				</li>
				<li>
                    <a href="#">Ventas</a>
                    <i class="icon-angle-right"></i>
                    <a href="manto_clientes.php">Mantenimiento de Clientes</a>
                    <i class="icon-angle-right"></i>
                    <a href="#">Ficha de clientes</a>
                </li>
			</ul>
                <?php
                if($security == 'go'){
                    if($monica=="yes"){
                        echo "<h3>Cliente ingresado exitosamente!</h3>";
                    }else{
                ?>
                <h1>Ficha de Clientes</h1>
                					<div class="box-content">
						<form class="form-horizontal" method="post">
						  <fieldset>
							  <label class="control-label" for="date01">Fecha:</label>
							  <div class="controls">
								<input type="text" class="input-xlarge datepicker" id="date01" name="date01" disabled value="<?php echo "$fecha";?>">
							  </div>
							 <label class="control-label" for="codigo">Código: </label>
                                  <div class="controls">
                                      
								<input type="text" class="span6 typeahead" id="codigo" name="codigo" value="<?php echo"$codigo";?>" disabled>
							  </div>
                                 <label class="control-label" for="n_comercial">Nombres: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="n_comercial" name="n_comercial" value="<?php echo"$nombre";?>">
							  </div>
                              <label class="control-label" for="apellidos">Apellidos: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="apellidos" name="apellidos" value="<?php echo"$apellidos";?>" >
							  </div>
                              <label class="control-label" for="dpi">DPI: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="dpi" name="dpi" value="<?php echo"$dpi";?>">
							  </div>

							  <label class="control-label" for="cat">Catalogación: </label>
								<div class="controls">
								  <select id="cat" name="cat"  data-rel="chosen" >
                                      <option value="<?php echo "$id_cat1";?>"><?php echo "$cat1";?></option>
                                    <?php
                                      $query3=mysql_query("SELECT `id_cat`,`catalogacion` FROM `catalogacion` ORDER BY id_cat ASC");
                                      
                                      while($r3=mysql_fetch_array($query3)){
                                        $id_cat  =  $r3['id_cat'];
                                        $cat 		 =  $r3['catalogacion'];	
                                    ?>
                                      <option value="<?php echo "$id_cat";?>"><?php echo "$cat";?></option>
                                    <?php
                                      }
                                    ?>
									
								  </select>
								</div>
                                                                
 								<label class="control-label" for="direccion">Direccion: </label>
								 <div class="controls">
								<input type="text" class="span6 typeahead" id="direccion" name="direccion" value="<?php echo"$direccion";?>">
							  </div>
                                   <label class="control-label" for="tel">Teléfono: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="tel" name="tel" value="<?php echo"$tel";?>" >
							  </div>
                              
                             <br>   <h3>DATOS DE FIADOR</h3> 
                                
                                <label class="control-label" for="n_fiador">Nombres: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="n_fiador" name="n_fiador" value="<?php echo"$nombre_fiador";?>">
							  </div>
                              <label class="control-label" for="ape_fiador">Apellidos: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="ape_fiador" name="ape_fiador" value="<?php echo"$apellido_fiador";?>">
							  </div>
                              <label class="control-label" for="dpi_fiador">DPI: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="dpi_fiador" name="dpi_fiador" value="<?php echo"$dpi_fiador";?>">
							  </div>
                                                                
                                  
                               	<label class="control-label" for="dir_fiador">Direccion: </label>
								 <div class="controls">
								<input type="text" class="span6 typeahead" id="dir_fiador" name="dir_fiador" value="<?php echo"$direccion_fiador";?>">
							  </div>
                                   <label class="control-label" for="tel_fiador">Teléfono: </label>
                                  <div class="controls">
								<input type="text" class="span6 typeahead" id="tel_fiador" name="tel_fiador" value="<?php echo"$telefono_fiador";?>" >
							  </div>

							  <br>    
                              
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary">Guardar</button>
                                <input type="hidden" id="editar" name="editar" value="edit">
                                <input type="hidden" id="codigo" name="codigo" value="<?php echo "$codigo";?>">
							  <button type="reset" class="btn" onclick="newDoc()">Cancelar</button>
							</div>
						  </fieldset>
						</form>   

					</div>
                <?php } ?>
       <?php }else{echo "Usuario no autoriado!";}?>
	</div><!--/.fluid-container-->
	
			<!-- TERMINA: CONTENIDO ************************************************************** -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
		
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Ajustes</h3>
		</div>
		<div class="modal-body">
			<p>Aca se configuran los ajustes...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Cerrar</a>
			<a href="#" class="btn btn-primary">Salvar cambios</a>
		</div>
	</div>
	
	<div class="clearfix"></div>
	
<?php
    require 'footer.php';
?>
	
	<!-- start: JavaScript-->

		<script src="js/jquery-1.9.1.min.js"></script>
	<script src="js/jquery-migrate-1.0.0.min.js"></script>
	
		<script src="js/jquery-ui-1.10.0.custom.min.js"></script>
	
		<script src="js/jquery.ui.touch-punch.js"></script>
	
		<script src="js/modernizr.js"></script>
	
		<script src="js/bootstrap.min.js"></script>
	
		<script src="js/jquery.cookie.js"></script>
	
		<script src='js/fullcalendar.min.js'></script>
	
		<script src='js/jquery.dataTables.min.js'></script>

		<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.js"></script>
	<script src="js/jquery.flot.pie.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	
		<script src="js/jquery.chosen.min.js"></script>
	
		<script src="js/jquery.uniform.min.js"></script>
		
		<script src="js/jquery.cleditor.min.js"></script>
	
		<script src="js/jquery.noty.js"></script>
	
		<script src="js/jquery.elfinder.min.js"></script>
	
		<script src="js/jquery.raty.min.js"></script>
	
		<script src="js/jquery.iphone.toggle.js"></script>
	
		<script src="js/jquery.uploadify-3.1.min.js"></script>
	
		<script src="js/jquery.gritter.min.js"></script>
	
		<script src="js/jquery.imagesloaded.js"></script>
	
		<script src="js/jquery.masonry.min.js"></script>
	
		<script src="js/jquery.knob.modified.js"></script>
	
		<script src="js/jquery.sparkline.min.js"></script>
	
		<script src="js/counter.js"></script>
	
		<script src="js/retina.js"></script>

		<script src="js/custom.js"></script>
	<!-- end: JavaScript-->
	
</body>
</html>
