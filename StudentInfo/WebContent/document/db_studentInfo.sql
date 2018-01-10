/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_studentinfo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_studentinfo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_studentinfo`;

/*Table structure for table `t_class` */

DROP TABLE IF EXISTS `t_class`;

CREATE TABLE `t_class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(20) DEFAULT NULL,
  `gradeId` int(11) DEFAULT NULL,
  `classDesc` text,
  PRIMARY KEY (`classId`),
  KEY `FK_t_class` (`gradeId`),
  CONSTRAINT `FK_t_class` FOREIGN KEY (`gradeId`) REFERENCES `t_grade` (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_class` */

insert  into `t_class`(`classId`,`className`,`gradeId`,`classDesc`) values (3,'09计本',2,'22'),(4,'08计本',1,'111'),(5,'08网本',1,'222'),(6,'10网本',3,'22'),(7,'10计本',3,'10年级计算机本科');

/*Table structure for table `t_datadic` */

DROP TABLE IF EXISTS `t_datadic`;

CREATE TABLE `t_datadic` (
  `ddId` int(11) NOT NULL AUTO_INCREMENT,
  `ddTypeId` int(11) DEFAULT NULL,
  `ddValue` varchar(20) DEFAULT NULL,
  `ddDesc` text,
  PRIMARY KEY (`ddId`),
  KEY `FK_t_datadic` (`ddTypeId`),
  CONSTRAINT `FK_t_datadic` FOREIGN KEY (`ddTypeId`) REFERENCES `t_datadictype` (`ddTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8;

/*Data for the table `t_datadic` */

insert  into `t_datadic`(`ddId`,`ddTypeId`,`ddValue`,`ddDesc`) values (1,1,'男','1'),(2,1,'女',NULL),(3,2,'中共党员',NULL),(4,2,'中共预备党员',NULL),(5,2,'共青团员',NULL),(6,2,'民革党员',NULL),(7,2,'民盟盟员',NULL),(8,2,'民建会员',NULL),(9,2,'民进会员',NULL),(10,2,'农工党党员',NULL),(11,2,'致公党党员',NULL),(12,2,'九三学社社员',NULL),(13,2,'台盟盟员',NULL),(14,2,'无党派人士',NULL),(15,2,'普通公民',NULL),(16,2,'港澳同胞',NULL),(17,2,'叛徒',NULL),(18,2,'反革命分子',NULL),(334,3,'汉族',NULL),(335,3,'蒙古族',NULL),(336,3,'回族',NULL),(337,3,'藏族',NULL),(338,3,'维吾尔族',NULL),(339,3,'门巴族',NULL),(340,3,'外国血统',NULL),(342,3,'哈哈族','11');

/*Table structure for table `t_datadictype` */

DROP TABLE IF EXISTS `t_datadictype`;

CREATE TABLE `t_datadictype` (
  `ddTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `ddTypeName` varchar(20) DEFAULT NULL,
  `ddTypeDesc` text,
  PRIMARY KEY (`ddTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_datadictype` */

insert  into `t_datadictype`(`ddTypeId`,`ddTypeName`,`ddTypeDesc`) values (1,'性别','121'),(2,'政治面貌',NULL),(3,'名族',NULL);

/*Table structure for table `t_grade` */

DROP TABLE IF EXISTS `t_grade`;

CREATE TABLE `t_grade` (
  `gradeId` int(11) NOT NULL AUTO_INCREMENT,
  `gradeName` varchar(20) DEFAULT NULL,
  `gradeDesc` text,
  PRIMARY KEY (`gradeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_grade` */

insert  into `t_grade`(`gradeId`,`gradeName`,`gradeDesc`) values (1,'08级','111'),(2,'09级','222'),(3,'10级','33');

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `studentId` varchar(40) NOT NULL,
  `stuNo` varchar(20) DEFAULT NULL,
  `stuName` varchar(20) DEFAULT NULL,
  `stuSex` varchar(10) DEFAULT NULL,
  `stuBirthday` date DEFAULT NULL,
  `stuRxsj` date DEFAULT NULL,
  `stuNation` varchar(20) DEFAULT NULL,
  `stuZzmm` varchar(20) DEFAULT NULL,
  `classId` int(11) DEFAULT NULL,
  `stuDesc` text,
  `stuPic` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`studentId`),
  KEY `FK_t_student` (`classId`),
  CONSTRAINT `FK_t_student` FOREIGN KEY (`classId`) REFERENCES `t_class` (`classId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`studentId`,`stuNo`,`stuName`,`stuSex`,`stuBirthday`,`stuRxsj`,`stuNation`,`stuZzmm`,`classId`,`stuDesc`,`stuPic`) values ('10bea402-23e4-4066-a4fd-534c3798a7d7','0011','美女111','男','2014-05-16','2014-06-08','回族','共青团员',5,'美女12222222','20140712081542.jpg'),('13','21',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),('14','21',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),('15','2',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),('17','2',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),('18','2',NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),('19','小三','21','女','2014-05-14','2014-05-14','汉族','中共党员',5,'是','20140502030158.jpg'),('4','11','212','男','2014-04-08','2014-04-05','蒙古族','中共预备党员',4,'21','20140429052236.JPG'),('5','11','21','男','2014-04-08','2014-04-05','蒙古族','中共预备党员',4,'21','20140429052433.JPG'),('6','21','2','男','2014-04-08','2014-04-05','蒙古族',NULL,4,NULL,NULL),('7fac0234-59ef-46ea-981a-de50d24741b2','000','11','男','2014-07-10','2014-07-09','汉族','中共党员',4,'测试图片','20140710090403.jpg'),('a1cf592d-d9d4-4de1-b8ff-0db7e9852411','sss22','ss2','女','2014-05-08','2014-05-10','蒙古族','共青团员',3,'大2','20140508022528.jpg'),('a8a1816b-f24c-4fb9-b160-c8c107c80acf','21','321','男','2014-05-13','2014-05-15','蒙古族','民革党员',3,'123','20140508020709.jpg'),('b53b0b8a-7f1c-4254-8cff-e8353902f012','121','21','男','2014-07-09','2014-07-16','汉族','中共党员',3,'21','');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`userId`,`userName`,`password`) values (1,'java1234','12');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
