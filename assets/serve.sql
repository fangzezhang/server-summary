-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: serve
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `deleted_host`
--

DROP TABLE IF EXISTS `deleted_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deleted_host` (
  `host` char(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `beta_env` varchar(45) NOT NULL,
  `pub_env` varchar(45) DEFAULT NULL,
  `vpc_env` varchar(45) DEFAULT NULL,
  `is_modify` tinyint DEFAULT '0',
  PRIMARY KEY (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deleted_host`
--

LOCK TABLES `deleted_host` WRITE;
/*!40000 ALTER TABLE `deleted_host` DISABLE KEYS */;
INSERT INTO `deleted_host` VALUES ('jv4cdbmy-fe01.ncp3',NULL,'MySQL',NULL,'Real',NULL,NULL,0),('jv5cdbmy-fe01.ncp3',NULL,'MySQL',NULL,'Real',NULL,NULL,0),('jv5cdbmy-fe02.ncp3',NULL,'MySQL',NULL,'Real',NULL,NULL,0),('jv5cdbpg-front01.ncp3',NULL,'PostgreSQL',NULL,'Real',NULL,NULL,0),('jv5cdbpg-front02.ncp3',NULL,'PostgreSQL',NULL,'Real',NULL,NULL,0),('sv4cdbmy-fe01.ncp3(SG1)','10.205.76.163',NULL,NULL,'Real','PUB','VPC',0),('sv4cdbmy-fe02.ncp3(SG1)','10.205.76.164',NULL,NULL,'Real','PUB','VPC',0),('sv4cdbpg-front01.ncp3',NULL,'PostgreSQL',NULL,'Real',NULL,NULL,0),('sv4cdbpg-front02.ncp3',NULL,'PostgreSQL',NULL,'Real',NULL,NULL,0),('sv5cdbmy-fe01.ncp3(SG2)','10.210.72.176',NULL,NULL,'Real','PUB','VPC',0),('sv5cdbmy-fe02.ncp3(SG2)','10.210.72.177',NULL,NULL,'Real','PUB','VPC',0),('sv5cdbpg-front01.ncp3',NULL,'PostgreSQL',NULL,'Real',NULL,NULL,0);
/*!40000 ALTER TABLE `deleted_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `host`
--

DROP TABLE IF EXISTS `host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `host` (
  `host` char(50) NOT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `beta_env` varchar(45) NOT NULL,
  `pub_env` varchar(45) DEFAULT NULL,
  `vpc_env` varchar(45) DEFAULT NULL,
  `is_modify` tinyint DEFAULT '0',
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `host`
--

LOCK TABLES `host` WRITE;
/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` VALUES ('avbeta-cdb-front001.gov','10.250.253.160','MySQL,Hadoop',NULL,'Beta','GOV','Classic',1,NULL),('avbeta-cdb-front01.extncl','10.250.36.249',',MySQL,MSSQL,Redis,Hadoop',NULL,'Beta','PUB','Classic',1,'KR, SG, DE, US, JP'),('avbeta-cdbdms-fe01.fin3','10.219.78.124',',DatabaseMigrationService',NULL,'Beta','FIN','VPC',1,NULL),('avbeta-cdbdms-fe01.ncp3','10.213.89.153',',DatabaseMigrationService',NULL,'Beta','PUB','VPC',1,NULL),('avbeta-cdbpg-front01.gov3','10.213.81.108',',PostgreSQL',NULL,'Beta','GOV','VPC',1,NULL),('avbeta-cdbpg-front01.ncp3','10.213.88.232',',PostgreSQL',NULL,'Beta','PUB','VPC',1,NULL),('avbeta-cdbpg-front02.gov3','10.213.81.109',',PostgreSQL',NULL,'Beta','GOV','VPC',1,NULL),('avbeta-cdbpg-front02.ncp3','10.213.88.233',',PostgreSQL',NULL,'Beta','PUB','VPC',1,NULL),('avbeta-df-fe01.ncp3','10.213.72.93',',Data Forest',NULL,'Beta','PUB','VPC',1,NULL),('avbeta2-cdbmy-fe01.extncl',NULL,'MySQL',NULL,'Beta',NULL,NULL,1,NULL),('avbeta2-cdbmy-fe02.extncl',NULL,'MySQL',NULL,'Beta',NULL,NULL,1,NULL),('avbeta3-cdbmy-front01.extncl','10.250.226.139','MySQL, Mssql, Redis, Hadoop, MongoDB, PostgreSQL ',NULL,'Beta','FIN','VPC',1,NULL),('avcdb-front01.extncl','10.250.26.169',',MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','Classic',1,'KR, SG, DE, US, JP'),('avcdb-front01.gov','10.250.104.172',',MySQL,Hadoop',NULL,'Real','GOV','Classic',0,NULL),('avcdb-front02.extncl','10.250.26.170',',MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','Classic',1,'KR, SG, DE, US, JP'),('avcdb-front02.gov','10.250.104.173',',MySQL,Hadoop',NULL,'Real','GOV','Classic',0,NULL),('avcdbdms-fe01.ncp3','10.213.214.28',',DatabaseMigrationService',NULL,'Real','PUB','VPC',1,NULL),('avcdbdms-fe02.ncp3','10.213.214.29',',DatabaseMigrationService',NULL,'Real','PUB','VPC',1,NULL),('avcdbmy-fe01.gov3','10.250.86.124','MySQL,MSSQL,Redis,Hadoop, MongoDB',NULL,'Real','GOV','VPC',0,NULL),('avcdbmy-fe01.ncp3','10.213.204.142',',MySQL',NULL,'Real','PUB','VPC',1,'KR'),('avcdbmy-fe02.gov3','10.250.86.125','MySQL,MSSQL,Redis,Hadoop, MongoDB',NULL,'Real','GOV','VPC',0,NULL),('avcdbmy-fe02.ncp3','10.213.204.143',',MySQL',NULL,'Real','PUB','VPC',1,'KR'),('avcdbpg-front01.fin3','10.250.242.198','PostgreSQL',NULL,'Real','FIN','VPC',1,NULL),('avcdbpg-front01.gov3','10.250.86.241',',PostgreSQL',NULL,'Real','GOV','VPC',0,NULL),('avcdbpg-front01.ncp3','10.213.214.162',',PostgreSQL',NULL,'Real','PUB','VPC',1,NULL),('avcdbpg-front02.fin3','10.250.242.199','PostgreSQL',NULL,'Real','FIN','VPC',1,NULL),('avcdbpg-front02.gov3','10.250.86.242',',PostgreSQL',NULL,'Real','GOV','VPC',0,NULL),('avcdbpg-front02.ncp3','10.213.214.163',',PostgreSQL',NULL,'Real','PUB','VPC',1,NULL),('avdf-fe01.ncp3','10.213.200.237',',Data Forest',NULL,'Real','PUB','VPC',1,NULL),('avdf-fe02.ncp3','10.213.200.238',',Data Forest',NULL,'Real','PUB','VPC',1,NULL),('avfin-cdb-front01.extncl','10.250.27.113','MySQL,Redis,Hadoop,Mongo,MSSQL',NULL,'Real','FIN','VPC',1,NULL),('avfin-cdb-front02.extncl','10.250.25.110','MySQL,Redis,Hadoop,Mongo,MSSQL',NULL,'Real','FIN','VPC',1,NULL),('avk1beta-cdbmy-fe01.gov3','10.213.78.154','MySQL, MSSQL, Redis, Hadoopo, MongoDB',NULL,'Beta','GOV','VPC',1,NULL),('avk1beta-cdbmy-fe02.gov3','10.213.78.155',',MySQL, MSSQL, Redis, Hadoopo, MongoDB',NULL,'Beta','GOV','VPC',1,NULL),('avk1beta-cdbmy-fe03.ncp3','10.213.68.160','MySQL, MSSQL, Reids, Hadoop, MongoDB',NULL,'Beta','PUB','VPC',1,NULL),('avk2beta-cdbmy-fe01.ncp3','10.213.72.230','MySQL, MSSQL, Reids, Hadoop, MongoDB',NULL,'Beta','PUB','VPC',1,NULL),('avk2beta-cdbmy-fe02.ncp3','10.213.72.231','MySQL, MSSQL, Reids, Hadoop, MongoDB',NULL,'Beta','PUB','VPC',1,NULL),('jv4cdbmy-fe01.ncp3(JP1)','10.211.70.158','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'JP(1)'),('jv4cdbmy-fe02.ncp3(JP1)','10.211.70.159','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'JP(1)'),('jv4cdbpg-front01.ncp3(JP1)','10.211.70.128','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'JP(1)'),('jv4cdbpg-front02.ncp3(JP1)','10.211.70.129','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'JP(1)'),('jv5cdbmy-fe01.ncp3(JP2)','10.212.78.138','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'JP(2)'),('jv5cdbmy-fe02.ncp3(JP2)','10.212.78.139','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'JP(2)'),('jv5cdbpg-front01.ncp3(JP2)','10.212.72.122','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'JP(2)'),('jv5cdbpg-front02.ncp3(JP2)','10.212.72.123','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'JP(2)'),('kvcdbdms-fe01.fin3','10.249.52.188','DatabaseMigrationService',NULL,'Real','FIN','VPC',1,NULL),('kvcdbdms-fe02.fin3','10.249.52.208','DatabaseMigrationService',NULL,'Real','FIN','VPC',1,NULL),('sv4cdbmy-fe01.ncp3','10.205.76.163','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'SG(1)'),('sv4cdbmy-fe02.ncp3','10.205.76.164','MySQL,MSSQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'SG(1)'),('sv4cdbpg-front01.ncp3(SG1)','10.205.70.196','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'SG(1)'),('sv4cdbpg-front02.ncp3(SG1)','10.205.70.197','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'SG(1)'),('sv5cdbmy-fe01.ncp3','10.210.72.176','MySQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'SG(2)'),('sv5cdbmy-fe02.ncp3','10.210.72.177','MySQL,Redis,Hadoop',NULL,'Real','PUB','VPC',1,'SG(2)'),('sv5cdbpg-front01.ncp3(SG2)','10.210.76.172','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'SG(2)'),('sv5cdbpg-front02.ncp3(SG2)','10.210.76.173','PostgreSQL,MongoDB',NULL,'Real','PUB','VPC',1,'SG(2)'),('xvcdbmy-fe03.ncp3','10.218.70.112',',MySQL',NULL,'Real','PUB','VPC',1,'KR'),('xvcdbmy-fe04.ncp3','10.218.70.146',',MySQL',NULL,'Real','PUB','VPC',1,'KR'),('xvcdbpg-front01.ncp3','10.218.72.157',',PostgreSQL',NULL,'Real','PUB','VPC',1,NULL),('xvcdbpg-front02.ncp3','10.218.72.158',',PostgreSQL',NULL,'Real','PUB','VPC',1,NULL);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-21 14:05:40
