CREATE DATABASE  IF NOT EXISTS `mare` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `mare`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mare
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.28-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (12,'Camperas'),(13,'Remeras'),(14,'Conjuntos'),(15,'Pantalones'),(16,'Jeans');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detail`
--

DROP TABLE IF EXISTS `detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(38,2) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlqdlcasie9qik7r5xuauy1ral` (`cart_id`),
  KEY `FKj3xts7y5rbrekgijwq4pb5aj6` (`product_id`),
  CONSTRAINT `FKj3xts7y5rbrekgijwq4pb5aj6` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKlqdlcasie9qik7r5xuauy1ral` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detail`
--

LOCK TABLES `detail` WRITE;
/*!40000 ALTER TABLE `detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flyway_schema_history`
--

DROP TABLE IF EXISTS `flyway_schema_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flyway_schema_history` (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) DEFAULT NULL,
  `description` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `script` varchar(1000) NOT NULL,
  `checksum` int(11) DEFAULT NULL,
  `installed_by` varchar(100) NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`),
  KEY `flyway_schema_history_s_idx` (`success`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flyway_schema_history`
--

LOCK TABLES `flyway_schema_history` WRITE;
/*!40000 ALTER TABLE `flyway_schema_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `flyway_schema_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `featured` bit(1) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(38,2) DEFAULT NULL,
  `product_entry` date DEFAULT NULL,
  `stock` int(11) NOT NULL,
  `waist` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Rojo','Esta es una descripcion del producto',_binary '','https://acdn.mitiendanube.com/stores/638/118/products/weeknd-ml01-1889a3112a5e9d18fe16790308994225-1024-1024.png','Remera',100.00,'2023-10-26',15,'M',13),(2,'Rojo','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://sublitextil.com.ar/wp-content/uploads/2019/01/Remera-sublimar-hombre-.jpg','Remera 1',5000.00,'2023-10-26',50,'L',13),(3,'Rojo','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://drifters.com.ar/uploads/product_image/28726/650w_DriftersPDP_WO00001910-500_Shot1.jpg','Remera 2',4500.00,'2023-10-26',7,'XL',13),(4,'Rojo','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://drifters.com.ar/uploads/product_image/28726/650w_DriftersPDP_WO00001910-500_Shot1.jpg','Remera 3',4500.00,'2023-10-26',7,'XL',13),(5,'Negra','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/001/053/068/products/mujer-afro-11-da492bf8650e3e52e116645715620104-240-0.jpg','Remera 4',3500.00,'2023-10-26',14,'3',13),(6,'Gris Claro','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/001/057/234/products/mesa-de-trabajo-1-531-718751db608efed6ad16699187999904-640-0.jpg','Jeans 2',11200.00,'2023-10-27',18,'3',16),(7,'Gris Oscuro','Esta es una descripcion del producto',_binary '','https://acdn.mitiendanube.com/stores/001/057/234/products/mesa-de-trabajo-1-531-718751db608efed6ad16699187999904-640-0.jpg','Jeans 3',11000.00,'2023-10-26',15,'M',16),(8,'Gris Oscuro','Esta es una descripcion del producto',_binary '','https://acdn.mitiendanube.com/stores/001/057/234/products/mesa-de-trabajo-1-531-718751db608efed6ad16699187999904-640-0.jpg','Jeans 4',10000.00,'2023-10-26',15,'M',16),(9,'Gris Oscuro','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/001/057/234/products/mesa-de-trabajo-1-531-718751db608efed6ad16699187999904-640-0.jpg','Jeans 1',11200.00,'2023-10-27',18,'4',16),(10,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/001/057/234/products/mesa-de-trabajo-1-531-718751db608efed6ad16699187999904-640-0.jpg','Jeans 5',11200.00,'2023-10-27',18,'4',16),(11,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 1',15000.00,'2023-10-27',18,'4',15),(12,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 2',13000.00,'2023-10-27',18,'4',15),(13,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 3',11000.00,'2023-10-27',18,'4',15),(14,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 4',10000.00,'2023-10-27',18,'4',15),(15,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 5',9500.00,'2023-10-27',18,'4',15),(16,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 6',8300.00,'2023-10-27',18,'4',15),(17,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 7',1300.00,'2023-10-27',18,'4',15),(18,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 8',13500.00,'2023-10-27',18,'4',15),(19,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://acdn.mitiendanube.com/stores/800/781/products/15f9a2fd-97bd-40b3-adda-4e73a596235e1-eba4270baf8844a40016783931044609-640-0.jpeg','Pantalon 9',10550.00,'2023-10-27',18,'4',15),(20,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 1',5000.00,'2023-10-27',12,'4',14),(21,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 2',3500.00,'2023-10-27',12,'4',14),(22,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 3',4500.00,'2023-10-27',12,'4',14),(23,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 4',5500.00,'2023-10-27',12,'4',14),(24,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 5',5400.00,'2023-10-27',12,'4',14),(25,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 6',5600.00,'2023-10-27',12,'4',14),(26,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 7',5700.00,'2023-10-27',12,'4',14),(27,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 8',5900.00,'2023-10-27',12,'4',14),(28,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 9',6900.00,'2023-10-27',12,'4',14),(29,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 10',7900.00,'2023-10-27',12,'4',14),(30,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 11',4900.00,'2023-10-27',12,'4',14),(31,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://image.made-in-china.com/202f0j00BwjVESzCQAob/Lovely-Kid-Baby-Girls-Clothes-Sets-Summer-Cotton-Sleeveless-Tops-Shorts-2PCS-Outfit-Fashion-Clothing.webp','Conjunto 12',4100.00,'2023-10-27',12,'4',14),(32,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 1',14100.00,'2023-10-27',12,'4',12),(33,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 2',16100.00,'2023-10-27',12,'4',12),(34,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 3',17100.00,'2023-10-27',12,'4',12),(35,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 4',17100.00,'2023-01-01',12,'4',12),(36,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 5',17100.00,'2023-10-27',12,'4',12),(37,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 6',12100.00,'2023-10-27',12,'4',12),(38,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 7',22100.00,'2023-10-27',12,'4',12),(39,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 8',22100.00,'2023-10-27',12,'4',12),(40,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 9',22100.00,'2023-10-27',12,'4',12),(41,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 10',22100.00,'2023-10-27',12,'4',12),(42,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 11',22100.00,'2023-10-27',12,'4',12),(43,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://scandinavianar.vtexassets.com/arquivos/ids/172241-800-auto?v=637949600149630000&width=800&height=auto&aspect=true','Campera 12',22100.00,'2023-10-27',12,'4',12),(44,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 5',2100.00,'2023-10-27',12,'4',13),(45,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 6',22100.00,'2023-10-27',12,'4',13),(46,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 7',22100.00,'2023-10-27',12,'4',13),(47,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 8',22100.00,'2023-10-27',12,'4',13),(48,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 9',22100.00,'2023-10-27',12,'4',13),(49,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 10',22100.00,'2023-10-27',12,'4',13),(50,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 11',22100.00,'2023-10-27',12,'4',13),(51,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 12',22100.00,'2023-10-27',12,'4',13),(52,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 13',22100.00,'2023-10-27',12,'4',13),(53,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://assets.adidas.com/images/w_600,f_auto,q_auto/42f6e0d4f39047e8b476aee60109bc4c_9366/Camiseta_Titular_River_Plate_22-23_Blanco_GB7592_01_laydown.jpg','Remera 14',22100.00,'2023-10-27',12,'4',13),(54,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://http2.mlstatic.com/D_NQ_NP_609085-MLA54968500938_042023-O.webp','Jeans 6',12100.00,'2023-10-27',12,'4',16),(55,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://http2.mlstatic.com/D_NQ_NP_609085-MLA54968500938_042023-O.webp','Jeans 7',12100.00,'2023-10-27',12,'4',16),(56,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://http2.mlstatic.com/D_NQ_NP_609085-MLA54968500938_042023-O.webp','Jeans 8',12100.00,'2023-10-27',12,'4',16),(57,'Azul','Esta es una descripción de ejemplo para el producto.',_binary '\0','https://http2.mlstatic.com/D_NQ_NP_609085-MLA54968500938_042023-O.webp','Jeans 9',12100.00,'2023-10-27',12,'4',16);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `rol` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Alte Brown 209','andres.bozzani@gmail.com','Bozzani','Andrés','$2a$10$rZeyGg6Y1h3uHLqbVzn.AujNofJrsC8cYiHCGH738wY.r869kPh0q','3446236311',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mare'
--

--
-- Dumping routines for database 'mare'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-09 14:12:42
