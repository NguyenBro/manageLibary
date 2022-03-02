-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `information` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Hồ Xuân Hương','Female','Quê ở Phú Yên'),(2,'Nam Cao','Male','vv'),(3,'Tô Hoài','Female','Ông là ...'),(5,'Nguyễn Nhật Ánh','Female','Quê ở Huế'),(6,'Ngô Tất Tố','Male','v'),(8,'Phùng Quán','Male','v'),(10,'Vũ Trọng Phụng','Male','Ông .....');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `book` (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_author` int(11) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `limitDay` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_book` (`id_author`),
  KEY `publisher_book` (`id_publisher`),
  CONSTRAINT `author_book` FOREIGN KEY (`id_author`) REFERENCES `author` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `publisher_book` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('tn1','Chí Phèo',2,7,0,30,15),('tt1','Mắt Biếc',5,2,20,40,25),('tt2','Dế Mèn Phiêu Lưu Kí',3,1,23,30,15),('tt5','Tắt Đèn',6,3,20,20,20),('tt7','Vượt Côn Đảo',8,3,15,30,10);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_book` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_user`,`id_book`),
  KEY `book_cart_idx` (`id_book`),
  CONSTRAINT `book_cart` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_cart` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `publisher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (1,'Kim Đồng','KimoD@gmail.com','438-HaiBaTrung-ThanhXuan-HaNoi'),(2,'DHQG TPHCM','dhqg1@gmail.com','12A-TranHungDao-Quan1-TpHCM'),(3,'Hồng Đức','hd@gmail.com','141-Nguyễn Huệ-Quận 4- tpHCM'),(7,'Thanh niên','thanhnien@yahho.com','1-Võ Văn Ngân-Quận Thủ Đức-TpHCM'),(8,'Bình Minh','binhminh@hoanghon.yahoo','15-Võ Văn Kiệt - Quận 1 -TpHCM');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_sale_idx` (`id_user`),
  CONSTRAINT `user_sales` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,'2021-11-08','19110442',25),(2,'2021-11-08','19110407',10),(3,'2021-11-09','19110442',15),(4,'2021-11-07','19110442',30),(5,'2021-11-06','19110407',45),(6,'2021-11-05','19110407',15),(7,'2021-11-05','19110442',30),(8,'2021-11-10','19110407',5),(9,'2021-11-12','19110407',15),(10,'2021-11-12','19110442',15),(11,'2021-11-21','19110442',20),(12,'2021-11-21','19110407',20),(13,'2021-11-21','19110407',56),(14,'2021-11-21','19110407',46),(15,'2021-11-21','19110407',51),(16,'2021-11-21','19110407',31),(17,'2021-11-21','19110407',31),(18,'2021-11-22','19110407',40),(20,'2021-12-01','19110407',15),(22,'2021-12-05','19110407',20),(23,'2021-12-05','19110407',25),(25,'2021-12-06','19110407',45),(26,'2021-12-06','19110407',35),(28,'2021-12-10','19110442',70);
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthday` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('101','Hiện','2003-08-21','0253641524','Quận 2','123456',1,5),('19110407','Phát','2011-12-13','0362963051','Quận 13 - TpHCM','123456',1,1),('19110408','Hoang','2008-12-18','0362963052','Đà Nẵng','123456',1,0),('19110442','minh','2003-11-21','013625478','Thành phố Hồ Chí Minh','123456',1,20),('admin','nguyen','2001/02/25','1236547','Thanh Pho Ho Chi Minh','123',0,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work`
--

DROP TABLE IF EXISTS `work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_book` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `start_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `end_date` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_work_idx` (`id_user`),
  KEY `book_work_idx` (`id_book`),
  CONSTRAINT `book_work` FOREIGN KEY (`id_book`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_work` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work`
--

LOCK TABLES `work` WRITE;
/*!40000 ALTER TABLE `work` DISABLE KEYS */;
INSERT INTO `work` VALUES (1,'19110407','tt1','2021-11-08','2021-11-21','YES',25),(2,'19110442','tn1','2021-11-08','2021-11-09','YES',15),(11,'19110407','tt7','2021-10-01','2021-11-21','YES',31),(14,'19110407','tn1','2021-11-19','2021-11-21','YES',15),(15,'19110407','tt5','2021-11-19','2021-11-21','YES',20),(23,'19110442','tt2','2021-11-20','2021-12-10','YES',15),(24,'19110442','tt7','2021-11-20','2021-12-10','YES',10),(25,'19110407','tt2','2021-11-21','2021-11-22','YES',15),(26,'19110407','tt5','2021-11-21','2021-11-21','YES',20),(29,'19110407','tt1','2021-11-22','2021-11-22','YES',25),(31,'19110407','tn1','2021-11-24','2021-12-2','YES',15),(32,'19110407','tt2','2021-10-14',' ','LATE',43),(33,'19110407','tt5','2021-12-02','2021-12-5','YES',20),(34,'19110407','tt5','2021-12-05','2021-12-05','YES',20),(35,'19110407','tn1','2021-10-05',' ','LATE',52),(36,'19110407','tt1','2021-12-05','2021-12-05','YES',25),(37,'19110407','tt1','2021-12-06','2021-12-06','YES',25),(38,'19110407','tt5','2021-12-06','2021-12-06','YES',20),(39,'19110407','tt1','2021-12-06','2021-12-06','YES',25),(40,'19110407','tt7','2021-12-06','2021-12-06','YES',10),(42,'19110442','tt1','2021-12-10','2021-12-10','YES',25),(43,'19110442','tt5','2021-12-10','2021-12-10','YES',20),(44,'19110407','tt1','2021-12-11',' ','NO',25);
/*!40000 ALTER TABLE `work` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-11 20:49:14
