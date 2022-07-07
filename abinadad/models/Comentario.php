<?php

    class Comentario{
        private $conn;
        private $table = 'comentarios';

        //Propiedades
        public $id;
        public $comentario;
        public $estado;       
        public $fecha_creacion;


        //Constructor de nuestra clase
        public function __construct($db){
            $this->conn = $db;
        }


        //Obtener los artículos
        public function leer(){
            //Crear query
            $query = 'SELECT c.id AS id_comentario, c.comentario AS comentario, c.estado AS estado, c.fecha_creacion AS fecha, c.usuario_id, u.email AS nombre_usuario, a.titulo AS titulo_articulo  FROM ' . $this->table . ' c LEFT JOIN usuarios u ON u.id = c.usuario_id LEFT JOIN articulos a ON a.id = c.articulo_id';

            //Preparar sentencia
            $stmt = $this->conn->prepare($query);

            //Ejecutar query
            $stmt->execute();
            $comentarios = $stmt->fetchAll(PDO::FETCH_OBJ);
            return $comentarios;
        }

        //Obtener artículo individual
        public function leer_individual($id){
            //Crear query
            $query = 'SELECT c.id AS id_comentario, c.comentario AS comentario, c.estado AS estado, c.fecha_creacion AS fecha, c.usuario_id, u.email AS nombre_usuario, a.titulo AS titulo_articulo  FROM ' . $this->table . ' c LEFT JOIN usuarios u ON u.id = c.usuario_id LEFT JOIN articulos a ON a.id = c.articulo_id WHERE c.id = ? LIMIT 0,1';

            //Preparar sentencia
            $stmt = $this->conn->prepare($query);

            //Vincular parámetro
            $stmt->bindParam(1, $id);

            //Ejecutar query
            $stmt->execute();
            $comentario = $stmt->fetch(PDO::FETCH_OBJ);
            return $comentario;
        }

        //Obtener comentarios por id de artículo
        public function leerPorId($idArticulo){
            $query = 'SELECT c.comentario AS comentario, 
			re.comentario AS respuesta,
			re.comentario_id as reIdComentario,
            re.fecha_creacion as fechaRespuesta,
            (SELECT usu.nombre FROM usuarios usu WHERE usu.id = re.usuario_id) usuarioRespondio,
			c.id AS id_comentario, c.estado AS estado, c.fecha_creacion AS fecha, c.usuario_id, u.email AS nombre_usuario, r.nombre AS rol 
			FROM comentarios c
			LEFT JOIN respuestas re
			ON c.id = re.comentario_id
			INNER JOIN usuarios u ON u.id = c.usuario_id INNER JOIN roles r ON r.id = u.rol_id WHERE articulo_id = :articulo_id AND c.estado = 1';

            //Preparar sentencia
            $stmt = $this->conn->prepare($query);

            //Vincular parámetro
            $stmt->bindParam("articulo_id", $idArticulo);

            //Ejecutar query
            $stmt->execute();
            $comentarios = $stmt->fetchAll(PDO::FETCH_OBJ);
            return $comentarios;
        }

        //Crear un nuevo comentario
        public function crear($email, $comentario, $idArticulo){
            //Obtener el id del usuario usando el email
            $query = "SELECT * FROM usuarios WHERE email = :email";

             //Preparar sentencia
             $stmt = $this->conn->prepare($query);

            //Vincular parámetro
            $stmt->bindParam(":email", $email);

            $stmt->execute();
            $usuario = $stmt->fetch(PDO::FETCH_OBJ);
            $idUsuario = $usuario->id;

            //Crear el query para la inserción del comentario
            $query2 = 'INSERT INTO ' . $this->table . ' (comentario, usuario_id, articulo_id, estado)VALUES(:comentario, :usuario_id, :articulo_id, 0)';

             //Preparar sentencia
             $stmt = $this->conn->prepare($query2);

            //Vincular parámetro
            $stmt->bindParam(":comentario", $comentario, PDO::PARAM_STR);
            $stmt->bindParam(":usuario_id", $idUsuario, PDO::PARAM_INT);
            $stmt->bindParam(":articulo_id", $idArticulo, PDO::PARAM_INT);

             //Ejecutar query
             if ($stmt->execute()) {
                return true;
            }
    
            //Si hay error 
            printf("error $s\n", $stmt->error);
            return false;
        }
        

        //Respondemos comentario
        public function responderComentario($email, $comentario, $idComentario){
            $query = "SELECT * FROM usuarios WHERE email = :email";

             //Preparar sentencia
             $stmt = $this->conn->prepare($query);

            //Vincular parámetro
            $stmt->bindParam(":email", $email);

            $stmt->execute();
            $usuario = $stmt->fetch(PDO::FETCH_OBJ);
            $idUsuario = $usuario->id;

            //Crear el query para la inserción del comentario
            $query2 = 'INSERT INTO respuestas (comentario, usuario_id, comentario_id, estado)VALUES(:comentario, :usuario_id, :comentario_id, 0)';

             //Preparar sentencia
             $stmt = $this->conn->prepare($query2);

            //Vincular parámetro
            $stmt->bindParam(":comentario", $comentario, PDO::PARAM_STR);
            $stmt->bindParam(":usuario_id", $idUsuario, PDO::PARAM_INT);
            $stmt->bindParam(":comentario_id", $idComentario, PDO::PARAM_INT);

             //Ejecutar query
             if ($stmt->execute()) {
                return true;
            }
    
            //Si hay error 
            printf("error $s\n", $stmt->error);
            return false;
        }

        //Crear un comentario
        public function actualizar($idComentario, $estado){
         
               //Crear query
                $query = 'UPDATE ' . $this->table . ' SET estado = :estado WHERE id = :id';

                //Preparar sentencia
                $stmt = $this->conn->prepare($query);

                //Vincular parámetro                
                $stmt->bindParam(":id", $idComentario, PDO::PARAM_INT);
                $stmt->bindParam(":estado", $estado, PDO::PARAM_INT);

                //Ejecutar query
                if ($stmt->execute()) {
                    return true;
                }
        
                //Si hay error 
                printf("error $s\n", $stmt->error);

        }

        //Crear un artículo
        public function borrar($idComentario){
            //Crear query
            $query = 'DELETE FROM ' . $this->table . ' WHERE id = :id';

            //Preparar sentencia
            $stmt = $this->conn->prepare($query);

            //Vincular parámetro
            $stmt->bindParam(":id", $idComentario, PDO::PARAM_INT);         

            //Ejecutar query
            if ($stmt->execute()) {
                return true;
            }

            //Si hay error 
            printf("error $s\n", $stmt->error);

        }

    }