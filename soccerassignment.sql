CREATE DATABASE  IF NOT EXISTS `soccer` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `soccer`;
-- MySQL dump 10.13  Distrib 5.5.54, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: soccer
-- ------------------------------------------------------
-- Server version	5.5.54-0ubuntu0.14.04.1

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
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES ('2019_02_14_183806_user_table',1),('2019_02_16_155142_create_team_table',1),('2019_02_16_155610_create_players_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerTeamMapping`
--

DROP TABLE IF EXISTS `playerTeamMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerTeamMapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_id` int(11) DEFAULT '0',
  `player_id` int(11) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerTeamMapping`
--

LOCK TABLES `playerTeamMapping` WRITE;
/*!40000 ALTER TABLE `playerTeamMapping` DISABLE KEYS */;
INSERT INTO `playerTeamMapping` VALUES (4,5,8,'2019-02-17 07:22:56','2019-02-17 10:08:40'),(5,6,1,'2019-02-17 07:43:28','2019-02-17 10:07:57'),(6,5,2,'2019-02-17 07:44:22','2019-02-17 10:08:33'),(7,9,9,'2019-02-17 07:46:36','2019-02-17 10:08:48'),(8,5,10,'2019-02-17 09:20:14','2019-02-17 10:08:57');
/*!40000 ALTER TABLE `playerTeamMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `imageUri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Ronaldo','Ronaldo','https://media2.s-nbcnews.com/j/newscms/2018_40/2594221/181005-cristiano-ronaldo-ew-247p_f3c5835ccd4632267efc0c1fdd4a5d30.fit-760w.jpg','2019-02-16 10:48:10','2019-02-17 10:07:56'),(2,'Lionel','Messi','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHD_F-rAp9IonZLB-bfVei_mN-t0JLLWbst4gPbCLO33OrDczN','2019-02-16 10:48:10','2019-02-17 10:08:33'),(8,'MC','PP','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHD_F-rAp9IonZLB-bfVei_mN-t0JLLWbst4gPbCLO33OrDczN','2019-02-17 07:22:56','2019-02-17 10:08:40'),(9,'Dg','dg','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHD_F-rAp9IonZLB-bfVei_mN-t0JLLWbst4gPbCLO33OrDczN','2019-02-17 07:46:36','2019-02-17 10:08:48'),(10,'BBBB','BBBBB','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHD_F-rAp9IonZLB-bfVei_mN-t0JLLWbst4gPbCLO33OrDczN','2019-02-17 09:20:14','2019-02-17 10:08:56');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logoUri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (5,'Orlando City','https://img.washingtonpost.com/blogs/soccer-insider/files/2014/10/orlando-logo.jpg','2019-02-16 10:48:10','2019-02-17 10:04:42'),(6,'FC Dallas','https://img.washingtonpost.com/blogs/soccer-insider/files/2014/10/fcdallas-logo.jpg','2019-02-16 10:48:10','2019-02-17 10:02:47'),(9,'Manchaster United','http://www.martinsoccer.org/img/thumb/soccer_team_logos.jpg','2019-02-17 07:46:07','2019-02-17 10:04:04'),(10,'Soccer F.C','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQicjNRlISIpVoVAng4av-Bl5d7mBJr7Or1MB0PJxzX07ZtuuvX','2019-02-17 10:05:30','2019-02-17 10:05:30');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_email_unique` (`email`),
  UNIQUE KEY `user_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (5,'Admin','admin','admin@gmail.com','$2y$10$Up35PRVUAo3QHD/2wnr1yupHWiCo6iphwk05.IFTk6g0KCmqtRrbq',1,'2019-02-16 10:48:09','2019-02-17 10:23:15','jtObiDDCE3cmGp3HPxlweQYhiynekBimTlRvPj4cxfYciNMzapuG8aZACLbB'),(6,'User','user','user@gmail.com','$2y$10$roh02Eva2jCplUqT2bVWHuAXQGDGdmVfWj1jPcfSy5bzrRO0QWOeu',0,'2019-02-16 10:48:09','2019-02-16 10:48:09',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-17 22:30:25
