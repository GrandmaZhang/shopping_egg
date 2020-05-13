# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 8.0.18)
# Database: shopping
# Generation Time: 2019-12-26 10:23:02 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table business
# ------------------------------------------------------------

SET NAMES UTF8;
# 创建数据库
DROP DATABASE IF EXISTS shopping;
CREATE DATABASE shopping CHARSET=UTF8;
USE shopping;

# 建表
DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '''''',
  `income` int(15) DEFAULT '0',
  `sold` json DEFAULT NULL,
  `goodsIds` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table good_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `good_category`;

CREATE TABLE `good_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LOCK TABLES `good_category` WRITE;
/*!40000 ALTER TABLE `good_category` DISABLE KEYS */;

INSERT INTO `good_category` (`id`, `categoryName`, `categoryId`)
VALUES
	(1,'游戏',1),
	(2,'电子产品',2),
	(3,'服装',3),
	(4,'运动健身',4),
	(5,'鞋靴',5),
	(6,'美妆',6),
	(7,'母婴用品',7),
	(8,'生鲜',8),
	(9,'食品',9),
	(10,'医药',10);

/*!40000 ALTER TABLE `good_category` ENABLE KEYS */;
-- UNLOCK TABLES;


# Dump of table goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remain` int(11) NOT NULL DEFAULT '0',
  `url` json DEFAULT NULL,
  `price` float NOT NULL DEFAULT '0',
  `sold` int(11) NOT NULL DEFAULT '0',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  -- `desc` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `categoryId` int(11) DEFAULT NULL,
  `businessId` int(11) DEFAULT '0',
  `isBanner` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;

INSERT INTO `goods` (`id`, `name`, `remain`, `url`, `price`, `sold`, `isDeleted`, `categoryId`, `businessId`, `isBanner`)
VALUES
	(1,'onagrine橙花卸妆油200ml多效植物脸部温和清洁眼唇脸部卸妆液水',500,'[\"https://img.alicdn.com/imgextra/i4/2206703610411/O1CN01idcuZG1EuHNVrvjbt_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',198,1500,0,6,0,0),
	(2,'倩碧小雏菊腮红07/05/15 修容提亮肤色 菊花胭脂 自然',452,'[\"https://img.alicdn.com/imgextra/i3/1653734047/O1CN016y2gWH1flZTU1DU3C_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',130,10000,0,6,0,0),
	(3,'flower knows花知晓猫爪刷化妆刷套刷独家设计肉垫可捏（橘猫款）',254,'[\"https://img.alicdn.com/imgextra/i1/2978644138/O1CN01e9g6Qf1gRFUSIw30O_!!2978644138.jpg_640x640q80_.webp\"]',275,1200,0,6,0,0),
	(4,'【官方正品】阿玛尼大师造型紧颜粉底液高光提亮保湿遮瑕不脱妆',499,'[\"https://img.alicdn.com/imgextra/i2/3527212490/O1CN01uRwyn41UGSnWShjgc_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',630,1168,0,6,0,0),
	(5,'too cool for school涂酷三色修容粉饼阴影盘鼻影粉侧影盘三合一',199,'[\"https://img.alicdn.com/imgextra/i1/2567641357/O1CN01tHfTbJ1LtY2Tt1li3_!!2567641357.jpg_1152x1920Q50s50.jpg_.webp\"]',89,4880,0,6,0,0),
	(6,'【超品预售】TOM FORD幻魅四色眼影盘TF眼影20 03红霞盘 限量回归',65,'[\"https://img.alicdn.com/imgextra/i4/2200676153815/O1CN01pwgfKw1e3JaJIcvOE_!!2200676153815-0-lubanu-s.jpg_1152x1920Q50s50.jpg_.webp\"]',690,6020,0,6,0,0),
	(7,'网纱半身裙中长款女纱裙年夏适合胯大腿粗的裙子太平鸟outlets女',169,'[\"https://img.alicdn.com/imgextra/i1/2201506575764/O1CN01fly7ve1sRxStTD5g1_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',169,9500,0,3,0,0),
	(8,'太平鸟泫雅风修身打底针织衫女2019新款秋冬V领高领条纹长袖T恤女',99,'[\"https://img.alicdn.com/imgextra/i2/112394247/O1CN01IMzGyU1hFAe6UKTqD_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',99,5500,0,3,0,0),
	(9,'C&A温柔复古方领短款长袖衬衫女2020新春夏新款CA200228241-PL',59,'[\"https://img.alicdn.com/bao/uploaded/i2/1944046363/O1CN01053UQc1wsIlKtlMuI_!!1944046363.jpg_1152x1920Q50s50.jpg_.webp\"]',59,45,0,3,0,0),
	(10,'阔腿裤女高腰垂感2020年春秋新款休闲宽松显瘦坠感直筒拖地长裤夏',128,'[\"https://img.alicdn.com/imgextra/i1/3345891932/O1CN010zkemb1Q8tmfOEkUz_!!3345891932.jpg_1152x1920Q50s50.jpg_.webp\"]',138,3231,0,3,0,0),
	(11,'法式内衣女薄款大胸显小胸罩性感蕾丝背心式文胸无钢圈Bralette',188,'[\"https://img.alicdn.com/imgextra/i1/277827631/O1CN01EQZgzL26F2xHAQheJ_!!277827631.jpg_1152x1920Q50s50.jpg_.webp\"]',68,1500,0,3,0,0),
	(12,'太平鸟牛仔裤女直筒宽松老爹裤夏季2020年新款高腰休闲哈伦牛仔裤',129,'[\"https://img.alicdn.com/imgextra/i2/112394247/O1CN017pRrCk1hFAgDC2Gwx_!!112394247.jpg_1152x1920Q50s50.jpg_.webp\"]',249.9,2234,0,3,0,0),
	(13,'亿滋奥利奥696g原味巧克力味夹心饼干独立小包装儿童休闲零食盒装',465,'[\"https://img.alicdn.com/imgextra/i1/787936378/O1CN01eWuHiC1wzAgMNCZCp_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',33.9,5500,0,9,0,0),
	(14,'英国原装进口 Walker’s沃尔克斯什锦味太妃糖喜糖儿童糖果1.25kg',4568,'[\"https://img.alicdn.com/imgextra/i1/1985519698/O1CN01ua9q4z2LVjdPkmMIv_!!1985519698.jpg_1152x1920Q50s50.jpg_.webp\"]',59,123,0,9,0,0),
	(15,'金丝猴 圆柱牛奶糖原味500g散装喜糖结婚婚庆糖果儿时怀旧零食',1,'[\"https://img.alicdn.com/imgextra/i1/4084203199/O1CN01CdHM121ZVBaPkUYhN_!!4084203199.jpg_1152x1920Q50s50.jpg_.webp\"]',9.9,654,0,9,0,0),
	(16,'法国进口马苏大师芝士碎2kg 拉丝马苏里拉奶酪起司做披萨用的材料',1234,'[\"https://img.alicdn.com/imgextra/i1/3015107655/O1CN01rz9DSP26Q2Tplmp3o_!!3015107655-0-pixelsss.jpg_1152x1920Q50s50.jpg_.webp\"]',95,4560,0,9,0,0),
	(17,'雀巢咖啡COLD BREW即饮咖啡冷萃拿铁/美式/摩卡味280ml*15整箱装',59,'[\"https://img.alicdn.com/imgextra/i4/2206411980214/O1CN017JcIWI1DS3M2VOaCg_!!2206411980214.jpg_1152x1920Q50s50.jpg_.webp\"]',179.9,1234,0,9,0,0),
	(18,'韩国方便面 农心香菇牛肉辛拉面120克×30袋包装 多省中通包邮',19,'[\"https://img.alicdn.com/imgextra/i4/2033991899/O1CN01c2wGUH1PtmiA7tl7V_!!2033991899.jpg_640x640q80_.webp\"]',135,47465,0,9,0,0),
	(19,'克洛斯威羽毛球拍正品双拍2支套装全碳素超轻成人单拍进攻耐用型',46615,'[\"https://img.alicdn.com/imgextra/i1/2058921492/O1CN01Mbyh1n1MtNVwt40ty_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',89,6543,0,4,0,0),
	(21,'哑铃男士健身家用器材可调节重量拆卸初学者电镀盒装杠铃壶铃一对',26,'[\"https://img.alicdn.com/imgextra/i2/2254938626/O1CN01N4Mzol2Dal2bU5yTD_!!2254938626.jpg_1152x1920Q50s50.jpg_.webp\"]',59,63,0,4,0,0),
	(22,'李宁大框泳镜女高清防水防雾游泳眼镜泳帽套装男儿童护目装备全套',465,'[\"https://img.alicdn.com/imgextra/i3/2769363179/O1CN01rfM4UW1ZM1gqcmn2U_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',65,498,0,4,0,0),
	(23,'悦步男士健身垫初学者瑜伽垫子加厚加宽加长防滑运动瑜珈地垫家用',456,'[\"https://img.alicdn.com/imgextra/i4/1745659439/O1CN01g7mPAS2Jb73pYJd2h_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',18.9,564,0,4,0,0),
	(24,'美国汉臣HARISON椭圆机家用静音磁控椭圆仪健身房漫步机E1506PLUS',21,'[\"https://img.alicdn.com/imgextra/i3/2455160817/O1CN013P5ihG1HuEBEyAe4r_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',9980,0,0,4,0,0),
	(25,'【粤鄂同心  顺丰发货】良仁潜江麻辣小龙虾熟食34-50只 750g*2盒',456,'[\"https://img.alicdn.com/imgextra/i2/2200694352566/O1CN01I5b54J1UpGttoehEc_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',129,4564,0,8,0,0),
	(26,'??御牛满地澳洲进口原肉整切牛排新鲜黑椒10片菲力西冷牛肉扒20',48,'[\"https://img.alicdn.com/imgextra/i3/2200676033145/O1CN01iiVsXK1Z6SCCUH7lj_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',228,25000,0,8,0,0),
	(27,'山东烟台大樱桃新鲜孕妇水果国产车厘子红灯5斤当季包邮大连助农',85,'[\"https://img.alicdn.com/imgextra/i2/2200816311284/O1CN01YEppYn1LM78xi1F0x_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',59,7500,0,6,0,0),
	(28,'泰国金枕头榴莲新鲜水果当季特产现摘巴掌榴莲包邮带壳2-10斤一箱',138,'[\"https://img.alicdn.com/imgextra/i3/2206699507022/O1CN01BSKSkE21k7lrHA4D4_!!2206699507022.jpg_1152x1920Q50s50.jpg_.webp\"]',70.8,1770,0,6,0,0),
	(29,'思卡琪马丁靴女英伦风时尚帅气前系带短靴子2019秋冬新款大码女鞋',564,'[\"https://img.alicdn.com/imgextra/i1/772948600/O1CN019L2GZI2DOqkv3KCUy_!!772948600.jpg_1152x1920Q50s50.jpg_.webp\"]',458,14,0,5,0,0),
	(30,'2020新款男鞋夏季透气英伦风潮流男士休闲皮鞋商务真皮豆豆鞋春季',864,'[\"https://img.alicdn.com/imgextra/i3/2935730488/O1CN01IsMPXm1FTXrcSN9G0_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',99,465,0,5,0,0),
	(31,'CONVERSE匡威官方 All Star  Pocket 复古个性帆布鞋 167043C',64,'[\"https://img.alicdn.com/imgextra/i3/1046707508/O1CN01Jjlcho25KiF50lT1h_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',469,156,0,5,0,0),
	(32,'布洛克雕花男鞋真皮圆头厚底正装皮鞋男商务鞋婚鞋英伦休闲皮鞋潮',589,'[\"https://img.alicdn.com/imgextra/i1/1965733040/TB2Bkbxpb3nBKNjSZFMXXaUSFXa_!!1965733040.jpg_1152x1920Q50s50.jpg_.webp\"]',358,58,0,5,0,0),
	(33,'HM 女鞋时装鞋女鞋子2020春装新款凉鞋女仙女风 0872011鞋',138,'[\"https://img.alicdn.com/imgextra/i4/3676232520/O1CN012EY5JB1UUCgKHbmW8_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',249,1380,0,5,0,0),
	(34,'Leica/徕卡 V-LUX 5数码相机 超大变焦镜头 全新升级 黑色19120',465,'[\"https://img.alicdn.com/imgextra/i1/2874484355/O1CN01CyKdZ71i2dSec6Azu_!!2874484355-0-pixelsss.jpg_1152x1920Q50s50.jpg_.webp\"]',9600,453,0,2,0,0),
	(35,'苹果airpods2充电仓华强北洛达1536U终极版蓝牙耳机无线充电盒单只3ipods二代air原装pro蓝牙三1一代正品耳麦',5464,'[\"https://img.alicdn.com/imgextra/i2/2268991510/O1CN01ggjmRv1N1ceb0skAq_!!2268991510.jpg_1152x1920Q50s50.jpg_.webp\"]',1099,4815,0,2,0,0),
	(36,'VOSSTR殴姆珑智能手环监测血压心率AI心电图语音声控拨号通话房颤心跳心脏报警睡眠防水男女老人华为苹果OPPO',189,'[\"https://img.alicdn.com/imgextra/i2/2201242878521/O1CN01J9ab2R2CofTJoNV3t_!!2201242878521.jpg_1152x1920Q50s50.jpg_.webp\"]',179,454,0,2,0,0),
	(37,'富士instax mini9 一次成像相机立拍立得 Pocky & instax联名礼盒',56,'[\"https://img.alicdn.com/imgextra/i2/1019803011/O1CN01dpGNH21Y759K7wlUJ_!!1019803011.jpg_1152x1920Q50s50.jpg_.webp\"]',309,48,0,2,0,0),
	(38,'日本参天FX NEO清凉型眼药水银瓶滴眼液舒缓疲劳眼充血12ml成人',54,'[\"https://img.alicdn.com/imgextra/i2/2549841410/O1CN01FkO6wJ1MHp37BRov4_!!2549841410-0-sm.jpg_1152x1920Q50s50.jpg_.webp\"]',78,158,0,10,0,0),
	(39,'儿童止咳感冒药明仁小儿解感颗粒2g*8袋/盒鼻塞咽喉肿痛咳嗽冲剂',48,'[\"https://img.alicdn.com/imgextra/i2/2928278102/O1CN01nTKiEw29ilTiDp5th_!!2928278102-0-sm.jpg_1152x1920Q50s50.jpg_.webp\"]',19.9,456,0,10,0,0),
	(40,'本草纲目川贝雪梨糖浆100ml止咳药清肺润肺肺热咳嗽风热感冒咽痛',816,'[\"https://img.alicdn.com/imgextra/i4/2928278102/O1CN01mllTvp29ilTjAQXpC_!!2928278102-0-sm.jpg_1152x1920Q50s50.jpg_.webp\"]',28.6,484,0,10,0,0),
	(41,'3瓶装水仙牌风油精9ml清凉驱风止痒蚊虫叮咬正品驱蚊',85,'[\"https://img.alicdn.com/imgextra/i2/2928278102/O1CN016NohKF29ilWLcmFqh_!!2928278102-0-sm.jpg_1152x1920Q50s50.jpg_.webp\"]',18.7,181,0,10,0,0),
	(42,'PS4 神海 神秘海域 DLC 失落的遗产 UNCHARTED 现货',500,'[\"https://img.alicdn.com/imgextra/i4/305920714/O1CN01foOSHR1H93N7JiGVc_!!305920714.jpg_640x640q80_.webp\"]',1.65,1500,0,1,0,0),
	(43,'switch游戏 煮糊了2 分手厨房2 胡闹厨房2 中文正版 ns游戏卡 全新现货 支持双人',500,'[\"https://img.alicdn.com/imgextra/i2/3946743952/O1CN01mn1GKj1f43o228OAw_!!0-item_pic.jpg_1152x1920Q50s50.jpg_.webp\"]',0.01,1500,0,1,0,0),
	(44,'童泰贝康三角巾尿片一次性婴儿T型纸尿片隔尿垫新生宝宝免洗尿布',500,'[\"https://img.alicdn.com/imgextra/i1/2200865257350/O1CN01ksGmAe24ALcoAcmAa_!!2200865257350.jpg_1152x1920Q50s50.jpg_.webp\"]',54.5,1500,0,7,0,0),
	(45,'dicobaby新生婴儿玻璃奶瓶宽口径宝宝防胀气仿母乳喝水杯断奶神器',500,'[\"https://img.alicdn.com/imgextra/i3/2206797005034/O1CN01yLWOTz1n3cNvCyENF_!!2206797005034.jpg_1152x1920Q50s50.jpg_.webp\"]',58,1500,0,7,0,0);

/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
-- UNLOCK TABLES;


# Dump of table banners
# ------------------------------------------------------------

DROP TABLE IF EXISTS `banners`;

CREATE TABLE `banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `banners` (`id`, `name`, `url`)
VALUES
	(42,'轮播图1','[\"https://img.alicdn.com/simba/img/TB1lnsFxEY1gK0jSZFCSuwwqXXa.jpg_q50.jpg\"]'),
	(43,'轮播图2','[\"https://img.alicdn.com/simba/img/TB1GOb7B.Y1gK0jSZFCSuwwqXXa.jpg_q50.jpg\"]'),
	(44,'轮播图3','[\"https://img.alicdn.com/imgextra/i2/54/O1CN01MiRxen1CGlz3x3EmD_!!54-0-luban.jpg\"]'),
	(45,'轮播图3','[\"https://img.alicdn.com/imgextra/i4/143/O1CN01MXejyy1CvXEaaMsSH_!!143-0-luban.jpg\"]'),
	(46,'轮播图3','[\"https://img.alicdn.com/imgextra/i2/182/O1CN010Lwx1X1DDOgEGP2Y5_!!182-0-luban.jpg\"]');

# Dump of table orders
# ------------------------------------------------------------

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NULL DEFAULT NULL,
  `finishTime` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `goods` json DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;

INSERT INTO `orders` (`id`, `createTime`, `finishTime`, `status`, `goods`, `userId`)
VALUES
	(40,'2019-12-26 15:28:50',NULL,4,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(41,'2019-12-26 15:28:50',NULL,3,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(43,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(44,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(45,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(46,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(47,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(48,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(49,'2019-12-26 15:28:50',NULL,0,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(50,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7),
	(51,'2019-12-26 15:28:50',NULL,1,'[{\"id\": 16, \"url\": [\"https://img.alicdn.com/imgextra/i4/3395371069/O1CN01lMqV9M1Jldv21fooA_!!3395371069.jpg\"], \"name\": \"芝士片\", \"price\": 19.9, \"goodsNumber\": 1}]',7);

/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
-- UNLOCK TABLES;


# Dump of table shopping_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `shopping_cart`;

CREATE TABLE `shopping_cart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `goodsNumber` int(11) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT NULL,
  `expireTime` timestamp NULL DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `orderIds` json DEFAULT NULL,
  `money` int(255) DEFAULT '1000',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `orderIds`, `money`, `password`)
VALUES
	(6,'pengzefan',NULL,100,'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92'),
	(7,'1234','[38]',86,'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4'),
	(8,'1111',NULL,100,'f6e0a1e2ac41945a9aa7ff8a8aaa0cebc12a3bcc981a929ad5cf810a090e11ae');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
-- UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
