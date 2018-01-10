/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_equipment
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_equipment` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_equipment`;

/*Table structure for table `t_department` */

DROP TABLE IF EXISTS `t_department`;

CREATE TABLE `t_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_department` */

insert  into `t_department`(`id`,`deptName`,`remark`) values (1,'工程一部2','工程一部。2'),(2,'工程二部','工程二部。'),(3,'工程三部','工程三部。'),(4,'1',NULL),(5,'2',NULL),(7,'4',NULL);

/*Table structure for table `t_equipment` */

DROP TABLE IF EXISTS `t_equipment`;

CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_equipment` (`typeId`),
  CONSTRAINT `FK_t_equipment` FOREIGN KEY (`typeId`) REFERENCES `t_equipmenttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_equipment` */

insert  into `t_equipment`(`id`,`name`,`no`,`typeId`,`state`,`remark`) values (1,'发电机','001',1,1,'发电机。'),(2,'电路板','002',2,3,'电路板。');

/*Table structure for table `t_equipmenttype` */

DROP TABLE IF EXISTS `t_equipmenttype`;

CREATE TABLE `t_equipmenttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_equipmenttype` */

insert  into `t_equipmenttype`(`id`,`typeName`,`remark`) values (1,'强电型','强电型。'),(2,'弱电型','弱电型。');

/*Table structure for table `t_repair` */

DROP TABLE IF EXISTS `t_repair`;

CREATE TABLE `t_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentId` int(11) DEFAULT NULL,
  `userman` varchar(20) DEFAULT NULL,
  `repairman` varchar(20) DEFAULT NULL,
  `repairTime` datetime DEFAULT NULL,
  `finishTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `finishState` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `t_repair` */

insert  into `t_repair`(`id`,`equipmentId`,`userman`,`repairman`,`repairTime`,`finishTime`,`state`,`finishState`) values (24,1,'jack','marry','2015-02-02 16:26:50','2015-02-02 16:26:59',1,2),(25,1,'jack','marry','2015-02-02 16:27:11','2015-02-02 16:27:18',1,2),(26,1,'jack','marry','2015-02-02 16:27:31','2015-02-02 16:27:35',2,2),(27,2,'jack','marry','2015-03-25 08:57:19','2015-03-31 09:01:08',2,2),(28,1,'jack','marry','2015-03-31 09:03:03','2015-03-31 09:03:37',1,2);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  `deptId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t_user` (`deptId`),
  CONSTRAINT `FK_t_user` FOREIGN KEY (`deptId`) REFERENCES `t_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`userName`,`password`,`trueName`,`roleName`,`deptId`) values (1,'java1234','123456','锋哥','管理员',1),(2,'jack','123','杰克','使用者',2),(3,'marry','123','玛丽','维修者',3),(4,'json2','12322','姐僧2','维修者',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
