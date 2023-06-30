-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: se
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `dispositivo`
--

DROP TABLE IF EXISTS `dispositivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `dispositivo` (
  `disp_id` int NOT NULL,
  `disp_modelo` varchar(30) NOT NULL,
  `disp_status` varchar(30) NOT NULL,
  PRIMARY KEY (`disp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispositivo`
--

LOCK TABLES `dispositivo` WRITE;
/*!40000 ALTER TABLE `dispositivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dispositivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `pes_matricula` varchar(30) NOT NULL,
  `pes_nome` varchar(50) NOT NULL,
  `pes_categoria` int NOT NULL,
  `pes_senha` varchar(30) NOT NULL,
  PRIMARY KEY (`pes_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `porta`
--

DROP TABLE IF EXISTS `porta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `porta` (
  `port_id` int NOT NULL,
  `port_disp_id` int NOT NULL,
  `port_sal_id` int NOT NULL,
  PRIMARY KEY (`port_id`),
  KEY `port_disp_id` (`port_disp_id`),
  KEY `port_sal_id` (`port_sal_id`),
  CONSTRAINT `porta_ibfk_1` FOREIGN KEY (`port_disp_id`) REFERENCES `dispositivo` (`disp_id`),
  CONSTRAINT `porta_ibfk_2` FOREIGN KEY (`port_sal_id`) REFERENCES `sala` (`sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `porta`
--

LOCK TABLES `porta` WRITE;
/*!40000 ALTER TABLE `porta` DISABLE KEYS */;
/*!40000 ALTER TABLE `porta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predio`
--

DROP TABLE IF EXISTS `predio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `predio` (
  `pred_id` int NOT NULL,
  `pred_nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pred_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predio`
--

LOCK TABLES `predio` WRITE;
/*!40000 ALTER TABLE `predio` DISABLE KEYS */;
/*!40000 ALTER TABLE `predio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regras_de_acesso`
--

DROP TABLE IF EXISTS `regras_de_acesso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `regras_de_acesso` (
  `reg_id` int NOT NULL,
  `reg_pes_matricula` varchar(30) NOT NULL,
  `reg_sal_id` int NOT NULL,
  `reg_data` date NOT NULL,
  `reg_horario` time NOT NULL,
  PRIMARY KEY (`reg_id`),
  KEY `reg_pes_matricula` (`reg_pes_matricula`),
  KEY `reg_sal_id` (`reg_sal_id`),
  CONSTRAINT `regras_de_acesso_ibfk_1` FOREIGN KEY (`reg_pes_matricula`) REFERENCES `pessoa` (`pes_matricula`),
  CONSTRAINT `regras_de_acesso_ibfk_2` FOREIGN KEY (`reg_sal_id`) REFERENCES `sala` (`sal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regras_de_acesso`
--

LOCK TABLES `regras_de_acesso` WRITE;
/*!40000 ALTER TABLE `regras_de_acesso` DISABLE KEYS */;
/*!40000 ALTER TABLE `regras_de_acesso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8 */;
CREATE TABLE `sala` (
  `sal_id` int NOT NULL,
  `sal_nome` varchar(50) NOT NULL,
  `sal_id_adm` int NOT NULL,
  `sal_id_pred` int NOT NULL,
  PRIMARY KEY (`sal_id`),
  KEY `sal_id_pred` (`sal_id_pred`),
  CONSTRAINT `sala_ibfk_1` FOREIGN KEY (`sal_id_pred`) REFERENCES `predio` (`pred_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'se'
--

--
-- Dumping routines for database 'se'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-19 16:01:07
