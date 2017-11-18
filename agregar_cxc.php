<?php
    require 'ini.php';
    require 'connection.php';
    require 'core.php';
    $monica = "no";
    $flag1  = "one";
    //error_reporting(0);
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
	<script type="text/javascript" src="jquery.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  
		$('#popup').fadeIn('slow');
		$('.popup-overlay').fadeIn('slow');
		$('.popup-overlay').height($(window).height());
		return false;
	
	
	$('#close').click(function(){
		$('#popup').fadeOut('slow');
		$('.popup-overlay').fadeOut('slow');
		return false;
	});
});
</script>
	<!--<link href='http://fonts.googleapis.com/
	css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800&subset=latin,cyrillic-ext,latin-ext' rel='stylesheet' type='text/css'>
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
	
		
		
	<script type="text/javascript">


		function newDoc() {
    		window.location.assign("manto_cxc.php")
			

			}



		 function search_cliente(dpi)
			{
         
          var xml_name;
          var xml_tel;
          var xml_n_fiador;
          var xml_d_fiador;
          var xml_tel_fiador;
          var xml_clasif

          if (window.XMLHttpRequest)
          {// code for IE7+, Firefox, Chrome, Opera, Safari
           
            xml_name     	=   new XMLHttpRequest();
            xml_tel      	=   new XMLHttpRequest();
            xml_n_fiador 	=   new XMLHttpRequest();
            xml_d_fiador	=   new XMLHttpRequest();
            xml_tel_fiador  =   new XMLHttpRequest();
            xml_clasif      =   new XMLHttpRequest();
          }
          else
          {// code for IE6, IE5
           
            xml_name	 	=   new ActiveXObject("Microsoft.XMLHTTP");
            xml_tel      	=   new ActiveXObject("Microsoft.XMLHTTP");
            xml_n_fiador	=   new ActiveXObject("Microsoft.XMLHTTP");
            xml_d_fiador 	=   new ActiveXObject("Microsoft.XMLHTTP");
            xml_tel_fiador  =   new ActiveXObject("Microsoft.XMLHTTP");
            xml_clasif      =   new ActiveXObject("Microsoft.XMLHTTP");
          }	

          

         xml_name.onreadystatechange = function() {
            if(xml_name.readyState == 4 && xml_name.status == 200)
            {
              
                document.getElementById("cliente").value = xml_name.responseText;
            }
          }

          xml_tel.onreadystatechange = function() {
            if(xml_tel.readyState == 4 && xml_tel.status == 200)
            {
             
                document.getElementById("tel").value = xml_tel.responseText;
            }
          }

          xml_n_fiador.onreadystatechange = function() {
            if(xml_n_fiador.readyState == 4 && xml_n_fiador.status == 200)
            {
              
                document.getElementById("n_fiador").value = xml_n_fiador.responseText;
            }
          }

          xml_d_fiador.onreadystatechange = function() {
            if(xml_d_fiador.readyState == 4 && xml_d_fiador.status == 200)
            {
              
                document.getElementById("d_fiador").value = xml_d_fiador.responseText;
            }
          }

          xml_tel_fiador.onreadystatechange = function() {
            if(xml_tel_fiador.readyState == 4 && xml_tel_fiador.status == 200)
            {
              
                document.getElementById("tel_fiador").value = xml_tel_fiador.responseText;
            }
          }

          xml_clasif.onreadystatechange = function() {
            if(xml_clasif.readyState == 4 && xml_clasif.status == 200)
            {
              
                document.getElementById("clasif").value = xml_clasif.responseText;
                document.getElementById("clasif1").value = xml_clasif.responseText;
            }
          }

          xml_name.open("GET","search_ex.php?dpi="+dpi, true);
          xml_name.send();
          xml_tel.open("GET","search_tel.php?dpi="+dpi, true);
          xml_tel.send();
          xml_n_fiador.open("GET","search_n_fiador.php?dpi="+dpi, true);
          xml_n_fiador.send();
          xml_d_fiador.open("GET","search_d_fiador.php?dpi="+dpi, true);
          xml_d_fiador.send();
          xml_tel_fiador.open("GET","search_tel_fiador.php?dpi="+dpi, true);
          xml_tel_fiador.send();
          xml_clasif.open("GET","search_clasif.php?dpi="+dpi, true);
          xml_clasif.send();
         
		}

		
  		

</script>

<style type="text/css">
	#popup {
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 1001;
}

.content-popup {
    margin:0px auto;
    margin-top:120px;
    position:relative;
    padding:10px;
    width:250px;
    min-height:250px;
    border-radius:4px;
    background-color:#FFFFFF;
    box-shadow: 0 2px 5px #666666;
}

.content-popup h2 {
    color:#48484B;
    border-bottom: 1px solid #48484B;
    margin-top: 0;
    padding-bottom: 4px;
}

.popup-overlay {
    left: 0;
    position: absolute;
    top: 0;
    width: 100%;
    z-index: 999;
    display:none;
    background-color: #777777;
    cursor: pointer;
    opacity: 0.7;
}

.close {
    position: absolute;
    right: 15px;
}


</style>
		
</head>

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
			
			<!-- start: Content ****************************************************** - -->
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
                    <a href="manto_cxc.php">Cuentas por cobrar</a>
                    <i class="icon-angle-right"></i>
                    <a href="#">Nuevo Prestamo</a>
                </li>
			</ul>
                <?php
                if($security == 'go'){ 
                //INICIA IF PARA GUARDAR CABECERA DE EL PEDIDO----------------
                if(empty($_POST)===false && $_POST['flag1']=="guardar"){
                    // if($_FILES['archivo']['name']){
                        //    $new_file_name = basename($_FILES["archivo"]["name"]);
                         //   $target_dir = "cxp/";
                         //   $target_file = $target_dir . basename($_FILES["archivo"]["name"]);
                            //$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
                        //    move_uploaded_file($_FILES["archivo"]["tmp_name"], $target_file);
                       // }
                    $no_docto   =   $_POST['no_documento'];
                    $id_cliente =   $_POST['cliente'];
                    $tel 		=	$_POST['tel'];
                    $total      =   $_POST['tot_prestamo'];
                   
                    $clasif 	=	$_POST['clasif'];
                    $t_prestamo =	$_POST['t_prestamo'];
                    $descrip 	=	$_POST['descrip'];
                    $dpi 		=	$_POST['dpi'];

                    $query_v	=	mysql_query("SELECT `id_cobrador`, `usuario` FROM `cobradores` WHERE usuario = '$u'");
                    $qv 		=	mysql_fetch_array($query_v);

                    $id_v 		=	$qv['id_cobrador'];


                    $query_cla	=	mysql_query("SELECT `id_cat`, `catalogacion`, `max` FROM `catalogacion` WHERE catalogacion = '$clasif'");

                    $qcla 		=	mysql_fetch_array($query_cla);

                    $max 		=	$qcla['max'];


                    
                    if($total>$max){

                    	$monica	=	"mayor";

                    }else
                    {


                    $query2 =   mysql_query("INSERT INTO `cxc` (`id_control`, `fecha`, `tipo_prestamo`, `id_vendedor`, `cliente`, `clasif`, `descripcion`,`total`, `saldo`, `estatus`) VALUES ($no_docto, '$da', '$t_prestamo', '$id_v', '$dpi', '$clasif', '$descrip', '$total', '$total', '0')");
                    
                     $flag1 = "guardar";
                     }

                }
                
                //FINALIZA IF PARA GUARDAR CABECERA DE EL PEDIDO----------------
                
         
                
                //INICIA INGRESO DE DATOS DE CUENTAS POR PAGAR--------------------
                ?>
                <h1>Ingreso Nuevo Prestamo</h1>
                    <div class="box-content">
                        <?php
                            if($flag1=="one"){
                        ?>
						<form class="form-horizontal" method="post" enctype="multipart/form-data">
						  <fieldset>
						  	
						  	
                            <div class="control-group">
							  <label class="control-label" for="date01">FECHA:</label>
							  <div class="controls">
								<input type="text" class="input-medium datepicker" id="date01" name="date01" value="<?php echo $da; ?>">
							  </div>
                             <label class=" control-label" for="no_documento">NO. DOCUMENTO: </label>
                                  <div class="controls">
                                  	<?php 
                                $query1 =   mysql_query("SELECT `id_control` FROM `cxc` ORDER BY id_control DESC LIMIT 1");
                                $r1     =   mysql_fetch_array($query1);
                                $cod    =   $r1['id_control'] + 1;
                              ?>    
                                      
								<input type="text" class="input-medium typeahead" id="no_documento" name="no_documento" value="<?php echo "$cod";?>" >
							  </div>   
                                
								<label class="control-label" for="dpi">DPI: </label>
								<div class="controls">
								  <select id="dpi" name="dpi" onchange="search_cliente(this.value);" data-rel="chosen" required>
                                      <option value=""></option>
                                    <?php
                                      $query3=mysql_query("SELECT `codigo`,`dpi` FROM `clientes` ORDER BY codigo ASC");
                                      
                                      while($r3=mysql_fetch_array($query3)){
                                        $id_cliente  =  $r3['codigo'];
                                        $dpi 		 =  $r3['dpi'];	
                                    ?>
                                      <option value="<?php echo "$id_cliente";?>"><?php echo "$dpi";?></option>
                                    <?php
                                      }
                                    ?>
									
								  </select>
								</div>
								<label class=" control-label" for="cliente">CLIENTE: </label>
                                  <div class="controls">
                                      
								<input type="text" class="input-xlarge typeahead" id="cliente" name="cliente" value="" required>
							  </div> 
                                
							 <!-- <label class=" control-label" for="archivo">FOTO ARCHIVO: </label>
                              <div class="controls">
                              <input type="file" name="archivo" id="archivo" size="25" />
                              </div>-->
                            <label class=" control-label" for="tel">TELEFONO: </label>
                              <div class="controls">
								<input type="text" class="input-small typeahead" id="tel" name="tel" value="" required>
							  </div>
                                 <label class=" control-label" for="clasif">CLASIFICACION: </label>
                              <div class="controls">
								<input type="hidden" class="input-small typeahead" id="clasif" name="clasif" value="" >
								<input type="text" class="input-small typeahead" id="clasif1" name="clasif1" value="" disabled>
							  </div>
							
							<label class=" control-label" for="tot_prestamo">TOTAL PRESTAMO: </label>
                              <div class="controls">
								<input type="number" class="input-small typeahead" id="tot_prestamo" name="tot_prestamo" value="" required>
							  </div>
							
							<label class="control-label" for="t_prestamo">TIPO DE PRESTAMO: </label>
								<div class="controls">
								  <select id="t_prestamo" name="t_prestamo" data-rel="chosen" required>
                                      <option value=""></option>
                                    <?php
                                      $query4=mysql_query("SELECT `id_credito`,`tipo` FROM `creditos` ORDER BY id_credito ASC");
                                      
                                      while($r4=mysql_fetch_array($query4)){
                                        $id_credito  =  $r4['id_credito'];
                                        $tipo 		 =  $r4['tipo'];	
                                    ?>
                                      <option value="<?php echo "$id_credito";?>"><?php echo "$tipo";?></option>
                                    <?php
                                      }
                                    ?>
									
								  </select>
								</div>
							<label class=" control-label" for="descrip">DESCRIPCION: </label>
                              <div class="controls">
								<input type="text" class="input-xlarge typeahead" id="descrip" name="descrip" value="" required>
							  </div>
							</div>
						
								<h2>Datos del Fiador</h2>
								<br>
								<label class=" control-label" for="n_fiador">Nombre: </label>
                              <div class="controls">
								<input type="text" disabled class="input-xlarge typeahead"  id="n_fiador" name="n_fiador" value="">
							  </div>

							  <label class=" control-label" for="d_fiador">Direccion: </label>
                              <div class="controls">
								<input type="text" disabled class="input-xlarge typeahead"  id="d_fiador" name="d_fiador" value="">
							  </div>

							  <label class=" control-label" for="tel_fiador">Telefono: </label>
                              <div class="controls">
								<input type="text" disabled class="input-xlarge typeahead"  id="tel_fiador" name="tel_fiador" value="">
							  </div>

						
							
							<div class="form-actions">
                          
                                <button type="submit" class="btn btn-primary">Guardar</button>
                                <input type="hidden" id="flag1" name="flag1" value="guardar">
                                <button type="reset" class="btn" onclick="history.back(-1)">Cancelar</button>   
                                
							</div>
							
						  </fieldset>
						</form>

						<?php if($monica=="mayor"){  ?>   
               <div id="popup" style="display: none;">
    <div class="content-popup">
        <div class="close"><a href="agregar_cxc.php" id="close"><img src="img/close.png"/></a></div>
        <div>
        	<h2>Error</h2>
            <p>El prestamo es mayor de lo permitido por su letra de clasificacion, </p>
            
        </div>
    </div>
</div>
<div class="popup-overlay"></div>
               <<?php } ?>     
                                <?php
                                //-----------FINALIZA IF DE VISUALIZACION LUEGO QUE FUE PRECIONADO EL BOTON SIGUIENTE!-----------
                            } else if($flag1=="guardar"){
                                echo "<h3>Cuenta por cobrar ingresada con éxito!</h3>";
                            }
                        ?>
					</div>
			<!-- TERMINA: CONTENIDO ************************************************************** -->
		</div><!--/#content.span10-->
		</div><!--/fluid-row-->
    </div>
    <?php }else{ ?>
    Usuario no registrado!
    <?php } ?>
		
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
	
	<?php require 'footer.php';?>
	
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