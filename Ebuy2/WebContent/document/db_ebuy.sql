/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_ebuy2
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_ebuy2` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_ebuy2`;

/*Table structure for table `t_bigtype` */

DROP TABLE IF EXISTS `t_bigtype`;

CREATE TABLE `t_bigtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_bigtype` */

insert  into `t_bigtype`(`id`,`name`,`remarks`) values (1,'服饰',NULL),(2,'数码',NULL),(3,'美食',NULL),(4,'家电',NULL);

/*Table structure for table `t_comment` */

DROP TABLE IF EXISTS `t_comment`;

CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1000) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `nickName` varchar(30) DEFAULT NULL,
  `replyContent` varchar(1000) DEFAULT NULL,
  `replyTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `t_comment` */

insert  into `t_comment`(`id`,`content`,`createTime`,`nickName`,`replyContent`,`replyTime`) values (2,'积分大返利，机不可失失不再来','2014-01-02 00:00:00','会员VIP','会员特惠月开始','2014-01-02 00:00:00'),(3,'开始配货开始配货开始配货开始配货','2014-01-03 00:00:00','阿木木',NULL,'2014-01-01 00:00:00'),(4,'小米4发布了 1999 16G 3200W像素','2014-01-04 00:00:00','雷军','假的！！','2014-01-03 00:00:00'),(6,'1234单号，有问题','2014-08-28 00:00:00','大熊2','22','2014-09-13 18:11:51'),(12,'1234单号，有问题','2014-08-28 00:00:00','大熊2','没问题啊','2014-09-13 18:02:52'),(13,'1234单号，有问题','2014-08-28 00:00:00','大熊2','没问题。','2014-09-13 18:04:45'),(14,'1234单号，有问题','2014-08-28 00:00:00','大熊2','没问题。','2014-09-13 18:05:03'),(17,'1234单号，有问题','2014-08-28 00:00:00','大熊2','没问题。111','2014-09-13 18:09:52'),(18,'什么时候发货？','2014-09-14 00:00:00','小华','块了','2014-09-14 21:26:46'),(19,'某某订单有问题','2014-09-15 00:00:00','外星人','enen ..','2014-09-15 07:53:00');

/*Table structure for table `t_news` */

DROP TABLE IF EXISTS `t_news`;

CREATE TABLE `t_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_news` */

insert  into `t_news`(`id`,`createTime`,`title`,`content`) values (1,'2013-01-01 00:00:00','新闻一',NULL),(2,'2013-01-01 00:00:00','新闻二',NULL),(3,'2013-01-01 00:00:00','新闻三',NULL),(4,'2013-01-01 00:00:00','新闻四',NULL),(5,'2013-01-01 00:00:00','新闻五',NULL),(6,'2013-01-01 00:00:00','新闻六',NULL),(7,'2013-01-01 00:00:00','新闻七',NULL),(8,'2013-01-01 00:00:00','新闻八',NULL),(9,NULL,'1',NULL),(10,NULL,'2',NULL);

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_notice` */

insert  into `t_notice`(`id`,`createTime`,`title`,`content`) values (1,'2014-10-01 00:00:00','公告一','<p>公告一内容</p>\r\n'),(2,'2014-10-01 00:00:00','公告二',NULL),(3,'2014-10-01 00:00:00','公告三',NULL),(4,'2014-10-01 00:00:00','公告四',NULL),(5,'2014-10-01 00:00:00','公告五',NULL),(6,'2014-10-01 00:00:00','公告六',NULL),(7,'2014-10-01 00:00:00','公告七',NULL),(8,'2014-10-01 00:00:00','公告八',NULL);

/*Table structure for table `t_order` */

DROP TABLE IF EXISTS `t_order`;

CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cost` float NOT NULL,
  `createTime` datetime DEFAULT NULL,
  `orderNo` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kh19wisaki6acmrs36vcmboj3` (`userId`),
  CONSTRAINT `FK_kh19wisaki6acmrs36vcmboj3` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `t_order` */

insert  into `t_order`(`id`,`cost`,`createTime`,`orderNo`,`status`,`userId`) values (15,46115,'2014-09-04 20:30:23','20140904083023',4,1),(16,7297,'2014-09-04 20:46:02','20140904084602',3,1),(17,168,'2014-09-09 12:09:23','20140909120923',3,1),(18,13134,'2014-09-13 22:41:26','20140913104126',4,2),(19,1702,'2014-09-14 21:13:45','20140914091345',1,2),(20,8534,'2014-09-14 21:37:22','20140914093722',1,5),(21,11952,'2014-09-15 07:49:43','20140915074943',4,6),(22,8355,'2014-09-15 08:08:07','20140915080807',1,6),(23,468,'2014-09-15 15:36:48','20140915033649',1,5);

/*Table structure for table `t_order_product` */

DROP TABLE IF EXISTS `t_order_product`;

CREATE TABLE `t_order_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_323px8t5nllt9l3v8rof6yxjj` (`orderId`),
  KEY `FK_kwtg2jr0df9hmph9fkodtp4oe` (`productId`),
  CONSTRAINT `FK_323px8t5nllt9l3v8rof6yxjj` FOREIGN KEY (`orderId`) REFERENCES `t_order` (`id`),
  CONSTRAINT `FK_kwtg2jr0df9hmph9fkodtp4oe` FOREIGN KEY (`productId`) REFERENCES `t_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `t_order_product` */

insert  into `t_order_product`(`id`,`num`,`orderId`,`productId`) values (3,1,15,26),(4,2,15,40),(5,2,16,38),(6,1,16,87),(7,1,17,25),(8,1,NULL,25),(9,1,NULL,27),(10,2,18,21),(11,2,18,39),(12,3,19,21),(13,2,19,51),(14,2,20,25),(15,2,20,125),(16,2,21,8),(17,2,21,42),(18,2,21,15),(19,2,22,296),(20,1,22,9),(21,2,22,38),(22,1,23,21);

/*Table structure for table `t_product` */

DROP TABLE IF EXISTS `t_product`;

CREATE TABLE `t_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `proPic` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `smallTypeId` int(11) DEFAULT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  `hot` int(11) NOT NULL,
  `hotTime` datetime DEFAULT NULL,
  `specialPrice` int(11) NOT NULL,
  `specialPriceTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_qexns4el8esjqbdrqfys82ih8` (`smallTypeId`),
  KEY `FK_2vciohqujaeij91ujm5va2xs4` (`bigTypeId`),
  CONSTRAINT `FK_2vciohqujaeij91ujm5va2xs4` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`),
  CONSTRAINT `FK_qexns4el8esjqbdrqfys82ih8` FOREIGN KEY (`smallTypeId`) REFERENCES `t_smalltype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8;

/*Data for the table `t_product` */

insert  into `t_product`(`id`,`description`,`name`,`price`,`proPic`,`stock`,`smallTypeId`,`bigTypeId`,`hot`,`hotTime`,`specialPrice`,`specialPriceTime`) values (8,'乐库优2014春装新款中腰蓝色刺绣修身','乐库优2014春装新款中腰蓝色刺绣修身',78,'images/product/5.jpg',65,8,1,1,'2014-01-01 00:00:00',0,'2014-01-01 00:00:00'),(9,'缪佳 春装新款2014女士牛仔裤女小脚','缪佳 春装新款2014女士牛仔裤女小脚',99,'images/product/6.jpg',152,8,1,1,'2014-01-01 00:00:00',0,NULL),(10,'2014春装新款 韩版修身显瘦小脚裤休','2014春装新款 韩版修身显瘦小脚裤休',79,'images/product/7.jpg',52,8,1,1,'2014-01-01 00:00:00',0,NULL),(14,'名驭 牛仔裤女小脚裤韩版潮2014春装','名驭 牛仔裤女小脚裤韩版潮2014春装',79,'images/product/8.jpg',55,8,1,1,'2014-01-01 00:00:00',0,NULL),(15,'皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ','皮尔卡丹 男士牛仔裤 男 直筒 春夏新品 ',199,'images/product/9.jpg',125,8,1,1,'2014-01-01 00:00:00',0,NULL),(16,'Le hondies2014男士白色牛仔裤韩版','Le hondies2014男士白色牛仔裤韩版',129,'images/product/10.jpg',129,8,1,1,'2014-01-01 00:00:00',0,NULL),(17,'夏装新品 唐狮正品男基本修身小脚牛仔','夏装新品 唐狮正品男基本修身小脚牛仔',129,'images/product/11.jpg',129,8,1,1,'2014-01-01 00:00:00',0,NULL),(18,'gxg.1978男装2014新款春装休闲修身','gxg.1978男装2014新款春装休闲修身',229,'images/product/12.jpg',229,7,1,1,'2014-01-01 00:00:00',0,NULL),(19,'罗蒙 休闲西服男士小西装外套商务正装','罗蒙 休闲西服男士小西装外套商务正装',449,'images/product/13.jpg',125,7,1,1,'2013-01-01 00:00:00',0,NULL),(20,'领般【新品】男士西服套装 商务休闲修身西装 男款职业正装结婚礼服 黑色斜纹 外','领般【新品】男士西服套装 ',318,'images/product/14.jpg',318,7,1,0,NULL,1,'2013-01-01 00:00:00'),(21,'货到付款Mr.TA 西服 2014新款男士礼服套 经典 黑色西装 英伦商务修身西服套装 黑','货到付款Mr.TA 西服 ',468,'images/product/15.jpg',468,7,1,0,NULL,1,'2014-01-02 00:00:00'),(25,'【货到付款】圣贝琪　2014韩版夏装黑白经典百搭腰肩花边美观又时尚新款连衣裙 ','经典百搭腰肩花边美观又时尚新款连衣裙 ',168,'images/product/16.jpg',99,6,1,0,NULL,1,'2014-01-01 00:00:00'),(26,'蒲洛妃2014春季新款女装 韩版修身两件套秋款连衣裙 L189 粉色 M','蒲洛妃2014春季新款女装 ',139,'images/product/17.jpg',11,6,1,0,NULL,1,'2014-01-01 00:00:00'),(27,'媞沫 2014春夏品质女装新款圆领桑蚕丝连衣裙大牌真丝连衣裙（支持货到付款)','2014春夏品质女装新款圆领桑蚕丝连衣裙',169,'images/product/18.jpg',55,6,1,0,NULL,1,'2014-01-01 00:00:00'),(38,'佳能（Canon） EOS 600D 单反套机（EF-S 18-55mm f/3.5-5.6 IS II 镜头）','佳能（Canon） EOS 600D 单反套机',3599,'images/product/19.jpg',25,9,2,0,NULL,1,'2014-01-01 00:00:00'),(39,'尼康（Nikon） D3200 单反相机套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜','尼康（Nikon） D3200 单反相机套机',6099,'images/product/20.jpg',45,9,2,0,NULL,1,'2014-01-01 00:00:00'),(40,'佳能（Canon） EOS 5D Mark III 单反机身','佳能（Canon） EOS 5D Mark III 单反机身',22988,'images/product/21.jpg',123,9,2,0,NULL,1,'2014-01-01 00:00:00'),(41,'尼康（Nikon） D3300 单反套机（AF-S DX 18-55mm f/3.5-5.6G VRII尼克尔镜头）','尼康（Nikon） D3300 单反套机',6389,'images/product/22.jpg',123,9,2,0,NULL,1,'2014-01-01 00:00:00'),(42,'佳能（Canon） EOS 1D X 单反机身','佳能（Canon） EOS 1D X 单反机身',5699,'images/product/23.jpg',123,9,2,0,NULL,0,NULL),(43,'佳能（Canon） EOS 700D 单反机身','佳能（Canon） EOS 700D 单反机身',3199,'images/product/24.jpg',485,9,2,0,NULL,0,NULL),(44,'佳能（Canon） 1200D 双镜头套装','佳能（Canon） 1200D 双镜头套装',8999,'images/product/25.jpg',875,9,2,0,NULL,0,NULL),(45,'宾得（PENTAX） K-50/DA L 18-55mmWR 单反套机','宾得（PENTAX） K-50/DA L 18-55mmWR ',4499,'images/product/26.jpg',165,9,2,0,NULL,0,NULL),(46,'佳能（Canon） EOS 6D 单反套机（EF 24-70mm f/4L IS USM 镜头）','佳能（Canon） EOS 6D 单反套机',3199,'images/product/27.jpg',52,9,2,0,NULL,0,NULL),(47,'尼康（Nikon） D3100 单反套机（AF-S DX 18-55mm f/3.5-5.6G VR尼克尔镜头）','尼康（Nikon） D3100 单反套机',5299,'images/product/28.jpg',641,9,2,0,NULL,0,NULL),(48,'佳能（Canon） EOS 100D 单反机身','佳能（Canon） EOS 100D 单反机身',4280,'images/product/29.jpg',46,9,2,0,NULL,0,NULL),(49,'漫步者（EDIFIER） R101V 2.1声道多媒体音箱 黑色','漫步者R101V 2.1声道多媒体音箱 黑色',119,'images/product/30.jpg',465,29,2,0,NULL,0,NULL),(50,'惠威（HiVi）多媒体音箱 M200MKIII 2.0声道HI-FI品质 豪华原木做工','惠威（HiVi）多媒体音箱  豪华原木做工',1785,'images/product/31.jpg',213,29,2,0,NULL,0,NULL),(51,'魅动e族MD-5110音箱 音响 蓝牙音箱 蓝牙音响 无线音箱 低音炮 NFC配对 黑色','魅动e族MD-5110音箱 音响 蓝牙音箱',149,'images/product/32.jpg',456,29,2,0,NULL,0,NULL),(52,'漫步者（EDIFIER） R1600TIII 性能超强大的4吋2.0音箱','漫步者R1600TIII性能超强大的4吋2.0音箱',399,'images/product/33.jpg',55,29,2,0,NULL,0,NULL),(53,'哈曼卡顿harmankardon SoundSticks III 3代 水晶 音箱','哈曼卡顿 III 3代 水晶 音箱',1098,'images/product/34.jpg',331,29,2,0,NULL,0,NULL),(54,'惠威（HiVi）多媒体音箱 M200MKII 2.0声道HI-FI品质','惠威（HiVi）多媒体音箱 2.0声道HI-FI品质',1096,'images/product/35.jpg',456,29,2,0,NULL,0,NULL),(55,'全微（transwin） 全微T-200N 2.1有源多媒体音响 电脑音箱笔记本迷你小重低音炮','全微 全微T-200N 2.1有源多媒体音响 ',69,'images/product/36.jpg',12389,29,2,0,NULL,0,NULL),(56,'漫步者（EDIFIER） R10U 2.0声道 多媒体音箱 黑色','漫步者 R10U 2.0声道 多媒体音箱 黑色',65,'images/product/37.jpg',789,29,2,0,NULL,0,NULL),(57,'dostyle SD306重低音2.1电脑音箱低音炮音响子夜黑','dostyle SD306重低音2.1电脑音箱低音炮音响',239,'images/product/38.jpg',4156,29,2,0,NULL,0,NULL),(59,'漫步者（EDIFIER） R201T12 2.1声道 多媒体音箱 黑色','漫步者 R201T12 2.1声道 多媒体音箱 黑色',198,'images/product/40.jpg',965,29,2,0,NULL,0,NULL),(60,'麦博（microlab） M100(10) 多媒体有源音响 黑色','麦博 M100(10) 多媒体有源音响 黑色',99,'images/product/41.jpg',66,29,2,0,NULL,0,NULL),(62,'漫步者（EDIFIER） R201T08 2.1声道 多媒体音箱 黑色','漫步者 R201T08 2.1声道 多媒体音箱 黑色',189,'images/product/43.jpg',998,29,2,0,NULL,0,NULL),(63,'JBL ONBEATVENLTWHTCN 城市节拍 音乐底座/音箱 全新闪电接口 内置蓝牙 白色','JBL  城市节拍 音乐底座/音箱 全新闪电接口',998,'images/product/44.jpg',651,29,2,0,NULL,0,NULL),(64,'飞利浦(Philips) SBM120SLV/93 便携式插卡音响 FM收音机（银色）','飞利浦 SBM120SLV/93 便携式插卡音响',199,'images/product/45.jpg',456,29,2,0,NULL,0,NULL),(65,'漫步者（EDIFIER） R101T06 2.1声道 多媒体音箱 黑银','漫步者 R101T06 2.1声道 多媒体音箱 黑银',139,'images/product/46.jpg',12376,29,2,0,NULL,0,NULL),(66,'JBL PULSE–炫彩360度LED灯 NFC 便携蓝牙音箱 音乐脉动 黑色','JBL PULSE–炫彩360度LED灯 便携蓝牙音箱',1699,'images/product/47.jpg',8554,29,2,0,NULL,0,NULL),(67,'漫步者（EDIFIER）C2X 外置功放 全木质音箱 黑色','漫步者 C2X 外置功放 全木质音箱 黑色',569,'images/product/48.jpg',66247,29,2,0,NULL,0,NULL),(68,'飞利浦（PHILIPS）DC295/93 iphone5/ipad4/mini/ipod 专用苹果充电底座音响 银','飞利浦 DC295 iphone5/ipad4/mini/ipod 专用',799,'images/product/49.jpg',6245,29,2,0,NULL,0,NULL),(70,'苹果（Apple）iPod touch 4代 16G ME179CH/A 多媒体播放器 白色','苹果（Apple）iPod 16G 多媒体播放器 白色',898,'images/product/50.jpg',1154,30,2,0,NULL,0,NULL),(71,'苹果（APPLE）MD775CH/A IPOD SHUFFLE 2GB/BLUE 蓝色','苹果（APPLE）MD775CH/A 2GB/BLUE 蓝色',328,'images/product/51.jpg',456,30,2,0,NULL,0,NULL),(72,'索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色','索尼（SONY） NWZ-B172F 2G MP3 播放器 黑色',239,'images/product/52.jpg',675,30,2,0,NULL,0,NULL),(73,'苹果（APPLE）MD773CH/A IPOD SHUFFLE 2GB/ PINK粉色','苹果（APPLE）MD773CH/A IPOD 2GB/ PINK粉色',328,'images/product/53.jpg',12,30,2,0,NULL,0,NULL),(74,'苹果（Apple） iPod Nano 7代 16G MD480CH/A 多媒体播放器 银白色','苹果（Apple）16G 多媒体播放器 银白色',998,'images/product/54.jpg',545,30,2,0,NULL,0,NULL),(75,'苹果（APPLE）MD778CH/A IPOD SHUFFLE 2GB/SILVER 银白','苹果（APPLE）MD778CH/A   2GB/SILVER 银白',328,'images/product/55.jpg',85,30,2,0,NULL,0,NULL),(76,'苹果（APPLE）MD776CH/A IPOD SHUFFLE 2GB/GREEN 绿色','苹果（APPLE）MD776CH/A2GB/GREEN 绿色',328,'images/product/56.jpg',65,30,2,0,NULL,0,NULL),(77,'苹果（Apple） iPod Nano 7代 16G MD477CH/A 多媒体播放器 蓝色','苹果（Apple） Nano 7代 16G 多媒体播放器',998,'images/product/57.jpg',123,30,2,0,NULL,0,NULL),(78,'飞利浦（PHILIPS） SA2SPK04SFZ/93 MP3 播放器 4G 银色','飞利浦 SA2SPK04SFZ/93 MP3 播放器 4G 银色',279,'images/product/58.jpg',456,30,2,0,NULL,0,NULL),(79,'苹果（APPLE）MD777CH/A IPOD SHUFFLE 2GB/PURPLE 紫色','苹果（APPLE）MD777CH/A IPOD 2GB/PURPLE 紫色',328,'images/product/59.jpg',456,30,2,0,NULL,0,NULL),(80,'索尼（ SONY）NWZ-B172F MP3 纯白','索尼（ SONY）NWZ-B172F MP3 纯白',239,'images/product/60.jpg',54,30,2,0,NULL,0,NULL),(81,'苹果（Apple） iPod Nano 7代 16G MD476CH/A 多媒体播放器 黄色','苹果（Apple） iPod 16G 多媒体播放器 黄色',998,'images/product/61.jpg',56,30,2,0,NULL,0,NULL),(82,'苹果（Apple） iPod Nano 7代 16G MD479CH/A 多媒体播放器 紫色','苹果（Apple） iPod 16G  多媒体播放器 紫色',998,'images/product/62.jpg',34,30,2,0,NULL,0,NULL),(83,'昂达（onda） VX330 双无损音乐格式+超便携纯音乐夹子+4G MP3 黑色','昂达 VX330 双无损音乐格式+超便携纯音乐夹',99,'images/product/63.jpg',62,30,2,0,NULL,0,NULL),(84,'苹果（Apple） iPod Nano 7代 16GB ME971CH/A 多媒体播放器 深空灰色','苹果（Apple）iPod 7代 16GB 多媒体播放器',998,'images/product/64.jpg',89,30,2,0,NULL,0,NULL),(86,'德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶1L*12','德国 欧德堡 超高温处理全脂纯牛奶1L*12',199,'images/product/66.jpg',45,31,3,0,NULL,0,NULL),(87,'澳大利亚 进口牛奶 德运（Devondale）全脂牛奶礼盒装 1L*6','澳大利亚  德运 全脂牛奶礼盒装 1L*6',99,'images/product/67.jpg',66,31,3,0,NULL,0,NULL),(88,'德国 进口牛奶 德亚（Deyatur）全脂牛奶200ml*30盒','德国 德亚 全脂牛奶200ml*30盒',129,'images/product/68.jpg',199,31,3,0,NULL,0,NULL),(89,'德国 进口牛奶 欧德堡（Oldenburger）超高温处理全脂纯牛奶200ml*20盒','德国 欧德堡超高温处理全脂纯牛奶200ml*20',99,'images/product/69.jpg',299,31,3,0,NULL,0,NULL),(90,'丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 908g 盒装','丹麦进口  蓝罐 曲奇 礼盒 908g 盒装',89,'images/product/70.jpg',399,31,3,0,NULL,0,NULL),(91,'丹麦进口 Kjeldsens 蓝罐 曲奇 礼盒 454g 盒装','丹麦进口  蓝罐 曲奇 礼盒 454g 盒装',58,'images/product/71.jpg',145,31,3,0,NULL,0,NULL),(92,'中国 台湾 蜜兰诺 松塔 12粒装 192克（新老包装随机发送） 盒装','蜜兰诺 松塔 12粒装 192克',17,'images/product/72.jpg',451,31,3,0,NULL,0,NULL),(93,'丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装','丹麦进口 Kjeldsens 蓝罐 曲奇 125g 盒装',10,'images/product/73.jpg',34,31,3,0,NULL,0,NULL),(94,'丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g','丹麦进口 美人鱼（Mermaid） 黄油 曲奇 454g',31,'images/product/74.jpg',415,31,3,0,NULL,0,NULL),(95,'意大利进口FerreroRocher费列罗榛果威化巧克力96粒婚礼装1200g','意大利进口费列罗榛果威化巧克力96粒婚礼装1200g',149,'images/product/75.jpg',3541,31,3,0,NULL,0,NULL),(96,'意大利进口FerreroRocher费列罗榛果威化巧克力16粒装200g','意大利进口费列罗榛果威化巧克力16粒装200g',35,'images/product/76.jpg',4142,31,3,0,NULL,0,NULL),(97,'意大利进口FerreroRocher费列罗榛果威化巧克力32粒钻石装400g','意大利进口费列罗榛果威化巧克力32粒钻石400g',77,'images/product/77.jpg',547,31,3,0,NULL,0,NULL),(98,'进口食品 非国内分装 费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g','费列罗榛果威化金莎巧克力T48粒钻石装礼盒600g',125,'images/product/78.jpg',265,31,3,0,NULL,0,NULL),(99,'新疆特产 一品玉和田大枣四星450g*3袋','新疆特产 一品玉和田大枣四星450g*3袋',75,'images/product/79.jpg',25,32,3,0,NULL,0,NULL),(100,'新疆特产 一品玉和田大枣六星450g*3袋','新疆特产 一品玉和田大枣六星450g*3袋',109,'images/product/80.jpg',45,32,3,0,NULL,0,NULL),(101,'新疆特产 和田玉枣 四星 500g*3袋','新疆特产 和田玉枣 四星 500g*3袋',105,'images/product/81.jpg',123,32,3,0,NULL,0,NULL),(102,'新疆特产 味正品新疆和田大枣箱装2000g','新疆特产 味正品新疆和田大枣箱装2000g',99,'images/product/82.jpg',45,32,3,0,NULL,0,NULL),(103,'稻香村京八件糕点礼盒 北京礼物1200g 北京特产','稻香村京八件糕点礼盒 北京礼物1200g 北京特产',78,'images/product/83.jpg',85,32,3,0,NULL,0,NULL),(104,'北京特产御食园3号大礼包1800g','北京特产御食园3号大礼包1800g',68,'images/product/84.jpg',999,32,3,0,NULL,0,NULL),(105,'北京特产御食园4号大礼包800g','北京特产御食园4号大礼包800g',24,'images/product/85.jpg',456,32,3,0,NULL,0,NULL),(106,'北京特产 御食园大礼包1500g 休闲食品小吃零食','北京特产 御食园大礼包1500g 休闲食品小吃零食',60,'images/product/86.jpg',54,32,3,0,NULL,0,NULL),(107,NULL,'山西特产 维之王山楂凉果408g*2袋',39,'images/product/87.jpg',65,32,3,0,NULL,0,NULL),(108,'冠云 中华老字号 山西特产 平遥牛肉家庭装(200gX3袋)600g','中华老字号 平遥牛肉家庭装(200gX3袋)600g',88,'images/product/88.jpg',65,32,3,0,NULL,0,NULL),(109,'冠云 中华老字号 山西特产 平遥牛肉礼盒(158gX6袋)948g','中华老字号 平遥牛肉礼盒(158gX6袋)948g',152,'images/product/89.jpg',654,32,3,0,NULL,0,NULL),(110,'山西特产 维之王山楂片268g*2袋','山西特产 维之王山楂片268g*2袋',32,'images/product/90.jpg',214,32,3,0,NULL,0,NULL),(111,'武汉特产 周黑鸭鸭脖210g','武汉特产 周黑鸭鸭脖210g',26,'images/product/91.jpg',55,33,3,0,NULL,0,NULL),(112,'中华老字号 重庆老四川金角五香牛肉干138g','中华老字号 重庆老四川金角五香牛肉干138g',25,'images/product/92.jpg',112,33,3,0,NULL,0,NULL),(113,'武汉特产 周黑鸭锁骨300g','武汉特产 周黑鸭锁骨300g',28,'images/product/93.jpg',6211,33,3,0,NULL,0,NULL),(114,'重庆特产 有友泡凤爪山椒味100g*5袋','重庆特产 有友泡凤爪山椒味100g*5袋',22,'images/product/94.jpg',445,33,3,0,NULL,0,NULL),(115,'百草味靖江猪肉脯200g×2袋装靖江特产蜜汁精致猪肉干','百草味靖江猪肉脯200g×2袋装',39,'images/product/95.jpg',123,33,3,0,NULL,0,NULL),(116,'食塘薄皮核桃1000g','食塘薄皮核桃1000g',53,'images/product/96.jpg',415,33,3,0,NULL,0,NULL),(117,'三只松鼠夏威夷果265gx2包奶油味送开口器坚果炒货春季热卖AB1','夏威夷果265gx2包奶油味',37,'images/product/97.jpg',119,33,3,0,NULL,0,NULL),(118,'黄飞红麻辣花生210g','黄飞红麻辣花生210g',9,'images/product/98.jpg',6513,33,3,0,NULL,0,NULL),(119,'楼兰蜜语 新疆纯野生无漂白 薄皮核桃500gx2包 新包装送夹子','楼兰蜜语 新疆薄皮核桃500gx2包',50,'images/product/99.jpg',1341,33,3,0,NULL,0,NULL),(120,'福建特产 友臣 金丝肉松饼208g','福建特产 友臣 金丝肉松饼208g',10,'images/product/100.jpg',4115,33,3,0,NULL,0,NULL),(121,'【包邮】友臣金丝肉松饼整箱2.5kg 约70个 休闲零食品','【包邮】友臣金丝肉松饼整箱2.5kg 约70个',67,'images/product/101.jpg',4141,33,3,0,NULL,0,NULL),(122,'食塘薄皮核桃1000g','食塘薄皮核桃1000g',52,'images/product/102.jpg',123,33,3,0,NULL,0,NULL),(123,'越南进口利葡面包干300g*2袋（Lipo商品名称更换中随机发货）','越南进口利葡面包干300g*2袋',26,'images/product/103.jpg',463,33,3,0,NULL,0,NULL),(124,'索尼（SONY） KDL-47R500A 47英寸 全高清3D LED液晶电视 黑色','索尼（SONY） KDL-47R500A 47英寸 全高清3D',4099,'images/product/104.jpg',78,34,4,0,NULL,0,NULL),(125,'海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核3D安卓智能电视','海尔模卡（MOOKA） U50H7 50英寸 4K极高清8核',4099,'images/product/105.jpg',654,34,4,0,NULL,0,NULL),(126,'海尔模卡（MOOKA） 48A5 48英寸 窄边框安卓智能电视','海尔模卡（MOOKA）48英寸 窄边框安卓智能电视',3999,'images/product/106.jpg',123,34,4,0,NULL,0,NULL),(127,'F3301B 32英寸 窄边蓝光USB播放LED电视(黑色）','TCL 32英寸 窄边蓝光USB播放LED电视(黑色）',2999,'images/product/107.jpg',456,34,4,0,NULL,0,NULL),(128,'飞利浦（PHILIPS） 50PFL3040/T3 50英寸 全高清LED液晶电视(黑色）','飞利浦 50PFL3040/T3 50英寸 全高清LED液晶',1298,'images/product/108.jpg',123,34,4,0,NULL,0,NULL),(129,'夏普（SHARP）LCD-40DS20A 40英寸日本原装面板','夏普 40英寸日本原装面板',3699,'images/product/109.jpg',11,34,4,0,NULL,0,NULL),(130,'飞利浦（PHILIPS） 32PFL3045/T3 32英寸 高清LED液晶电视（黑色）','飞利浦 32PFL3045/T3 32英寸 高清LED液晶电视',2799,'images/product/110.jpg',61,34,4,0,NULL,0,NULL),(131,'康佳（KONKA） LED49K70A KKTV 49英寸网络安卓智能液晶电视(黑色)','康佳 LED49K70A KKTV 49英寸网络安卓智能液晶',2999,'images/product/111.jpg',651,34,4,0,NULL,0,NULL),(132,'康佳（KONKA） LED32E330C 32英寸 高清窄边LED（银色）','康佳 LED32E330C 32英寸 高清窄边LED（银色）',1298,'images/product/112.jpg',654,34,4,0,NULL,0,NULL),(133,'长虹（CHANGHONG） 3D51C2280 51英寸 3D护眼电视（黑色）','长虹 3D51C2280 51英寸 3D护眼电视（黑色）',3699,'images/product/113.jpg',65,34,4,0,NULL,0,NULL),(134,'乐视TV 超级电视（Letv） S50 50英寸 3D 智能LED液晶电视 黑色','乐视TV 超级电视（Letv） S50 50英寸 3D',2799,'images/product/114.jpg',134,34,4,0,NULL,0,NULL),(135,'夏普（SHARP）LCD-46DS20A 46英寸日本原装面板','夏普（SHARP）LCD-46DS20A 46英寸日本原装',1399,'images/product/115.jpg',76,34,4,0,NULL,0,NULL),(136,'索尼（SONY） KDL-60R520A 60英寸 全高清网络 LED液晶电视（黑色）','索尼 KDL-60R520A 60英寸 全高清网络',2999,'images/product/116.jpg',878,34,4,0,NULL,0,NULL),(137,'海信（Hisense）LED50EC310JD 50英寸全网Vision 智能电视（黑色）','海信 LED50EC310JD 50英寸全网Vision ',1298,'images/product/117.jpg',45,34,4,0,NULL,0,NULL),(139,'TCL XQB50-1678NS 5公斤 全自动洗衣机（浅灰色）','TCL XQB50-1678NS 5公斤 全自动洗衣机',818,'images/product/118.jpg',51,35,4,0,NULL,0,NULL),(140,'松下(panasonic) XQB65-Q76201 6.5公斤 全自动波轮洗衣机（灰色）','松下 XQB65-Q76201 6.5公斤 全自动',1499,'images/product/119.jpg',456,35,4,0,NULL,0,NULL),(141,'LG WD-N12435D 6公斤 静音系列滚筒洗衣机（白色）','LG WD-N12435D 6公斤 静音系列滚筒洗衣机',2349,'images/product/120.jpg',1327,35,4,0,NULL,0,NULL),(142,'小天鹅（Little Swan） TB55-V1068 5.5公斤 波轮全自动洗衣机（灰色）','小天鹅（Little Swan） TB55-V1068 5.5公斤',998,'images/product/121.jpg',189,35,4,0,NULL,0,NULL),(143,'海尔（Haier） XQB60-M1269 6公斤 波轮全自动洗衣机','海尔 6公斤 波轮全自动洗衣机',1498,'images/product/122.jpg',1626,35,4,0,NULL,0,NULL),(144,'LG WD-N12430D 6公斤 静音系列滚筒洗衣机（白色）','LG WD-N12430D 6公斤 静音系列滚筒洗衣机',1299,'images/product/123.jpg',741,35,4,0,NULL,0,NULL),(145,'海尔（Haier） XQG60-1000J 6公斤 1000转滚筒洗衣机（瓷白）','海尔 6公斤 1000转滚筒洗衣机（瓷白）',2599,'images/product/124.jpg',1134,35,4,0,NULL,0,NULL),(146,NULL,'容声 BCD-202M/TX6-GF61-C 202升 三门冰箱',1549,'images/product/125.jpg',85,36,4,0,NULL,0,NULL),(147,NULL,'康佳 BCD-138UTS-GY 138升 双门冰箱',898,'images/product/126.jpg',415,36,4,0,NULL,0,NULL),(148,NULL,'美的 BCD-185QM 185升 双门冰箱',1699,'images/product/127.jpg',160,36,4,0,NULL,0,NULL),(289,'极致优雅气质/轻薄垂坠/耗料三层荷叶边大摆/蕾丝拼接封腰式显瘦设计/轻盈旋转梦幻般的清新/精品推荐！','阿卡春装新款蕾丝绣花收腰显瘦中长袖',298,'images/product/1.jpg',99,6,1,0,NULL,0,NULL),(291,'Vero Moda透视拼接修身包边圆领蕾','Vero Moda透视拼接修身包边圆领蕾',499,'images/product/2.jpg',99,6,1,0,NULL,0,NULL),(294,'爱丽缇 2014夏装新款韩版七分袖圆领','爱丽缇 2014夏装新款韩版七分袖圆领',138,'images/product/3.jpg',120,6,1,0,NULL,0,NULL),(296,'太平鸟男装男士休闲格子西装/西服修身','太平鸟男装男士休闲格子西装/西服修身',529,'images/product/4.jpg',15,7,1,1,'2014-09-12 18:32:53',1,'2014-09-12 18:33:10'),(297,'好看的裤子2','时尚裤子',101,'images/product/20140915075456.jpg',10,8,1,1,'2014-09-15 07:55:31',1,'2014-09-15 07:55:36');

/*Table structure for table `t_smalltype` */

DROP TABLE IF EXISTS `t_smalltype`;

CREATE TABLE `t_smalltype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `bigTypeId` int(11) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a9rcrieyoywpcgb1luxsbir8s` (`bigTypeId`),
  CONSTRAINT `FK_a9rcrieyoywpcgb1luxsbir8s` FOREIGN KEY (`bigTypeId`) REFERENCES `t_bigtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `t_smalltype` */

insert  into `t_smalltype`(`id`,`name`,`bigTypeId`,`remarks`) values (6,'连衣裙',1,'1'),(7,'男士西装',1,NULL),(8,'牛仔裤',1,NULL),(9,'相机',2,NULL),(29,'音箱',2,NULL),(30,'MP3/MP4',2,NULL),(31,'进口食品',3,NULL),(32,'地方特产',3,NULL),(33,'休闲食品',3,NULL),(34,'平板电视',4,NULL),(35,'洗衣机',4,NULL),(36,'冰箱',4,NULL);

/*Table structure for table `t_tag` */

DROP TABLE IF EXISTS `t_tag`;

CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_tag` */

insert  into `t_tag`(`id`,`name`,`url`) values (1,'音乐','http://www.java1234.com'),(2,'影视','http://www.baidu.com'),(3,'少儿',NULL),(4,'运动鞋',NULL),(5,'美容护肤',NULL),(6,'家纺用品',NULL),(7,'婴幼奶粉',NULL),(8,'饰品',NULL);

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `birthday` datetime DEFAULT NULL,
  `dentityCode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `trueName` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`birthday`,`dentityCode`,`email`,`mobile`,`password`,`sex`,`status`,`userName`,`trueName`,`address`) values (1,'2014-09-04 00:00:00','411522199407254576','admin@qq.com','13523902576','123456','女',2,'java1234','张三3','郑州22'),(2,'1989-01-01 00:00:00','411522199407254572','123@qq.com','13523902572','123','女',1,'marry','','江苏南京'),(3,'2014-08-05 00:00:00','1','2','3','1','女',1,'f1',NULL,NULL),(4,'2014-09-14 00:00:00','21321','121@123.com','321321321','123','男',1,'jack',NULL,'好地方'),(5,'2014-09-14 00:00:00','411522199407254576','abc@qq.com','13523902576','123','男',1,'tom',NULL,'2321'),(6,'2014-08-31 00:00:00','411522199407254576','123@qq.com','13523902576','123','男',1,'jerry','王二小','江苏南京六合');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
