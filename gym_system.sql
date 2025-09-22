CREATE DATABASE  IF NOT EXISTS `gym_system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym_system`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: gym_system
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Temporary view structure for view `active_memberships`
--

DROP TABLE IF EXISTS `active_memberships`;
/*!50001 DROP VIEW IF EXISTS `active_memberships`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `active_memberships` AS SELECT 
 1 AS `member_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `membership_type`,
 1 AS `start_date`,
 1 AS `end_date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `class_id` int NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `trainer_id` int DEFAULT NULL,
  `class_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `unique_class` (`class_name`),
  KEY `idx_class_trainer` (`trainer_id`),
  CONSTRAINT `fk_class_trainer` FOREIGN KEY (`trainer_id`) REFERENCES `trainers` (`trainer_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `chk_class_time` CHECK ((`end_time` > `start_time`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`class_id`, `class_name`, `trainer_id`, `class_date`, `start_time`, `end_time`) VALUES (1,'yoga_flow',2,'2025-09-12','08:00:00','09:00:00'),(2,'hiit_training',3,'2025-09-13','09:30:00','10:30:00'),(3,'pilates',2,'2025-09-14','10:00:00','11:30:00'),(4,'boxing',3,'2025-09-15','06:00:00','07:30:00'),(5,'spinning',3,'2025-09-16','04:00:00','05:00:00'),(6,'zumba',4,'2025-09-17','03:30:00','04:45:00'),(7,'boot_camp',5,'2025-09-18','06:00:00','07:30:00'),(8,'cross_fit',1,'2025-09-21','09:00:00','10:00:00'),(9,'dance_fitness',4,'2025-09-22','08:00:00','09:15:00'),(10,'step_aerobics',4,'2025-09-23','08:00:00','09:45:00'),(11,'strength_training',1,'2025-09-23','10:00:00','10:45:00'),(12,'body_pump',1,'2025-09-26','10:30:00','12:00:00'),(13,'circuit_training',5,'2025-09-27','11:00:00','12:30:00'),(14,'power_yoga',2,'2025-09-28','10:00:00','11:30:00'),(15,'trx_suspension_training',5,'2025-09-30','11:00:00','12:30:00'),(501,'Morning Yoga',11,'2025-10-01','08:00:00','09:00:00');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `member_contacts`
--

DROP TABLE IF EXISTS `member_contacts`;
/*!50001 DROP VIEW IF EXISTS `member_contacts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `member_contacts` AS SELECT 
 1 AS `member_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `phone_number`,
 1 AS `address`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `join_date` date NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE KEY `unique_phone_number` (`phone_number`),
  UNIQUE KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`member_id`, `first_name`, `last_name`, `phone_number`, `join_date`, `address`) VALUES (1,'Karim','Haddad','76123456','2025-09-01','Beirut, Hamra'),(2,'Maya','Nasr','70111222','2025-09-03','Beirut, Achrafieh'),(3,'Fadi','Salameh','71333444','2025-09-05','Tripoli, Mina'),(4,'Nour','Khoury','76155666','2025-09-07','Byblos, Old Souk'),(5,'Jad','Abou Khalil','78997788','2025-09-09','Saida, Riad El Solh'),(6,'Rita','Chami','71555222','2025-09-11','Zahle, Ksara'),(7,'Omar','Itani','76991122','2025-09-13','Beirut, Tariq El Jdideh'),(8,'Elie','Mansour','70664455','2025-09-15','Batroun, Sea Road'),(9,'Layal','Fakhoury','71122334','2025-09-17','Beirut, Verdun'),(10,'Samir','Barakat','76551234','2025-09-19','Tyre, Corniche'),(11,'Hiba','Darwish','70889977','2025-09-21','Beirut, Mar Elias'),(12,'Michel','Sleiman','76444555','2025-09-23','Jounieh, Kaslik'),(13,'Yara','Azar','71717171','2025-09-25','Beirut, Gemmayzeh'),(14,'Rami','Ghannam','76889900','2025-09-27','Aley, Main Street'),(15,'Dana','Karam','70992211','2025-09-29','Tripoli, Abou Samra'),(101,'Karim','Haddad','03012345','2025-09-19','Beirut');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_member_delete` AFTER DELETE ON `members` FOR EACH ROW INSERT INTO members_archive (member_id, first_name, last_name, phone_number, join_date, address)
VALUES (OLD.member_id, OLD.first_name, OLD.last_name, OLD.phone_number, OLD.join_date, OLD.address) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `memberships`
--

DROP TABLE IF EXISTS `memberships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberships` (
  `member_id` int NOT NULL,
  `membership_type` varchar(50) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`member_id`),
  KEY `idx_membership_member` (`member_id`),
  CONSTRAINT `fk_membership_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_membership_dates` CHECK ((`end_date` >= `start_date`)),
  CONSTRAINT `chk_price` CHECK ((`price` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberships`
--

LOCK TABLES `memberships` WRITE;
/*!40000 ALTER TABLE `memberships` DISABLE KEYS */;
INSERT INTO `memberships` (`member_id`, `membership_type`, `start_date`, `end_date`, `price`) VALUES (1,'Basic','2025-09-01','2025-09-30',50.00),(2,'Standard','2025-09-03','2025-10-03',75.00),(3,'Premium','2025-09-05','2025-10-05',100.00),(4,'Basic','2025-09-07','2025-10-07',50.00),(5,'Standard','2025-09-09','2025-10-09',75.00),(6,'Premium','2025-09-11','2025-10-11',100.00),(7,'Basic','2025-09-13','2025-10-13',50.00),(8,'Standard','2025-09-15','2025-10-15',75.00),(9,'Premium','2025-09-17','2025-10-17',100.00),(10,'Basic','2025-09-19','2025-10-19',50.00),(11,'Standard','2025-09-21','2025-10-21',75.00),(12,'Premium','2025-09-23','2025-10-23',100.00),(13,'Basic','2025-09-25','2025-10-25',50.00),(14,'Standard','2025-09-27','2025-10-27',75.00),(15,'Premium','2025-09-29','2025-10-29',100.00);
/*!40000 ALTER TABLE `memberships` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_membership_insert` AFTER INSERT ON `memberships` FOR EACH ROW INSERT INTO payments (member_id, amount, payment_date, paymen_method)
VALUES (NEW.member_id, NEW.price, CURDATE(), 'Pending') */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `monthly_revenue`
--

DROP TABLE IF EXISTS `monthly_revenue`;
/*!50001 DROP VIEW IF EXISTS `monthly_revenue`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthly_revenue` AS SELECT 
 1 AS `year`,
 1 AS `month`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(30) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_payment_member` (`member_id`),
  CONSTRAINT `fk_payment_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`),
  CONSTRAINT `chk_amount` CHECK ((`amount` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` (`payment_id`, `member_id`, `amount`, `payment_date`, `payment_method`) VALUES (1,1,50.00,'2025-09-01','Cash'),(2,2,60.00,'2025-09-03','Card'),(3,3,45.00,'2025-09-05','Cash'),(4,4,55.00,'2025-09-07','Card'),(5,5,70.00,'2025-09-09','Bank Transfer'),(6,6,50.00,'2025-09-11','Cash'),(7,7,65.00,'2025-09-13','Card'),(8,8,50.00,'2025-09-15','Cash'),(9,9,60.00,'2025-09-17','Card'),(10,10,55.00,'2025-09-19','Bank Transfer'),(11,11,50.00,'2025-09-21','Cash'),(12,12,70.00,'2025-09-23','Card'),(13,13,45.00,'2025-09-25','Cash'),(14,14,60.00,'2025-09-27','Card'),(15,15,55.00,'2025-09-29','Cash');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `payments_summary`
--

DROP TABLE IF EXISTS `payments_summary`;
/*!50001 DROP VIEW IF EXISTS `payments_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `payments_summary` AS SELECT 
 1 AS `member_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `total_paid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `revenue_by_membership`
--

DROP TABLE IF EXISTS `revenue_by_membership`;
/*!50001 DROP VIEW IF EXISTS `revenue_by_membership`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `revenue_by_membership` AS SELECT 
 1 AS `membership_type`,
 1 AS `total_revenue`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainers` (
  `trainer_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `speciality` varchar(50) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`trainer_id`),
  UNIQUE KEY `unique_email` (`email`),
  UNIQUE KEY `unique_phone` (`phone`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` (`trainer_id`, `first_name`, `last_name`, `speciality`, `phone`, `email`) VALUES (1,'Ali','Haddad','Strength Training','76123410','ali.haddad@gmail.com'),(2,'Nadia','Sleiman','Yoga','70111211','nadia.sleiman@yahoo.com'),(3,'Fadi','Barakat','Cardio','71333412','fadi.barakat@hotmail.com'),(4,'Rita','Khoury','CrossFit','76155613','rita.khoury@gmail.com'),(5,'Omar','Mansour','Strength Training','78997714','omar.mansour@gmail.com'),(6,'Maya','Darwish','Pilates','71555215','maya.darwish@gmail.com'),(7,'Jad','Azar','Cardio','76991116','jad.azar@yahoo.com'),(8,'Elie','Fakhoury','Yoga','70664417','elie.fakhoury@gmail.com'),(9,'Layal','Karam','CrossFit','71122318','layal.karam@hotmail.com'),(10,'Samir','Ghannam','Strength Training','76551219','samir.ghannam@gmail.com'),(11,'Rami','Saleh','Yoga','03098765','rami@fitness.com');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gym_system'
--

--
-- Dumping routines for database 'gym_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_payment`(
    IN p_member_id INT,
    IN p_amount DECIMAL(10,2),
    IN p_payment_date DATE,
    IN p_method VARCHAR(20)
)
BEGIN
   INSERT INTO payments (member_id, amount, payment_date, payment_method)
   VALUES (p_member_id, p_amount, p_payment_date, p_method);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_active_members` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_active_members`()
BEGIN
   SELECT m.member_id, m.first_name, m.last_name,
          ms.membership_type, ms.start_date, ms.end_date
   FROM members m
   JOIN memberships ms ON m.member_id = ms.member_id
   WHERE CURDATE() BETWEEN ms.start_date AND ms.end_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `revenue_by_type` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `revenue_by_type`()
BEGIN
   SELECT ms.membership_type, SUM(p.amount) AS total_revenue
   FROM memberships ms
   JOIN payments p ON ms.member_id = p.member_id
   GROUP BY ms.membership_type;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `active_memberships`
--

/*!50001 DROP VIEW IF EXISTS `active_memberships`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `active_memberships` AS select `m`.`member_id` AS `member_id`,`m`.`first_name` AS `first_name`,`m`.`last_name` AS `last_name`,`ms`.`membership_type` AS `membership_type`,`ms`.`start_date` AS `start_date`,`ms`.`end_date` AS `end_date` from (`members` `m` join `memberships` `ms` on((`m`.`member_id` = `ms`.`member_id`))) where (curdate() between `ms`.`start_date` and `ms`.`end_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_contacts`
--

/*!50001 DROP VIEW IF EXISTS `member_contacts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_contacts` AS select `members`.`member_id` AS `member_id`,`members`.`first_name` AS `first_name`,`members`.`last_name` AS `last_name`,`members`.`phone_number` AS `phone_number`,`members`.`address` AS `address` from `members` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_revenue`
--

/*!50001 DROP VIEW IF EXISTS `monthly_revenue`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_revenue` AS select year(`payments`.`payment_date`) AS `year`,month(`payments`.`payment_date`) AS `month`,sum(`payments`.`amount`) AS `total_revenue` from `payments` group by year(`payments`.`payment_date`),month(`payments`.`payment_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `payments_summary`
--

/*!50001 DROP VIEW IF EXISTS `payments_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `payments_summary` AS select `m`.`member_id` AS `member_id`,`m`.`first_name` AS `first_name`,`m`.`last_name` AS `last_name`,sum(`p`.`amount`) AS `total_paid` from (`members` `m` join `payments` `p` on((`m`.`member_id` = `p`.`member_id`))) group by `m`.`member_id`,`m`.`first_name`,`m`.`last_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `revenue_by_membership`
--

/*!50001 DROP VIEW IF EXISTS `revenue_by_membership`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `revenue_by_membership` AS select `ms`.`membership_type` AS `membership_type`,sum(`p`.`amount`) AS `total_revenue` from (`memberships` `ms` join `payments` `p` on((`ms`.`member_id` = `p`.`member_id`))) group by `ms`.`membership_type` */;
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

-- Dump completed on 2025-09-20 16:55:53
