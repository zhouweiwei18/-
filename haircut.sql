/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : haircut

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2020-01-22 22:05:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `business`
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business` (
  `businessname` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `telephone` bigint(20) DEFAULT NULL COMMENT '商家联系电话',
  `address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `boss` varchar(255) DEFAULT NULL COMMENT '商家',
  `signuptime` datetime DEFAULT NULL COMMENT '成立时间',
  `onwork` datetime DEFAULT NULL COMMENT '上班时间',
  `offwork` datetime DEFAULT NULL COMMENT '下班时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES ('晓庄理发', '15950507893', '南京晓庄学院', 'admin', '2016-01-01 21:03:37', '2020-01-22 08:30:00', '2020-01-22 21:00:00');

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL COMMENT '顾客姓名',
  `cpassword` varchar(255) DEFAULT NULL COMMENT '顾客密码',
  `sex` int(11) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '顾客年龄',
  `telephone` bigint(20) DEFAULT NULL COMMENT '手机号',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `signuptime` datetime DEFAULT NULL COMMENT '注册日期',
  `memberid` varchar(255) DEFAULT NULL COMMENT '会员卡号',
  `roleid` int(11) DEFAULT NULL COMMENT '客户角色',
  PRIMARY KEY (`id`),
  KEY `memberid` (`memberid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`memberid`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', '张伟', '2020zw', '1', '27', '15950507893', '2010-06-01 20:15:20', '2020-01-21 20:15:40', null, '3');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `empname` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `images` varchar(255) DEFAULT NULL COMMENT '雇员头像',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `telephone` bigint(20) DEFAULT NULL COMMENT '手机号',
  `salary` int(11) DEFAULT NULL COMMENT '员工工资',
  `birthday` datetime DEFAULT NULL COMMENT '员工生日',
  `positionid` int(11) DEFAULT NULL COMMENT '职位id',
  `royalty` int(11) DEFAULT NULL COMMENT '工资提成',
  `roleid` int(11) DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`),
  KEY `positionid` (`positionid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`positionid`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '李荣浩', '123456', null, '35', null, '4500', '2020-01-01 00:00:00', '1', '200', '2');
INSERT INTO `employee` VALUES ('2', '诸葛大力', '16130122', null, '23', null, '3600', '2020-01-08 00:00:00', '3', '300', '2');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(255) NOT NULL COMMENT '会员卡号',
  `signuptime` datetime DEFAULT NULL COMMENT '开卡日期',
  `balance` int(11) DEFAULT NULL COMMENT '卡内余额',
  `lasttime` datetime DEFAULT NULL COMMENT '上次访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('affdsfdgrd', '2020-01-15 20:17:51', '300', '2020-01-21 20:18:03');
INSERT INTO `member` VALUES ('tytyiugvvvy', '2019-12-03 20:19:24', '1000', '2020-01-17 20:19:38');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` varchar(255) NOT NULL COMMENT '订单id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '订单状态：0：未完成；1：完成',
  `cost` int(11) DEFAULT NULL COMMENT '消费金额',
  `customerid` int(11) DEFAULT NULL COMMENT '消费者信息',
  `online` int(11) DEFAULT NULL COMMENT '是否未线上消费:0：不是；1：是',
  PRIMARY KEY (`oid`),
  KEY `customerid` (`customerid`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`customerid`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('20200122', '2020-01-09 20:25:45', '1', '300', '1', '0');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `pname` varchar(255) DEFAULT '' COMMENT '职位名称',
  `psalary` int(11) DEFAULT NULL COMMENT '职位薪资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '理发师', '3500');
INSERT INTO `position` VALUES ('2', '烫发师', '4500');
INSERT INTO `position` VALUES ('3', '染发师', '4000');
INSERT INTO `position` VALUES ('4', '植发师', '5000');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品序号',
  `proname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `proprice` int(11) DEFAULT NULL COMMENT '商品价格',
  `stocknumber` int(11) DEFAULT NULL COMMENT '库存数量',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '烫发机', '2000', '2', null);
INSERT INTO `product` VALUES ('2', '烘发机', '2200', '2', null);
INSERT INTO `product` VALUES ('3', '焗油机', '2300', '2', null);
INSERT INTO `product` VALUES ('4', '刷子', '10', '5', null);
INSERT INTO `product` VALUES ('5', '染碗', '10', '10', null);
INSERT INTO `product` VALUES ('6', '肩托', '20', '20', null);
INSERT INTO `product` VALUES ('7', '夹子', '1', '100', null);
INSERT INTO `product` VALUES ('8', '颈纸', '3', '300', null);
INSERT INTO `product` VALUES ('9', '卷发棒', '200', '5', null);
INSERT INTO `product` VALUES ('10', '发胶', '50', '5', null);
INSERT INTO `product` VALUES ('11', '弹簧素', '80', '10', null);
INSERT INTO `product` VALUES ('12', '发胶', '50', null, '20200122');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `rname` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `level` int(11) DEFAULT NULL COMMENT '权限等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', '1');
INSERT INTO `role` VALUES ('2', '普通员工', '2');
INSERT INTO `role` VALUES ('3', '顾客', '3');

-- ----------------------------
-- Table structure for `servicelist`
-- ----------------------------
DROP TABLE IF EXISTS `servicelist`;
CREATE TABLE `servicelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '服务序号',
  `servicename` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `serviceprice` int(11) DEFAULT NULL,
  `servicetime` datetime DEFAULT NULL COMMENT '服务时间',
  `duration` int(11) DEFAULT NULL COMMENT '服务时长(min)',
  `barber` int(11) DEFAULT NULL COMMENT '理发师',
  `orderid` varchar(255) DEFAULT NULL COMMENT '订单id',
  PRIMARY KEY (`id`),
  KEY `barber` (`barber`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `servicelist_ibfk_2` FOREIGN KEY (`orderid`) REFERENCES `order` (`oid`),
  CONSTRAINT `servicelist_ibfk_1` FOREIGN KEY (`barber`) REFERENCES `employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicelist
-- ----------------------------
INSERT INTO `servicelist` VALUES ('1', '普通理发', '30', '2020-01-15 20:11:59', '20', '1', null);
INSERT INTO `servicelist` VALUES ('2', '离子烫', '200', '2020-01-06 20:12:32', '180', '2', null);
INSERT INTO `servicelist` VALUES ('3', '染发', '300', '2020-01-09 20:13:06', '120', '1', null);
INSERT INTO `servicelist` VALUES ('4', '洗发', '10', '2020-01-04 20:13:51', '10', '2', null);
INSERT INTO `servicelist` VALUES ('5', '染发', '300', '2020-01-16 21:25:51', '120', '1', '20200122');
