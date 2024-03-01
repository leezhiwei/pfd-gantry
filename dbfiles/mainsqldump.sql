-- MySQL dump 10.19  Distrib 10.3.39-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: DataCollection_1
-- ------------------------------------------------------
-- Server version	10.3.39-MariaDB-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `average time in`
--

DROP TABLE IF EXISTS `average time in`;
/*!50001 DROP VIEW IF EXISTS `average time in`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `average time in` AS SELECT
 1 AS `AVG Time In` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `average time out`
--

DROP TABLE IF EXISTS `average time out`;
/*!50001 DROP VIEW IF EXISTS `average time out`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `average time out` AS SELECT
 1 AS `AVG Time Out` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(50) NOT NULL,
  `ShiftID` int(11) NOT NULL,
  `RfidID` bigint(20) DEFAULT NULL,
  `FaceID` int(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`),
  UNIQUE KEY `FaceID` (`FaceID`),
  UNIQUE KEY `RfidID` (`RfidID`),
  KEY `FK_Employee_ShiftID` (`ShiftID`),
  CONSTRAINT `FK_Employee_ShiftID` FOREIGN KEY (`ShiftID`) REFERENCES `shift` (`ShiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Zarah Wilne',2,1284551071830932,1),(2,'Lorna Romanini',2,2,2),(3,'Cob Milson',1,3,3),(4,'Basil Morot',2,4,4),(5,'Dal O\'Hara',2,5,5),(6,'Milli Newbury',2,6,6),(7,'Kipper Yule',1,7,7),(8,'Aubrey Mebius',2,8,8),(9,'Stevie Camden',3,9,9),(10,'Ephrem Lougheed',2,10,10),(11,'Hermione Adrianello',2,11,11),(12,'Rubin Lanaway',1,12,12),(13,'Waldo McCorkell',3,13,13),(14,'Madelle Raper',2,14,14),(15,'Rabbi Aldin',1,15,15),(16,'Berni Clow',3,16,16),(17,'Elianora Mant',1,17,17),(18,'Shanon Wathey',1,18,18),(19,'Ethel Haccleton',2,19,19),(20,'Griff Tweedlie',1,20,20),(21,'Mozelle Jeaneau',1,21,21),(22,'Misti Abramino',2,22,22),(23,'Angelico Slessar',3,23,23),(24,'Viviene McGlade',2,24,24),(25,'Izaak Jillins',3,25,25),(26,'Maggi Goodnow',1,26,26),(27,'Gretel Dilkes',2,27,27),(28,'Tatum Jahnisch',1,28,28),(29,'Kariotta Kimbley',1,29,29),(30,'Emyle Cadge',2,30,30),(31,'Binny Proudman',3,31,31),(32,'Hermie Mioni',1,32,32),(33,'Lilyan Jurewicz',3,33,33),(34,'Sidoney Lovatt',3,34,34),(35,'Shell Romaines',2,35,35),(36,'Prissie Nussen',2,36,36),(37,'Colet Bramsom',1,37,37),(38,'Selia Pitrelli',2,38,38),(39,'Marylee Adaway',1,39,39),(40,'Timothy Graine',1,40,40),(41,'Malina Obray',1,41,41),(42,'Eden Fewkes',3,42,42),(43,'Marcellus Warton',3,43,43),(44,'Kori Grewes',3,44,44),(45,'Ethyl Kmicicki',1,45,45),(46,'Wernher Babar',2,46,46),(47,'Noellyn Bellee',3,47,47),(48,'Elmer Towson',2,48,48),(49,'Torrin Clemmow',3,49,49),(50,'Elsworth Wass',3,50,50),(52,'Test Subject',1,56,56);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `CountID` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) DEFAULT NULL,
  `Username` varchar(100) DEFAULT NULL,
  `PassHash` varchar(500) NOT NULL,
  PRIMARY KEY (`CountID`),
  UNIQUE KEY `PassHash` (`PassHash`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Username` (`Username`),
  CONSTRAINT `EmailOrUsernameNotNull` CHECK (`Username` is not null or `Email` is not null)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,NULL,'Lee8219','76324164972059e037653063b91a01e5050335a23ca89a656c4a2e02d0c3f470f64abb0ef2b6d347d9d759aaba573f0eef74e3345a4f0cc28d8a440581b39a7a'),(2,'zhiweilee.com@gmail.com',NULL,'ee3d849481e3cec60757630fc31c8376a6f3523b8ff5a960d1ec85a9d1ae0036b4e482b742f811d207f6fc733ad1c0d8c6e64324c4e72d436c16deff2d70ebeb'),(3,'lzwlzwlzwhe@gmail.com','SecondAdmin','0d8395f15e96cf3f63eb0009e162232c093b91da230db3ed16f6df06491f4d5ad013c4acf37e85e25976239d2e3d33939515ada295b2fab2a90c30eb65e5aad3');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `record`
--

DROP TABLE IF EXISTS `record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `record` (
  `RecordID` int(11) NOT NULL AUTO_INCREMENT,
  `EmployeeID` int(11) NOT NULL,
  `TimeIn` datetime DEFAULT NULL,
  `TimeOut` datetime DEFAULT NULL,
  PRIMARY KEY (`RecordID`),
  KEY `FK_Record_EmployeeID` (`EmployeeID`),
  CONSTRAINT `FK_Record_EmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `record`
--

LOCK TABLES `record` WRITE;
/*!40000 ALTER TABLE `record` DISABLE KEYS */;
INSERT INTO `record` VALUES (1,45,'2023-10-08 15:43:22','2023-08-18 05:20:59'),(2,41,'2023-05-01 05:51:12','2023-06-13 11:08:42'),(3,43,'2023-10-28 17:01:28','2023-01-08 23:42:15'),(4,48,'2023-07-05 07:00:28','2023-02-20 11:57:52'),(5,22,'2023-09-05 18:24:35','2023-02-13 08:25:48'),(6,16,'2023-03-19 06:12:06','2023-09-18 13:29:06'),(7,49,'2023-08-10 06:29:17','2023-06-09 06:11:00'),(8,5,'2023-05-01 23:46:54','2023-06-29 23:10:02'),(9,29,'2023-02-18 23:15:45','2022-12-29 05:03:58'),(10,46,'2022-12-11 13:23:11','2023-07-28 21:39:31'),(11,30,'2022-11-25 04:44:15','2022-11-19 21:58:25'),(12,39,'2023-07-05 13:03:54','2023-05-03 12:52:41'),(13,7,'2022-11-22 07:49:00','2023-08-21 09:41:13'),(14,22,'2023-08-06 23:58:27','2023-06-02 15:07:00'),(15,7,'2023-10-29 18:05:53','2022-11-19 00:26:37'),(16,36,'2023-09-29 02:21:38','2023-11-04 01:47:12'),(17,41,'2023-05-19 10:48:20','2023-09-10 17:00:24'),(18,3,'2023-04-26 18:26:27','2023-04-06 01:32:18'),(19,4,'2023-05-13 10:36:46','2023-02-06 15:25:26'),(20,13,'2023-09-10 04:21:28','2023-07-07 10:13:59'),(21,8,'2022-11-25 03:48:44','2023-01-30 02:20:24'),(22,3,'2023-04-18 08:00:58','2023-09-27 14:18:30'),(23,6,'2023-08-23 02:12:44','2023-05-04 16:49:22'),(24,29,'2023-01-09 17:04:54','2023-07-02 03:52:09'),(25,27,'2023-11-01 03:48:43','2023-08-27 07:30:31'),(26,23,'2022-11-22 06:01:39','2023-09-19 03:52:41'),(27,27,'2023-05-09 16:30:29','2023-11-08 04:55:57'),(28,45,'2023-05-19 12:17:30','2023-07-26 08:36:07'),(29,34,'2023-01-24 05:41:22','2022-12-19 14:55:15'),(30,21,'2023-06-18 15:30:27','2023-10-21 21:55:03'),(31,47,'2023-08-28 06:00:11','2023-08-05 22:11:38'),(32,14,'2023-10-26 01:16:24','2023-05-31 15:48:53'),(33,24,'2023-08-30 01:19:45','2023-09-26 09:25:22'),(34,23,'2023-10-11 10:02:33','2023-08-25 23:42:21'),(35,44,'2023-04-23 17:47:53','2023-05-23 13:50:54'),(36,7,'2022-11-30 03:22:42','2023-07-28 02:43:15'),(37,36,'2023-11-03 12:31:54','2023-08-27 17:18:53'),(38,6,'2023-06-15 05:14:04','2023-04-07 16:08:51'),(39,35,'2023-05-16 09:14:40','2023-08-17 04:53:22'),(40,22,'2023-08-31 12:12:21','2023-04-13 21:18:23'),(41,41,'2023-04-04 10:37:31','2023-04-19 16:24:48'),(42,32,'2022-12-06 08:56:34','2023-01-21 16:49:51'),(43,49,'2023-06-21 00:53:49','2022-12-11 13:24:14'),(44,6,'2023-09-19 01:00:54','2022-12-18 23:05:37'),(45,12,'2023-09-02 02:32:50','2023-08-30 05:35:32'),(46,33,'2023-05-02 01:23:53','2022-11-18 14:30:12'),(47,38,'2023-06-14 16:07:01','2022-12-25 01:16:32'),(48,29,'2023-06-09 17:05:57','2023-03-29 21:34:52'),(49,50,'2022-12-30 08:07:52','2022-12-01 13:07:10'),(50,9,'2023-01-08 09:10:19','2023-01-17 15:48:08'),(51,10,'2022-11-25 01:17:16','2022-11-30 07:11:18'),(52,36,'2023-04-25 05:49:59','2022-12-08 14:23:48'),(53,10,'2023-05-19 22:52:02','2023-04-23 16:25:12'),(54,29,'2023-08-02 03:56:19','2023-02-27 22:44:15'),(55,44,'2023-06-22 02:57:44','2023-04-08 22:21:33'),(56,20,'2023-01-03 22:12:59','2023-10-29 10:55:00'),(57,46,'2023-01-03 19:53:08','2023-11-01 20:06:28'),(58,40,'2023-01-28 03:33:50','2023-06-10 20:27:18'),(59,25,'2023-03-03 01:30:14','2022-12-29 13:39:49'),(60,35,'2023-07-30 20:35:45','2023-10-17 11:28:47'),(61,9,'2023-03-26 06:56:27','2023-09-07 16:29:34'),(62,31,'2022-11-19 21:01:57','2023-04-26 18:07:21'),(63,4,'2023-02-18 09:06:33','2023-07-03 00:34:02'),(64,33,'2023-04-24 06:57:14','2023-10-19 22:03:36'),(65,36,'2023-04-20 23:41:11','2022-12-29 03:09:07'),(66,35,'2023-06-28 08:04:39','2022-12-07 13:05:07'),(67,30,'2022-12-10 19:31:40','2023-09-21 04:44:44'),(68,12,'2023-09-27 21:20:17','2023-03-19 16:51:25'),(69,36,'2023-09-27 08:32:47','2023-05-18 11:14:13'),(70,19,'2023-02-19 20:41:23','2023-05-31 00:07:09'),(71,1,'2024-01-29 13:39:41',NULL),(72,1,NULL,'2024-01-29 15:24:03'),(73,1,'2024-01-29 15:24:25',NULL),(74,1,NULL,'2024-02-04 04:15:06'),(75,1,'2024-02-04 04:15:28',NULL),(76,1,NULL,'2024-02-04 04:20:59'),(77,1,'2024-02-04 04:22:14',NULL),(78,1,NULL,'2024-02-04 04:22:34'),(79,1,'2024-02-04 04:25:54',NULL),(80,1,NULL,'2024-02-04 04:26:14'),(81,1,'2024-02-05 12:35:52',NULL),(82,1,NULL,'2024-02-05 13:05:46'),(83,1,'2024-02-05 14:32:36',NULL),(84,1,NULL,'2024-02-05 14:33:27');
/*!40000 ALTER TABLE `record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shift` (
  `ShiftID` int(11) NOT NULL AUTO_INCREMENT,
  `ShiftIn` time NOT NULL,
  `ShiftOut` time NOT NULL,
  PRIMARY KEY (`ShiftID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES (1,'08:29:00','17:50:00'),(2,'08:04:00','17:18:00'),(3,'08:00:00','17:12:00'),(6,'05:28:00','22:33:00');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timenumbersdummy`
--

DROP TABLE IF EXISTS `timenumbersdummy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timenumbersdummy` (
  `ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timenumbersdummy`
--

LOCK TABLES `timenumbersdummy` WRITE;
/*!40000 ALTER TABLE `timenumbersdummy` DISABLE KEYS */;
INSERT INTO `timenumbersdummy` VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12),(13),(14),(15),(16),(17),(18),(19),(20),(21),(22),(23),(24),(25),(26),(27),(28),(29),(30),(31),(32),(33),(34),(35),(36),(37),(38),(39),(40),(41),(42),(43),(44),(45),(46),(47),(48),(49),(50),(51),(52),(53),(54),(55),(56),(57),(58),(59),(60),(61),(62),(63),(64),(65),(66);
/*!40000 ALTER TABLE `timenumbersdummy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `average time in`
--

/*!50001 DROP VIEW IF EXISTS `average time in`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average time in` AS select from_unixtime(avg(unix_timestamp(`record`.`TimeOut`))) AS `AVG Time In` from `record` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `average time out`
--

/*!50001 DROP VIEW IF EXISTS `average time out`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `average time out` AS select from_unixtime(avg(unix_timestamp(`record`.`TimeOut`))) AS `AVG Time Out` from `record` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01 15:35:46
