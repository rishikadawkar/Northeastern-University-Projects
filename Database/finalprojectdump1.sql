-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: residentialmanagement
-- ------------------------------------------------------
-- Server version	5.6.38-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `apartment_details_view`
--

DROP TABLE IF EXISTS `apartment_details_view`;
/*!50001 DROP VIEW IF EXISTS `apartment_details_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `apartment_details_view` AS SELECT 
 1 AS `Landlord_ID`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Apartment_Number`,
 1 AS `Bedrooms`,
 1 AS `Floor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `apartment_type`
--

DROP TABLE IF EXISTS `apartment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `apartment_type` (
  `ApartmentType_ID` int(11) NOT NULL,
  `Bedrooms` enum('1bhk','2bhk','3bhk') NOT NULL,
  `Floor` enum('basement','first','second') NOT NULL,
  PRIMARY KEY (`ApartmentType_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to help decide a unique value for each rental flat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apartment_type`
--

LOCK TABLES `apartment_type` WRITE;
/*!40000 ALTER TABLE `apartment_type` DISABLE KEYS */;
INSERT INTO `apartment_type` VALUES (1,'1bhk','basement'),(2,'2bhk','basement'),(3,'3bhk','basement'),(4,'1bhk','first'),(5,'2bhk','first'),(6,'3bhk','first'),(7,'1bhk','second'),(8,'2bhk','second'),(9,'3bhk','second');
/*!40000 ALTER TABLE `apartment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `current_resident`
--

DROP TABLE IF EXISTS `current_resident`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `current_resident` (
  `Apartment_Number` int(11) NOT NULL,
  `Landlord_ID` int(11) DEFAULT NULL,
  `TenantId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Apartment_Number`),
  KEY `landlord_ID_idx` (`Landlord_ID`),
  KEY `TenantId` (`TenantId`),
  CONSTRAINT `current_resident_ibfk_1` FOREIGN KEY (`Apartment_Number`) REFERENCES `society` (`Apartment_Number`),
  CONSTRAINT `current_resident_ibfk_2` FOREIGN KEY (`Landlord_ID`) REFERENCES `landlord` (`Landlord_ID`),
  CONSTRAINT `current_resident_ibfk_3` FOREIGN KEY (`TenantId`) REFERENCES `tenantstable` (`TenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `current_resident`
--

LOCK TABLES `current_resident` WRITE;
/*!40000 ALTER TABLE `current_resident` DISABLE KEYS */;
INSERT INTO `current_resident` VALUES (1,1,NULL),(2,NULL,1),(3,NULL,2),(4,2,NULL),(5,NULL,3),(6,3,NULL),(7,4,NULL),(8,NULL,4),(9,NULL,5);
/*!40000 ALTER TABLE `current_resident` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `due_table`
--

DROP TABLE IF EXISTS `due_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `due_table` (
  `Apartment_Number` int(11) NOT NULL,
  `due` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Apartment_Number`),
  CONSTRAINT `due_table_ibfk_1` FOREIGN KEY (`Apartment_Number`) REFERENCES `rent_collection` (`Apartment_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `due_table`
--

LOCK TABLES `due_table` WRITE;
/*!40000 ALTER TABLE `due_table` DISABLE KEYS */;
INSERT INTO `due_table` VALUES (9,'300');
/*!40000 ALTER TABLE `due_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `landlord`
--

DROP TABLE IF EXISTS `landlord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `landlord` (
  `Landlord_ID` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Landlord_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `landlord`
--

LOCK TABLES `landlord` WRITE;
/*!40000 ALTER TABLE `landlord` DISABLE KEYS */;
INSERT INTO `landlord` VALUES (1,'Rishika','Dawkar','9673772351',NULL),(2,'Apurva','Kushare','9673772352',NULL),(3,'Nupur','Dongare','9673772353',NULL),(4,'Saumya','Bengari','9673772354',NULL),(5,'Deepshikha','Sinha','9673772355',NULL),(6,'Ayush','Jain','9673772356',NULL),(7,'Shweta','Pathak','9673772357',NULL),(8,'Omair','Ahmad','9673772358',NULL),(9,'Haroon','Perveez','9673772359',NULL);
/*!40000 ALTER TABLE `landlord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lease`
--

DROP TABLE IF EXISTS `lease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lease` (
  `lease_ID` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `Deposit` int(11) NOT NULL,
  `TenantId` int(11) NOT NULL,
  `Rent` int(11) DEFAULT NULL,
  PRIMARY KEY (`lease_ID`),
  UNIQUE KEY `lease_ID_UNIQUE` (`lease_ID`),
  KEY `Tenant_Id_idx` (`TenantId`),
  CONSTRAINT `Tenant_Id` FOREIGN KEY (`TenantId`) REFERENCES `tenantstable` (`TenantId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lease`
--

LOCK TABLES `lease` WRITE;
/*!40000 ALTER TABLE `lease` DISABLE KEYS */;
INSERT INTO `lease` VALUES (1,'2016-12-13','2017-12-12',5000,1,2000),(2,'2016-06-13','2017-12-13',6000,2,3500),(3,'2016-07-14','2017-12-14',6000,3,2500),(4,'2016-04-14','2017-12-14',6000,4,1700),(5,'2016-05-14','2017-12-15',6000,5,1500);
/*!40000 ALTER TABLE `lease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenance`
--

DROP TABLE IF EXISTS `maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance` (
  `Issue_ID` int(11) NOT NULL,
  `Issue_Description` text,
  `MaintenanceGuyId` int(11) DEFAULT NULL,
  `Apartment_Number` int(11) DEFAULT NULL,
  PRIMARY KEY (`Issue_ID`),
  KEY `MaintenanceGuyId_idx` (`MaintenanceGuyId`),
  KEY `Apartment_Number_idx` (`Apartment_Number`),
  CONSTRAINT `MaintenanceGuyId` FOREIGN KEY (`MaintenanceGuyId`) REFERENCES `maintenanceworkers` (`MaintenanceGuyId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance`
--

LOCK TABLES `maintenance` WRITE;
/*!40000 ALTER TABLE `maintenance` DISABLE KEYS */;
INSERT INTO `maintenance` VALUES (1,'plumbing issues',1,5),(2,'plumbing issues',1,5),(3,'wiring issues',2,7),(4,'wiring issues',2,8),(5,'clogging issues',1,8);
/*!40000 ALTER TABLE `maintenance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger maintenance_bill_trig
after insert on maintenance
for each row
begin
declare ifpresent Integer;
declare ifpresent1 Integer;
declare charge Integer;
declare issueid Integer;
declare guyid Integer;
declare aptno Integer;
Select Issue_ID into issueid from maintenance where Issue_ID=new.Issue_ID;
Select MaintenanceGuyId into guyid from maintenance where Issue_ID=issueid;
Select Apartment_Number into aptno from maintenance where Issue_ID=issueid;
Select Charges into charge from maintenanceworkers where MaintenanceGuyId=guyid;

Call pro_5(charge,guyid);


set ifpresent =  (SELECT count(*) from maintenance_bill where Apartment_Number=aptno);

if ifpresent=1 then
Call pro_3(charge,aptno);
else
call pro_4(aptno,charge);  
end If;

set ifpresent1 =  (SELECT count(*) from total_bill where Apartment_Number=aptno);

if ifpresent1=1 then
Call pro_6(charge,aptno);
else
call pro_7(aptno,charge);  
end If;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `maintenance_bill`
--

DROP TABLE IF EXISTS `maintenance_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenance_bill` (
  `Apartment_Number` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Apartment_Number`),
  KEY `apt_no_idx` (`Apartment_Number`),
  CONSTRAINT `apt_no` FOREIGN KEY (`Apartment_Number`) REFERENCES `maintenance` (`Apartment_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `maintenance_bill_ibfk_1` FOREIGN KEY (`Apartment_Number`) REFERENCES `maintenance` (`Apartment_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenance_bill`
--

LOCK TABLES `maintenance_bill` WRITE;
/*!40000 ALTER TABLE `maintenance_bill` DISABLE KEYS */;
INSERT INTO `maintenance_bill` VALUES (5,100),(7,100),(8,150);
/*!40000 ALTER TABLE `maintenance_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maintenanceworkers`
--

DROP TABLE IF EXISTS `maintenanceworkers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maintenanceworkers` (
  `MaintenanceGuyId` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `EmailId` varchar(45) DEFAULT NULL,
  `Profession` enum('plumber','electrician','gardener','carpenter','painter','cleaner','pestcontrol','other') DEFAULT NULL,
  `Charges` int(11) DEFAULT NULL,
  `Earning` int(11) DEFAULT '0',
  PRIMARY KEY (`MaintenanceGuyId`),
  UNIQUE KEY `MaintenanceGuyId_UNIQUE` (`MaintenanceGuyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maintenanceworkers`
--

LOCK TABLES `maintenanceworkers` WRITE;
/*!40000 ALTER TABLE `maintenanceworkers` DISABLE KEYS */;
INSERT INTO `maintenanceworkers` VALUES (1,'rohan','joshi','617234567','rohan.joshi@gmail.com','plumber',50,150),(2,'varun','joshi','617234587','varun.joshi@gmail.com','electrician',100,200),(3,'kinj','patel','617234580','varun.joshi@gmail.com','gardener',30,0),(4,'yash','chau','613234580','yash.chau@gmail.com','carpenter',150,0),(5,'rug','sav','617234550','rug.sav@gmail.com','painter',200,0),(6,'sid','koppi','618234580','sid.koppi@gmail.com','cleaner',75,0),(7,'pra','joshi','617234590','pra.joshi@gmail.com','pestcontrol',100,0),(8,'janice','gonzal','617234580','janice.gonzal@gmail.com','other',250,0);
/*!40000 ALTER TABLE `maintenanceworkers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking`
--

DROP TABLE IF EXISTS `parking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parking` (
  `ParkingId` int(11) NOT NULL,
  `Price` int(11) DEFAULT NULL,
  `Apartment_Number` int(11) DEFAULT '0',
  PRIMARY KEY (`ParkingId`),
  UNIQUE KEY `ParkingSpaceId_UNIQUE` (`ParkingId`),
  KEY `apt_no_idx` (`Apartment_Number`),
  CONSTRAINT `parking_ibfk_1` FOREIGN KEY (`Apartment_Number`) REFERENCES `society` (`Apartment_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking`
--

LOCK TABLES `parking` WRITE;
/*!40000 ALTER TABLE `parking` DISABLE KEYS */;
INSERT INTO `parking` VALUES (1,235,5);
/*!40000 ALTER TABLE `parking` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger parking_total_bill
after insert on parking
for each row
begin
declare ifpresent Integer;
declare aptno Integer;
declare amt Integer;
declare parkid Integer;
Select ParkingId into parkid from parking where ParkingId=new.ParkingId;
Select Apartment_Number into aptno from parking where ParkingId=parkid;
Select Price into amt from parking where ParkingId=parkid ;

set ifpresent =  (SELECT count(*) from total_bill where Apartment_Number=aptno);

if ifpresent=1 then
Call pro_8(amt,aptno);
else
call pro_9(aptno,amt);  
end If;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `rent_collection`
--

DROP TABLE IF EXISTS `rent_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rent_collection` (
  `Invoice_Number` int(11) NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `Paid_Amount` float DEFAULT NULL,
  `Apartment_Number` int(11) NOT NULL,
  `Tenant_ID` int(11) NOT NULL,
  PRIMARY KEY (`Invoice_Number`),
  KEY `Apartment_Number_idx` (`Apartment_Number`),
  KEY `Tenant_ID_idx` (`Tenant_ID`),
  CONSTRAINT `Apartment_Number` FOREIGN KEY (`Apartment_Number`) REFERENCES `society` (`Apartment_Number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `rent_collection_ibfk_1` FOREIGN KEY (`Tenant_ID`) REFERENCES `tenantstable` (`TenantId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_collection`
--

LOCK TABLES `rent_collection` WRITE;
/*!40000 ALTER TABLE `rent_collection` DISABLE KEYS */;
INSERT INTO `rent_collection` VALUES (1,'2017-11-11',1000,9,5),(2,'2017-11-12',200,9,5);
/*!40000 ALTER TABLE `rent_collection` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger due_table_entry
after insert on rent_collection
for each row
begin
declare ifpresent Integer;
declare due Integer;
declare aptno Integer;
declare payment Integer;
declare tenant1 Integer;
declare rentamt Integer;
declare invoic Integer;
Select Invoice_Number into invoic from rent_collection where Invoice_Number=new.Invoice_Number;
Select Apartment_Number into aptno from rent_collection where Invoice_Number=invoic;
Select Paid_Amount into payment from rent_collection where Invoice_Number=invoic;
Select Tenant_ID into tenant1 from rent_collection where Invoice_Number=invoic;
Select Rent into rentamt from lease where TenantId=tenant1;
set due=0;

set ifpresent =  (SELECT count(*) from due_table where Apartment_Number=aptno);

if ifpresent=1 then
Call pro_1(payment,aptno);
else
set due=rentamt-payment;
call pro_2(aptno,due);  

end If;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `society`
--

DROP TABLE IF EXISTS `society`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `society` (
  `Apartment_Number` int(11) NOT NULL,
  `Apartment_Type` int(11) DEFAULT NULL,
  `Landlord_ID` int(11) NOT NULL,
  PRIMARY KEY (`Apartment_Number`),
  KEY `apartment_type_idx` (`Apartment_Type`),
  KEY `landlord_ID_idx` (`Landlord_ID`),
  CONSTRAINT `apartment_type` FOREIGN KEY (`Apartment_Type`) REFERENCES `apartment_type` (`ApartmentType_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `landlord_ID` FOREIGN KEY (`Landlord_ID`) REFERENCES `landlord` (`Landlord_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `society`
--

LOCK TABLES `society` WRITE;
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
INSERT INTO `society` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,2),(5,5,2),(6,6,3),(7,7,4),(8,8,4),(9,9,4);
/*!40000 ALTER TABLE `society` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenantstable`
--

DROP TABLE IF EXISTS `tenantstable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tenantstable` (
  `TenantId` int(11) NOT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `PhoneNumber` varchar(45) DEFAULT NULL,
  `EmailId` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TenantId`),
  UNIQUE KEY `TenantId_UNIQUE` (`TenantId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenantstable`
--

LOCK TABLES `tenantstable` WRITE;
/*!40000 ALTER TABLE `tenantstable` DISABLE KEYS */;
INSERT INTO `tenantstable` VALUES (1,'Neha','Patil','9673772361','neha.patil@gmail.com'),(2,'Isha','Agarwal','9673772362','isha.agarwal@gmail.com'),(3,'Krutika','Patil','9673772363','krutika.patil@gmail.com'),(4,'Krutika','Halkare','9673772364','krutika.halkare@gmail.com'),(5,'Vilakshan','Bhargava','9673772365','vilakshan.bhargava@gmail.com'),(6,'Unmesh','Gosavi','9673772366','unmesh.gosavi@gmail.com'),(7,'Rugved','Savant','9673772367','rugved.savant@gmail.com'),(8,'Tanay','Pardeshi','9673772368','tanay.pardeshi@gmail.com'),(9,'Nihar','Kadam','9673772369','nnihar.kadam@gmail.com');
/*!40000 ALTER TABLE `tenantstable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_bill`
--

DROP TABLE IF EXISTS `total_bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `total_bill` (
  `Apartment_Number` int(11) NOT NULL,
  `Amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`Apartment_Number`),
  CONSTRAINT `total_bill_ibfk_1` FOREIGN KEY (`Apartment_Number`) REFERENCES `maintenance_bill` (`Apartment_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_bill`
--

LOCK TABLES `total_bill` WRITE;
/*!40000 ALTER TABLE `total_bill` DISABLE KEYS */;
INSERT INTO `total_bill` VALUES (5,335),(7,100),(8,150);
/*!40000 ALTER TABLE `total_bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'residentialmanagement'
--

--
-- Dumping routines for database 'residentialmanagement'
--
/*!50003 DROP PROCEDURE IF EXISTS `pro_1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_1`(in pay int,in apt int)
Begin
update due_table set due=due-pay where Apartment_Number=apt; 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_2`(in apt int,in du int)
Begin
insert into due_table values (apt,du);
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_3`(in charg int,in apt int)
Begin
update maintenance_bill set Amount=Amount+charg where Apartment_Number=apt; 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_4` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_4`(in apt int,in cha int)
Begin
insert into maintenance_bill values (apt,cha);
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_5` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_5`(in charg int,in mid int)
Begin
update maintenanceworkers set Earning=Earning+charg where MaintenanceGuyId=mid; 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_6` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_6`(in charg int,in apt int)
Begin
update total_bill set Amount=Amount+charg where Apartment_Number=apt; 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_7` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_7`(in apt int,in cha int)
Begin
insert into total_bill values (apt,cha);
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_8` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_8`(in pri int,in apt int)
Begin
update total_bill set Amount=Amount+pri where Apartment_Number=apt; 
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pro_9` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_9`(in apt int,in cha int)
Begin
insert into total_bill values (apt,cha);
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `apartment_details_view`
--

/*!50001 DROP VIEW IF EXISTS `apartment_details_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `apartment_details_view` AS select `landlord`.`Landlord_ID` AS `Landlord_ID`,`landlord`.`FirstName` AS `FirstName`,`landlord`.`LastName` AS `LastName`,`society`.`Apartment_Number` AS `Apartment_Number`,`apartment_type`.`Bedrooms` AS `Bedrooms`,`apartment_type`.`Floor` AS `Floor` from ((`society` join `apartment_type` on((`society`.`Apartment_Type` = `apartment_type`.`ApartmentType_ID`))) join `landlord` on((`society`.`Landlord_ID` = `landlord`.`Landlord_ID`))) */;
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

-- Dump completed on 2017-12-14  7:44:45
