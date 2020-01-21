/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : haircut

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2020-01-21 22:10:45
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
  `boss` varchar(255) DEFAULT NULL COMMENT '商家'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business
-- ----------------------------

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
  `phonenumber` bigint(20) DEFAULT NULL COMMENT '手机号',
  `birthday` datetime DEFAULT NULL COMMENT '出生日期',
  `signuptime` datetime DEFAULT NULL COMMENT '注册日期',
  `memberid` varchar(255) DEFAULT NULL COMMENT '会员卡号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '员工id',
  `empname` varchar(255) DEFAULT NULL COMMENT '员工姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `salary` int(11) DEFAULT NULL COMMENT '员工工资',
  `birthday` datetime DEFAULT NULL COMMENT '员工生日',
  `positionid` int(11) DEFAULT NULL COMMENT '职位id',
  `royalty` int(11) DEFAULT NULL COMMENT '工资提成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '李荣浩', '123456', '35', '4500', '2020-01-01 00:00:00', null, null);
INSERT INTO `employee` VALUES ('2', '诸葛大力', '16130122', '23', '3600', '2020-01-08 00:00:00', null, null);

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
  `employee` varchar(255) DEFAULT NULL COMMENT '员工信息',
  `context` varchar(255) DEFAULT NULL COMMENT '服务信息(数组表示多项服务)',
  `online` int(11) DEFAULT NULL COMMENT '是否未线上消费:0：不是；1：是',
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位id',
  `pname` varchar(255) DEFAULT '' COMMENT '职位名称',
  `psalary` int(11) DEFAULT NULL COMMENT '职位薪资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of position
-- ----------------------------

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品序号',
  `proname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `proprice` int(11) DEFAULT NULL COMMENT '商品价格',
  `stocknumber` int(11) DEFAULT NULL COMMENT '库存数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servicelist
-- ----------------------------
