-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: kamiwaza
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street` varchar(30) COLLATE utf8mb4_czech_ci NOT NULL,
  `registry_number` varchar(15) COLLATE utf8mb4_czech_ci NOT NULL,
  `house_number` varchar(15) COLLATE utf8mb4_czech_ci NOT NULL,
  `city` varchar(30) COLLATE utf8mb4_czech_ci NOT NULL,
  `zip` varchar(10) COLLATE utf8mb4_czech_ci NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `address_FK` (`country_id`),
  CONSTRAINT `address_FK` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `area_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `title_short` varchar(4) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_czech_ci NOT NULL,
  `ic_number` varchar(10) COLLATE utf8mb4_czech_ci NOT NULL,
  `bank_code` varchar(4) COLLATE utf8mb4_czech_ci NOT NULL,
  `account_number` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_address`
--

DROP TABLE IF EXISTS `company_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_address` (
  `company_id` int NOT NULL,
  `address_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`company_id`,`address_id`),
  KEY `company_address_FK` (`address_id`),
  CONSTRAINT `company_address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `company_address_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_address`
--

LOCK TABLES `company_address` WRITE;
/*!40000 ALTER TABLE `company_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `company_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `hidden` tinyint NOT NULL DEFAULT '0',
  `restricted` int DEFAULT NULL,
  `faq` enum('karate','volejbal','street') COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `company_id` int NOT NULL,
  `area_id` int NOT NULL,
  `sport_id` int NOT NULL,
  `s_year_id` int NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `course_FK` (`area_id`),
  KEY `course_FK_1` (`company_id`),
  KEY `course_FK_2` (`sport_id`),
  KEY `course_FK_3` (`s_year_id`),
  CONSTRAINT `course_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  CONSTRAINT `course_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `course_FK_2` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`),
  CONSTRAINT `course_FK_3` FOREIGN KEY (`s_year_id`) REFERENCES `s_year` (`s_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_payment_group`
--

DROP TABLE IF EXISTS `course_payment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_payment_group` (
  `course_payment_group_id` int NOT NULL AUTO_INCREMENT,
  `course_id` int NOT NULL,
  `payment_group_id` int NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  PRIMARY KEY (`course_payment_group_id`),
  KEY `course_payment_group_FK` (`course_id`),
  KEY `course_payment_group_FK_1` (`payment_group_id`),
  CONSTRAINT `course_payment_group_FK` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_payment_group_FK_1` FOREIGN KEY (`payment_group_id`) REFERENCES `payment_group` (`payment_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_payment_group`
--

LOCK TABLES `course_payment_group` WRITE;
/*!40000 ALTER TABLE `course_payment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_payment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_training`
--

DROP TABLE IF EXISTS `course_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_training` (
  `course_id` int NOT NULL,
  `training_id` int NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`course_id`,`training_id`),
  KEY `course_training_FK_1` (`training_id`),
  CONSTRAINT `course_training_FK` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `course_training_FK_1` FOREIGN KEY (`training_id`) REFERENCES `training` (`training_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_training`
--

LOCK TABLES `course_training` WRITE;
/*!40000 ALTER TABLE `course_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_order`
--

DROP TABLE IF EXISTS `e_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_order` (
  `e_order_id` int NOT NULL AUTO_INCREMENT,
  `e_order_uid` bigint NOT NULL,
  `e_order_link` char(32) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cost` int NOT NULL DEFAULT '0',
  `due_date` date NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `status` enum('created','completed','accepted','suspended','canceled','hidden') COLLATE utf8mb4_czech_ci NOT NULL,
  `comment` varchar(500) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `returned` tinyint(1) NOT NULL DEFAULT '0',
  `returned_amount` int DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `edited` datetime DEFAULT NULL,
  `edited_by` int DEFAULT NULL,
  `person_id` int DEFAULT NULL,
  `person_detail_id` int DEFAULT NULL,
  `specific_symbol_id` int DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `payment_type_id` int DEFAULT NULL,
  `payment_group_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `karate_stamp_id` int DEFAULT NULL,
  `p_order_id` int DEFAULT NULL,
  `payment_id` int DEFAULT NULL,
  PRIMARY KEY (`e_order_id`),
  KEY `e_order_FK` (`address_id`),
  KEY `e_order_FK_1` (`company_id`),
  KEY `e_order_FK_2` (`course_id`),
  KEY `e_order_FK_3` (`payment_id`),
  KEY `e_order_FK_4` (`payment_group_id`),
  KEY `e_order_FK_5` (`payment_type_id`),
  KEY `e_order_FK_6` (`person_id`),
  KEY `e_order_FK_7` (`person_detail_id`),
  KEY `e_order_FK_8` (`created_by`),
  KEY `e_order_FK_9` (`edited_by`),
  KEY `e_order_FK_10` (`event_id`),
  KEY `e_order_FK_11` (`p_order_id`),
  KEY `e_order_FK_12` (`karate_stamp_id`),
  CONSTRAINT `e_order_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `e_order_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `e_order_FK_10` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `e_order_FK_11` FOREIGN KEY (`p_order_id`) REFERENCES `p_order` (`p_order_id`),
  CONSTRAINT `e_order_FK_12` FOREIGN KEY (`karate_stamp_id`) REFERENCES `karate_stamp` (`karate_stamp_id`),
  CONSTRAINT `e_order_FK_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `e_order_FK_3` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`),
  CONSTRAINT `e_order_FK_4` FOREIGN KEY (`payment_group_id`) REFERENCES `payment_group` (`payment_group_id`),
  CONSTRAINT `e_order_FK_5` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`),
  CONSTRAINT `e_order_FK_6` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `e_order_FK_7` FOREIGN KEY (`person_detail_id`) REFERENCES `person_detail` (`person_detail_id`),
  CONSTRAINT `e_order_FK_8` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `e_order_FK_9` FOREIGN KEY (`edited_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_order`
--

LOCK TABLES `e_order` WRITE;
/*!40000 ALTER TABLE `e_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `e_order_incoming_payment`
--

DROP TABLE IF EXISTS `e_order_incoming_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `e_order_incoming_payment` (
  `e_order_incoming_payment_id` int NOT NULL AUTO_INCREMENT,
  `e_order_id` int NOT NULL,
  `incoming_payment_id` int NOT NULL,
  `assigned` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `assigned_by` varchar(10) COLLATE utf8mb4_czech_ci DEFAULT 'system',
  PRIMARY KEY (`e_order_incoming_payment_id`),
  KEY `e_order_incoming_payment_FK` (`e_order_id`),
  KEY `e_order_incoming_payment_FK_1` (`incoming_payment_id`),
  CONSTRAINT `e_order_incoming_payment_FK` FOREIGN KEY (`e_order_id`) REFERENCES `e_order` (`e_order_id`),
  CONSTRAINT `e_order_incoming_payment_FK_1` FOREIGN KEY (`incoming_payment_id`) REFERENCES `incoming_payment` (`incoming_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `e_order_incoming_payment`
--

LOCK TABLES `e_order_incoming_payment` WRITE;
/*!40000 ALTER TABLE `e_order_incoming_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `e_order_incoming_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `event_id` int NOT NULL AUTO_INCREMENT,
  `designated_for` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `description_detailed` text COLLATE utf8mb4_czech_ci,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `place` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `day_selection` tinyint(1) NOT NULL DEFAULT '0',
  `payment_option` enum('free','cash','e_order','e_order_hidden') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'e_order',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `capacity` int DEFAULT NULL,
  `event_type_id` int NOT NULL,
  `sport_id` int NOT NULL,
  `address_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `s_year_id` int DEFAULT NULL,
  `public_from` datetime DEFAULT NULL,
  `public_to` datetime DEFAULT NULL,
  `send_confirmation` tinyint(1) NOT NULL DEFAULT '0',
  `confirmation_content` text COLLATE utf8mb4_czech_ci,
  `restricted` int DEFAULT NULL,
  `requires_karate_stamp` tinyint(1) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_FK` (`address_id`),
  KEY `event_FK_1` (`company_id`),
  KEY `event_FK_2` (`s_year_id`),
  KEY `event_FK_3` (`sport_id`),
  KEY `event_FK_4` (`event_type_id`),
  CONSTRAINT `event_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `event_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `event_FK_2` FOREIGN KEY (`s_year_id`) REFERENCES `s_year` (`s_year_id`),
  CONSTRAINT `event_FK_3` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`),
  CONSTRAINT `event_FK_4` FOREIGN KEY (`event_type_id`) REFERENCES `event_type` (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_option`
--

DROP TABLE IF EXISTS `event_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_option` (
  `event_option_id` int NOT NULL AUTO_INCREMENT,
  `event_option_type_id` int DEFAULT NULL,
  `option_day` date DEFAULT NULL,
  `event_id` int DEFAULT NULL,
  `data_attribute` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cost_per_day` int NOT NULL DEFAULT '0',
  `day_capacity` int NOT NULL DEFAULT '20',
  `karate_grade_id` int DEFAULT NULL,
  PRIMARY KEY (`event_option_id`),
  KEY `event_option_FK` (`karate_grade_id`),
  KEY `event_option_FK_1` (`event_id`),
  KEY `event_option_FK_2` (`event_option_type_id`),
  CONSTRAINT `event_option_FK` FOREIGN KEY (`karate_grade_id`) REFERENCES `karate_grade` (`karate_grade_id`),
  CONSTRAINT `event_option_FK_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `event_option_FK_2` FOREIGN KEY (`event_option_type_id`) REFERENCES `event_option_type` (`event_option_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_option`
--

LOCK TABLES `event_option` WRITE;
/*!40000 ALTER TABLE `event_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_option_type`
--

DROP TABLE IF EXISTS `event_option_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_option_type` (
  `event_option_type_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`event_option_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_option_type`
--

LOCK TABLES `event_option_type` WRITE;
/*!40000 ALTER TABLE `event_option_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_option_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_payment_group`
--

DROP TABLE IF EXISTS `event_payment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_payment_group` (
  `event_payment_group_id` int NOT NULL AUTO_INCREMENT,
  `event_id` int NOT NULL,
  `payment_group_id` int NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`event_payment_group_id`),
  KEY `event_payment_group_FK` (`event_id`),
  KEY `event_payment_group_FK_1` (`payment_group_id`),
  CONSTRAINT `event_payment_group_FK` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`),
  CONSTRAINT `event_payment_group_FK_1` FOREIGN KEY (`payment_group_id`) REFERENCES `payment_group` (`payment_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_payment_group`
--

LOCK TABLES `event_payment_group` WRITE;
/*!40000 ALTER TABLE `event_payment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_payment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_type`
--

DROP TABLE IF EXISTS `event_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_type` (
  `event_type_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `description` varchar(500) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_type`
--

LOCK TABLES `event_type` WRITE;
/*!40000 ALTER TABLE `event_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gdpr`
--

DROP TABLE IF EXISTS `gdpr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gdpr` (
  `gdpr_id` int NOT NULL AUTO_INCREMENT,
  `company_agreement` tinyint NOT NULL DEFAULT '0',
  `gdpr_agreement` tinyint NOT NULL DEFAULT '0',
  `ip_address` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`gdpr_id`),
  KEY `gdpr_FK` (`user_id`),
  KEY `gdpr_FK_1` (`company_id`),
  CONSTRAINT `gdpr_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `gdpr_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gdpr`
--

LOCK TABLES `gdpr` WRITE;
/*!40000 ALTER TABLE `gdpr` DISABLE KEYS */;
/*!40000 ALTER TABLE `gdpr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incoming_payment`
--

DROP TABLE IF EXISTS `incoming_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incoming_payment` (
  `incoming_payment_id` int NOT NULL AUTO_INCREMENT,
  `message_id` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `plain_body` text COLLATE utf8mb4_czech_ci,
  `variable_symbol` varchar(10) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `specific_symbol` varchar(10) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `from_account` varchar(25) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `pre_code` varchar(10) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `bank_account` varchar(25) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cost` int DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `assigned` enum('0','1') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT '0',
  `problematic` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL DEFAULT '0',
  `created_by` int NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `ignored` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`incoming_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incoming_payment`
--

LOCK TABLES `incoming_payment` WRITE;
/*!40000 ALTER TABLE `incoming_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `incoming_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karate_competition_registration`
--

DROP TABLE IF EXISTS `karate_competition_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karate_competition_registration` (
  `karate_competition_registration_id` int NOT NULL AUTO_INCREMENT,
  `person_event_id` int NOT NULL,
  `weight` decimal(10,0) DEFAULT NULL,
  `kumite1` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kumite2` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kumite3` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kumite4` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kata1` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kata2` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `kata3` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `belt_catching` tinyint(1) DEFAULT NULL,
  `begineer_agility` tinyint(1) DEFAULT NULL,
  `begineer_kihon` tinyint(1) DEFAULT NULL,
  `begineer_balloon` tinyint(1) DEFAULT NULL,
  `begineer_kata` tinyint(1) DEFAULT NULL,
  `karate_grade_id` int DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `notice` varchar(500) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`karate_competition_registration_id`),
  KEY `karate_competition_registration_FK` (`person_event_id`),
  KEY `karate_competition_registration_FK_1` (`karate_grade_id`),
  CONSTRAINT `karate_competition_registration_FK` FOREIGN KEY (`person_event_id`) REFERENCES `person_event` (`person_event_id`),
  CONSTRAINT `karate_competition_registration_FK_1` FOREIGN KEY (`karate_grade_id`) REFERENCES `karate_grade` (`karate_grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karate_competition_registration`
--

LOCK TABLES `karate_competition_registration` WRITE;
/*!40000 ALTER TABLE `karate_competition_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `karate_competition_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karate_grade`
--

DROP TABLE IF EXISTS `karate_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karate_grade` (
  `karate_grade_id` int NOT NULL AUTO_INCREMENT,
  `code_name` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `title` varchar(70) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `title_short` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `waiting_time` int DEFAULT NULL,
  `priority` int DEFAULT NULL,
  PRIMARY KEY (`karate_grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karate_grade`
--

LOCK TABLES `karate_grade` WRITE;
/*!40000 ALTER TABLE `karate_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `karate_grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karate_stamp`
--

DROP TABLE IF EXISTS `karate_stamp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karate_stamp` (
  `karate_stamp_id` int NOT NULL AUTO_INCREMENT,
  `cal_year` year DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `locked` tinyint(1) DEFAULT NULL,
  `karate_union_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`karate_stamp_id`),
  KEY `karate_stamp_FK` (`company_id`),
  KEY `karate_stamp_FK_1` (`karate_union_id`),
  CONSTRAINT `karate_stamp_FK` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `karate_stamp_FK_1` FOREIGN KEY (`karate_union_id`) REFERENCES `karate_union` (`karate_union_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karate_stamp`
--

LOCK TABLES `karate_stamp` WRITE;
/*!40000 ALTER TABLE `karate_stamp` DISABLE KEYS */;
/*!40000 ALTER TABLE `karate_stamp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karate_stamp_payment_group`
--

DROP TABLE IF EXISTS `karate_stamp_payment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karate_stamp_payment_group` (
  `karate_stamp_payment_group_id` int NOT NULL AUTO_INCREMENT,
  `karate_stamp_id` int NOT NULL,
  `payment_group_id` int NOT NULL,
  `hidden` int DEFAULT NULL,
  PRIMARY KEY (`karate_stamp_payment_group_id`),
  KEY `karate_stamp_payment_group_FK` (`karate_stamp_id`),
  KEY `karate_stamp_payment_group_FK_1` (`payment_group_id`),
  CONSTRAINT `karate_stamp_payment_group_FK` FOREIGN KEY (`karate_stamp_id`) REFERENCES `karate_stamp` (`karate_stamp_id`),
  CONSTRAINT `karate_stamp_payment_group_FK_1` FOREIGN KEY (`payment_group_id`) REFERENCES `payment_group` (`payment_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karate_stamp_payment_group`
--

LOCK TABLES `karate_stamp_payment_group` WRITE;
/*!40000 ALTER TABLE `karate_stamp_payment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `karate_stamp_payment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `karate_union`
--

DROP TABLE IF EXISTS `karate_union`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `karate_union` (
  `karate_union_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `name_short` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`karate_union_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `karate_union`
--

LOCK TABLES `karate_union` WRITE;
/*!40000 ALTER TABLE `karate_union` DISABLE KEYS */;
/*!40000 ALTER TABLE `karate_union` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `message` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `details` varchar(500) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `source` tinytext COLLATE utf8mb4_czech_ci NOT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `log_type_id` int NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `user_FK` (`user_id`),
  KEY `log_type_FK` (`log_type_id`),
  CONSTRAINT `log_type_FK` FOREIGN KEY (`log_type_id`) REFERENCES `log_type` (`log_type_id`),
  CONSTRAINT `user_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_type`
--

DROP TABLE IF EXISTS `log_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_type` (
  `log_type_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL,
  `level` int NOT NULL,
  PRIMARY KEY (`log_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_type`
--

LOCK TABLES `log_type` WRITE;
/*!40000 ALTER TABLE `log_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_order`
--

DROP TABLE IF EXISTS `p_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `p_order` (
  `p_order_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'waiting',
  `training_location_id` int NOT NULL,
  PRIMARY KEY (`p_order_id`),
  KEY `p_order_FK` (`person_id`),
  KEY `p_order_FK_1` (`training_location_id`),
  KEY `p_order_FK_2` (`created_by`),
  CONSTRAINT `p_order_FK` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `p_order_FK_1` FOREIGN KEY (`training_location_id`) REFERENCES `training_location` (`training_location_id`),
  CONSTRAINT `p_order_FK_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_order`
--

LOCK TABLES `p_order` WRITE;
/*!40000 ALTER TABLE `p_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `payment_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `cost` int NOT NULL,
  `priority` tinyint(1) NOT NULL DEFAULT '1',
  `latest_due_date` date NOT NULL,
  `paid_from` date NOT NULL,
  `paid_to` date NOT NULL,
  `paid_part_number` int NOT NULL,
  `paid_total_parts` int NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `company_id` int NOT NULL,
  `specific_symbol_id` int NOT NULL,
  `s_year_id` int NOT NULL,
  `payment_type_id` int NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `payment_FK` (`company_id`),
  KEY `payment_FK_1` (`payment_type_id`),
  KEY `payment_FK_2` (`s_year_id`),
  KEY `payment_FK_3` (`specific_symbol_id`),
  CONSTRAINT `payment_FK` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `payment_FK_1` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type` (`payment_type_id`),
  CONSTRAINT `payment_FK_2` FOREIGN KEY (`s_year_id`) REFERENCES `s_year` (`s_year_id`),
  CONSTRAINT `payment_FK_3` FOREIGN KEY (`specific_symbol_id`) REFERENCES `specific_symbol` (`specific_symbol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_discount`
--

DROP TABLE IF EXISTS `payment_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_discount` (
  `payment_discount_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `title` varchar(250) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_czech_ci NOT NULL,
  `amount_original` int NOT NULL,
  `amount_used` int NOT NULL DEFAULT '0',
  `company_id` int NOT NULL,
  `visibility` tinyint(1) NOT NULL,
  `active_from` datetime DEFAULT NULL,
  `active_to` datetime DEFAULT NULL,
  `rejected` tinyint(1) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`payment_discount_id`),
  KEY `payment_discount_FK` (`person_id`),
  KEY `payment_discount_FK_1` (`company_id`),
  KEY `payment_discount_FK_2` (`created_by`),
  CONSTRAINT `payment_discount_FK` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `payment_discount_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `payment_discount_FK_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_discount`
--

LOCK TABLES `payment_discount` WRITE;
/*!40000 ALTER TABLE `payment_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_group`
--

DROP TABLE IF EXISTS `payment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_group` (
  `payment_group_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci NOT NULL,
  `type` enum('full','partial') CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'full',
  `s_year_id` int NOT NULL,
  `priority` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_group_id`),
  KEY `payment_group_FK` (`s_year_id`),
  CONSTRAINT `payment_group_FK` FOREIGN KEY (`s_year_id`) REFERENCES `s_year` (`s_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_group`
--

LOCK TABLES `payment_group` WRITE;
/*!40000 ALTER TABLE `payment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_has_payment_group`
--

DROP TABLE IF EXISTS `payment_has_payment_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_has_payment_group` (
  `payment_has_payment_group_id` int NOT NULL AUTO_INCREMENT,
  `payment_id` int NOT NULL,
  `payment_group_id` int NOT NULL,
  PRIMARY KEY (`payment_has_payment_group_id`),
  KEY `payment_has_payment_group_FK` (`payment_id`),
  KEY `payment_has_payment_group_FK_1` (`payment_group_id`),
  CONSTRAINT `payment_has_payment_group_FK` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`),
  CONSTRAINT `payment_has_payment_group_FK_1` FOREIGN KEY (`payment_group_id`) REFERENCES `payment_group` (`payment_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_has_payment_group`
--

LOCK TABLES `payment_has_payment_group` WRITE;
/*!40000 ALTER TABLE `payment_has_payment_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_has_payment_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_type`
--

DROP TABLE IF EXISTS `payment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_type` (
  `payment_type_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_type`
--

LOCK TABLES `payment_type` WRITE;
/*!40000 ALTER TABLE `payment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `person_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_c_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `active` int NOT NULL DEFAULT '1',
  `validated` int NOT NULL,
  `validation_error` text CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci,
  `user_id` int NOT NULL,
  PRIMARY KEY (`person_id`),
  KEY `person_FK` (`user_id`),
  CONSTRAINT `person_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_address`
--

DROP TABLE IF EXISTS `person_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_address` (
  `person_id` int NOT NULL,
  `address_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`person_id`,`address_id`),
  KEY `person_address_FK` (`address_id`),
  CONSTRAINT `person_address_FK` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `person_address_FK_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_address`
--

LOCK TABLES `person_address` WRITE;
/*!40000 ALTER TABLE `person_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_course`
--

DROP TABLE IF EXISTS `person_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_course` (
  `person_course_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `course_id` int NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`person_course_id`),
  KEY `person_course_FK` (`course_id`),
  KEY `person_course_FK_1` (`person_id`),
  KEY `person_course_FK_2` (`created_by`),
  CONSTRAINT `person_course_FK` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  CONSTRAINT `person_course_FK_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_course_FK_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_course`
--

LOCK TABLES `person_course` WRITE;
/*!40000 ALTER TABLE `person_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_detail`
--

DROP TABLE IF EXISTS `person_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_detail` (
  `person_detail_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `birth_c_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `gender` enum('m','f') CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `citizenship` varchar(5) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `secondary_phone` varchar(20) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `secondary_email` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `school` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `comment` text COLLATE utf8mb4_czech_ci,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `company_id` int DEFAULT NULL,
  `person_id` int NOT NULL,
  PRIMARY KEY (`person_detail_id`),
  KEY `person_detail_FK` (`person_id`),
  KEY `person_detail_FK_1` (`created_by`),
  KEY `person_detail_FK_2` (`company_id`),
  CONSTRAINT `person_detail_FK` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_detail_FK_1` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `person_detail_FK_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_detail`
--

LOCK TABLES `person_detail` WRITE;
/*!40000 ALTER TABLE `person_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_event`
--

DROP TABLE IF EXISTS `person_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_event` (
  `person_event_id` int NOT NULL AUTO_INCREMENT,
  `person_id` int NOT NULL,
  `event_id` int NOT NULL,
  `status` enum('regular','waiting','canceled') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'regular',
  `paid` enum('unpaid','prepayment','complete','canceled','free','cash') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'unpaid',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`person_event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_event`
--

LOCK TABLES `person_event` WRITE;
/*!40000 ALTER TABLE `person_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_event_has_event_option`
--

DROP TABLE IF EXISTS `person_event_has_event_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_event_has_event_option` (
  `person_event_id` int NOT NULL,
  `event_option_id` int NOT NULL,
  `status` enum('regular','waiting','canceled','unselected') COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `selected` int DEFAULT NULL,
  PRIMARY KEY (`person_event_id`,`event_option_id`),
  KEY `person_event_has_event_option_FK_1` (`event_option_id`),
  CONSTRAINT `person_event_has_event_option_FK` FOREIGN KEY (`person_event_id`) REFERENCES `person_event` (`person_event_id`),
  CONSTRAINT `person_event_has_event_option_FK_1` FOREIGN KEY (`event_option_id`) REFERENCES `event_option` (`event_option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_event_has_event_option`
--

LOCK TABLES `person_event_has_event_option` WRITE;
/*!40000 ALTER TABLE `person_event_has_event_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_event_has_event_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_tag`
--

DROP TABLE IF EXISTS `person_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_tag` (
  `person_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int NOT NULL,
  PRIMARY KEY (`person_id`,`tag_id`),
  KEY `person_tag_FK` (`created_by`),
  KEY `person_tag_FK_1` (`tag_id`),
  CONSTRAINT `person_tag_FK` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`),
  CONSTRAINT `person_tag_FK_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`),
  CONSTRAINT `person_tag_FK_2` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_tag`
--

LOCK TABLES `person_tag` WRITE;
/*!40000 ALTER TABLE `person_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_training`
--

DROP TABLE IF EXISTS `person_training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person_training` (
  `person_id` int NOT NULL,
  `training_id` int NOT NULL,
  `paid_until` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `status` enum('regular','waiting','canceled') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'regular',
  PRIMARY KEY (`person_id`,`training_id`),
  KEY `person_training_FK_1` (`training_id`),
  KEY `person_training_FK_2` (`created_by`),
  CONSTRAINT `person_training_FK` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `person_training_FK_1` FOREIGN KEY (`training_id`) REFERENCES `training` (`training_id`),
  CONSTRAINT `person_training_FK_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_training`
--

LOCK TABLES `person_training` WRITE;
/*!40000 ALTER TABLE `person_training` DISABLE KEYS */;
/*!40000 ALTER TABLE `person_training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pickup_note`
--

DROP TABLE IF EXISTS `pickup_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pickup_note` (
  `pickup_note_id` int NOT NULL AUTO_INCREMENT,
  `person_course_id` int NOT NULL,
  `message` text COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`pickup_note_id`),
  KEY `pickup_note_FK` (`person_course_id`),
  CONSTRAINT `pickup_note_FK` FOREIGN KEY (`person_course_id`) REFERENCES `person_course` (`person_course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pickup_note`
--

LOCK TABLES `pickup_note` WRITE;
/*!40000 ALTER TABLE `pickup_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `pickup_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `registration_id` int NOT NULL AUTO_INCREMENT,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `validity` tinyint NOT NULL DEFAULT '1',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  `person_id` int NOT NULL,
  `company_id` int NOT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `registration_FK` (`person_id`),
  KEY `registration_FK_1` (`company_id`),
  KEY `registration_FK_2` (`created_by`),
  CONSTRAINT `registration_FK` FOREIGN KEY (`person_id`) REFERENCES `person` (`person_id`),
  CONSTRAINT `registration_FK_1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `registration_FK_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_year`
--

DROP TABLE IF EXISTS `s_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_year` (
  `s_year_id` int NOT NULL AUTO_INCREMENT,
  `start` date NOT NULL,
  `end` date NOT NULL,
  PRIMARY KEY (`s_year_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_year`
--

LOCK TABLES `s_year` WRITE;
/*!40000 ALTER TABLE `s_year` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specific_symbol`
--

DROP TABLE IF EXISTS `specific_symbol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `specific_symbol` (
  `specific_symbol_id` int NOT NULL AUTO_INCREMENT,
  `value` int NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`specific_symbol_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specific_symbol`
--

LOCK TABLES `specific_symbol` WRITE;
/*!40000 ALTER TABLE `specific_symbol` DISABLE KEYS */;
/*!40000 ALTER TABLE `specific_symbol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sport` (
  `sport_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `title_short` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_czech_ci NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `priority` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `hidden` tinyint NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`tag_id`),
  KEY `tag_FK` (`created_by`),
  CONSTRAINT `tag_FK` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training`
--

DROP TABLE IF EXISTS `training`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training` (
  `training_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `start` time NOT NULL,
  `end` time NOT NULL,
  `day` tinyint NOT NULL,
  `capacity` int NOT NULL DEFAULT '50',
  `sport_id` int NOT NULL,
  `training_location_id` int NOT NULL,
  `s_year_id` int NOT NULL,
  PRIMARY KEY (`training_id`),
  KEY `training_FK` (`sport_id`),
  KEY `training_FK_2` (`training_location_id`),
  KEY `training_FK_1` (`s_year_id`),
  CONSTRAINT `training_FK` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`sport_id`),
  CONSTRAINT `training_FK_1` FOREIGN KEY (`s_year_id`) REFERENCES `s_year` (`s_year_id`),
  CONSTRAINT `training_FK_2` FOREIGN KEY (`training_location_id`) REFERENCES `training_location` (`training_location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training`
--

LOCK TABLES `training` WRITE;
/*!40000 ALTER TABLE `training` DISABLE KEYS */;
/*!40000 ALTER TABLE `training` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_location`
--

DROP TABLE IF EXISTS `training_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_location` (
  `training_location_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(150) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `address_id` int DEFAULT NULL,
  `area_id` int NOT NULL,
  PRIMARY KEY (`training_location_id`),
  KEY `training_location_FK` (`area_id`),
  KEY `training_location_FK_1` (`address_id`),
  CONSTRAINT `training_location_FK` FOREIGN KEY (`area_id`) REFERENCES `area` (`area_id`),
  CONSTRAINT `training_location_FK_1` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_location`
--

LOCK TABLES `training_location` WRITE;
/*!40000 ALTER TABLE `training_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `password_token` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `password_token_validity` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  `company_id` int NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`,`company_id`),
  KEY `user_role_FK_1` (`role_id`),
  KEY `user_role_FK_2` (`company_id`),
  KEY `user_role_FK_3` (`created_by`),
  CONSTRAINT `user_role_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_FK_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `user_role_FK_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `user_role_FK_3` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volleyball_category`
--

DROP TABLE IF EXISTS `volleyball_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volleyball_category` (
  `volleyball_category_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(250) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`volleyball_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volleyball_category`
--

LOCK TABLES `volleyball_category` WRITE;
/*!40000 ALTER TABLE `volleyball_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `volleyball_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volleyball_tournament_registration`
--

DROP TABLE IF EXISTS `volleyball_tournament_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volleyball_tournament_registration` (
  `volleyball_tournament_registration_id` int NOT NULL AUTO_INCREMENT,
  `person_event_id` int NOT NULL,
  `volleyball_category_id` int NOT NULL,
  `needs_teammate` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8mb4_czech_ci,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int NOT NULL,
  PRIMARY KEY (`volleyball_tournament_registration_id`),
  KEY `volleyball_tournament_registration_FK` (`person_event_id`),
  KEY `volleyball_tournament_registration_FK_1` (`volleyball_category_id`),
  CONSTRAINT `volleyball_tournament_registration_FK` FOREIGN KEY (`person_event_id`) REFERENCES `person_event` (`person_event_id`),
  CONSTRAINT `volleyball_tournament_registration_FK_1` FOREIGN KEY (`volleyball_category_id`) REFERENCES `volleyball_category` (`volleyball_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volleyball_tournament_registration`
--

LOCK TABLES `volleyball_tournament_registration` WRITE;
/*!40000 ALTER TABLE `volleyball_tournament_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `volleyball_tournament_registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-28 13:52:27