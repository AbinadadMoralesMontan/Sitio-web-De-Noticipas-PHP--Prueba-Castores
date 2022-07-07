/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : abinadad

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-07-05 16:55:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articulos
-- ----------------------------
DROP TABLE IF EXISTS `articulos`;
CREATE TABLE `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `texto` text COLLATE utf8_spanish2_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `articulos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of articulos
-- ----------------------------
INSERT INTO `articulos` VALUES ('6', 'Coronavirus en México al 3 de julio: en sólo una semana sumaron más de 100 mil casos activos', 'RAEDRHZXINBIHOILELLYBU4ZBE36952.webp', 'La Secretaría de Salud (SSa) emitió el Informe Técnico Diario del coronavirus en México; por medio de la Dirección General de Epidemiología se actualizaron las cifras en torno al COVID-19 en el país. Para el corte de información de las 17:00 horas del domingo 3 de julio el país alcanzó los seis millones 89 mil 600 casos totales y 325 mil 788 muertes desde que inició la pandemia en el país.\r\n\r\nEn contraste, en las últimas 24 horas se contabilizaron 6 mil 301 casos nuevos confirmados y únicamente 13 fallecimientos a causa de la enfermedad. Cabe recordar que el número de defunciones se mantiene a la baja, mientras que el número de casos ha aumentado significativamente, por lo cual se ha denominado como la quinta ola de contagios.', '2022-07-05 06:58:07', '13');
INSERT INTO `articulos` VALUES ('7', 'Raymundo Riva Palacio advirtió que AMLO buscaría revertir la despenalización del aborto en México', 'YYBFIY4LCZEGXEMRG6EXJTZIPU81593.webp', 'A finales de junio de 2022, la Suprema Corte de los Estados Unidos decidió anular la protección del derecho al aborto que desde el año 1973 se mantenía vigente en todo el territorio, lo que abrió un amplio debate en todas las esferas de la sociedad norteamericana.\r\n\r\nEn este sentido, fueron seis votos a favor y tres en contra para echar atrás las sentencias Roe versus Wade y Planned Parenthood versus Casey, donde se protegía el derecho de las mujeres al aborto en todo el país, pues de acuerdo con los magistrados “chocaba” con la Constitución vigente.\r\n\r\nEs decir, ahora cada estado tendrá la autoridad para legislar sobre el aborto a través de los representantes electos por el pueblo, permitiendo que a nivel local, los territorios que así lo decidan podrán prohibir definitivamente el aborto dentro de sus límites.', '2022-07-05 06:59:26', '13');
INSERT INTO `articulos` VALUES ('8', 'Familias colocaron fotos de los 43 normalistas de Ayotzinapa en la Glorieta de las y los Desaparecidos', 'MAT6RREJU5H5ZDQ2DCEUUR3PIA79755.webp', 'La Glorieta de las y los Desaparecidos, conocida previamente como la Glorieta de la Palma, es un espacio que decenas de familias se han apropiado para construir uno de los memoriales más importantes de la Ciudad de México que enuncia los nombres y muestra los rostros de las personas que han sido víctimas de desapariciones en el país.\r\n\r\nEste memorial, iniciado en mayo de 2022, forma parte del proceso de reapropiación que ha llevado a cabo la ciudadanía en la avenida Paseo de la Reforma, en donde se ha creado la Ruta de la Memoria con antimonumentos (como el de la Guardería ABC, el Halconazo y la masacre de migrantes en San Fernando, Tamaulipas), la Antimonumenta (que remplazó el monumento de Cristobal Colón) y la Glorieta de las Mujeres que Luchan.\r\n\r\nFamilias que impulsan esta iniciativa colocaron este domingo 3 de julio las fotos de los 43 estudiantes de Ayotzinapa en la Glorieta de las y los Desaparecidos para honrar su memoria y, una vez más, exigir justicia por la desaparición forzada de los jóvenes ocurrida el 26 de septiembre de 2014.\r\n\r\n', '2022-07-05 07:00:16', '13');
INSERT INTO `articulos` VALUES ('9', 'Fiscalía de Oaxaca encontró los cuerpos de 3 migrantes en San Francisco Ixhuatán', 'XMSBPQ2XANCMBMAEN2HSLZU5LQ24333.webp', 'A través de un boletín compartido en sus redes sociales, la Fiscalía General del Estado (FGE) de Oaxaca informó que abrió una carpeta de investigación por el delito de homicidio tras el hallazgo de tres migrantes, posiblemente de origen centroamericano, en el pueblo de San Francisco Ixhuatán, ubicado en la región del Istmo de Tehuantepec.\r\n\r\nDe acuerdo con las autoridades, los cuerpos podrían pertenecer a las víctimas de un grupo de migrantes cuyas lanchas se volcaron en días pasados, mientras viajaban cerca de la comunidad de Aguachil, en el pueblo antes mencionado.\r\n\r\nLos primeros dos cuerpos, uno del sexo masculino y otro del sexo femenino, fueron hallados la mañana del pasado 30 de junio de 2022 en las inmediaciones de Playa Cachimbo, mientras que el tercero (masculino) fue encontrado el 2 de julio en las orillas de la Playa Isla de León.\r\n\r\nSegún informó la FGE, fueron elementos de la Vicefiscalía Regional del Istmo quienes realizaron el levantamiento de los cuerpos, mismos que ya fueron sometidos a las necropsias y dictámenes periciales correspondientes. A la vez que se realizan las investigaciones, los cadáveres están resguardados en un anfiteatro de la localidad de Santo Domingo Zanatepec.', '2022-07-05 07:01:06', '13');
INSERT INTO `articulos` VALUES ('10', 'El PAN busca otorgar estímulo fiscal a quienes contraten mujeres víctimas de violencia', 'RS5MQWSVMRDATHHIURDVHHM4AQ16394.webp', 'Itzel Balderas, diputada federal por el Partido Acción Nacional (PAN), propuso la creación de estímulos fiscales a los empleadores que contraten a mujeres víctimas de violencia, esto para incentivar la ocupación en el sector productivo de este demográfico y procurar una inclusión sustantiva entre las mujeres que han padecido algún tipo de transgresión a su integridad.\r\n\r\nEl estímulo, que se dio a conocer el pasado viernes 1 de julio, aplicaría tanto a personas físicas como morales y consiste en adicionar un Capítulo II Bis, denominado “De los Patrones que Contraten a Mujeres Víctimas de la Violencia” a la Ley del Impuesto Sobre la Renta (LISR).\r\n\r\nDe acuerdo con la propuesta, el beneficio al que se hace referencia consistiría en deducir de los ingresos acumulables del contribuyente para los efectos del ISR en el ejercicio fiscal correspondiente, por un monto equivalente a 25% del salario efectivamente pagado a las mujeres violentadas.\r\n\r\n', '2022-07-05 07:02:05', '13');
INSERT INTO `articulos` VALUES ('11', 'El mensaje de Checo Pérez después del GP de Gran Bretaña: “No hay que rendirse”', 'TR3BLSODPZUG5JNXX4AOIM4XZA96276.webp', 'El Gran Premio de Gran Bretaña se caracterizó por una serie de contrastes de emociones que se vivieron en la pista, pero lo que más rescató la afición de la Fórmula 1 fue el trabajo que realizó Sergio Checo Pérez tras remontar 15 posiciones y colocarse en el segundo lugar del podio.\r\n\r\nPor ello, Checo Pérez mandó un mensaje para agradecer el apoyo que le brindaron tras haber realizado una hazaña deportiva en la pista, pero sin dejar de lado los accidentes que detuvieron la carrera por algunos minutos.\r\n\r\nPor medio de su cuenta oficial de Twitter dedicó un espacio para compartir la satisfacción que le dio al saber que Alex Albon, piloto de Williams Racing, y Guanyu Zhou, piloto de Alfa Romeo, se encuentran bien luego del aparatoso accidente en el que se vieron involucrados. Ambos corredores salieron sin lesiones graves del accidente, por lo que Checo festejó aquella noticia.\r\n\r\n', '2022-07-05 07:02:37', '13');

-- ----------------------------
-- Table structure for comentarios
-- ----------------------------
DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `articulo_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `articulo_id` (`articulo_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`articulo_id`) REFERENCES `articulos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of comentarios
-- ----------------------------

-- ----------------------------
-- Table structure for personal
-- ----------------------------
DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT '',
  `apepaterno` varchar(50) DEFAULT '',
  `apematerno` varchar(50) DEFAULT '',
  `direccion` varchar(255) DEFAULT NULL,
  `fechaingreso` timestamp NULL DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idusuario` (`idusuario`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of personal
-- ----------------------------
INSERT INTO `personal` VALUES ('5', 'Abinadad', 'Morales', 'Montan', 'Veracruz', null, '13');
INSERT INTO `personal` VALUES ('6', 'Nohemi', 'Fiscal', 'Zapot', 'Coatzacoalcos', null, '14');
INSERT INTO `personal` VALUES ('7', 'Jose', 'Ricardo', 'Corona', 'León', null, '15');

-- ----------------------------
-- Table structure for respuestas
-- ----------------------------
DROP TABLE IF EXISTS `respuestas`;
CREATE TABLE `respuestas` (
  `idrespuestas` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `comentario_id` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idrespuestas`),
  KEY `comentario_id` (`comentario_id`),
  CONSTRAINT `respuestas_ibfk_1` FOREIGN KEY (`comentario_id`) REFERENCES `comentarios` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of respuestas
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Interno');
INSERT INTO `roles` VALUES ('2', 'Externo');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `rol_id` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `rol_id` (`rol_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('13', 'Abinadad', 'abinadad1211@gmail.com', '202cb962ac59075b964b07152d234b70', '1', '2022-07-04 06:45:32');
INSERT INTO `usuarios` VALUES ('14', 'Nohemi', 'nfz@gmail.com', '202cb962ac59075b964b07152d234b70', '2', '2022-07-04 07:45:06');
INSERT INTO `usuarios` VALUES ('15', 'Jose', 'ricardo@gmail.com', '202cb962ac59075b964b07152d234b70', '2', '2022-07-04 21:50:33');
