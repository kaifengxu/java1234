/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_rbps
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_rbps` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_rbps`;

/*Table structure for table `t_auth` */

DROP TABLE IF EXISTS `t_auth`;

CREATE TABLE `t_auth` (
  `authId` int(11) NOT NULL AUTO_INCREMENT,
  `authName` varchar(20) DEFAULT NULL,
  `authPath` varchar(100) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `authDescription` varchar(200) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `iconCls` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`authId`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `t_auth` */

insert  into `t_auth`(`authId`,`authName`,`authPath`,`parentId`,`authDescription`,`state`,`iconCls`) values (1,'某系统','',-1,NULL,'closed','icon-home'),(2,'权限管理','',1,NULL,'closed','icon-permission'),(3,'学生管理','',1,'我擦','closed','icon-student'),(4,'课程管理','',1,NULL,'closed','icon-course'),(5,'住宿管理','zsgl.html',3,NULL,'open','icon-item'),(6,'学生信息管理','xsxxgl.html',3,NULL,'open','icon-item'),(7,'学籍管理','xjgl.html',3,NULL,'open','icon-item'),(8,'奖惩管理','jcgl.html',3,NULL,'open','icon-item'),(9,'课程设置','kcsz.html',4,NULL,'open','icon-item'),(10,'选课情况','xkqk.html',4,NULL,'open','icon-item'),(11,'成绩录入','cjlr.html',4,NULL,'closed','icon-item'),(12,'用户管理','userManage.html',2,NULL,'open','icon-userManage'),(13,'角色管理','roleManage.html',2,NULL,'open','icon-roleManage'),(14,'菜单管理','menuManage.html',2,NULL,'open','icon-menuManage'),(15,'修改密码','',1,NULL,'open','icon-modifyPassword'),(16,'安全退出','',1,NULL,'open','icon-exit'),(23,'B','B1B',11,'B','open','icon-item');

/*Table structure for table `t_role` */

DROP TABLE IF EXISTS `t_role`;

CREATE TABLE `t_role` (
  `roleId` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(20) DEFAULT NULL,
  `authIds` varchar(50) DEFAULT NULL,
  `roleDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `t_role` */

insert  into `t_role`(`roleId`,`roleName`,`authIds`,`roleDescription`) values (1,'超级管理员','1,2,12,13,14,3,5,6,7,8,4,9,10,11,17,18,19,20,15,16','具有最高权限'),(2,'宿舍管理员','1,3,5,6,7,8,4,10,11,16','管理学生宿舍信息'),(3,'辅导员','','负责学生的生活，学习及心里问题'),(8,'教师','','讲课的'),(9,'学生','','你懂的'),(18,'辅导员','','略'),(19,'A',NULL,NULL),(20,'B',NULL,NULL),(21,'C',NULL,NULL),(22,'D',NULL,NULL),(23,'B','','AB'),(24,'AAAA','','dddd'),(25,'CCCCC我靠','','我靠2');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `userType` tinyint(4) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  `userDescription` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `FK_t_user` (`roleId`),
  CONSTRAINT `FK_t_user` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`roleId`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`userName`,`password`,`userType`,`roleId`,`userDescription`) values (1,'java1234','1',1,1,NULL),(2,'marry','123456',2,2,'好'),(3,'java','javacc',2,3,'guanli元'),(15,'zhangsan','javacc',2,18,''),(28,'java','123',2,2,'hao 管理'),(29,'java','123444',2,3,'hao 管理  today'),(30,'ww','1234',2,2,'12'),(31,'xiaoli','123456',2,3,'这是一个宿舍管理员');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
