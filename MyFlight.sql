CREATE DATABASE  IF NOT EXISTS `flight_reservation` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `flight_reservation`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: ourhelldatabase.ccskr1fo4tov.us-east-2.rds.amazonaws.com    Database: flight_reservation
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Airlines`
--

DROP TABLE IF EXISTS `Airlines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Airlines` (
  `airline_id` char(2) NOT NULL,
  `num_aircraft` int(11) DEFAULT NULL,
  `num_airport_operates` int(11) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Airlines`
--

LOCK TABLES `Airlines` WRITE;
/*!40000 ALTER TABLE `Airlines` DISABLE KEYS */;
/*!40000 ALTER TABLE `Airlines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `admin` (
  `employee_id` char(8) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aircrafts`
--

DROP TABLE IF EXISTS `aircrafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aircrafts` (
  `aircraft_registration` char(6) NOT NULL,
  `num_seats` int(11) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`aircraft_registration`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aircrafts`
--

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airports`
--

DROP TABLE IF EXISTS `airports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `airports` (
  `airport_id` char(3) NOT NULL,
  PRIMARY KEY (`airport_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airports`
--

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arrive_at`
--

DROP TABLE IF EXISTS `arrive_at`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `arrive_at` (
  `flight_num` char(6) NOT NULL,
  `airport_id` char(3) NOT NULL,
  `arrival_time` date DEFAULT NULL,
  PRIMARY KEY (`airport_id`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `arrive_at_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `airports` (`airport_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arrive_at_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arrive_at`
--

LOCK TABLES `arrive_at` WRITE;
/*!40000 ALTER TABLE `arrive_at` DISABLE KEYS */;
/*!40000 ALTER TABLE `arrive_at` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buys`
--

DROP TABLE IF EXISTS `buys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buys` (
  `customer_id` char(8) NOT NULL,
  `ticket_unique_num` char(10) NOT NULL,
  `booking_fees` double DEFAULT NULL,
  `purchase_time` date DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`ticket_unique_num`),
  KEY `ticket_unique_num` (`ticket_unique_num`),
  CONSTRAINT `buys_ibfk_1` FOREIGN KEY (`ticket_unique_num`) REFERENCES `flight_tickets` (`ticket_unique_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buys_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buys`
--

LOCK TABLES `buys` WRITE;
/*!40000 ALTER TABLE `buys` DISABLE KEYS */;
/*!40000 ALTER TABLE `buys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_representatives`
--

DROP TABLE IF EXISTS `customer_representatives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_representatives` (
  `employee_id` char(8) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `customer_representatives_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_representatives`
--

LOCK TABLES `customer_representatives` WRITE;
/*!40000 ALTER TABLE `customer_representatives` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_representatives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `customer_id` char(8) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('Azzy','13579'),('tg','tty');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `depart_from`
--

DROP TABLE IF EXISTS `depart_from`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `depart_from` (
  `flight_num` char(6) NOT NULL,
  `airport_id` char(3) NOT NULL,
  `depature _time` date DEFAULT NULL,
  PRIMARY KEY (`airport_id`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `depart_from_ibfk_1` FOREIGN KEY (`airport_id`) REFERENCES `airports` (`airport_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `depart_from_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `depart_from`
--

LOCK TABLES `depart_from` WRITE;
/*!40000 ALTER TABLE `depart_from` DISABLE KEYS */;
/*!40000 ALTER TABLE `depart_from` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` char(8) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_tickets`
--

DROP TABLE IF EXISTS `flight_tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flight_tickets` (
  `ticket_unique_num` char(10) NOT NULL,
  `senquence` int(11) DEFAULT NULL,
  `class` varchar(20) DEFAULT NULL,
  `meal` varchar(45) DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `fare` double DEFAULT NULL,
  PRIMARY KEY (`ticket_unique_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight_tickets`
--

LOCK TABLES `flight_tickets` WRITE;
/*!40000 ALTER TABLE `flight_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `flight_tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flights`
--

DROP TABLE IF EXISTS `flights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flights` (
  `flight_num` char(6) NOT NULL,
  `days` date DEFAULT NULL,
  `destination_boundary` varchar(15) DEFAULT NULL,
  `flight_type` varchar(45) DEFAULT NULL,
  `arrival_time` date DEFAULT NULL,
  `depature_time` date DEFAULT NULL,
  `departing_airport` varchar(45) DEFAULT NULL,
  `arriving_airport` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`flight_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flights`
--

LOCK TABLES `flights` WRITE;
/*!40000 ALTER TABLE `flights` DISABLE KEYS */;
INSERT INTO `flights` VALUES ('yooo','0000-00-00','National','one-way',NULL,NULL,'congo','Zambia');
/*!40000 ALTER TABLE `flights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fly`
--

DROP TABLE IF EXISTS `fly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `fly` (
  `airline_id` char(2) NOT NULL,
  `aircraft_registration` char(6) NOT NULL,
  PRIMARY KEY (`airline_id`,`aircraft_registration`),
  KEY `aircraft_registration` (`aircraft_registration`),
  CONSTRAINT `fly_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `Airlines` (`airline_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fly_ibfk_2` FOREIGN KEY (`aircraft_registration`) REFERENCES `aircrafts` (`aircraft_registration`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fly`
--

LOCK TABLES `fly` WRITE;
/*!40000 ALTER TABLE `fly` DISABLE KEYS */;
/*!40000 ALTER TABLE `fly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `is_has_waiting_list`
--

DROP TABLE IF EXISTS `is_has_waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `is_has_waiting_list` (
  `flight_num` char(6) NOT NULL,
  `customer_id` char(8) NOT NULL,
  PRIMARY KEY (`customer_id`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `is_has_waiting_list_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `is_has_waiting_list_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `is_has_waiting_list`
--

LOCK TABLES `is_has_waiting_list` WRITE;
/*!40000 ALTER TABLE `is_has_waiting_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `is_has_waiting_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `make_book_have__list_Reservation`
--

DROP TABLE IF EXISTS `make_book_have__list_Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `make_book_have__list_Reservation` (
  `employee_id` char(8) NOT NULL,
  `customer_id` char(8) NOT NULL,
  `flight_num` char(6) NOT NULL,
  `ticket_unique_num` char(10) NOT NULL,
  PRIMARY KEY (`employee_id`,`customer_id`,`flight_num`,`ticket_unique_num`),
  KEY `customer_id` (`customer_id`),
  KEY `flight_num` (`flight_num`),
  KEY `ticket_unique_num` (`ticket_unique_num`),
  CONSTRAINT `make_book_have__list_Reservation_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `make_book_have__list_Reservation_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `make_book_have__list_Reservation_ibfk_3` FOREIGN KEY (`ticket_unique_num`) REFERENCES `flight_tickets` (`ticket_unique_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `make_book_have__list_Reservation_ibfk_4` FOREIGN KEY (`employee_id`) REFERENCES `customer_representatives` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `make_book_have__list_Reservation`
--

LOCK TABLES `make_book_have__list_Reservation` WRITE;
/*!40000 ALTER TABLE `make_book_have__list_Reservation` DISABLE KEYS */;
/*!40000 ALTER TABLE `make_book_have__list_Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uses`
--

DROP TABLE IF EXISTS `uses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uses` (
  `aircraft_registration` char(6) NOT NULL,
  `flight_num` char(6) NOT NULL,
  PRIMARY KEY (`aircraft_registration`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `uses_ibfk_1` FOREIGN KEY (`aircraft_registration`) REFERENCES `aircrafts` (`aircraft_registration`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uses_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uses`
--

LOCK TABLES `uses` WRITE;
/*!40000 ALTER TABLE `uses` DISABLE KEYS */;
/*!40000 ALTER TABLE `uses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid`
--

DROP TABLE IF EXISTS `valid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `valid` (
  `flight_num` char(6) NOT NULL,
  `ticket_unique_num` char(10) NOT NULL,
  PRIMARY KEY (`ticket_unique_num`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `valid_ibfk_1` FOREIGN KEY (`ticket_unique_num`) REFERENCES `flight_tickets` (`ticket_unique_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `valid_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid`
--

LOCK TABLES `valid` WRITE;
/*!40000 ALTER TABLE `valid` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `via`
--

DROP TABLE IF EXISTS `via`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `via` (
  `airline_id` char(2) NOT NULL,
  `flight_num` char(6) NOT NULL,
  PRIMARY KEY (`airline_id`,`flight_num`),
  KEY `flight_num` (`flight_num`),
  CONSTRAINT `via_ibfk_1` FOREIGN KEY (`airline_id`) REFERENCES `Airlines` (`airline_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `via_ibfk_2` FOREIGN KEY (`flight_num`) REFERENCES `flights` (`flight_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `via`
--

LOCK TABLES `via` WRITE;
/*!40000 ALTER TABLE `via` DISABLE KEYS */;
/*!40000 ALTER TABLE `via` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'flight_reservation'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-31 14:54:08
