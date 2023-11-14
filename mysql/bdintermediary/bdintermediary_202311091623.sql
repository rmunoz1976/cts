CREATE DATABASE  IF NOT EXISTS `bdintermediary` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bdintermediary`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: bdintermediary
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER'),(2,'ROLE_MODERATOR'),(3,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t010c_compania`
--

DROP TABLE IF EXISTS `t010c_compania`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t010c_compania` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(4) NOT NULL COMMENT 'Código de la compañiia',
  `nit` int(11) NOT NULL COMMENT 'Nit de la compañiia',
  `dv` int(11) NOT NULL COMMENT 'Dígito de verificación de la compañiia',
  `nombre_corto` varchar(256) NOT NULL COMMENT 'Nombre corto de la compañiia',
  `nombre_largo` varchar(256) NOT NULL COMMENT 'Nombre largo de la compañiia',
  `sigla` varchar(32) NOT NULL COMMENT 'Sigla de la compañiia',
  `fecha` date DEFAULT NULL COMMENT 'Fecha de la compañia',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `nit_UNIQUE` (`nit`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los datos de la compañia.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t010c_compania`
--

LOCK TABLES `t010c_compania` WRITE;
/*!40000 ALTER TABLE `t010c_compania` DISABLE KEYS */;
INSERT INTO `t010c_compania` VALUES (3,'3',123456789,1,'MYCOMPANY','MYCOMPANYLARGE','MC','2023-03-10');
/*!40000 ALTER TABLE `t010c_compania` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t020c_compania_app`
--

DROP TABLE IF EXISTS `t020c_compania_app`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t020c_compania_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(4) NOT NULL COMMENT 'Código de la app de la compañiia',
  `nombre_corto` varchar(256) NOT NULL COMMENT 'Nombre corto de la app de la compañiia',
  `nombre_largo` varchar(256) NOT NULL COMMENT 'Nombre largo de la app de la compañiia',
  `id_compania` int(11) NOT NULL COMMENT 'Identificador de la compañia',
  `version` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  KEY `idx_t020c_01` (`id_compania`),
  CONSTRAINT `fk_t020c_01` FOREIGN KEY (`id_compania`) REFERENCES `t010c_compania` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los datos de la app de la compañia.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t020c_compania_app`
--

LOCK TABLES `t020c_compania_app` WRITE;
/*!40000 ALTER TABLE `t020c_compania_app` DISABLE KEYS */;
INSERT INTO `t020c_compania_app` VALUES (1,'01','INTERMEDIARY','INTERMEDIARY',3,'00010001-01.01.001A-202308021144');
/*!40000 ALTER TABLE `t020c_compania_app` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t104t_estado_registro`
--

DROP TABLE IF EXISTS `t104t_estado_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t104t_estado_registro` (
  `id` int(11) NOT NULL COMMENT 'Consecutivo único del registro',
  `codigo` varchar(4) NOT NULL COMMENT 'Código del estado',
  `descripcion` varchar(32) NOT NULL COMMENT 'Descripción del estado',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los estados de los registros.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t104t_estado_registro`
--

LOCK TABLES `t104t_estado_registro` WRITE;
/*!40000 ALTER TABLE `t104t_estado_registro` DISABLE KEYS */;
INSERT INTO `t104t_estado_registro` VALUES (1,'1','ACTIVO'),(2,'2','INACTIVO'),(3,'3','ELIMINADO');
/*!40000 ALTER TABLE `t104t_estado_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t132t_magnitud_medida`
--

DROP TABLE IF EXISTS `t132t_magnitud_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t132t_magnitud_medida` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la magnitud de medida',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción de la magnitud de medida',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de las magnitudes de medida.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t132t_magnitud_medida`
--

LOCK TABLES `t132t_magnitud_medida` WRITE;
/*!40000 ALTER TABLE `t132t_magnitud_medida` DISABLE KEYS */;
INSERT INTO `t132t_magnitud_medida` VALUES (1,'01','LONGITUD'),(2,'02','MASA'),(3,'03','TIEMPO'),(4,'04','TEMPERATURA'),(5,'05','INTENSIDAD DE CORRIENTE ELÉCTRICA'),(6,'06','CANTIDAD DE SUSTANCIA'),(7,'07','INTENSIDAD'),(8,'02243','INTENDDSIDAD');
/*!40000 ALTER TABLE `t132t_magnitud_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t134t_unidad_medida`
--

DROP TABLE IF EXISTS `t134t_unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t134t_unidad_medida` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la unidad de medida',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción de la unidad de medida',
  `unidad_principal` int(11) NOT NULL COMMENT 'Identifica si es la unidad principal de la magnitud (solo puede tener estos valores: 1=VERDADERO, 0=FALSO)',
  `simbolo` varchar(16) NOT NULL COMMENT 'Simbolo de la unidad de medida',
  `id_magnitud_medida` int(11) NOT NULL COMMENT 'Identificador del tipo de magnitud de medida',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t132t_01` (`id_magnitud_medida`),
  CONSTRAINT `fk_t132t_10` FOREIGN KEY (`id_magnitud_medida`) REFERENCES `t132t_magnitud_medida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las unidades de medidas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t134t_unidad_medida`
--

LOCK TABLES `t134t_unidad_medida` WRITE;
/*!40000 ALTER TABLE `t134t_unidad_medida` DISABLE KEYS */;
INSERT INTO `t134t_unidad_medida` VALUES (1,'01','METRO',1,'mt',1),(2,'02','KILOGRAMO',1,'kg',2),(3,'03','SEGUNDO',1,'s',3),(4,'04','KELVIN',1,'K',4),(5,'05','AMPERIO',1,'A',5),(6,'06','MOL',1,'mol',6),(7,'07','CANDELA',1,'cd',7),(102,'0201','GRAMOS',0,'gr',2),(103,'0101','CENTRIMETROS',0,'cm',1),(104,'0102','MILIMETROS',0,'mm',1);
/*!40000 ALTER TABLE `t134t_unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t139t_tipo_documento`
--

DROP TABLE IF EXISTS `t139t_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t139t_tipo_documento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de documento',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del tipo de documento',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los tipos de documentos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t139t_tipo_documento`
--

LOCK TABLES `t139t_tipo_documento` WRITE;
/*!40000 ALTER TABLE `t139t_tipo_documento` DISABLE KEYS */;
INSERT INTO `t139t_tipo_documento` VALUES (56,'CEDULA','CEDULA'),(57,'NIT','NIT'),(62,'CE','CEDULA EXTRANJERIA');
/*!40000 ALTER TABLE `t139t_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t146t_pais`
--

DROP TABLE IF EXISTS `t146t_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t146t_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del país',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del país',
  `codigo_dane` varchar(32) NOT NULL COMMENT 'Código DANE del país',
  `indicativo_telefono` varchar(4) NOT NULL COMMENT 'Indicativo de telefono',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los países.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t146t_pais`
--

LOCK TABLES `t146t_pais` WRITE;
/*!40000 ALTER TABLE `t146t_pais` DISABLE KEYS */;
INSERT INTO `t146t_pais` VALUES (2,'5','ARGENTINA','AR','0'),(3,'4','CHILE','CH','0'),(44,'555','55','55','55'),(62,'1','COLOMBIA','CO','0'),(63,'2','USA','US','0'),(64,'3','JAPON','JP','0'),(76,'101','iiiiiii','23','111');
/*!40000 ALTER TABLE `t146t_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t148t_departamento`
--

DROP TABLE IF EXISTS `t148t_departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t148t_departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Códgio del departamento (o estado)',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del departamento (o estado)',
  `codigo_dane` varchar(16) NOT NULL COMMENT 'Código DANE del departamento (o estado)',
  `indicativo_telefono` varchar(8) NOT NULL COMMENT 'Indicativo de telefono',
  `id_pais` int(11) NOT NULL COMMENT 'Identificador del país',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`),
  KEY `idx_t148t_01` (`id_pais`),
  CONSTRAINT `fk_t148t_01` FOREIGN KEY (`id_pais`) REFERENCES `t146t_pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los departamentos (o estados).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t148t_departamento`
--

LOCK TABLES `t148t_departamento` WRITE;
/*!40000 ALTER TABLE `t148t_departamento` DISABLE KEYS */;
INSERT INTO `t148t_departamento` VALUES (18,'1','ANTIOQUIA','ANT','0',62),(22,'2','CORDOBA','COR','0',62),(28,'3','TEXAS','TEX','0',63);
/*!40000 ALTER TABLE `t148t_departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t150t_municipio`
--

DROP TABLE IF EXISTS `t150t_municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t150t_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Códgio del municipio (o ciudad)',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del municipio (o ciudad)',
  `codigo_dane` varchar(16) NOT NULL COMMENT 'Código DANE del municipio (o ciudad)',
  `indicativo_telefono` varchar(8) NOT NULL COMMENT 'Indicativo de telefono',
  `id_departamento` int(11) NOT NULL COMMENT 'Identificador del departamento (o estado)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `codigo_dane_UNIQUE` (`codigo_dane`),
  KEY `idx_t150t_01` (`id_departamento`),
  CONSTRAINT `fk_t150t_01` FOREIGN KEY (`id_departamento`) REFERENCES `t148t_departamento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los municipio (o ciudades).';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t150t_municipio`
--

LOCK TABLES `t150t_municipio` WRITE;
/*!40000 ALTER TABLE `t150t_municipio` DISABLE KEYS */;
INSERT INTO `t150t_municipio` VALUES (30,'1','MEDELLIN','MED','0',18),(31,'2','MONTERIA','MON','0',22),(33,'3','AUSTIN','AUS','0',28);
/*!40000 ALTER TABLE `t150t_municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t156t_moneda`
--

DROP TABLE IF EXISTS `t156t_moneda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t156t_moneda` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de moneda',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción de la moneda',
  `descripcion_corta` varchar(32) NOT NULL COMMENT 'Descripción corta de la moneda',
  `simbolo` varchar(8) NOT NULL COMMENT 'Simbolo de la moneda',
  `iso` varchar(16) NOT NULL COMMENT 'ISO de la moneda',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  UNIQUE KEY `descripcion_corta_UNIQUE` (`descripcion_corta`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información las monedas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t156t_moneda`
--

LOCK TABLES `t156t_moneda` WRITE;
/*!40000 ALTER TABLE `t156t_moneda` DISABLE KEYS */;
INSERT INTO `t156t_moneda` VALUES (71,'1','PESO COLOMBIANO','PESO COLOMBIANO','$','COP'),(72,'2','US DOLLAR AMERICANO','US DOLLAR AMERICANO','$','USD'),(73,'3','YEN JAPONES','YEN JAPONES','¥','JPY'),(75,'4','EURO','EURO','Є','EUR');
/*!40000 ALTER TABLE `t156t_moneda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t163t_tipo_tercero`
--

DROP TABLE IF EXISTS `t163t_tipo_tercero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t163t_tipo_tercero` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de tercero de productos',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del tipo de tercero de productos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los tipos de terceros.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t163t_tipo_tercero`
--

LOCK TABLES `t163t_tipo_tercero` WRITE;
/*!40000 ALTER TABLE `t163t_tipo_tercero` DISABLE KEYS */;
INSERT INTO `t163t_tipo_tercero` VALUES (20,'001','CLIENTE'),(22,'002','PROVEEDOR'),(23,'003','USUARIO');
/*!40000 ALTER TABLE `t163t_tipo_tercero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t304e_empresa`
--

DROP TABLE IF EXISTS `t304e_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t304e_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la empresa',
  `nit` int(11) NOT NULL COMMENT 'Nit de la empresa',
  `dv` int(11) NOT NULL COMMENT 'Dígito de verificación de la empresa',
  `nombre_corto` varchar(128) NOT NULL COMMENT 'Nombre corto de la empresa',
  `nombre_largo` varchar(256) NOT NULL COMMENT 'Nombre largo de la empresa',
  `sigla` varchar(64) NOT NULL COMMENT 'Sigla de la empresa',
  `id_municipio` int(11) NOT NULL COMMENT 'Identificador del municipio (o ciudad)',
  `id_lista_direccion` int(11) NOT NULL COMMENT 'Identificador de lista de dirección',
  `id_lista_telefono` int(11) NOT NULL COMMENT 'Identificador de lista teléfono',
  `id_lista_celular` int(11) NOT NULL COMMENT 'Identificador de lista celular',
  `id_lista_email` int(11) NOT NULL COMMENT 'Identificador de lista email',
  `estado_empresa` int(11) NOT NULL COMMENT 'Indica el estado de la empresa (0=Inactivo / 1=Activo )',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `nit_UNIQUE` (`nit`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`),
  KEY `idx_t304e_10` (`id_municipio`),
  CONSTRAINT `fk_t304e_10` FOREIGN KEY (`id_municipio`) REFERENCES `t150t_municipio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena las empresas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t304e_empresa`
--

LOCK TABLES `t304e_empresa` WRITE;
/*!40000 ALTER TABLE `t304e_empresa` DISABLE KEYS */;
INSERT INTO `t304e_empresa` VALUES (1,'001',999999,9,'C.I FRUITEXPORT LB S.A.S','C.I FRUITEXPORT LB S.A.S','C.I FRUITEXPORT LB S.A.S',30,134,135,136,137,1),(10,'9799',919,9,'9S9','9S9','9S9',30,134,135,136,137,1);
/*!40000 ALTER TABLE `t304e_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t306e_empresa_datos`
--

DROP TABLE IF EXISTS `t306e_empresa_datos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t306e_empresa_datos` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `primer_nombre` varchar(32) NOT NULL COMMENT 'Primer nombre del contacto',
  `segundo_nombre` varchar(32) DEFAULT NULL COMMENT 'Segundo nombre del contacto',
  `primer_apellido` varchar(32) NOT NULL COMMENT 'Primer apellido del contacto',
  `segundo_apellido` varchar(32) DEFAULT NULL COMMENT 'Segundo apellido del contacto',
  `nombre_completo` varchar(128) NOT NULL COMMENT 'Nombre completo del contacto',
  `id_cargo` int(11) NOT NULL COMMENT 'Identificador del cargo',
  `id_lista_direccion` int(11) DEFAULT NULL COMMENT 'Identificador de lista de dirección',
  `id_lista_telefono` int(11) DEFAULT NULL COMMENT 'Identificador de lista teléfono',
  `id_lista_celular` int(11) DEFAULT NULL COMMENT 'Identificador de lista celular',
  `id_lista_email` int(11) DEFAULT NULL COMMENT 'Identificador de lista email',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_completo_UNIQUE` (`nombre_completo`),
  KEY `idx_t306e_01` (`id_empresa`),
  KEY `idx_t306e_02` (`id_usuario_creacion`),
  KEY `idx_t306e_03` (`id_usuario_modificacion`) /*!80000 INVISIBLE */,
  KEY `idx_t306e_10` (`id_cargo`),
  CONSTRAINT `fk_t306e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t306e_02` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t306e_03` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t306e_10` FOREIGN KEY (`id_cargo`) REFERENCES `t330e_cargo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información del contacto de la empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t306e_empresa_datos`
--

LOCK TABLES `t306e_empresa_datos` WRITE;
/*!40000 ALTER TABLE `t306e_empresa_datos` DISABLE KEYS */;
INSERT INTO `t306e_empresa_datos` VALUES (12,'LORENZO','','BELLO','DIAZ','LORENZO BELLO DIAZ',1,134,135,136,137,1,1,'2023-07-26 16:28:15.109069',NULL,NULL);
/*!40000 ALTER TABLE `t306e_empresa_datos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t308e_empresa_segumiento`
--

DROP TABLE IF EXISTS `t308e_empresa_segumiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t308e_empresa_segumiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `fecha_seguimiento` datetime(6) NOT NULL COMMENT 'Fecha de segumiento',
  `observacion` varchar(2048) NOT NULL COMMENT 'Observación del seguimiento',
  `compromiso` varchar(2048) NOT NULL COMMENT 'Compromisos del seguimiento',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t308e_01` (`id_empresa`),
  KEY `idx_t308m_02` (`id_estado_registro`),
  KEY `idx_t308e_03` (`id_usuario_creacion`),
  KEY `idx_t308e_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t308e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t308e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t308e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t5308m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información del seguimiento a la empresa.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t308e_empresa_segumiento`
--

LOCK TABLES `t308e_empresa_segumiento` WRITE;
/*!40000 ALTER TABLE `t308e_empresa_segumiento` DISABLE KEYS */;
INSERT INTO `t308e_empresa_segumiento` VALUES (20,'2024-05-04 19:00:00.000000','OBS1','COMP01',1,1,1,'2023-06-09 13:30:56.347918',1,'2023-06-09 13:30:56.347918'),(21,'2020-05-20 19:00:00.000000','OBS2','CONP02',1,1,1,'2023-06-09 13:33:31.186492',1,'2023-06-09 13:33:31.186492'),(22,'2023-05-04 19:00:00.000000','OBS3','COMP03',1,1,1,'2023-07-06 10:03:37.132633',1,'2023-07-06 10:03:37.132633'),(24,'2023-05-05 00:00:00.000000','OBS4','COMP04',1,1,1,'2023-07-27 08:14:22.069727',NULL,'2023-07-06 10:03:37.132633'),(25,'2023-06-05 00:00:00.000000','OBS5','COMP05',1,1,1,'2023-07-27 08:24:56.064230',1,'2023-07-27 08:28:33.352467'),(26,'2023-02-05 00:00:00.000000','OBS6','COMP06',1,1,1,'2023-07-27 08:26:14.039885',NULL,NULL);
/*!40000 ALTER TABLE `t308e_empresa_segumiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t310e_rol`
--

DROP TABLE IF EXISTS `t310e_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t310e_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del rol',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del rol',
  `tipo` varchar(16) NOT NULL COMMENT 'Tipo del rol (solo puede tener estos valores: ROLE_USER, ROLE_MODERATOR, ROLE_ADMIN)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t310e_rol`
--

LOCK TABLES `t310e_rol` WRITE;
/*!40000 ALTER TABLE `t310e_rol` DISABLE KEYS */;
INSERT INTO `t310e_rol` VALUES (1,'1','USUARIO','ROLE_USER'),(2,'2','MODERADOR','ROLE_MODERATOR'),(3,'3','ADMINISTRADOR','ROLE_ADMIN');
/*!40000 ALTER TABLE `t310e_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t312e_usuario`
--

DROP TABLE IF EXISTS `t312e_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t312e_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_tipo_documento` int(11) NOT NULL COMMENT 'Identificador del tipo de identificacion del usuario.',
  `numero_documento` int(11) NOT NULL COMMENT 'Númerode de identifiacion del usuario.',
  `primer_nombre` varchar(32) NOT NULL COMMENT 'Primer nombre del usuario',
  `segundo_nombre` varchar(32) DEFAULT NULL COMMENT 'Segundo nombre del usuario',
  `primer_apellido` varchar(32) NOT NULL COMMENT 'Primer apellido del usuario',
  `segundo_apellido` varchar(32) DEFAULT NULL COMMENT 'Segundo apellido del usuario',
  `nombre_completo` varchar(128) NOT NULL COMMENT 'Nombre completo del usuario',
  `numero_celular` varchar(16) NOT NULL COMMENT 'numero de celular del usuario',
  `username` varchar(128) NOT NULL COMMENT 'nombre del usuario',
  `password` varchar(512) NOT NULL COMMENT 'Password del usuario',
  `email` varchar(256) NOT NULL COMMENT 'email del usuario',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `nombre_completo_UNIQUE` (`nombre_completo`),
  UNIQUE KEY `numero_celular_UNIQUE` (`numero_celular`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `idx_t312e_01` (`id_empresa`),
  KEY `idx_t312e_02` (`id_tipo_documento`),
  CONSTRAINT `fk_t312e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t312e_02` FOREIGN KEY (`id_tipo_documento`) REFERENCES `t139t_tipo_documento` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los usuarios.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t312e_usuario`
--

LOCK TABLES `t312e_usuario` WRITE;
/*!40000 ALTER TABLE `t312e_usuario` DISABLE KEYS */;
INSERT INTO `t312e_usuario` VALUES (1,56,11,'admin','','admin','','admin admin','66','admin','$2a$10$1KYz30aghpq1VUcnxvatZe9oisrfUL.4B0paSz1hMaSIw7ayCW5OG','admin@gmail.com',1,1,1,'2023-03-13 11:50:34.869648',1,'2023-04-20 10:27:30.813257'),(65,56,22,'RICARDO','','MUNOZ','','RICARDO  MUNOZ ','777','RMUNOZ#089386','$2a$10$1/vqcy/Nmc.Hm6JJK/oJT.4ccqXJbLqg/dOlTn30zh7rWH1RVB17C','ricardo@gmail.com',1,1,1,'2023-04-20 10:30:13.494775',1,'2023-04-20 10:30:13.494775'),(66,56,33,'WEWEW','','VCVCVX','','WEWEW  VCVCVX ','3333','WVCVCVX#089879','$2a$10$lRIcbuyfg7HPwOs0qv0Uo.x.kg/lp.zUUzy/9JGPXuUXYvKW8YMi6','preuba@gmail.com',1,1,1,'2023-04-20 16:44:22.109664',1,'2023-04-20 16:44:22.109664');
/*!40000 ALTER TABLE `t312e_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t314e_usuario_rol`
--

DROP TABLE IF EXISTS `t314e_usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t314e_usuario_rol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_usuario` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `id_rol` int(11) NOT NULL COMMENT 'Identificador del rol',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `usuario_rol_UNIQUE` (`id_usuario`,`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de usuario y rol';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t314e_usuario_rol`
--

LOCK TABLES `t314e_usuario_rol` WRITE;
/*!40000 ALTER TABLE `t314e_usuario_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `t314e_usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t320e_tipo_parametro`
--

DROP TABLE IF EXISTS `t320e_tipo_parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t320e_tipo_parametro` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(64) NOT NULL COMMENT 'Código del tipo de parámetro',
  `descripcion` varchar(512) NOT NULL COMMENT 'Descripcion del tipo de parámetro',
  `tipo` varchar(16) NOT NULL COMMENT 'Tipo de parámetro(solo puede tener estos valores: LISTA, VALOR, VBLEGLOBAL)',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t320m_01` (`id_empresa`),
  KEY `idx_t320m_02` (`id_estado_registro`),
  KEY `idx_t320m_03` (`id_usuario_creacion`),
  KEY `idx_t320m_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t320m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t320m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t320m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t320m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4651 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los tipos de parametros usados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t320e_tipo_parametro`
--

LOCK TABLES `t320e_tipo_parametro` WRITE;
/*!40000 ALTER TABLE `t320e_tipo_parametro` DISABLE KEYS */;
INSERT INTO `t320e_tipo_parametro` VALUES (1,'TIPO_PARAMETRO','Tipos de parámetros','ADMIN',1,1,1,'2023-06-09 16:09:11.079523',1,'2023-06-09 16:09:11.079523'),(10,'VARIABLE_GLOBAL','Parámetro variable global','TIPO_PARAMETRO',1,1,1,'2023-06-09 15:11:41.701439',1,'2023-06-09 15:11:41.701439'),(11,'LISTA','Parámetro tipo lista','TIPO_PARAMETRO',1,1,1,'2023-06-09 15:18:28.191209',1,'2023-06-09 15:18:28.191209'),(12,'SUBLISTA','Parámetro tipo sublista','TIPO_PARAMETRO',1,1,1,'2023-06-09 15:33:51.070400',1,'2023-06-09 15:33:51.070400'),(509,'CARACTERISTICA_UBICACION','CARACTERISTICAS DE LA UBICACIÓN','LISTA',1,1,1,'2023-08-01 09:40:03.533930',1,'2023-08-01 09:40:03.533930'),(4644,'ESTADO_PROSPECTO','ESTADO PROSPECTO','LISTA',1,1,1,'2023-06-14 14:07:34.312241',1,'2023-06-14 14:07:34.312241'),(4649,'OPORTUNIDA_DE_NEGOCIO','OPORTUNIDAD DE NEGOCIO','LISTA',1,1,1,'2023-07-06 10:57:37.570342',1,'2023-07-06 10:57:37.570342'),(4650,'CARACTERISTICA_EMPAQUE','CARACTERISTICAS DEL EMAPAQUE','LISTA',1,1,1,'2023-08-01 09:40:03.533930',1,'2023-08-01 09:40:03.533930');
/*!40000 ALTER TABLE `t320e_tipo_parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t322e_paremetro_valor`
--

DROP TABLE IF EXISTS `t322e_paremetro_valor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t322e_paremetro_valor` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_tipo_parametro` int(11) NOT NULL COMMENT 'Identificador del tipo de parametro',
  `fecha_inicio` datetime(6) NOT NULL COMMENT 'Fecha de inicio del valor del parámetro',
  `fecha_final` datetime(6) DEFAULT NULL COMMENT 'Fecha de finalización del parámetro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del valor del parámetro',
  `referencia` varchar(32) NOT NULL COMMENT 'Referencia del valor del parámetro',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del valor del parámetro',
  `valor_numerico` int(11) NOT NULL COMMENT 'Valor numerico o decimal del parámetro',
  `valor_alfanumerico` int(11) NOT NULL COMMENT 'Valor alfanumerico del parámetro',
  `valor_booleano` int(11) NOT NULL COMMENT 'Valor booleano del parámetro (solo puede tener estos valores: 1=VERDADERO, 0=FALSO)',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t322m_01` (`id_empresa`),
  KEY `idx_t322m_02` (`id_estado_registro`),
  KEY `idx_t322m_03` (`id_usuario_creacion`),
  KEY `idx_t322m_04` (`id_usuario_modificacion`),
  KEY `idx_t322m_10` (`id_tipo_parametro`),
  CONSTRAINT `fk_t322m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t322m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t322m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t322m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t322m_10` FOREIGN KEY (`id_tipo_parametro`) REFERENCES `t320e_tipo_parametro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4630 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los valores de los objetos usados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t322e_paremetro_valor`
--

LOCK TABLES `t322e_paremetro_valor` WRITE;
/*!40000 ALTER TABLE `t322e_paremetro_valor` DISABLE KEYS */;
/*!40000 ALTER TABLE `t322e_paremetro_valor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t324e_parametro_lista`
--

DROP TABLE IF EXISTS `t324e_parametro_lista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t324e_parametro_lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_tipo_parametro` int(11) NOT NULL COMMENT 'Identificador del tipo de parámetro',
  `fecha_inicio` datetime(6) NOT NULL COMMENT 'Fecha de inicio del item de la lista del parametro',
  `fecha_final` datetime(6) DEFAULT NULL COMMENT 'Fecha de finalización del item de la lista del parametro',
  `orden` int(11) NOT NULL COMMENT 'Orden de salida del item de la lista del parametro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del item de la lista del parametro',
  `referencia` varchar(32) NOT NULL COMMENT 'Referencia del item de la lista del parametro',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del item de la lista del parametro',
  `valor_numerico` int(11) NOT NULL COMMENT 'Valor numerico o decimal del item de la lista del parametro',
  `valor_alfanumerico` int(11) NOT NULL COMMENT 'Valor alfanumerico del item de la lista del parametro',
  `valor_booleano` int(11) NOT NULL COMMENT 'Valor booleano del item de la lista del parametro (solo puede tener estos valores: 1=VERDADERO, 0=FALSO)',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t324m_01` (`id_empresa`),
  KEY `idx_t324m_02` (`id_estado_registro`),
  KEY `idx_t324m_03` (`id_usuario_creacion`),
  KEY `idx_t324m_04` (`id_usuario_modificacion`),
  KEY `idx_t324m_10` (`id_tipo_parametro`),
  CONSTRAINT `fk_t324m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t324m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t324m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t324m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t324m_10` FOREIGN KEY (`id_tipo_parametro`) REFERENCES `t320e_tipo_parametro` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los valores de los parametros tipo lista usados.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t324e_parametro_lista`
--

LOCK TABLES `t324e_parametro_lista` WRITE;
/*!40000 ALTER TABLE `t324e_parametro_lista` DISABLE KEYS */;
INSERT INTO `t324e_parametro_lista` VALUES (4637,4644,'2023-06-09 15:11:41.701439',NULL,1,'1','EP','EN PROCESO',0,1,0,1,1,1,'2023-07-05 10:10:41.564266',1,'2023-07-05 10:10:41.564266'),(4638,4644,'2023-06-09 15:11:41.701439',NULL,2,'2','D','DESCARTADO',0,2,0,1,1,1,'2023-07-05 10:10:59.616320',1,'2023-07-05 10:10:59.616320'),(4639,4644,'2023-06-09 15:11:41.701439',NULL,3,'3','S','SUSPENDIDO',0,3,0,1,1,1,'2023-07-05 10:11:19.013600',1,'2023-07-05 10:11:19.013600'),(4640,4644,'2023-06-09 15:11:41.701439',NULL,4,'4','PV','POR VISITAR',0,4,0,1,1,1,'2023-07-05 10:11:33.716147',1,'2023-07-05 10:11:33.716147'),(4641,4644,'2023-06-09 15:11:41.701439',NULL,5,'5','PL','POR LLAMAR',0,5,0,1,1,1,'2023-07-05 10:11:45.983318',1,'2023-07-05 10:11:45.983318'),(4642,4644,'2023-06-09 15:11:41.701439',NULL,6,'6','C','CONSOLIDAR',0,6,0,1,1,1,'2023-07-05 10:12:00.081915',1,'2023-07-05 10:12:00.081915'),(4649,4649,'2023-03-01 19:00:00.000000',NULL,1,'1','1','DTEXT PLANTA ARRIENDO',1,1,0,1,1,1,'2023-07-06 11:29:31.206020',1,'2023-07-06 11:29:31.206020'),(4650,4649,'2023-03-01 19:00:00.000000',NULL,2,'2','2','DTEXT MTM ARRIENDO',2,2,0,1,1,1,'2023-07-06 11:30:59.005734',1,'2023-07-06 11:30:59.005734'),(4651,4649,'2023-03-01 19:00:00.000000',NULL,3,'3','3','CONSULTOTIA XS PRODUCTIVIDAD',3,3,0,1,1,1,'2023-07-06 11:31:33.227720',1,'2023-07-06 11:31:33.227720'),(4652,4649,'2023-03-01 19:00:00.000000',NULL,5,'5','5','PROYECTO PRODUCTIVIDAD',5,5,0,1,1,1,'2023-07-06 11:32:19.345641',1,'2023-07-06 11:32:19.345641'),(4653,4649,'2023-03-01 19:00:00.000000',NULL,6,'6','6','DPARK COMPRA',6,6,0,1,1,1,'2023-07-06 11:32:48.913382',1,'2023-07-06 11:32:48.913382'),(4654,4649,'2023-03-01 19:00:00.000000',NULL,7,'7','7','DPARK ARRIENDO',7,7,0,1,1,1,'2023-07-06 11:33:11.173055',1,'2023-07-06 11:33:11.173055'),(4655,4649,'2023-03-01 19:00:00.000000',NULL,8,'8','8','DESARROLLO ESPECIFIC',8,8,0,1,1,1,'2023-07-06 11:33:32.523969',1,'2023-07-06 11:33:32.523969'),(4656,4649,'2023-03-01 19:00:00.000000',NULL,9,'9','9','NINGUNO',9,9,0,1,1,1,'2023-07-06 11:33:48.067244',1,'2023-07-06 11:33:48.067244'),(4667,4650,'2023-05-05 00:00:00.000000',NULL,1,'1','ALTO','ALTO',1,0,0,1,1,1,'2023-08-01 09:41:12.158631',NULL,'2023-08-01 09:42:34.784946'),(4668,4650,'2023-05-05 00:00:00.000000',NULL,2,'2','LARGO','LARGO',1,0,0,1,1,1,'2023-08-01 09:42:55.701454',NULL,NULL),(4669,4650,'2023-05-05 00:00:00.000000',NULL,3,'3','ANCHO','ANCHO',1,0,0,1,1,1,'2023-08-01 09:43:12.111139',NULL,NULL),(5090,509,'2023-06-09 15:11:41.701439',NULL,1,'1','DIRECCION','DIRECCION',1,0,0,1,1,1,'2023-06-09 15:11:41.701439',NULL,NULL),(5091,509,'2023-06-09 15:11:41.701439',NULL,2,'2','TELEFONO','TELEFONO',1,0,0,1,1,1,'2023-06-09 15:11:41.701439',NULL,NULL),(5092,509,'2023-06-09 15:11:41.701439',NULL,3,'3','CELULAR','CELULAR',1,0,0,1,1,1,'2023-06-09 15:11:41.701439',NULL,NULL),(5093,509,'2023-06-09 15:11:41.701439',NULL,4,'4','EMAIL','EMAIL',1,0,0,1,1,1,'2023-06-09 15:11:41.701439',NULL,NULL);
/*!40000 ALTER TABLE `t324e_parametro_lista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t326e_ubicacion`
--

DROP TABLE IF EXISTS `t326e_ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t326e_ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `valor_alfanumerico` varchar(1024) NOT NULL COMMENT 'Valor alfanumerico almacenado',
  `id_lista` int(11) NOT NULL COMMENT 'Identificador de lista de parametro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t326e_10` (`id_lista`),
  CONSTRAINT `fk_t326e_10` FOREIGN KEY (`id_lista`) REFERENCES `t324e_parametro_lista` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de ubicaciones.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t326e_ubicacion`
--

LOCK TABLES `t326e_ubicacion` WRITE;
/*!40000 ALTER TABLE `t326e_ubicacion` DISABLE KEYS */;
INSERT INTO `t326e_ubicacion` VALUES (134,'DIRECC 01',5090),(135,'TEL',5091),(136,'CEL',5093),(137,'EMAIL',5092);
/*!40000 ALTER TABLE `t326e_ubicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t330e_cargo`
--

DROP TABLE IF EXISTS `t330e_cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t330e_cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del cargo',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del cargo',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los cargos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t330e_cargo`
--

LOCK TABLES `t330e_cargo` WRITE;
/*!40000 ALTER TABLE `t330e_cargo` DISABLE KEYS */;
INSERT INTO `t330e_cargo` VALUES (1,'01','GERENTE'),(72,'20','SECRETARIA'),(73,'210','AUXILIAR');
/*!40000 ALTER TABLE `t330e_cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t333e_tipo_material`
--

DROP TABLE IF EXISTS `t333e_tipo_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t333e_tipo_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de material',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del tipo de material',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t333e_01` (`id_empresa`),
  KEY `idx_t333e_02` (`id_estado_registro`),
  KEY `idx_t333e_03` (`id_usuario_creacion`) /*!80000 INVISIBLE */,
  KEY `idx_t333e_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t333e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t333e_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t333e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t333e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los tipos de materiales.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t333e_tipo_material`
--

LOCK TABLES `t333e_tipo_material` WRITE;
/*!40000 ALTER TABLE `t333e_tipo_material` DISABLE KEYS */;
INSERT INTO `t333e_tipo_material` VALUES (17,'1','MADERA',1,1,1,'2023-08-01 10:21:32.586913',NULL,NULL),(18,'2','PLASTICO',1,1,1,'2023-08-01 10:24:36.253276',NULL,NULL),(19,'3','METAL',1,1,1,'2023-08-01 10:24:44.991934',NULL,NULL),(20,'4','ICOPOR',1,1,1,'2023-08-01 10:24:52.812033',NULL,NULL),(21,'5','VIDRIO',1,1,1,'2023-08-01 10:25:05.261778',1,'2023-08-01 14:22:52.752719');
/*!40000 ALTER TABLE `t333e_tipo_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t336e_tipo_empaque`
--

DROP TABLE IF EXISTS `t336e_tipo_empaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t336e_tipo_empaque` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del tipo de empaque',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del tipo de empaque',
  `id_tipo_material` int(11) NOT NULL COMMENT 'Identificador del tipo de material del empaque',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t336e_01` (`id_empresa`),
  KEY `idx_t336e_02` (`id_estado_registro`),
  KEY `idx_t336e_03` (`id_usuario_creacion`),
  KEY `idx_t336e_04` (`id_usuario_modificacion`),
  KEY `idx_t336e_10` (`id_tipo_material`),
  CONSTRAINT `fk_t336e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t336e_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t336e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t336e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t336e_10` FOREIGN KEY (`id_tipo_material`) REFERENCES `t333e_tipo_material` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los tipos de empaques.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t336e_tipo_empaque`
--

LOCK TABLES `t336e_tipo_empaque` WRITE;
/*!40000 ALTER TABLE `t336e_tipo_empaque` DISABLE KEYS */;
INSERT INTO `t336e_tipo_empaque` VALUES (8,'CJ','CAJA',21,1,1,1,'2023-07-10 16:20:25.835534',1,'2023-07-10 16:20:25.835534'),(9,'BR','BARRIL',17,1,1,1,'2023-07-10 16:21:34.408649',1,'2023-08-01 13:49:47.857399'),(10,'JA','JAULA',17,1,1,1,'2023-07-10 16:21:44.727641',1,'2023-07-10 16:21:44.727641'),(11,'EM','ESTIBA',17,1,1,1,'2023-07-10 16:22:30.955857',1,'2023-07-10 16:22:30.955857'),(16,'12','CONTENEDOR',19,1,1,1,'2023-08-01 08:37:28.297564',1,'2023-08-01 08:40:07.613805'),(18,'112','BOLSA',18,1,1,1,'2023-08-01 13:49:45.932081',NULL,NULL);
/*!40000 ALTER TABLE `t336e_tipo_empaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t344e_marca`
--

DROP TABLE IF EXISTS `t344e_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t344e_marca` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código de la marca',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción de la marca',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t344e_01` (`id_empresa`),
  KEY `idx_t344e_02` (`id_estado_registro`),
  KEY `idx_t344e_03` (`id_usuario_creacion`),
  KEY `idx_t344e_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t344e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t344e_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t344e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t344e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de las marcas.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t344e_marca`
--

LOCK TABLES `t344e_marca` WRITE;
/*!40000 ALTER TABLE `t344e_marca` DISABLE KEYS */;
INSERT INTO `t344e_marca` VALUES (17,'1','MARCA GATO',1,1,1,'2023-08-01 10:30:56.036656',NULL,NULL),(19,'19','MARCA REG',1,1,1,'2023-08-01 10:31:28.291823',1,'2023-08-01 10:31:28.291823'),(20,'29','MARCA EXITO',1,1,1,'2023-08-01 10:31:28.291823',1,'2023-08-01 10:31:28.291823');
/*!40000 ALTER TABLE `t344e_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t350e_color`
--

DROP TABLE IF EXISTS `t350e_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t350e_color` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del color',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del color',
  `rojo` int(11) NOT NULL COMMENT 'Codigo del color rojo',
  `verde` int(11) NOT NULL COMMENT 'Codigo del color verde',
  `azul` int(11) NOT NULL COMMENT 'Codigo del color azul',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t350e_01` (`id_empresa`),
  KEY `idx_t350e_02` (`id_estado_registro`),
  KEY `idx_t350e_03` (`id_usuario_creacion`),
  KEY `idx_t350e_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t350e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t350e_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t350e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t350e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los colores.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t350e_color`
--

LOCK TABLES `t350e_color` WRITE;
/*!40000 ALTER TABLE `t350e_color` DISABLE KEYS */;
INSERT INTO `t350e_color` VALUES (17,'1','NEGRO',0,0,0,1,1,1,'2023-08-01 12:02:11.711293',1,'2023-08-02 08:45:10.387807'),(18,'155','ROJO',0,5,0,1,1,1,'2023-08-01 12:03:12.344892',NULL,NULL),(19,'1558','VERDE',0,0,5,1,1,1,'2023-08-01 12:14:23.792132',NULL,NULL),(21,'77','GRIS',7,0,0,1,1,1,'2023-08-02 08:44:55.530703',NULL,NULL);
/*!40000 ALTER TABLE `t350e_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t358e_moneda_pais`
--

DROP TABLE IF EXISTS `t358e_moneda_pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t358e_moneda_pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_pais` int(11) NOT NULL COMMENT 'Identificador del país',
  `id_moneda` int(11) NOT NULL COMMENT 'Identificador de la moneda',
  `unidad_principal` int(11) NOT NULL COMMENT 'Identifica si es la moneda principal del país (solo puede tener estos valores: 1=VERDADERO, 0=FALSO)',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t358e_01` (`id_empresa`),
  KEY `idx_t358e_02` (`id_estado_registro`),
  KEY `idx_t358e_03` (`id_usuario_creacion`),
  KEY `idx_t358e_04` (`id_usuario_modificacion`),
  KEY `idx_t358e_10` (`id_pais`),
  KEY `idx_t358e_11` (`id_moneda`),
  CONSTRAINT `fk_t358e_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t358e_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t358e_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t358e_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t358e_10` FOREIGN KEY (`id_pais`) REFERENCES `t146t_pais` (`id`),
  CONSTRAINT `fk_t358e_11` FOREIGN KEY (`id_moneda`) REFERENCES `t156t_moneda` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de las monedas de cada país.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t358e_moneda_pais`
--

LOCK TABLES `t358e_moneda_pais` WRITE;
/*!40000 ALTER TABLE `t358e_moneda_pais` DISABLE KEYS */;
INSERT INTO `t358e_moneda_pais` VALUES (1,62,71,1,1,1,1,'2023-06-09 13:33:31.186492',NULL,NULL),(2,62,72,0,1,1,1,'2023-06-09 13:33:31.186492',NULL,NULL),(3,63,72,1,1,1,1,'2023-06-09 13:33:31.186492',NULL,NULL);
/*!40000 ALTER TABLE `t358e_moneda_pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t522m_grupo_producto`
--

DROP TABLE IF EXISTS `t522m_grupo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t522m_grupo_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del grupo de productos',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del grupo de productos',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t522m_01` (`id_empresa`),
  KEY `idx_t522m_02` (`id_estado_registro`),
  KEY `idx_t522m_03` (`id_usuario_creacion`),
  KEY `idx_t522m_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t522m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t522m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t522m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t522m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los grupos de productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t522m_grupo_producto`
--

LOCK TABLES `t522m_grupo_producto` WRITE;
/*!40000 ALTER TABLE `t522m_grupo_producto` DISABLE KEYS */;
INSERT INTO `t522m_grupo_producto` VALUES (7,'1','ANIMALES',1,1,1,'2023-03-13 13:09:26.873948',1,'2023-03-13 13:09:26.873948'),(8,'2','MINERALES',1,1,1,'2023-06-06 10:37:17.545325',1,'2023-06-06 10:37:17.545325'),(10,'6','MANUFACTURA',1,1,1,'2023-06-06 11:36:44.984265',1,'2023-06-06 11:36:44.984265'),(15,'DDD','SDSD',1,1,1,'2023-07-24 16:15:23.302604',1,'2023-07-24 16:15:23.302604'),(16,'6211','MINER2ALES',1,1,1,'2023-07-24 16:16:06.541681',NULL,'2023-07-27 11:27:29.835655'),(17,'1W','RRRR',1,1,1,'2023-07-27 10:58:29.162390',NULL,NULL),(18,'14W','RRRRERR',1,1,1,'2023-07-27 10:59:54.856659',NULL,NULL),(19,'1422W','RRR33RERR',1,1,1,'2023-07-27 11:04:51.837468',NULL,NULL);
/*!40000 ALTER TABLE `t522m_grupo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t525m_subgrupo_producto`
--

DROP TABLE IF EXISTS `t525m_subgrupo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t525m_subgrupo_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código del grupo de productos',
  `descripcion` varchar(64) NOT NULL COMMENT 'Descripción del grupo de productos',
  `id_grupo_producto` int(11) NOT NULL COMMENT 'Identificador del grupo de producto',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t525m_01` (`id_empresa`),
  KEY `idx_t525m_02` (`id_estado_registro`),
  KEY `idx_t525m_03` (`id_usuario_creacion`),
  KEY `idx_t525m_04` (`id_usuario_modificacion`),
  KEY `idx_t525m_10` (`id_grupo_producto`),
  CONSTRAINT `fk_t525m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t525m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t525m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t525m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t525m_10` FOREIGN KEY (`id_grupo_producto`) REFERENCES `t522m_grupo_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=901 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información los grupos de productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t525m_subgrupo_producto`
--

LOCK TABLES `t525m_subgrupo_producto` WRITE;
/*!40000 ALTER TABLE `t525m_subgrupo_producto` DISABLE KEYS */;
INSERT INTO `t525m_subgrupo_producto` VALUES (5,'5','PIEL COCODRILO',10,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(6,'6','PIEL VACA',10,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(111,'111','EQUINOS',7,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(222,'222','AVES',7,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(767,'676','CARBON',8,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(777,'777','PLATA',8,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(888,'888','ORO',8,1,1,1,'2023-03-13 13:37:23.247849',1,'2023-03-13 13:37:23.247849'),(899,'4','FDFDF',7,1,1,1,'2023-07-27 11:55:52.484786',1,'2023-07-27 11:56:15.779831'),(900,'PLATA','PLAVTA',7,1,1,1,'2023-07-27 11:56:06.860499',NULL,NULL);
/*!40000 ALTER TABLE `t525m_subgrupo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t528m_producto`
--

DROP TABLE IF EXISTS `t528m_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t528m_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Código el producto',
  `nombre_corto` varchar(64) NOT NULL COMMENT 'Nombre corto del producto',
  `nombre_largo` varchar(128) NOT NULL COMMENT 'Nombre largo del producto',
  `ruta_imagen` varchar(512) DEFAULT NULL COMMENT 'Ruta del archivo de imagen',
  `nombre_imagen` varchar(128) DEFAULT NULL COMMENT 'Nombre del archivo de imagen',
  `id_subgrupo_producto` int(11) NOT NULL COMMENT 'Identificador del subgrupo de producto',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `nombre_corto_UNIQUE` (`nombre_corto`),
  UNIQUE KEY `nombre_largo_UNIQUE` (`nombre_largo`),
  UNIQUE KEY `ruta_nombre_UNIQUE` (`ruta_imagen`,`nombre_imagen`),
  KEY `idx_t528m_01` (`id_empresa`),
  KEY `idx_t528m_02` (`id_estado_registro`),
  KEY `idx_t528m_03` (`id_usuario_creacion`),
  KEY `idx_t528m_04` (`id_usuario_modificacion`),
  KEY `idx_t528m_10` (`id_subgrupo_producto`),
  CONSTRAINT `fk_t528m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t528m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t528m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t528m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t528m_10` FOREIGN KEY (`id_subgrupo_producto`) REFERENCES `t525m_subgrupo_producto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena los productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t528m_producto`
--

LOCK TABLES `t528m_producto` WRITE;
/*!40000 ALTER TABLE `t528m_producto` DISABLE KEYS */;
INSERT INTO `t528m_producto` VALUES (16,'1','CABALLO','CABALLO','C:\\proyectos\\vscts\\vscts\\assets\\productos','1',111,1,1,1,'2023-07-06 11:56:13.784611',1,'2023-07-06 11:56:13.784611'),(17,'2','ASNO','ASNO','C:\\proyectos\\vscts\\vscts\\assets\\productos','2',111,1,1,1,'2023-07-06 11:56:31.351808',1,'2023-07-06 11:56:31.351808'),(18,'3','CARBON','CARBON','C:\\proyectos\\vscts\\vscts\\assets\\productos','3',767,1,1,1,'2023-07-06 11:56:56.548283',1,'2023-07-06 11:56:56.548283'),(19,'4','GRAFITO','GRAFITO','C:\\proyectos\\vscts\\vscts\\assets\\productos','4',767,1,1,1,'2023-07-06 11:57:23.984193',1,'2023-07-06 11:57:23.984193'),(20,'5','GALLINAS','GALLINAS','C:\\proyectos\\vscts\\vscts\\assets\\productos','5',222,1,1,1,'2023-07-06 11:57:55.617051',1,'2023-07-06 11:57:55.617051'),(21,'6','PLATA','PLATA','C:\\proyectos\\vscts\\vscts\\assets\\productos','6',777,1,1,1,'2023-07-06 11:58:17.281679',1,'2023-07-06 11:58:17.281679'),(22,'7','ORO','ORO','C:\\proyectos\\vscts\\vscts\\assets\\productos','7',888,1,1,1,'2023-07-06 11:58:34.112626',1,'2023-07-06 11:58:34.112626'),(23,'8','PIEL COCODRILO AMARILLA','PIEL COCODRILO AMARILLA','C:\\proyectos\\vscts\\vscts\\assets\\productos','8',5,1,1,1,'2023-07-06 11:59:03.215437',1,'2023-07-06 11:59:03.215437'),(24,'9','PIEL COCODRILO NEGRA','PIEL COCODRILO NEGRA','C:\\proyectos\\vscts\\vscts\\assets\\productos','9',5,1,1,1,'2023-07-06 11:59:14.528449',1,'2023-07-06 11:59:14.528449'),(25,'10','PIEL VACA NEGRA','PIEL VACA NEGRA','C:\\proyectos\\vscts\\vscts\\assets\\productos','10',6,1,1,1,'2023-07-06 11:59:28.616013',1,'2023-07-06 11:59:28.616013'),(26,'11','PIEL VACA ROJA','PIEL VACA ROJA','C:\\proyectos\\vscts\\vscts\\assets\\productos','11',6,1,1,1,'2023-07-06 11:59:45.768561',1,'2023-07-06 11:59:45.768561'),(27,'12','PIEL VACA BLANCA','PIEL VACA BLANCA','C:\\proyectos\\vscts\\vscts\\assets\\productos','12',6,1,1,1,'2023-07-06 11:59:56.178372',1,'2023-07-06 11:59:56.178372'),(28,'13','PIEL VACA GRIS','PIEL VACA GRIS','C:\\proyectos\\vscts\\vscts\\assets\\productos','13',6,1,1,1,'2023-07-06 12:00:15.967236',1,'2023-07-06 12:00:15.967236');
/*!40000 ALTER TABLE `t528m_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t543m_nivel_arancel`
--

DROP TABLE IF EXISTS `t543m_nivel_arancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t543m_nivel_arancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(32) NOT NULL COMMENT 'Código del nivel de arancel',
  `descripcion` varchar(128) NOT NULL COMMENT 'Descripción del nivel de arancel',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t543m_01` (`id_empresa`),
  KEY `idx_t543m_02` (`id_estado_registro`),
  KEY `idx_t543m_03` (`id_usuario_creacion`),
  KEY `idx_t543m_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t543m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t543m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t543m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t543m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los niveles de arancel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t543m_nivel_arancel`
--

LOCK TABLES `t543m_nivel_arancel` WRITE;
/*!40000 ALTER TABLE `t543m_nivel_arancel` DISABLE KEYS */;
INSERT INTO `t543m_nivel_arancel` VALUES (2,'1','NIVEL I',1,1,1,'2023-03-13 13:56:29.966360',1,'2023-03-13 13:56:29.966360');
/*!40000 ALTER TABLE `t543m_nivel_arancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t546m_concepto_arancel`
--

DROP TABLE IF EXISTS `t546m_concepto_arancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t546m_concepto_arancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(16) NOT NULL COMMENT 'Descripción del concepto de arancel',
  `descripcion` varchar(512) NOT NULL COMMENT 'Descripción del concepto de arancel',
  `tipo_lista` int(11) NOT NULL COMMENT 'Tipo de lista de valores',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`),
  KEY `idx_t546m_01` (`id_empresa`),
  KEY `idx_t546m_02` (`id_estado_registro`),
  KEY `idx_t546m_03` (`id_usuario_creacion`),
  KEY `idx_t546m_04` (`id_usuario_modificacion`),
  CONSTRAINT `fk_t546m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t546m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t546m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t546m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de los conceptos de arancel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t546m_concepto_arancel`
--

LOCK TABLES `t546m_concepto_arancel` WRITE;
/*!40000 ALTER TABLE `t546m_concepto_arancel` DISABLE KEYS */;
INSERT INTO `t546m_concepto_arancel` VALUES (2,'21','2NIVEL I',1,1,1,1,'2023-03-13 14:24:25.423131',1,'2023-03-13 14:24:25.423131');
/*!40000 ALTER TABLE `t546m_concepto_arancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t549m_estructura_arancel`
--

DROP TABLE IF EXISTS `t549m_estructura_arancel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t549m_estructura_arancel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `codigo` varchar(32) NOT NULL COMMENT 'Código de la estructura de arancel',
  `descripcion` varchar(1024) NOT NULL COMMENT 'Descripción de la estructura de arancel',
  `id_nivel` int(11) NOT NULL COMMENT 'Identificador del nivel de arancel',
  `id_estructura` int(11) NOT NULL COMMENT 'Identificador del nivel padre del arancel',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  KEY `idx_t549m_01` (`id_empresa`),
  KEY `idx_t549m_02` (`id_estado_registro`),
  KEY `idx_t549m_03` (`id_usuario_creacion`),
  KEY `idx_t549m_04` (`id_usuario_modificacion`),
  KEY `idx_t549m_10` (`id_nivel`),
  CONSTRAINT `fk_t549m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t549m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t549m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t549m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t549m_10` FOREIGN KEY (`id_nivel`) REFERENCES `t543m_nivel_arancel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información de la estructura de arancel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t549m_estructura_arancel`
--

LOCK TABLES `t549m_estructura_arancel` WRITE;
/*!40000 ALTER TABLE `t549m_estructura_arancel` DISABLE KEYS */;
/*!40000 ALTER TABLE `t549m_estructura_arancel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t564m_prod_aran`
--

DROP TABLE IF EXISTS `t564m_prod_aran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t564m_prod_aran` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_producto` int(11) NOT NULL COMMENT 'Identificador del producto para el arancel',
  `id_estructura_arancel` int(11) NOT NULL COMMENT 'Identificador de la estructura del arancel',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t564m_01` (`id_empresa`),
  KEY `idx_t564m_02` (`id_estado_registro`),
  KEY `idx_t564m_03` (`id_usuario_creacion`),
  KEY `idx_t564m_04` (`id_usuario_modificacion`),
  KEY `idx_t564m_10` (`id_producto`),
  KEY `idx_t564m_11` (`id_estructura_arancel`),
  CONSTRAINT `fk_t564m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t564m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t564m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t564m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t564m_10` FOREIGN KEY (`id_producto`) REFERENCES `t528m_producto` (`id`),
  CONSTRAINT `fk_t564m_11` FOREIGN KEY (`id_estructura_arancel`) REFERENCES `t549m_estructura_arancel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información del producto y la estructura de arancel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t564m_prod_aran`
--

LOCK TABLES `t564m_prod_aran` WRITE;
/*!40000 ALTER TABLE `t564m_prod_aran` DISABLE KEYS */;
/*!40000 ALTER TABLE `t564m_prod_aran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t567m_prod_aran_perfil`
--

DROP TABLE IF EXISTS `t567m_prod_aran_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t567m_prod_aran_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_prod_aran` int(11) NOT NULL COMMENT 'Identificador del producto y arancel',
  `id_concepto_arancel` int(11) NOT NULL COMMENT 'Identificador del concepto para el arancel',
  `tipo_accion` int(11) NOT NULL COMMENT 'Acción del concepto de arancel',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t567m_01` (`id_empresa`),
  KEY `idx_t567m_02` (`id_estado_registro`),
  KEY `idx_t567m_03` (`id_usuario_creacion`),
  KEY `idx_t567m_04` (`id_usuario_modificacion`),
  KEY `idx_t567m_10` (`id_prod_aran`),
  KEY `idx_t567m_11` (`id_concepto_arancel`),
  CONSTRAINT `fk_t567m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t567m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t567m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t567m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t567m_10` FOREIGN KEY (`id_prod_aran`) REFERENCES `t564m_prod_aran` (`id`),
  CONSTRAINT `fk_t567m_11` FOREIGN KEY (`id_concepto_arancel`) REFERENCES `t546m_concepto_arancel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información del concepto para el producto arancel.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t567m_prod_aran_perfil`
--

LOCK TABLES `t567m_prod_aran_perfil` WRITE;
/*!40000 ALTER TABLE `t567m_prod_aran_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `t567m_prod_aran_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t582m_producto_empaque`
--

DROP TABLE IF EXISTS `t582m_producto_empaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t582m_producto_empaque` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_producto` int(11) NOT NULL COMMENT 'Identificador del producto',
  `id_tipo_empaque` int(11) NOT NULL COMMENT 'Identificador del tipo de empaque del producto',
  `id_um_longitud` int(11) DEFAULT NULL,
  `valor_alto` decimal(20,4) NOT NULL COMMENT 'Valor del alto del empaque',
  `valor_largo` decimal(20,4) NOT NULL COMMENT 'Valordel  largo del empaque',
  `valor_ancho` decimal(20,4) NOT NULL COMMENT 'Valor del  ancho del empaque',
  `id_um_masa` int(11) NOT NULL COMMENT 'Identificador de la unidad de medida del empaque del producto',
  `valor_unidad_medida` decimal(20,4) NOT NULL COMMENT 'Valor de la unidad de medida del empaque del producto',
  `id_marca` int(11) NOT NULL COMMENT 'Identificador de la marca del empaque del producto',
  `id_color` int(11) NOT NULL COMMENT 'Identificador del color del empaque del producto',
  `id_moneda` int(11) DEFAULT NULL COMMENT 'Identificador de la moneda de venta',
  `valor_precio` decimal(20,4) DEFAULT NULL COMMENT 'Valor del precio del producto según caractersticas',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) DEFAULT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) DEFAULT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_t582m_01` (`id_empresa`),
  KEY `idx_t582m_02` (`id_estado_registro`),
  KEY `idx_t582m_03` (`id_usuario_creacion`),
  KEY `idx_t582m_04` (`id_usuario_modificacion`),
  KEY `idx_t582m_10` (`id_producto`),
  KEY `idx_t582m_11` (`id_tipo_empaque`),
  KEY `idx_t582m_12` (`id_um_masa`),
  KEY `idx_t582m_13` (`id_marca`),
  KEY `idx_t582m_14` (`id_color`),
  CONSTRAINT `fk_t582m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t582m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t582m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t582m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t582m_10` FOREIGN KEY (`id_producto`) REFERENCES `t528m_producto` (`id`),
  CONSTRAINT `fk_t582m_11` FOREIGN KEY (`id_tipo_empaque`) REFERENCES `t336e_tipo_empaque` (`id`),
  CONSTRAINT `fk_t582m_12` FOREIGN KEY (`id_um_masa`) REFERENCES `t134t_unidad_medida` (`id`),
  CONSTRAINT `fk_t582m_13` FOREIGN KEY (`id_marca`) REFERENCES `t344e_marca` (`id`),
  CONSTRAINT `fk_t582m_14` FOREIGN KEY (`id_color`) REFERENCES `t350e_color` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena la información del producto y el tipo de empaque.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t582m_producto_empaque`
--

LOCK TABLES `t582m_producto_empaque` WRITE;
/*!40000 ALTER TABLE `t582m_producto_empaque` DISABLE KEYS */;
INSERT INTO `t582m_producto_empaque` VALUES (2,18,18,103,10.0000,5.0000,12.0000,2,122.0000,19,18,71,20000.0000,1,1,1,'2023-08-02 11:35:27.337054',NULL,NULL),(10,19,16,103,17.0000,17.0000,17.0000,102,44.0000,17,17,72,876.9400,1,1,1,'2023-08-02 11:35:27.337054',1,'2023-08-02 15:01:52.389198'),(12,20,9,104,17.0000,17.0000,17.0000,102,555.0000,17,21,73,12346.0000,1,1,1,'2023-08-02 12:06:58.652747',NULL,NULL),(14,22,18,103,7.0000,27.0000,4.0000,2,87.0000,19,18,75,123.5600,1,1,1,'2023-08-02 12:09:39.417302',NULL,NULL);
/*!40000 ALTER TABLE `t582m_producto_empaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t702m_hst_producto_precio`
--

DROP TABLE IF EXISTS `t702m_hst_producto_precio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t702m_hst_producto_precio` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_producto` int(11) NOT NULL COMMENT 'Identificador del producto',
  `fecha_inicial` datetime(6) NOT NULL COMMENT 'Fecha inicial',
  `fecha_final` datetime(6) DEFAULT NULL COMMENT 'Fecha final',
  `id_moneda_pais` int(11) NOT NULL COMMENT 'Identificador de la moneda del pais',
  `precio` decimal(20,4) NOT NULL COMMENT 'Precio del producto',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `producto_fecha_inicial_UNIQUE` (`id_producto`,`fecha_inicial`),
  KEY `idx_t702m_01` (`id_empresa`),
  KEY `idx_t702m_02` (`id_estado_registro`),
  KEY `idx_t702m_03` (`id_usuario_creacion`),
  KEY `idx_t702m_04` (`id_usuario_modificacion`),
  KEY `idx_t702m_10` (`id_moneda_pais`),
  CONSTRAINT `fk_t702m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t702m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t702m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t702m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t702m_10` FOREIGN KEY (`id_moneda_pais`) REFERENCES `t358e_moneda_pais` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena el historico de los precios de productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t702m_hst_producto_precio`
--

LOCK TABLES `t702m_hst_producto_precio` WRITE;
/*!40000 ALTER TABLE `t702m_hst_producto_precio` DISABLE KEYS */;
/*!40000 ALTER TABLE `t702m_hst_producto_precio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t705m_hst_producto_empaque`
--

DROP TABLE IF EXISTS `t705m_hst_producto_empaque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t705m_hst_producto_empaque` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Consecutivo único del registro',
  `id_producto` int(11) NOT NULL COMMENT 'Identificador del producto',
  `fecha_inicial` datetime(6) NOT NULL COMMENT 'Fecha inicial',
  `fecha_final` datetime(6) DEFAULT NULL COMMENT 'Fecha final',
  `id_tipo_empaque` int(11) NOT NULL COMMENT 'Identificador del tipo de empaque',
  `precio` decimal(20,4) NOT NULL COMMENT 'Valor TRM',
  `id_empresa` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `id_estado_registro` int(11) NOT NULL COMMENT 'Identificador del estado del registro',
  `id_usuario_creacion` int(11) NOT NULL COMMENT 'Identificador del usuario que creó el registro',
  `fecha_creacion` datetime(6) NOT NULL COMMENT 'Fecha de creación el registro',
  `id_usuario_modificacion` int(11) NOT NULL COMMENT 'Identificador del usuario que modificó el registro',
  `fecha_modificacion` datetime(6) NOT NULL COMMENT 'Fecha de la última modificación del registro',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `producto_fecha_inicial_UNIQUE` (`id_producto`,`fecha_inicial`),
  KEY `idx_t705m_01` (`id_empresa`),
  KEY `idx_t705m_02` (`id_estado_registro`),
  KEY `idx_t705m_03` (`id_usuario_creacion`),
  KEY `idx_t705m_04` (`id_usuario_modificacion`),
  KEY `idx_t705m_10` (`id_tipo_empaque`),
  CONSTRAINT `fk_t705m_01` FOREIGN KEY (`id_empresa`) REFERENCES `t304e_empresa` (`id`),
  CONSTRAINT `fk_t705m_02` FOREIGN KEY (`id_estado_registro`) REFERENCES `t104t_estado_registro` (`id`),
  CONSTRAINT `fk_t705m_03` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t705m_04` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `t312e_usuario` (`id`),
  CONSTRAINT `fk_t705m_10` FOREIGN KEY (`id_tipo_empaque`) REFERENCES `t336e_tipo_empaque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena el historico de los tipos de empaque de productos.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t705m_hst_producto_empaque`
--

LOCK TABLES `t705m_hst_producto_empaque` WRITE;
/*!40000 ALTER TABLE `t705m_hst_producto_empaque` DISABLE KEYS */;
/*!40000 ALTER TABLE `t705m_hst_producto_empaque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (12,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (12,'1ricardo1aZ@gmail.com','$2a$10$dGcBF7HDmiAPDU.ZQl0OHeof..M2c2iwuHlspFfM3adyRKsWe0jeC','1ricardo1aZ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-09 16:21:30
