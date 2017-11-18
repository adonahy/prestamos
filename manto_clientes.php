<?php
    require 'ini.php';
    require 'connection.php';
    require 'core.php';
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
	<!--<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
	<!-- end: CSS -->
	

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<link id="ie-style" href="css/ie.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 9]>
		<link id="ie9style" href="css/ie9.css" rel="stylesheet">
	<![endif]-->
		
	<!-- start: Favicon -->
	<link rel="shortcut icon" href="img/favicon.ico">
	<!-- end: Favicon -->
	
		
		
		
</head>
<?php
    if(empty($_POST)===false && $_POST['id_old']!=""){
        $id =   $_POST['id_old'];
        
        $query1     =   mysql_query("SELECT `codigo`,`nombres` FROM `clientes` WHERE codigo = '$id'");
        $r1         =   mysql_fetch_array($query1);
        $name       =   $r1['nombres'];
        
        $query    =   mysql_query("DELETE FROM `clientes` WHERE `clientes`.`codigo` = '$id'");
        
         $u          =   $_SESSION['u'];
         $d          =   "Elimino al cliente: ";
         $t          =   "clientes";
        
         insert_logs($da, $u, $d, $t, $name);
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
				<a class="brand" href="one.php"><span><?php echo "$nombre_p "; ?></span></a>
								
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
			
			<!-- start: Content ****************************************************** -->
			<div id="content" class="span10">
			
			
			<ul class="breadcrumb">
				<li>
					<i class="icon-home"></i>
					<a href="one.php">Inicio</a> 
                    <i class="icon-angle-right"></i>
				</li>
				<li>
                    <a href="#">Finanzas</a>
                    <i class="icon-angle-right"></i>
                    <a href="#">Listado de clientes</a>
                </li>
			</ul>
                <?php if($security == 'go'){ ?>
                <!--INICIA TABLA DE MANTENIMIENTO----------------------------------- -->
                <h1>Listado de clientes</h1>
            <div class="box-content">
                <table>
                    <tr>
                        <td>
                            <form name="this2" method="post" action="m_clientes.php">
                    <button type="submit" class="btn btn-info"><i class="glyphicons-icon white circle_plus">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Agregar Cliente</i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
                </form>
                        </td>
                    </tr>
                </table>
						<table class="table table-strip ed table-bordered bootstrap-datatable datatable">
						  <thead>
							  <tr>
								  <th>ID CLIENTE</th>
								  <th>NOMBRE COMPLETO</th>
                                  <th>TELEFONO</th>
                                  <th>DPI</th>
                                  <th>COBRADOR</th>
								  <th>ACCION</th>
							  </tr>
						  </thead>   
						  <tbody>
                          <?php
                            //$u  =   $_SESSION['u'];
                            //$u = "admin";
                          $query_select   =   mysql_query("SELECT `user`,`admin_app` FROM `permissions` WHERE user='$u' ");
                          $qs 			  =   mysql_fetch_array($query_select);

                          $admin 		  =   $qs['admin_app'];
                           
                           if($admin != "1"){

                           	$query_cobra   =   mysql_query("SELECT `id_cobrador`,`usuario` FROM `cobradores` WHERE usuario='$u'");
                           	$qc 		   =   mysql_fetch_array($query_cobra);

                           	$id_cobrador   = $qc['id_cobrador'];
                           	

                           	$query_todo   =   mysql_query("SELECT `fecha`,`codigo`,`nombres`,`apellidos`,`tel`,`dpi`,`id_cobrador`  FROM `clientes` WHERE id_cobrador = '$id_cobrador'  ORDER BY fecha DESC");

                           }
                           else{ 
                                $query_todo   =   mysql_query("SELECT `fecha`,`codigo`,`nombres`,`apellidos`,`tel`,`dpi`,`id_cobrador` FROM `clientes` ORDER BY fecha DESC");
                            }
                              while($search=mysql_fetch_array($query_todo)){
                                 
                                  $id       =   $search['codigo'];
                                  $name     =   $search['nombres'] ." ".  $search['apellidos']; 
                                  $id_c 	=	$search['id_cobrador'];
                                  $telefono =   $search['tel'];
                                  $dpi 		=   $search['dpi'];


                                  
                                  $query2   =   mysql_query("SELECT `id_cobrador`,`nombres`,`apellidos` FROM `cobradores` WHERE id_cobrador = '$id_c'");
                                  $r2       =   mysql_fetch_array($query2);
                                  $c_name   =   $r2['nombres'] ." ". $r2['apellidos'];
                          ?>
							<tr>
								<td class="center"><?php echo "$id";?></td>
								<td class="center"><?php echo "$name";?></td>
                                <td class="center"><?php echo "$telefono";?></td>
                                <td class="center"><?php echo "$dpi";?></td>
                                <td class="center"><?php echo "$c_name";?></td>
								<td class="center">
                                    <table border="0">
                                        <tr>
                                            <td>
                                                <form name="this1" method="post" action="edit_clientes.php">
                                                    <button type="submit" class="btn btn-info"><i class="halflings-icon white edit"></i></button>
                                                    <input type="hidden" id="cod" name="cod" value="<?php echo "$id";?>"> 
                                                     
                                                </form>
                                            </td>
                                            <td>
                                                <form name="this" method="post">
                                                    <button type="submit" class="btn btn-danger" Onclick="if(confirm('Desea eliminar al cliente <?php echo $name; ?> ?')){
                                                    this.form.submit();}
                                                    else{ return false;
                                                    }"><i class="halflings-icon white trash"></i></button>
                                                    <input type="hidden" id="id_old" name="id_old" value="<?php echo "$id";?>"> 
                                                </form>
                                            </td>
                                        </tr>
                                    </table>
								</td>
							</tr>
                          <?php
                              }
                          ?>
						  </tbody>
					  </table>            
					</div>
                <?php }else{ ?>
                    Usuario no registrado!
                <?php } ?>
				</div><!--/span-->
			
			</div>
                <!--TERMINA TABLA DE MANTENIMIENTO---------------------------------- -->

<!--
			<div class="row-fluid">
				
			
       
	</div><!--/.fluid-container-->
	
			<!-- TERMINA: CONTENIDO ************************************************************** -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
    </div>
		
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
	
	<?php require 'footer.php'; ?>
	
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
