-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: agriculture
-- ------------------------------------------------------
-- Server version	5.7.14-log

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
-- Table structure for table `category_dim`
--

DROP TABLE IF EXISTS `category_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_dim` (
  `Category_id` int(11) NOT NULL,
  `Category_Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_dim`
--

LOCK TABLES `category_dim` WRITE;
/*!40000 ALTER TABLE `category_dim` DISABLE KEYS */;
INSERT INTO `category_dim` VALUES (1,'Animals and products'),(2,'Crops');
/*!40000 ALTER TABLE `category_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_in_dimension`
--

DROP TABLE IF EXISTS `category_in_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_in_dimension` (
  `Category_In_id` int(11) NOT NULL,
  `Category_In_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Category_In_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_in_dimension`
--

LOCK TABLES `category_in_dimension` WRITE;
/*!40000 ALTER TABLE `category_in_dimension` DISABLE KEYS */;
INSERT INTO `category_in_dimension` VALUES (1,'Capital Consumption'),(2,'Interest Expenses'),(3,'Interemediate Product Expenses'),(4,'Labor Expenses'),(5,'Net Rent to Landlords'),(6,'Property Taxes and Fees');
/*!40000 ALTER TABLE `category_in_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail_in_dim`
--

DROP TABLE IF EXISTS `detail_in_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detail_in_dim` (
  `Detail_In_id` int(11) NOT NULL,
  `Subcategory_in_id` int(11) DEFAULT NULL,
  `Detail_Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Detail_In_id`),
  KEY `Subcategory_in_id_idx` (`Subcategory_in_id`),
  CONSTRAINT `Subcategory_in_id` FOREIGN KEY (`Subcategory_in_id`) REFERENCES `subcategory_in_dimension` (`Subcategory_in_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail_in_dim`
--

LOCK TABLES `detail_in_dim` WRITE;
/*!40000 ALTER TABLE `detail_in_dim` DISABLE KEYS */;
INSERT INTO `detail_in_dim` VALUES (101,10,'Capital Consumption'),(201,20,'Nonreal Estate Interest'),(211,21,'Real Estate Interest'),(301,30,'Feed'),(302,30,'Livestock and Poultry'),(303,30,'Seed'),(311,31,'Electricity'),(312,31,'Fertilizers,Lime,Soil conditioner'),(314,31,'Fuel and Oils'),(315,31,'Pesticides'),(321,32,'Machire Hire & Custom Work'),(322,32,'Marketing,Storage,Transportation'),(323,32,'Miscellaneous'),(324,32,'Repair & Maintenance'),(401,40,'Contract Labor'),(402,40,'Hired Labor'),(411,41,'Non-Cash Employee Compensation'),(501,50,'Net Rent to Nonoperator Landlords'),(511,51,'Net Rent to operator Landlords'),(601,60,'Motor Vehicle Registration Licensing Fees'),(611,61,'Personal Property Taxes'),(621,62,'Real Estate Property Taxes');
/*!40000 ALTER TABLE `detail_in_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drought_fact`
--

DROP TABLE IF EXISTS `drought_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drought_fact` (
  `Time_id` int(11) NOT NULL,
  `State_id` int(11) NOT NULL,
  `Droght_Index` double DEFAULT NULL,
  `SP12` double DEFAULT NULL,
  PRIMARY KEY (`Time_id`,`State_id`),
  KEY `State_id_idx` (`State_id`),
  CONSTRAINT `State_id` FOREIGN KEY (`State_id`) REFERENCES `geo_dimension` (`State_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Time_id` FOREIGN KEY (`Time_id`) REFERENCES `time_dim` (`Time_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drought_fact`
--

LOCK TABLES `drought_fact` WRITE;
/*!40000 ALTER TABLE `drought_fact` DISABLE KEYS */;
INSERT INTO `drought_fact` VALUES (1,7,1.47,0.42),(1,8,3.05,1.36),(2,7,1.71,0.85),(2,8,-0.16,0.25),(3,7,-1.6,-0.7),(3,8,-4.01,-0.64),(4,7,-2.84,-1.06),(4,8,-0.22,-0.26),(5,7,-5.75,-1.91),(5,8,1.23,0.17),(6,7,-4.79,-0.84),(6,8,1.37,-0.96);
/*!40000 ALTER TABLE `drought_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `geo_dimension`
--

DROP TABLE IF EXISTS `geo_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `geo_dimension` (
  `State_Id` int(11) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `State_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`State_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `geo_dimension`
--

LOCK TABLES `geo_dimension` WRITE;
/*!40000 ALTER TABLE `geo_dimension` DISABLE KEYS */;
INSERT INTO `geo_dimension` VALUES (7,'California','CA'),(8,'Iowa','IA');
/*!40000 ALTER TABLE `geo_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `input_fact`
--

DROP TABLE IF EXISTS `input_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `input_fact` (
  `Time_id` int(11) NOT NULL,
  `State_id` int(11) NOT NULL,
  `Detail_in_id` int(11) NOT NULL,
  `Expense` int(11) DEFAULT NULL,
  PRIMARY KEY (`Time_id`,`State_id`,`Detail_in_id`),
  KEY `State_id_idx` (`State_id`),
  KEY `Detail_in_id_idx` (`Detail_in_id`),
  CONSTRAINT `Detail_in_id_fk_1` FOREIGN KEY (`Detail_in_id`) REFERENCES `detail_in_dim` (`Detail_In_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `State_id_fk_1` FOREIGN KEY (`State_id`) REFERENCES `geo_dimension` (`State_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Time_id_fk_1` FOREIGN KEY (`Time_id`) REFERENCES `time_dim` (`Time_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `input_fact`
--

LOCK TABLES `input_fact` WRITE;
/*!40000 ALTER TABLE `input_fact` DISABLE KEYS */;
INSERT INTO `input_fact` VALUES (1,7,101,1094519),(1,7,201,576851),(1,7,211,1142080),(1,7,301,4430000),(1,7,302,779012),(1,7,303,980000),(1,7,311,747729),(1,7,312,1350000),(1,7,314,1111987),(1,7,315,1210000),(1,7,321,806741),(1,7,322,2101993),(1,7,323,2727586),(1,7,324,1179903),(1,7,401,1996684),(1,7,402,5969193),(1,7,411,54123),(1,7,501,757530),(1,7,511,131445),(1,7,601,87292),(1,7,611,28305),(1,7,621,901695),(2,7,101,1134109),(2,7,201,498277),(2,7,211,1156838),(2,7,301,5110000),(2,7,302,814360),(2,7,303,1070000),(2,7,311,670358),(2,7,312,1620000),(2,7,314,1185517),(2,7,315,1290000),(2,7,321,689574),(2,7,322,2019305),(2,7,323,3135302),(2,7,324,1054594),(2,7,401,2332662),(2,7,402,5121806),(2,7,411,25532),(2,7,501,868971),(2,7,511,150782),(2,7,601,62593),(2,7,611,36655),(2,7,621,1003345),(3,7,101,1881099),(3,7,201,535985),(3,7,211,1058182),(3,7,301,5490000),(3,7,302,821938),(3,7,303,1340000),(3,7,311,854983),(3,7,312,1610000),(3,7,314,1363899),(3,7,315,1450000),(3,7,321,967413),(3,7,322,1722660),(3,7,323,3380161),(3,7,324,1140493),(3,7,401,2431450),(3,7,402,5808821),(3,7,411,39729),(3,7,501,1233619),(3,7,511,214055),(3,7,601,61494),(3,7,611,30768),(3,7,621,969232),(4,7,101,2128923),(4,7,201,446294),(4,7,211,1004100),(4,7,301,6170000),(4,7,302,805920),(4,7,303,1460000),(4,7,311,1036989),(4,7,312,1850000),(4,7,314,1300145),(4,7,315,1600000),(4,7,321,1084889),(4,7,322,1748214),(4,7,323,3993129),(4,7,324,1185780),(4,7,401,2206591),(4,7,402,6602528),(4,7,411,40882),(4,7,501,1258101),(4,7,511,218303),(4,7,601,67774),(4,7,611,34498),(4,7,621,995502),(5,7,101,2864952),(5,7,201,472075),(5,7,211,1052738),(5,7,301,4750000),(5,7,302,798747),(5,7,303,1340000),(5,7,311,1193366),(5,7,312,2350000),(5,7,314,1379152),(5,7,315,2080000),(5,7,321,1728992),(5,7,322,2147628),(5,7,323,4610977),(5,7,324,1497986),(5,7,401,3574385),(5,7,402,6072512),(5,7,411,73103),(5,7,501,1333420),(5,7,511,278573),(5,7,601,67107),(5,7,611,63029),(5,7,621,986971),(6,7,101,2048527),(6,7,201,502475),(6,7,211,1095357),(6,7,301,4050000),(6,7,302,967219),(6,7,303,1530000),(6,7,311,1152776),(6,7,312,2060000),(6,7,314,1222545),(6,7,315,1650000),(6,7,321,879141),(6,7,322,1594384),(6,7,323,3847703),(6,7,324,1414721),(6,7,401,3137446),(6,7,402,6056609),(6,7,411,45945),(6,7,501,1198344),(6,7,511,250353),(6,7,601,67703),(6,7,611,34285),(6,7,621,1045715);
/*!40000 ALTER TABLE `input_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `output_fact`
--

DROP TABLE IF EXISTS `output_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `output_fact` (
  `Time_id` int(11) NOT NULL,
  `State_id` int(11) NOT NULL,
  `Product_id` int(11) NOT NULL,
  `Revenue` int(11) DEFAULT NULL,
  PRIMARY KEY (`Time_id`,`State_id`,`Product_id`),
  KEY `State_id_idx` (`State_id`),
  KEY `Product_id_idx` (`Product_id`),
  CONSTRAINT `Product_id_FK` FOREIGN KEY (`Product_id`) REFERENCES `product_dim` (`Product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `State_id_FK` FOREIGN KEY (`State_id`) REFERENCES `geo_dimension` (`State_Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Time_id_FK` FOREIGN KEY (`Time_id`) REFERENCES `time_dim` (`Time_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `output_fact`
--

LOCK TABLES `output_fact` WRITE;
/*!40000 ALTER TABLE `output_fact` DISABLE KEYS */;
/*!40000 ALTER TABLE `output_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_dim`
--

DROP TABLE IF EXISTS `product_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_dim` (
  `Product_id` int(11) NOT NULL,
  `SID` int(11) DEFAULT NULL,
  `Product_Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Product_id`),
  KEY `SID_idx` (`SID`),
  CONSTRAINT `SID` FOREIGN KEY (`SID`) REFERENCES `subcategory_dim` (`SID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_dim`
--

LOCK TABLES `product_dim` WRITE;
/*!40000 ALTER TABLE `product_dim` DISABLE KEYS */;
INSERT INTO `product_dim` VALUES (101,10,'Cattle and calves'),(102,10,'Hogs'),(111,11,'Dairy products, Milk'),(121,12,'Broilers'),(122,12,'Chicken eggs'),(123,12,'Farm chickens'),(124,12,'Turkeys'),(131,13,'Aquaculture'),(132,13,'Sheep and lambs'),(133,13,'Honey'),(134,13,'Mohair'),(135,13,'All other animals and products'),(136,13,'Wool'),(201,20,'Rice'),(202,20,'Wheat'),(211,21,'Barley'),(212,21,'Corn'),(213,21,'Hay'),(214,21,'Oats'),(221,22,'Cotton lint, Long staple'),(222,22,'Cotton lint, Upland'),(223,22,'Cottonseed'),(231,23,'Safflower'),(232,23,'Sunflower'),(241,24,'Dry beans'),(242,24,'Potatoes'),(243,24,'Sweet potatoes'),(244,24,'Artichokes'),(245,24,'Asparagus'),(246,24,'Beans, Green lima'),(247,24,'Beans, Snap'),(248,24,'Broccoli'),(249,24,'Cabbage'),(251,25,'Grapefruit'),(252,25,'Lemons'),(253,25,'Oranges'),(254,25,'Tangerines'),(255,25,'Apples'),(256,25,'Apricots'),(257,25,'Avocados'),(258,25,'Cherries'),(259,25,'Dates'),(261,26,'Sugar beets'),(262,26,'Mint'),(263,26,'Floriculture'),(264,26,'Mushrooms'),(265,26,'Miscellaneous crops'),(2410,24,'Carrots'),(2411,24,'Cauliflower'),(2412,24,'Celery'),(2413,24,'Corn, Sweet'),(2414,24,'Cucumbers'),(2415,24,'Garlic'),(2416,24,'Lettuce'),(2417,24,'Pumpkins'),(2418,24,'Onions'),(2419,24,'Peppers, Chile'),(2420,24,'Peppers, bell'),(2421,24,'Spinach'),(2422,24,'Squash'),(2423,24,'Tomatoes'),(2424,24,'Cantaloups'),(2425,24,'Honeydews'),(2426,24,'Watermelon'),(2510,25,'Figs'),(2511,25,'Grapes'),(2512,25,'Nectarines'),(2513,25,'Olives'),(2514,25,'Peaches'),(2515,25,'Pears'),(2516,25,'Plums and prunes'),(2517,25,'Blueberries'),(2518,25,'Kiwifruit'),(2519,25,'Raspberries'),(2520,25,'Strawberries'),(2521,25,'Almonds'),(2522,25,'Pecans'),(2523,25,'Pistachios'),(2524,25,'Walnuts');
/*!40000 ALTER TABLE `product_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_dim`
--

DROP TABLE IF EXISTS `subcategory_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory_dim` (
  `SID` int(11) NOT NULL,
  `Category_id` int(11) DEFAULT NULL,
  `Subcategory_Desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SID`),
  KEY `Category_id_idx` (`Category_id`),
  CONSTRAINT `Category_id` FOREIGN KEY (`Category_id`) REFERENCES `category_dim` (`Category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory_dim`
--

LOCK TABLES `subcategory_dim` WRITE;
/*!40000 ALTER TABLE `subcategory_dim` DISABLE KEYS */;
INSERT INTO `subcategory_dim` VALUES (10,1,'Meat animals'),(11,1,'Dairy products, Milk'),(12,1,'Poultry and eggs'),(13,1,'Miscellaneous animals and products'),(20,2,'Food grains'),(21,2,'Feed crops'),(22,2,'Cotton'),(23,2,'Oil crops'),(24,2,'Vegetables and melons'),(25,2,'Fruits and nuts'),(26,2,'All other crops');
/*!40000 ALTER TABLE `subcategory_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subcategory_in_dimension`
--

DROP TABLE IF EXISTS `subcategory_in_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subcategory_in_dimension` (
  `Subcategory_in_id` int(11) NOT NULL,
  `Category_in_id` int(11) DEFAULT NULL,
  `Subcategory_In_Description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Subcategory_in_id`),
  KEY `Category_In_id_idx` (`Category_in_id`),
  CONSTRAINT `Category_In_id` FOREIGN KEY (`Category_in_id`) REFERENCES `category_in_dimension` (`Category_In_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subcategory_in_dimension`
--

LOCK TABLES `subcategory_in_dimension` WRITE;
/*!40000 ALTER TABLE `subcategory_in_dimension` DISABLE KEYS */;
INSERT INTO `subcategory_in_dimension` VALUES (10,1,'Capital Consumption'),(20,2,'Nonreal Estate Interest'),(21,2,'Real Estate Interest'),(30,3,'Farm-Origin'),(31,3,'Manufactured Inputs'),(32,3,'Other Intermediate'),(40,4,'Cash Labor'),(41,4,'Non-Cash Employee Compensation'),(50,5,'Net Rent to Nonoperator Landlords'),(51,5,'Net Rent to Operator Landlords'),(60,6,'Motor Vehicle Registration Licensing Fees'),(61,6,'Personal Property Taxes'),(62,6,'Real Estate Property Taxes');
/*!40000 ALTER TABLE `subcategory_in_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_dim`
--

DROP TABLE IF EXISTS `time_dim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_dim` (
  `Time_id` int(11) NOT NULL,
  `Year` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_dim`
--

LOCK TABLES `time_dim` WRITE;
/*!40000 ALTER TABLE `time_dim` DISABLE KEYS */;
INSERT INTO `time_dim` VALUES (1,'2010'),(2,'2011'),(3,'2012'),(4,'2013'),(5,'2014'),(6,'2015');
/*!40000 ALTER TABLE `time_dim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'agriculture'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-23 13:08:54
