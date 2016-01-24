-- MySQL dump 10.13  Distrib 5.1.63, for unknown-linux-gnu (x86_64)
--
-- Host: localhost    Database: admin
-- ------------------------------------------------------
-- Server version	5.1.63

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
-- Table structure for table `qw_article`
--

DROP TABLE IF EXISTS `qw_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) unsigned NOT NULL COMMENT '时间',
  `n` int(10) unsigned NOT NULL COMMENT '点击',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_article`
--

LOCK TABLES `qw_article` WRITE;
/*!40000 ALTER TABLE `qw_article` DISABLE KEYS */;
INSERT INTO `qw_article` VALUES (1,2,'3','','333333333','','3333333333333444',1453552375,0);
/*!40000 ALTER TABLE `qw_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_auth_group`
--

DROP TABLE IF EXISTS `qw_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_auth_group`
--

LOCK TABLES `qw_auth_group` WRITE;
/*!40000 ALTER TABLE `qw_auth_group` DISABLE KEYS */;
INSERT INTO `qw_auth_group` VALUES (1,'超级管理员',1,'1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54'),(2,'管理员',1,'1,2,3,4,5,6'),(3,'普通用户',1,'1'),(6,'333',1,'1,2');
/*!40000 ALTER TABLE `qw_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_auth_group_access`
--

DROP TABLE IF EXISTS `qw_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_auth_group_access`
--

LOCK TABLES `qw_auth_group_access` WRITE;
/*!40000 ALTER TABLE `qw_auth_group_access` DISABLE KEYS */;
INSERT INTO `qw_auth_group_access` VALUES (1,1),(2,6);
/*!40000 ALTER TABLE `qw_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_auth_rule`
--

DROP TABLE IF EXISTS `qw_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '1',
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_auth_rule`
--

LOCK TABLES `qw_auth_rule` WRITE;
/*!40000 ALTER TABLE `qw_auth_rule` DISABLE KEYS */;
INSERT INTO `qw_auth_rule` VALUES (1,0,'Index/index','控制台','menu-icon fa fa-tachometer',1,1,'',1,0),(2,0,'','系统设置','menu-icon fa fa-cog',1,1,'',1,0),(3,2,'Setting/setting','网站设置','menu-icon fa fa-caret-right',1,1,'',1,0),(4,2,'Menu/index','后台菜单','menu-icon fa fa-caret-right',1,1,'',1,0),(5,2,'Menu/add','新增菜单','menu-icon fa fa-caret-right',1,1,'',1,0),(6,4,'Menu/edit','编辑菜单','',1,1,'',0,0),(7,2,'Menu/update','保存菜单','menu-icon fa fa-caret-right',1,1,'',0,0),(8,2,'Menu/del','删除菜单','menu-icon fa fa-caret-right',1,1,'',0,0),(9,2,'Database/backup','数据库备分','menu-icon fa fa-caret-right',1,1,'',1,0),(10,2,'Database/recovery','数据库还原','',1,1,'',0,0),(11,2,'Update/update','在线升级','menu-icon fa fa-caret-right',1,1,'',1,0),(12,2,'Update/devlog','开发日志','menu-icon fa fa-caret-right',1,1,'',1,0),(13,0,'','用户及组','menu-icon fa fa-users',1,1,'',1,0),(14,13,'Member/index','用户管理','menu-icon fa fa-caret-right',1,1,'',1,0),(15,13,'Member/add','新增用户','menu-icon fa fa-caret-right',1,1,'',1,0),(16,13,'Member/edit','编辑用户','menu-icon fa fa-caret-right',1,1,'',0,0),(17,13,'Member/update','保存用户','menu-icon fa fa-caret-right',1,1,'',0,0),(18,13,'Member/del','删除用户','',1,1,'',0,0),(19,13,'Group/index','用户组管理','menu-icon fa fa-caret-right',1,1,'',1,0),(20,13,'Group/add','新增用户组','menu-icon fa fa-caret-right',1,1,'',1,0),(21,13,'Group/edit','编辑用户组','menu-icon fa fa-caret-right',1,1,'',0,0),(22,13,'Group/update','保存用户组','menu-icon fa fa-caret-right',1,1,'',0,0),(23,13,'Group/edit','删除用户组','',1,1,'',0,0),(24,0,'','网站内容','menu-icon fa fa-desktop',1,1,'',1,0),(25,24,'Article/index','文章管理','menu-icon fa fa-caret-right',1,1,'',1,0),(26,24,'Article/add','新增文章','menu-icon fa fa-caret-right',1,1,'',1,0),(27,24,'Article/edit','编辑文章','menu-icon fa fa-caret-right',1,1,'',0,0),(29,24,'Article/update','保存文章','menu-icon fa fa-caret-right',1,1,'',0,0),(30,24,'Article/del','删除文章','',1,1,'',0,0),(31,24,'Category/index','分类管理','menu-icon fa fa-caret-right',1,1,'',1,0),(32,24,'Category/add','新增分类','menu-icon fa fa-caret-right',1,1,'',1,0),(33,24,'Category/edit','编辑分类','menu-icon fa fa-caret-right',1,1,'',0,0),(34,24,'Category/update','保存分类','menu-icon fa fa-caret-right',1,1,'',0,0),(36,24,'Category/del','删除分类','',1,1,'',0,0),(37,0,'','其它功能','menu-icon fa fa-legal',1,1,'',1,0),(38,37,'Link/index','友情链接','menu-icon fa fa-caret-right',1,1,'',1,0),(39,37,'Link/add','增加链接','',1,1,'',1,0),(40,37,'Link/edit','编辑链接','',1,1,'',0,0),(41,37,'Link/update','保存链接','',1,1,'',0,0),(42,37,'Link/del','删除链接','',1,1,'',0,0),(43,37,'Flash/index','焦点图','menu-icon fa fa-desktop',1,1,'',1,0),(44,37,'Flash/add','新增焦点图','',1,1,'',1,0),(45,37,'Flash/update','保存焦点图','',1,1,'',0,0),(46,37,'Flash/edit','编辑焦点图','',1,1,'',0,0),(47,37,'Flash/del','删除焦点图','',1,1,'',0,0),(48,0,'Personal/index','个人中心','menu-icon fa fa-user',1,1,'',1,0),(49,48,'Personal/profile','个人资料','menu-icon fa fa-user',1,1,'',1,0),(50,48,'Logout/index','退出','',1,1,'',1,0),(51,9,'Database/export','备分','',1,1,'',0,0),(52,9,'Database/optimize','数据优化','',1,1,'',0,0),(53,9,'Database/repair','修复表','',1,1,'',0,0),(54,11,'Update/updating','升级安装','',1,1,'',0,0);
/*!40000 ALTER TABLE `qw_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_category`
--

DROP TABLE IF EXISTS `qw_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_category`
--

LOCK TABLES `qw_category` WRITE;
/*!40000 ALTER TABLE `qw_category` DISABLE KEYS */;
INSERT INTO `qw_category` VALUES (2,0,'3333','','',222);
/*!40000 ALTER TABLE `qw_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_devlog`
--

DROP TABLE IF EXISTS `qw_devlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_devlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v` varchar(225) NOT NULL COMMENT '版本号',
  `y` int(4) NOT NULL COMMENT '年分',
  `t` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_devlog`
--

LOCK TABLES `qw_devlog` WRITE;
/*!40000 ALTER TABLE `qw_devlog` DISABLE KEYS */;
INSERT INTO `qw_devlog` VALUES (1,'1.0.0',2015,1440259200,'QWADMIN第一个版本发布。'),(2,'1.0.1',2015,1443024000,'1、新增用户权限控制。'),(3,'1.0.2',2015,1443110400,'  新增\r\n    1、新增用户列表搜索功能。\r\n    2、后台新增用户添加功能。\r\n  修改\r\n    1、调整左侧栏。'),(4,'1.0.3',2015,1443715200,'修改后台图片上传功能。'),(5,'1.0.4',2016,1453390365,'1、修改后台目录为Qwadmin；\r\n2、后台日志仅保留60日；\r\n3、网站统计代码改为底部内容；\r\n4、修复IE11在线升级文字一直转圈的bug；\r\n5、重写并合并部分方法及模板；\r\n6、图片上传更改；\r\n7、新增时间线记开发日志。');
/*!40000 ALTER TABLE `qw_devlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_flash`
--

DROP TABLE IF EXISTS `qw_flash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  `s` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_flash`
--

LOCK TABLES `qw_flash` WRITE;
/*!40000 ALTER TABLE `qw_flash` DISABLE KEYS */;
/*!40000 ALTER TABLE `qw_flash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_links`
--

DROP TABLE IF EXISTS `qw_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_links`
--

LOCK TABLES `qw_links` WRITE;
/*!40000 ALTER TABLE `qw_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `qw_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_log`
--

DROP TABLE IF EXISTS `qw_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `t` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_log`
--

LOCK TABLES `qw_log` WRITE;
/*!40000 ALTER TABLE `qw_log` DISABLE KEYS */;
INSERT INTO `qw_log` VALUES (1,'admin',1453462676,'139.203.0.171','登录成功。'),(2,'admin',1453465464,'139.203.0.171','登录成功。'),(3,'admin',1453467312,'119.164.177.5','登录成功。'),(4,'admin',1453474300,'119.164.177.5','备份完成！'),(5,'admin',1453546943,'123.232.234.200','登录失败。'),(6,'admin',1453546956,'123.232.234.200','登录失败。'),(7,'admin',1453546965,'123.232.234.200','登录失败。'),(8,'admin',1453546986,'123.232.234.200','登录失败。'),(9,'admin',1453546994,'123.232.234.200','登录成功。'),(10,'admin',1453549119,'123.232.234.200','新增用户组：111'),(11,'admin',1453549137,'123.232.234.200','新增用户组：22'),(12,'admin',1453549212,'123.232.234.200','删除用户组ID：5'),(13,'admin',1453549214,'123.232.234.200','删除用户组ID：4'),(14,'admin',1453549241,'123.232.234.200','新增用户组：333'),(15,'admin',1453549246,'123.232.234.200','新增用户组：33'),(16,'admin',1453549540,'123.232.234.200','编辑用户组，ID：1，组名：超级管理员333'),(17,'admin',1453549543,'123.232.234.200','编辑用户组，ID：1，组名：超级管理员'),(18,'admin',1453551729,'123.232.234.200','新增分类，ID：1，名称：3333'),(19,'admin',1453551930,'123.232.234.200','删除分类，ID：1'),(20,'admin',1453551963,'123.232.234.200','新增分类，ID：2，名称：3333'),(21,'admin',1453552365,'123.232.234.200','新增文章，AID：1'),(22,'admin',1453552375,'123.232.234.200','编辑文章，AID：1'),(23,'admin',1453556956,'222.213.140.136','登录成功。'),(24,'admin',1453559230,'222.213.140.136','登录成功。'),(25,'admin',1453560410,'222.213.140.136','登录成功。'),(26,'admin',1453560810,'222.213.140.136','编辑用户组，ID：1，组名：超级管理员'),(27,'admin',1453560817,'222.213.140.136','编辑用户组，ID：1，组名：超级管理员'),(28,'admin',1453570510,'123.232.234.200','删除用户组ID：7'),(29,'admin',1453607970,'123.232.234.200','新增用户：test1'),(30,'test',1453608004,'123.232.234.200','登录失败。'),(31,'test',1453608014,'123.232.234.200','登录失败。'),(32,'test1',1453608032,'123.232.234.200','登录成功。'),(33,'admin',1453608042,'123.232.234.200','编辑用户组，ID：6，组名：333'),(34,'test1',1453608058,'123.232.234.200','登录成功。'),(35,'admin',1453608064,'123.232.234.200','编辑用户组，ID：6，组名：333'),(36,'admin',1453608491,'123.232.234.200','编辑用户组，ID：6，组名：333'),(37,'admin',1453608776,'123.232.234.200','编辑用户组，ID：6，组名：333'),(38,'admin',1453609338,'123.232.234.200','编辑用户组，ID：6，组名：333'),(39,'admin',1453621896,'182.141.108.106','登录成功。'),(40,'admin',1453622777,'182.141.108.106','编辑菜单，ID：6'),(41,'admin',1453622794,'182.141.108.106','编辑菜单，ID：6'),(42,'admin',1453622913,'182.141.108.106','编辑菜单，ID：6'),(43,'admin',1453625466,'182.141.108.106','编辑菜单，ID：10'),(44,'admin',1453625697,'182.141.108.106','新增菜单，名称：备分'),(45,'admin',1453626241,'182.141.108.106','编辑用户组，ID：1，组名：超级管理员'),(46,'admin',1453626762,'182.141.108.106','还原完成！'),(47,'admin',1453627329,'182.141.109.44','新增菜单，名称：升级安装'),(48,'admin',1453627341,'182.141.109.44','编辑用户组，ID：1，组名：超级管理员'),(49,'admin',1453631224,'123.232.234.200','编辑菜单，ID：49'),(50,'admin',1453631245,'123.232.234.200','编辑菜单，ID：49'),(51,'admin',1453631248,'123.232.234.200','编辑菜单，ID：49'),(52,'admin',1453631254,'123.232.234.200','编辑菜单，ID：49'),(53,'admin',1453631258,'123.232.234.200','编辑菜单，ID：49'),(54,'admin',1453631269,'123.232.234.200','编辑菜单，ID：49'),(55,'admin',1453631274,'123.232.234.200','编辑菜单，ID：49'),(56,'admin',1453631294,'123.232.234.200','编辑菜单，ID：49'),(57,'admin',1453631332,'123.232.234.200','编辑菜单，ID：49'),(58,'admin',1453631625,'123.232.234.200','编辑菜单，ID：49'),(59,'admin',1453631722,'123.232.234.200','编辑菜单，ID：49'),(60,'admin',1453631866,'182.141.109.44','编辑菜单，ID：48'),(61,'admin',1453631882,'182.141.109.44','编辑菜单，ID：48'),(62,'admin',1453631886,'182.141.109.44','编辑菜单，ID：48'),(63,'admin',1453640832,'123.232.234.200','编辑菜单，ID：48');
/*!40000 ALTER TABLE `qw_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_member`
--

DROP TABLE IF EXISTS `qw_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(225) NOT NULL,
  `head` varchar(255) NOT NULL COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL,
  `t` int(10) unsigned NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_member`
--

LOCK TABLES `qw_member` WRITE;
/*!40000 ALTER TABLE `qw_member` DISABLE KEYS */;
INSERT INTO `qw_member` VALUES (1,'admin','/Public/attached/201601/1453389194.png',1,1420128000,'13800138000','331349451','xieyanwei@qq.com','66d6a1c8748025462128dc75bf5ae8d1',1442505600),(2,'test1','',0,0,'','','','0fa5933c7d220e1334ba99d6f751074c',1453607970);
/*!40000 ALTER TABLE `qw_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qw_setting`
--

DROP TABLE IF EXISTS `qw_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qw_setting` (
  `k` varchar(100) NOT NULL COMMENT '变量',
  `v` varchar(255) NOT NULL COMMENT '值',
  KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qw_setting`
--

LOCK TABLES `qw_setting` WRITE;
/*!40000 ALTER TABLE `qw_setting` DISABLE KEYS */;
INSERT INTO `qw_setting` VALUES ('sitename','恰维管理系统'),('title','QWADMIN'),('keywords','关键词一,关键词二'),('description','网站描述'),('footer','2016&copy;恰维网络');
/*!40000 ALTER TABLE `qw_setting` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-24 21:24:27
