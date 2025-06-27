-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: TP_Integrador_G3
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.22.04.1
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `idcompra` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `calificacion_compra` int DEFAULT NULL,
  `usuario_DNI` int DEFAULT NULL,
  `publicacion_id` int DEFAULT NULL,
  `pago_idPago` int DEFAULT NULL,
  `envio_idEnvio` int DEFAULT NULL,
  PRIMARY KEY (`idcompra`),
  KEY `usuario_DNI` (`usuario_DNI`),
  KEY `publicacion_id` (`publicacion_id`),
  KEY `envio_idEnvio` (`envio_idEnvio`),
  KEY `pago_idPago` (`pago_idPago`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`usuario_DNI`) REFERENCES `usuario` (`DNI`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`),
  CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`envio_idEnvio`) REFERENCES `envio` (`idenvio`),
  CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`pago_idPago`) REFERENCES `pago` (`idPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `envio`
--

DROP TABLE IF EXISTS `envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envio` (
  `idenvio` int NOT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `empresa` tinyint DEFAULT NULL,
  PRIMARY KEY (`idenvio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `historial_ofertas`
--

DROP TABLE IF EXISTS `historial_ofertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_ofertas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `oferta` int DEFAULT NULL,
  `usuario_DNI` int NOT NULL,
  `publicacion_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_historial_ofertas_usuario1_idx` (`usuario_DNI`),
  KEY `fk_historial_ofertas_publicacion1_idx` (`publicacion_id`),
  CONSTRAINT `fk_historial_ofertas_publicacion1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`),
  CONSTRAINT `fk_historial_ofertas_usuario1` FOREIGN KEY (`usuario_DNI`) REFERENCES `usuario` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idPago` int NOT NULL,
  `metodo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `preguntas`
--

DROP TABLE IF EXISTS `preguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preguntas` (
  `idPregunta` int NOT NULL,
  `pregunta` text,
  `usuario_DNI` int NOT NULL,
  `publicacion_id` int NOT NULL,
  `fechaPreguntas` date DEFAULT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fk_preguntas_usuario1_idx` (`usuario_DNI`),
  KEY `fk_preguntas_publicacion1_idx` (`publicacion_id`),
  CONSTRAINT `fk_preguntas_publicacion1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`),
  CONSTRAINT `fk_preguntas_usuario1` FOREIGN KEY (`usuario_DNI`) REFERENCES `usuario` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int NOT NULL,
  `nombreProducto` varchar(45) DEFAULT NULL,
  `descripcion` text,
  `usuario_DNI` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `fk_producto_usuario1_idx` (`usuario_DNI`),
  CONSTRAINT `fk_producto_usuario1` FOREIGN KEY (`usuario_DNI`) REFERENCES `usuario` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacion` (
  `id` int NOT NULL,
  `precio` float DEFAULT NULL,
  `nivelPublicacion` varchar(45) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `producto_idProducto` int NOT NULL,
  `categoria_idCategoria` int NOT NULL,
  `usuario_DNI` int NOT NULL,
  `fechaPublicacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_publicacion_producto1_idx` (`producto_idProducto`),
  KEY `fk_publicacion_categoria1_idx` (`categoria_idCategoria`),
  KEY `fk_publicacion_usuario1_idx` (`usuario_DNI`),
  CONSTRAINT `fk_publicacion_categoria1` FOREIGN KEY (`categoria_idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `fk_publicacion_producto1` FOREIGN KEY (`producto_idProducto`) REFERENCES `producto` (`idProducto`),
  CONSTRAINT `fk_publicacion_usuario1` FOREIGN KEY (`usuario_DNI`) REFERENCES `usuario` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `respuestas`
--

DROP TABLE IF EXISTS `respuestas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respuestas` (
  `idRespuesta` int NOT NULL AUTO_INCREMENT,
  `respuesta` text,
  `preguntas_idPregunta` int NOT NULL,
  PRIMARY KEY (`idRespuesta`),
  KEY `fk_respuestas_preguntas1_idx` (`preguntas_idPregunta`),
  CONSTRAINT `fk_respuestas_preguntas1` FOREIGN KEY (`preguntas_idPregunta`) REFERENCES `preguntas` (`idPregunta`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subasta`
--

DROP TABLE IF EXISTS `subasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subasta` (
  `oferta` int DEFAULT NULL,
  `publicacion_id` int NOT NULL,
  `fecha_tope` datetime DEFAULT NULL,
  `oferta_minima` int DEFAULT NULL,
  PRIMARY KEY (`publicacion_id`),
  CONSTRAINT `fk_subasta_publicacion1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `nivel` varchar(45) DEFAULT NULL,
  `reputacion` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `facturacion` int DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `venta_directa`
--

DROP TABLE IF EXISTS `venta_directa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_directa` (
  `pago_idPago` int NOT NULL,
  `envio_idenvio` int NOT NULL,
  `publicacion_id` int NOT NULL,
  `calificacion_venta` int DEFAULT NULL,
  PRIMARY KEY (`publicacion_id`),
  KEY `fk_venta_directa_pago1_idx` (`pago_idPago`),
  KEY `fk_venta_directa_envio1_idx` (`envio_idenvio`),
  KEY `fk_venta_directa_publicacion1_idx` (`publicacion_id`),
  CONSTRAINT `fk_venta_directa_envio1` FOREIGN KEY (`envio_idenvio`) REFERENCES `envio` (`idenvio`),
  CONSTRAINT `fk_venta_directa_pago1` FOREIGN KEY (`pago_idPago`) REFERENCES `pago` (`idPago`),
  CONSTRAINT `fk_venta_directa_publicacion1` FOREIGN KEY (`publicacion_id`) REFERENCES `publicacion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dump completed on 2025-06-27 11:47:40