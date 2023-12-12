/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.25 : Database - library-system
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`library-system` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `library-system`;

/*Table structure for table `author` */

DROP TABLE IF EXISTS `author`;

CREATE TABLE `author` (
  `authorid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`authorid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `author` */

insert  into `author`(`authorid`,`name`,`status`) values
(2,'Elon Forbes','Enable'),
(6,'J.K Rowling','Enable'),
(8,'HIRAK','Enable');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookid` int NOT NULL AUTO_INCREMENT,
  `categoryid` int NOT NULL,
  `authorid` int NOT NULL,
  `name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `publisherid` int NOT NULL,
  `isbn` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `no_of_copy` int NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `book` */

insert  into `book`(`bookid`,`categoryid`,`authorid`,`name`,`publisherid`,`isbn`,`no_of_copy`,`status`,`added_on`,`updated_on`) values
(2,2,6,'Head First PHP &amp; MySQL',9,'0596006306',10,'Enable','2022-06-12 11:16:01','2022-06-12 11:16:01'),
(10,2,6,'Python',2,'ISN213123123',5,'Enable','2023-12-09 10:14:05','2023-12-09 10:14:05'),
(11,2,6,'python java',13,'kjhhklh786',40,'Enable','2023-12-12 08:26:17','2023-12-12 08:26:17');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `category` */

insert  into `category`(`categoryid`,`name`,`status`) values
(2,'Programming','Enable'),
(6,'Web Development','Enable'),
(11,'PYTHON','Enable');

/*Table structure for table `issued_book` */

DROP TABLE IF EXISTS `issued_book`;

CREATE TABLE `issued_book` (
  `issuebookid` int NOT NULL AUTO_INCREMENT,
  `bookid` int NOT NULL,
  `userid` int NOT NULL,
  `issue_date_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expected_return_date` datetime NOT NULL,
  `return_date_time` datetime NOT NULL,
  `status` enum('Issued','Returned','Not Return') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`issuebookid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `issued_book` */

insert  into `issued_book`(`issuebookid`,`bookid`,`userid`,`issue_date_time`,`expected_return_date`,`return_date_time`,`status`) values
(7,10,4,'2023-12-09 10:20:57','2023-12-05 10:20:50','2023-12-28 10:20:52','Issued'),
(8,10,12,'2023-12-10 10:02:43','2023-12-05 10:02:35','2023-12-30 10:02:38','Issued');

/*Table structure for table `publisher` */

DROP TABLE IF EXISTS `publisher`;

CREATE TABLE `publisher` (
  `publisherid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `status` enum('Enable','Disable') NOT NULL,
  PRIMARY KEY (`publisherid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `publisher` */

insert  into `publisher`(`publisherid`,`name`,`status`) values
(2,'Amazon Publishing','Enable'),
(13,'Hirak','Enable'),
(14,'PYTHON LIBRARY','Enable');

/*Table structure for table `rack` */

DROP TABLE IF EXISTS `rack`;

CREATE TABLE `rack` (
  `rackid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Enable',
  PRIMARY KEY (`rackid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `rack` */

insert  into `rack`(`rackid`,`name`,`status`) values
(1,'R1','Enable'),
(2,'R2','Enable');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `role` enum('admin','user') CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'user',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;

/*Data for the table `user` */

insert  into `user`(`id`,`first_name`,`last_name`,`email`,`password`,`role`) values
(17,'namra','patel','hp@gmail.com','1234','user'),
(18,'hirak','abc','ab@gmail.com','1234','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
