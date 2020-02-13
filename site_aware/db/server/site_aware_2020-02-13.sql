# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.18)
# Database: site_aware
# Generation Time: 2020-02-13 08:12:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`id`, `label`)
VALUES
	(1,'Tropical'),
	(2,'Winter'),
	(3,'Berry'),
	(4,'Root'),
	(5,'Cruciferous'),
	(6,'Organic');

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(25) NOT NULL,
  `department_id` int(11) NOT NULL,
  `unit_price` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;

INSERT INTO `item` (`id`, `label`, `department_id`, `unit_price`)
VALUES
	(1,'Papaya',1,23.9000),
	(2,'Coconut',1,3.9000),
	(3,'Pineapple',1,24.9000),
	(4,'Kiwi',1,15.9000),
	(5,'Mango',1,20.9000),
	(6,'Pomegranate',2,6.9000),
	(7,'Avocado',2,14.9000),
	(8,'Winter Squash',2,9.9000),
	(9,'Pumpkin',2,9.9000),
	(10,'Stawberries',3,24.0000),
	(11,'Blueberries',3,19.9000),
	(12,'Raspberries',3,17.9000),
	(13,'Cherry',3,9.5000),
	(14,'Grape',3,16.9000),
	(15,'Potato',4,6.9000),
	(16,'Sweet Potato',4,9.9000),
	(17,'Carrots',4,4.9000),
	(18,'White Onion',4,4.9000),
	(19,'Red Onion',4,5.9000),
	(20,'White Cabbage',5,4.9000),
	(21,'Red Cabbage',5,5.9000),
	(22,'Cauliflower',5,7.9000),
	(23,'Broccoli',5,9.9000),
	(24,'Kale',5,7.9000),
	(25,'Spinach',5,7.9000),
	(26,'Lettuce',6,5.9000),
	(27,'Red Pepper',6,13.9000),
	(28,'Ginger',6,30.9000),
	(29,'Lemon',6,11.9000),
	(30,'Cucumber',6,9.9000);

/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_details_id` int(11) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_price` decimal(10,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_details_id` (`user_details_id`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`user_details_id`) REFERENCES `user_detail` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;

INSERT INTO `order` (`id`, `user_id`, `user_details_id`, `date`, `total_price`)
VALUES
	(1,3,1,'2020-02-12 15:04:11',23.9000),
	(2,3,1,'2020-02-12 15:05:21',23.9000),
	(3,1,1,'2020-02-13 09:23:22',282.4000),
	(4,1,1,'2020-02-13 09:24:51',282.4000),
	(5,1,1,'2020-02-13 09:25:20',282.4000),
	(6,1,1,'2020-02-13 09:27:48',282.4000),
	(7,1,1,'2020-02-13 09:28:51',282.4000),
	(8,1,1,'2020-02-13 09:29:37',282.4000),
	(9,1,1,'2020-02-13 09:30:06',282.4000),
	(10,1,1,'2020-02-13 09:30:28',282.4000),
	(11,1,1,'2020-02-13 09:30:55',282.4000),
	(12,1,1,'2020-02-13 09:32:05',115.9000),
	(13,1,1,'2020-02-13 09:32:55',115.9000),
	(14,1,1,'2020-02-13 09:34:53',88.3000),
	(15,1,1,'2020-02-13 09:49:45',27.6000),
	(16,4,2,'2020-02-13 09:52:51',210.8000),
	(17,8,7,'2020-02-13 10:05:36',39.2500);

/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`id`, `order_id`, `item_id`, `quantity`, `weight`, `comment`)
VALUES
	(1,1,1,2,0.5000,''),
	(2,2,1,2,0.5000,''),
	(3,14,6,2,1.0000,''),
	(4,14,7,10,0.5000,''),
	(5,15,15,2,2.0000,''),
	(6,16,1,2,2.0000,''),
	(7,16,2,2,2.0000,''),
	(8,16,3,2,2.0000,''),
	(9,17,28,1,0.5000,''),
	(10,17,29,4,0.5000,'');

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `register` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `first_name`, `last_name`, `email`, `password`, `register`)
VALUES
	(1,'maya','bridge','m@gmail.com','8ONCHBXPFhtO1vIXdi6UsSgl/44m7rU7u8b8hQ5Uu89aU2qCMfzE4tbWUzUQd1j4oP/zcnQn9Ksm3pv10wYlmQ==','true'),
	(2,'maya','bridge','m@m.com',NULL,NULL),
	(3,'maya','bridge','d@d.com',NULL,NULL),
	(4,'savelli','S','s@gmail.com',NULL,NULL),
	(5,'Shai','BenShimol','shai@gmail.com','AFrjcIip/ABvpxDEDgaE/YPQjmfLcUztSh4zf6u0fgNcFbhEybqOXCy8O+CQ8r5cYJsRAOvEeI6YlBm75FwMRA==','true'),
	(6,'rachel','r','r@gmail.com','5r5p7Cpr2SD08VJuHwwqANKYxUuc43df88rO0xyIaTQsCY86XogxCyBj1b55TjCXPTisaHJCUjPj5BGI4IZ/Ig==','true'),
	(7,'rachel','r','rachel@gmail.com','xtNJR2nGmq1L8uSdR5UZB+Bvh8Qls8VjUJNKTDv+V7u8lIzgQcnEHt4Vmb0he93NMpHm7Vd5WUU781lkF5/weg==','true'),
	(8,'stav','s','stav@gmail.com','8ONCHBXPFhtO1vIXdi6UsSgl/44m7rU7u8b8hQ5Uu89aU2qCMfzE4tbWUzUQd1j4oP/zcnQn9Ksm3pv10wYlmQ==','true');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user_detail`;

CREATE TABLE `user_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_detail_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOCK TABLES `user_detail` WRITE;
/*!40000 ALTER TABLE `user_detail` DISABLE KEYS */;

INSERT INTO `user_detail` (`id`, `user_id`, `address`, `city`, `phone`)
VALUES
	(1,1,'1 main st','T',''),
	(2,4,'38 Lakefield rd','South Yarmouth',''),
	(3,5,'4 allenby st','tel aviv',''),
	(4,6,'7 king george st','tel aviv',''),
	(5,6,'5 king george st','tel aviv',''),
	(6,7,'38 Lakefield rd','South Yarmouth',''),
	(7,8,'20 main st','haifa','');

/*!40000 ALTER TABLE `user_detail` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Dumping routines (PROCEDURE) for database 'site_aware'
--
DELIMITER ;;

# Dump of PROCEDURE add_order
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `add_order` */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_order`(
	in user_id int(11),
    in user_details_id int(11),
    in price decimal(10,4)
)
BEGIN

Insert into `order` 
    (`id`, `user_id`, `user_details_id`, `date`, `total_price`)
values
	(default, user_id, user_details_id, default, price);
    
select * from `order` where id = last_insert_id();
    
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE add_user
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_user`(
	in first_name varchar(20),
    in last_name varchar(25),
    in email varchar(20),
    in in_password varchar(200),
    in register varchar(10)
)
BEGIN

Insert into `user` 
    (`id`, `first_name`, `last_name`, `email`, `password`, `register`)
values
	(default, first_name, last_name, email, in_password, register);
    
select * from `user` where id = last_insert_id();

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE add_user_detail
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `add_user_detail` */;;
/*!50003 SET SESSION SQL_MODE="ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `add_user_detail`(
	in user_id int(11),
    in address varchar(100),
    in city varchar(50),
    in phone varchar(11)
)
BEGIN

Insert into `user_detail` 
    (`id`, `user_id`, `address`, `city`, `phone`)
values
	(default, user_id, address, city, phone);
    
select * from `user_detail` where id = last_insert_id();
    
END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
# Dump of PROCEDURE update_user
# ------------------------------------------------------------

/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;;
/*!50003 SET SESSION SQL_MODE="STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION"*/;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `update_user`(
	in id int(11),
	in first_name varchar(20),
    in last_name varchar(25),
    in in_password varchar(200),
    in register varchar(10)
)
BEGIN

update `user` 
set 
	`first_name` = first_name,
    `last_name` = last_name,
    `password` = in_password,
    `register` = register
where
	`id` = id;
    

END */;;

/*!50003 SET SESSION SQL_MODE=@OLD_SQL_MODE */;;
DELIMITER ;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
