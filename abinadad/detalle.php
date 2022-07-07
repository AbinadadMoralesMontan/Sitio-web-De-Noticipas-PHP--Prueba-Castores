<?php include("includes/header_front.php") ?>
<?php
    //Instanciar base de datos y conexión
    $baseDatos = new Basemysql();
    $db = $baseDatos->connect();

    //Instancimos el objeto
    $usuarios = new Usuario($db);
    $resultadoUsuario = $usuarios->leer();


if (isset($_GET["id"])) {
        $idArticulo = $_GET["id"];
    }

    //Instancimos el objeto
    $articulo = new Articulo($db);
    $resultado = $articulo->leer_individual($idArticulo);


    //Instanciar los comentario para este artículo
    $comentarios = new Comentario($db);
    $resultado2 = $comentarios->leerPorId($idArticulo);

    //Crear comentario
    if (isset($_POST['enviarComentario'])) {
        //Obtener los valores
        $idArticulo = $_POST['articulo'];
        $email = $_POST['usuario'];
        $comentario = $_POST['comentario'];


        if (empty($email) || $email == '' || empty($comentario) || $comentario == '') {
            $error = "Error, algunos campos están vacíos";
        }else{
            //Instanciamos el comentario
            $comentarioObj = new Comentario($db);

            if ($comentarioObj->crear($email, $comentario, $idArticulo)) {
                $mensaje = "Comentario creado correctamente";
                echo ("<script>location.href = '".RUTA_FRONT."'</script>");
            }else{
                $error = "Error, no se pudo crear el comentario"; 
            }
        }
    }

    if (isset($_POST['responderComentario'])) {
        $email = $_POST['usuario'];
        $comentario = $_POST['comentario'];
        $comentario_id = $_POST['id_comentario'];

        if (empty($email) || $email == '' || empty($comentario) || $comentario == '') {
            $error = "Error, algunos campos están vacíos";
        }else{
            //Instanciamos el comentario
            $comentarioObj = new Comentario($db);

            if ($comentarioObj->responderComentario($email, $comentario, $comentario_id)) {
                $mensaje = "Comentario creado correctamente";
                echo ("<script>location.href = '".RUTA_FRONT."'</script>");
            }else{
                $error = "Error, no se pudo crear el comentario"; 
            }
        }
    }


?>

    <div class="row">
       
    </div>

    <div class="container-fluid"> 
      
        <div class="row">
                
        <div class="row">
        <div class="col-sm-12">
            
        </div>  
    </div>

            <div class="col-sm-12">
                <div class="card">
                   <div class="card-header">


                           <?php foreach($resultadoUsuario as $usuario) : ?>
                               <?php if($usuario->usuario_id ==$resultado->id_usuario ) : ?>
                                   <input type="text" class="form-control" name="idPublicador" id="idPublicador" value="Publicado por: <?php echo  $usuario->usuario_nombre ?>" readonly>
                               <?php endif; ?>
                           <?php endforeach; ?>
                        <h1><?php echo $resultado->titulo; ?></h1>
                   </div>
                    <div class="card-body">
                        <div class="text-center">
                            <img class="img-fluid img-thumbnail" src="<?php echo RUTA_FRONT; ?>img/articulos/<?php echo $resultado->imagen; ?>">
                        </div>

                        <p><?php echo $resultado->texto; ?></p>

                    </div>
                </div>
            </div>
        </div>  
  
        <?php if(isset($_SESSION['autenticado'])) : ?>
            <div class="row">        
                <div class="col-sm-6 offset-3">
                <form method="POST" action="">
                    <input type="hidden" name="articulo" value="<?php echo $idArticulo; ?>">
                    <div class="mb-3">
                        <label for="usuario" class="form-label">Usuario:</label>
                        <input type="text" class="form-control" name="usuario" id="usuario" value="<?php echo $_SESSION['email']; ?>" readonly>               
                    </div>
                
                    <div class="mb-3">
                        <label for="comentario">Comentario</label>   
                        <textarea class="form-control" name="comentario" style="height: 200px"></textarea>              
                    </div>          
                
                    <br />
                    <button type="submit" name="enviarComentario" class="btn btn-primary w-100"><i class="bi bi-person-bounding-box"></i> Crear Nuevo Comentario</button>
                    </form>
                </div>
            </div>
        <?php endif; ?>
   
    </div>

    <div class="row">
    <h1 class="text-center mt-5">Comentarios</h1>
    <?php foreach($resultado2 as $comentario) : ?>
            

            <br>
            <h3><i class="bi bi-person-circle"></i><?php echo $comentario->nombre_usuario.' - Usuario '.$comentario->rol; ?></h3>
            <p><?php echo $comentario->comentario; ?>
            <strong><?php echo'Creado el '.$comentario->fecha; ?></strong>
            <form method="POST" action="">
                <?php if(isset($_SESSION['autenticado'])) : ?>
                    <input type="hidden" class="form-control" name="usuario" id="usuario" value="<?php echo $_SESSION['email']; ?>" readonly>               
                    <textarea type="hidden" class="form-control" name="comentario" style="height: 200px"></textarea>     
                    <input type="hidden" class="form-control" name="id_comentario" id="id_comentario" value="<?php echo $comentario->id_comentario; ?>" readonly>  
                    

                    <button type="submit" name="responderComentario" class="btn btn-primary w-100"><i class="bi bi-reply-all-fill"></i> Responder</button>
                <?php endif; ?> 
                  <p><?php 
                        echo $comentario->usuarioRespondio.' respondió el '.$comentario->fechaRespuesta.' a '.$comentario->nombre_usuario.' lo siguiente: '.$comentario->respuesta; 
                  ?></p>
                <br><br>  
            </form>  
            
            
            
            <br><br>
    <?php endforeach; ?> 
    </div>
         
    </div>
<?php include("includes/footer.php") ?>