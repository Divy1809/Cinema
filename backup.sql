-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `age_restriction`
--

DROP TABLE IF EXISTS `age_restriction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `age_restriction` (
  `AgeRestriction` varchar(10) NOT NULL,
  `Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AgeRestriction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `age_restriction`
--

LOCK TABLES `age_restriction` WRITE;
/*!40000 ALTER TABLE `age_restriction` DISABLE KEYS */;
INSERT INTO `age_restriction` VALUES ('U','Universal - Suitable for all'),('U/A','Parental Guidance - Suitable for children above 7'),('UA','Parental Guidance - Suitable for children above 12');
/*!40000 ALTER TABLE `age_restriction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `AwardID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `AwardType` varchar(100) DEFAULT NULL,
  `AwardName` varchar(255) DEFAULT NULL,
  `AwardYear` int DEFAULT NULL,
  PRIMARY KEY (`AwardID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES (1,1,'National Film Award','Best Popular Film',2010),(2,2,'Filmfare Award','Best Film',2017),(3,3,'Filmfare Award','Best Film of 50 Years',2005),(4,4,'IIFA Award','Best Film',2012),(5,5,'National Film Award','Best Director',2016);
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cast`
--

DROP TABLE IF EXISTS `cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cast` (
  `CastID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Bio` text,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`CastID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cast`
--

LOCK TABLES `cast` WRITE;
/*!40000 ALTER TABLE `cast` DISABLE KEYS */;
INSERT INTO `cast` VALUES (1,'Aamir Khan','Indian actor, director, and producer known for his work in Hindi films.','1965-03-14'),(2,'R. Madhavan','Indian actor known for his work in Hindi and Tamil cinema.','1970-06-01'),(3,'Sharman Joshi','Indian actor known for his roles in comedy and drama films.','1979-04-28'),(4,'Fatima Sana Shaikh','Indian actress who gained fame for her role in Dangal.','1992-01-11'),(5,'Sanya Malhotra','Indian actress known for her work in Bollywood.','1992-02-25'),(6,'Amitabh Bachchan','Legendary Indian actor known for his deep voice and intense performances.','1942-10-11'),(7,'Dharmendra','Veteran Bollywood actor known for his action and romantic roles.','1935-12-08'),(8,'Hema Malini','Indian actress and politician, known as the Dream Girl of Bollywood.','1948-10-16'),(9,'Hrithik Roshan','Indian actor known for his dance skills and action-packed roles.','1974-01-10'),(10,'Farhan Akhtar','Indian actor, director, and singer known for multi-talented performances.','1974-01-09'),(11,'Priyanka Chopra','Indian actress, singer, and producer who gained international fame.','1982-07-18'),(12,'Deepika Padukone','Indian actress known for her work in Bollywood and Hollywood.','1986-01-05');
/*!40000 ALTER TABLE `cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `device` (
  `DeviceID` int NOT NULL AUTO_INCREMENT,
  `OS` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`DeviceID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `device_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
INSERT INTO `device` VALUES (1,'Android','Smartphone',1),(2,'iOS','Tablet',2),(3,'Windows','Laptop',3),(4,'macOS','Desktop',4),(5,'Linux','Smart TV',5);
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `directors`
--

DROP TABLE IF EXISTS `directors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `directors` (
  `DirectorID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Bio` text,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`DirectorID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `directors`
--

LOCK TABLES `directors` WRITE;
/*!40000 ALTER TABLE `directors` DISABLE KEYS */;
INSERT INTO `directors` VALUES (1,'Rajkumar Hirani','Indian film director known for his socially relevant and entertaining films.','1962-11-20'),(2,'Nitesh Tiwari','Indian filmmaker known for directing Dangal, one of the highest-grossing Indian films.','1973-05-26'),(3,'Ramesh Sippy','Veteran Indian film director known for directing the classic film Sholay.','1947-01-23'),(4,'Zoya Akhtar','Indian filmmaker known for making realistic and stylish Bollywood films.','1972-10-14'),(5,'Sanjay Leela Bhansali','Acclaimed Indian film director known for his visually stunning films.','1963-02-24');
/*!40000 ALTER TABLE `directors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `GenreID` int NOT NULL AUTO_INCREMENT,
  `GenreName` varchar(100) NOT NULL,
  PRIMARY KEY (`GenreID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Comedy'),(2,'Drama'),(3,'Sports'),(4,'Action'),(5,'Adventure'),(6,'Road Trip'),(7,'Historical');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `LogID` int NOT NULL AUTO_INCREMENT,
  `TableName` varchar(255) DEFAULT NULL,
  `ActionType` varchar(255) DEFAULT NULL,
  `Timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LogID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'users','UPDATE','2025-03-30 19:05:10'),(2,'users','UPDATE','2025-04-13 18:37:34'),(3,'users','UPDATE','2025-04-13 18:37:34'),(4,'users','UPDATE','2025-04-13 18:37:34'),(5,'users','UPDATE','2025-04-13 18:37:34'),(6,'users','UPDATE','2025-04-13 18:37:34'),(7,'users','UPDATE','2025-04-13 18:37:34'),(8,'users','UPDATE','2025-04-13 18:37:34'),(9,'users','UPDATE','2025-04-15 18:55:40');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_cast`
--

DROP TABLE IF EXISTS `movie_cast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_cast` (
  `MovieID` int NOT NULL,
  `CastID` int NOT NULL,
  `Role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MovieID`,`CastID`),
  KEY `CastID` (`CastID`),
  CONSTRAINT `movie_cast_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE,
  CONSTRAINT `movie_cast_ibfk_2` FOREIGN KEY (`CastID`) REFERENCES `cast` (`CastID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_cast`
--

LOCK TABLES `movie_cast` WRITE;
/*!40000 ALTER TABLE `movie_cast` DISABLE KEYS */;
INSERT INTO `movie_cast` VALUES (1,1,'Rancho'),(1,2,'Farhan'),(1,3,'Raju'),(2,1,'Mahavir Singh Phogat'),(2,4,'Geeta Phogat'),(2,5,'Babita Phogat'),(3,6,'Jai'),(3,7,'Veeru'),(3,8,'Basanti'),(4,9,'Arjun'),(4,10,'Imran'),(5,11,'Kashibai'),(5,12,'Mastani');
/*!40000 ALTER TABLE `movie_cast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_classification`
--

DROP TABLE IF EXISTS `movie_classification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_classification` (
  `MovieID` int DEFAULT NULL,
  `Rating` decimal(3,1) DEFAULT NULL,
  `ReleaseDate` date DEFAULT NULL,
  `AgeRestriction` varchar(10) DEFAULT NULL,
  KEY `MovieID` (`MovieID`),
  KEY `AgeRestriction` (`AgeRestriction`),
  CONSTRAINT `movie_classification_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`),
  CONSTRAINT `movie_classification_ibfk_2` FOREIGN KEY (`AgeRestriction`) REFERENCES `age_restriction` (`AgeRestriction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_classification`
--

LOCK TABLES `movie_classification` WRITE;
/*!40000 ALTER TABLE `movie_classification` DISABLE KEYS */;
INSERT INTO `movie_classification` VALUES (1,8.4,'2009-12-25','U'),(2,8.3,'2016-12-23','U'),(3,8.1,'1975-08-15','UA'),(4,8.2,'2011-07-15','UA'),(5,7.8,'2015-12-18','UA'),(6,7.0,'1999-11-05','U'),(7,7.5,'2013-12-20','U/A');
/*!40000 ALTER TABLE `movie_classification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_director`
--

DROP TABLE IF EXISTS `movie_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_director` (
  `MovieID` int NOT NULL,
  `DirectorID` int NOT NULL,
  PRIMARY KEY (`MovieID`,`DirectorID`),
  KEY `DirectorID` (`DirectorID`),
  CONSTRAINT `movie_director_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE,
  CONSTRAINT `movie_director_ibfk_2` FOREIGN KEY (`DirectorID`) REFERENCES `directors` (`DirectorID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_director`
--

LOCK TABLES `movie_director` WRITE;
/*!40000 ALTER TABLE `movie_director` DISABLE KEYS */;
INSERT INTO `movie_director` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `movie_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_trailer`
--

DROP TABLE IF EXISTS `movie_trailer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_trailer` (
  `TrailerID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `TrailerLink` varchar(255) DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`TrailerID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `movie_trailer_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_trailer`
--

LOCK TABLES `movie_trailer` WRITE;
/*!40000 ALTER TABLE `movie_trailer` DISABLE KEYS */;
INSERT INTO `movie_trailer` VALUES (1,1,'https://www.youtube.com/watch?v=K0eDlFX9GMc','2009-07-16 04:30:00'),(2,2,'https://www.youtube.com/watch?v=x_7YlGv9u1g','2016-12-01 06:30:00'),(3,3,'https://www.youtube.com/watch?v=zzTUvWfvlBg','1975-08-15 08:30:00'),(4,4,'https://www.youtube.com/watch?v=FJrpcDgC3zU','2011-06-15 12:30:00'),(5,5,'https://www.youtube.com/watch?v=eHOc-4D7MjY','2015-11-20 14:30:00'),(6,6,'https://www.youtube.com/watch?v=1WzqB5hONHM','1999-11-05 12:30:00'),(7,7,'https://www.youtube.com/watch?v=8q3V3IejF7c','2013-12-20 12:30:00'),(8,8,'https://www.youtube.com/watch?v=oSIGQ0YkFxs','2019-04-02 12:30:00'),(9,9,'https://www.youtube.com/watch?v=7uY1JbWZKPA','2014-10-01 12:30:00'),(10,10,'https://www.youtube.com/watch?v=oIZ4U21DRlM','2008-05-04 12:30:00'),(11,11,'https://www.youtube.com/watch?v=hq0RMAuQGWA','2010-06-09 12:30:00'),(12,12,'https://www.youtube.com/watch?v=v0UXgoJ9Shg','2010-03-16 12:30:00'),(13,13,'https://www.youtube.com/watch?v=nQ3FYUgSjC8','2018-03-16 12:30:00'),(14,14,'https://www.youtube.com/watch?v=SOXWc32k4zA','2009-08-20 12:30:00'),(15,15,'https://www.youtube.com/watch?v=u-j1nx_HY5o','1999-03-24 12:30:00'),(16,16,'https://www.youtube.com/watch?v=uI8Kkj2uBS8','2012-07-11 08:30:00'),(17,17,'https://www.youtube.com/watch?v=Oz_ZJhcOX1E','2009-10-01 12:30:00'),(18,18,'https://www.youtube.com/watch?v=EXeTwQWrcwY','2021-12-13 12:30:00'),(19,19,'https://www.youtube.com/watch?v=YoHD9XEInc0','2014-11-07 12:30:00'),(20,20,'https://www.youtube.com/watch?v=bLvqoHBptjg','2016-12-10 12:30:00'),(21,21,'https://www.youtube.com/watch?v=NmzuHjWmXOc','2016-07-11 12:30:00'),(22,22,'https://www.youtube.com/watch?v=sY1S34973zA','2004-05-19 12:30:00'),(23,23,'https://www.youtube.com/watch?v=uvbavW31adA','2000-05-01 08:30:00'),(24,24,'https://www.youtube.com/watch?v=s7EdQ4FqbhY','2017-02-08 12:30:00'),(25,25,'https://www.youtube.com/watch?v=hEJnMQG9ev8','2014-12-10 12:30:00'),(26,26,'https://www.youtube.com/watch?v=lFzVJEksoDY','2012-12-10 12:30:00'),(27,27,'https://www.youtube.com/watch?v=vKQi3bBA1y8','1999-03-31 08:30:00');
/*!40000 ALTER TABLE `movie_trailer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moviegenre`
--

DROP TABLE IF EXISTS `moviegenre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moviegenre` (
  `MovieID` int NOT NULL,
  `GenreID` int NOT NULL,
  PRIMARY KEY (`MovieID`,`GenreID`),
  KEY `GenreID` (`GenreID`),
  CONSTRAINT `moviegenre_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`),
  CONSTRAINT `moviegenre_ibfk_2` FOREIGN KEY (`GenreID`) REFERENCES `genre` (`GenreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moviegenre`
--

LOCK TABLES `moviegenre` WRITE;
/*!40000 ALTER TABLE `moviegenre` DISABLE KEYS */;
INSERT INTO `moviegenre` VALUES (1,1),(15,1),(16,1),(22,1),(24,1),(1,2),(2,2),(4,2),(5,2),(8,2),(9,2),(14,2),(21,2),(2,3),(8,3),(16,3),(18,3),(20,3),(3,4),(9,4),(11,4),(13,4),(15,4),(17,4),(23,4),(27,4),(3,5),(10,5),(17,5),(19,5),(26,5),(4,6),(10,6),(18,6),(25,6),(5,7),(12,7);
/*!40000 ALTER TABLE `moviegenre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieregion`
--

DROP TABLE IF EXISTS `movieregion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movieregion` (
  `MovieID` int NOT NULL,
  `RegionID` int NOT NULL,
  PRIMARY KEY (`MovieID`,`RegionID`),
  KEY `RegionID` (`RegionID`),
  CONSTRAINT `movieregion_ibfk_1` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`),
  CONSTRAINT `movieregion_ibfk_2` FOREIGN KEY (`RegionID`) REFERENCES `region` (`RegionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieregion`
--

LOCK TABLES `movieregion` WRITE;
/*!40000 ALTER TABLE `movieregion` DISABLE KEYS */;
INSERT INTO `movieregion` VALUES (1,1),(2,1),(3,1),(4,1),(5,1);
/*!40000 ALTER TABLE `movieregion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `MovieID` int NOT NULL AUTO_INCREMENT,
  `MovieName` varchar(255) NOT NULL,
  `Language` varchar(50) DEFAULT NULL,
  `Duration` int DEFAULT NULL,
  PRIMARY KEY (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'3 Idiots','Hindi',170),(2,'Dangal','Hindi',161),(3,'Sholay','Hindi',198),(4,'Zindagi Na Milegi Dobara','Hindi',153),(5,'Bajirao Mastani','Hindi',158),(6,'Hum Saath Saath Hai','Hindi',180),(7,'Dhoom 3','Hindi',172),(8,'Lagaan','Hindi',224),(9,'Kabhi Khushi Kabhie Gham','Hindi',210),(10,'Dilwale Dulhania Le Jayenge','Hindi',181),(11,'Tanu Weds Manu','Hindi',140),(12,'Jab Tak Hai Jaan','Hindi',174),(13,'Barfi!','Hindi',151),(14,'PK','Hindi',153),(15,'Kick','Hindi',145),(16,'Ek Tha Tiger','Hindi',134),(17,'Bajrangi Bhaijaan','Hindi',159),(18,'The Dark Knight','English',152),(19,'Inception','English',148),(20,'Forrest Gump','English',142),(21,'The Shawshank Redemption','English',142),(22,'The Godfather','English',175),(23,'Gladiator','English',155),(24,'Pulp Fiction','English',154),(25,'Titanic','English',195),(26,'The Lion King','English',88),(27,'The Matrix','English',136);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `RatingID` int NOT NULL AUTO_INCREMENT,
  `MovieID` int DEFAULT NULL,
  `MotionPictures` float DEFAULT NULL,
  `TSeries` float DEFAULT NULL,
  `IMDB` float DEFAULT NULL,
  PRIMARY KEY (`RatingID`),
  KEY `MovieID` (`MovieID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,8.5,8.3,8.4),(2,2,8.2,8,8.3),(3,3,8,7.8,8.1),(4,4,8.3,8.1,8.2),(5,5,7.9,7.7,7.8),(14,6,8,8,7.5),(17,0,7,7,7),(18,7,8,8,7.5),(30,8,8.1,8.2,8.1),(31,9,7.9,7.8,7.8),(32,10,8.5,8.4,8),(33,11,7.7,7.6,7.6),(34,12,8,7.8,7.9),(35,13,8.1,7.9,8),(36,14,8.2,8,8.1),(37,15,7.8,7.7,6.9),(38,16,7.9,7.8,6.9),(39,17,8,8,8),(40,18,9,8.9,9),(41,19,8.8,8.7,8.8),(42,20,8.8,8.7,8.8),(43,21,9.3,9.2,9.3),(44,22,9.2,9.1,9.2),(45,23,8.5,8.4,8.5),(46,24,8.9,8.9,8.9),(47,25,7.8,7.7,7.8),(48,26,8.5,8.4,8.5),(49,27,8.7,8.6,8.7);
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `region` (
  `RegionID` int NOT NULL AUTO_INCREMENT,
  `RegionName` varchar(100) NOT NULL,
  PRIMARY KEY (`RegionID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (1,'India'),(2,'USA'),(3,'UK'),(4,'Canada'),(5,'Australia');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `ReviewID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `MovieID` int DEFAULT NULL,
  `ReviewText` text,
  `Rating` decimal(3,1) DEFAULT NULL,
  `ReviewDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ReviewID`),
  KEY `UserID` (`UserID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,'A brilliant and heartwarming film!',9.0,'2024-03-15 05:00:00'),(2,2,2,'An inspiring story with great performances.',8.5,'2024-03-16 08:50:00'),(3,3,3,'A true classic of Indian cinema.',9.5,'2024-03-17 13:15:00'),(4,4,4,'Beautiful cinematography and a great adventure.',8.0,'2024-03-18 15:40:00'),(5,5,5,'A visually stunning period drama.',8.8,'2024-03-19 06:35:00');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `SubscriptionID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `PlanName` varchar(100) DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `PlanPrice` decimal(10,2) DEFAULT NULL,
  `PlanStatus` varchar(50) DEFAULT NULL,
  `Details` text,
  PRIMARY KEY (`SubscriptionID`),
  KEY `UserID` (`UserID`),
  CONSTRAINT `subscription_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,1,'Basic','2024-01-01','2024-06-30',9.99,'Active','Basic plan with limited access'),(2,2,'Premium','2024-02-01','2024-07-31',14.99,'Active','Premium plan with HD streaming'),(3,3,'Family','2024-03-01','2024-08-31',19.99,'Active','Family plan with multiple devices'),(4,4,'Student','2024-04-01','2024-09-30',4.99,'Inactive','Discounted plan for students'),(5,5,'Annual','2024-05-01','2025-04-30',99.99,'Active','Annual subscription with full access'),(7,8,'Basic Plan','2025-04-01','2026-04-01',99.99,'Active',NULL),(8,9,'Basic Plan','2025-04-14','2026-04-14',99.99,'Active',NULL);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `UserID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Password` varchar(255) NOT NULL DEFAULT '123456',
  `Username` varchar(100) DEFAULT NULL,
  `PreferredGenre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Johnathan Doe','1995-04-12','123456','john_doe_95','4'),(2,'Priya Verma','1998-09-25','123456','priya_v_98','5'),(3,'Rahul Mehta','1990-06-15','123456','rahul_mehta90','4'),(4,'Sneha Kapoor','2000-01-30','123456','sneha_k_2000',NULL),(5,'Vikram Joshi','1993-11-08','123456','vikram_j_93',NULL),(6,'John Doe','1990-01-01','123456','john_doe_90',NULL),(8,'Mark John','1980-08-08','123456','mark_john_80',NULL),(9,'Aditya','2003-12-24','qwerty','adiaa01','Comedy'),(10,'Elon Musk','2000-02-10','idku','elon@90','1'),(11,'Salman Khan','1997-02-20','123456789','salman@2000','1');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `WatchlistID` int NOT NULL AUTO_INCREMENT,
  `UserID` int DEFAULT NULL,
  `MovieID` int DEFAULT NULL,
  `AddedDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`WatchlistID`),
  KEY `UserID` (`UserID`),
  KEY `MovieID` (`MovieID`),
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE,
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`MovieID`) REFERENCES `movies` (`MovieID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,3,'2024-03-15 05:00:00'),(2,2,1,'2024-03-16 08:50:00'),(3,3,5,'2024-03-17 13:15:00'),(4,4,2,'2024-03-18 15:40:00'),(5,5,4,'2024-03-19 06:35:00');
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-22 18:42:22
