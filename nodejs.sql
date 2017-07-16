/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1_liaohb
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : nodejs

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-07-16 23:39:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule`;
CREATE TABLE `sys_rule` (
  `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '键',
  `PathName` varchar(255) NOT NULL COMMENT '路径',
  `Method` enum('option','put','post','delete','get') NOT NULL DEFAULT 'get' COMMENT '方法',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `Content` json DEFAULT NULL COMMENT '规则内容',
  `RuleContent` text COMMENT '规则内容',
  `CreateTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='系统规则表';

-- ----------------------------
-- Records of sys_rule
-- ----------------------------
INSERT INTO `sys_rule` VALUES ('1', '/webapi/demo', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo where username = \':username\' and password = \':password\'\", \"name\": \"admininfo\", \"type\": \"query\", \"isRows\": false}, {\"id\": 2, \"sql\": \"select * from xtn_userinfo where id> :id\", \"name\": \"userlist\", \"type\": \"query\", \"isRows\": true}, {\"id\": 3, \"type\": \"beginTran\"}, {\"id\": 4, \"sql\": \"update xtn_userinfo t set t.tel=\':tel\' where t.id = :id1\", \"name\": \"update_info\", \"type\": \"update\", \"isRows\": false}, {\"id\": 5, \"sql\": \"select * from xtn_userinfo where id = :id1\", \"name\": \"id1_info\", \"type\": \"query\", \"isRows\": false}, {\"id\": 6, \"sql\": \"insert into xtn_userinfo(username,password,tel,address) values(uuid_short(),md5(now()),\':tel\',\'哈哈\');\", \"name\": \"insert_result\", \"type\": \"insert\", \"resultName\": \"InsertNo\"}, {\"id\": 7, \"sql\": \"select * from xtn_userinfo t where t.id = :InsertNo\", \"name\": \"insert_result11\", \"type\": \"query\", \"isRows\": false}, {\"id\": 9, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total1\", \"type\": \"query\", \"isRows\": false}, {\"id\": 10, \"sql\": \"delete from xtn_userinfo where id = :InsertNo - 5\", \"name\": \"delete_result\", \"type\": \"delete\"}, {\"id\": 11, \"type\": \"commit\"}, {\"id\": 13, \"sql\": \"select count(1) total from xtn_userinfo \", \"name\": \"insert_total2\", \"type\": \"query\", \"isRows\": false}], \"fields\": \"username,password,id,tel\", \"result\": 1}', '');
INSERT INTO `sys_rule` VALUES ('2', '/webapi/userinfo/users', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select * from xtn_userinfo t order by t.id desc\", \"name\": \"UserList\", \"type\": \"query\", \"isRows\": \"true\"}], \"fields\": \"\", \"result\": 1}', null);
INSERT INTO `sys_rule` VALUES ('3', '/webapi/userinfo/user', 'delete', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"delete from xtn_userinfo where id = :id \", \"type\": \"delete\"}], \"fields\": \"id\", \"result\": 1}', null);
INSERT INTO `sys_rule` VALUES ('4', '/webapi/manager/api/list', 'get', '1', '{\"rules\": [{\"id\": 1, \"sql\": \"select (case t.status when 1 then \'启用\' when 0 then \'禁用\' end) StatusCn,t.* from sys_rule t;\", \"type\": \"query\", \"isRows\": true}], \"fields\": \"\", \"result\": 1}', null);

-- ----------------------------
-- Table structure for xtn_deps
-- ----------------------------
DROP TABLE IF EXISTS `xtn_deps`;
CREATE TABLE `xtn_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pid` int(100) unsigned NOT NULL DEFAULT '1' COMMENT '父ID',
  `depname` varchar(100) NOT NULL COMMENT '部门名称',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of xtn_deps
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_rule
-- ----------------------------
DROP TABLE IF EXISTS `xtn_rule`;
CREATE TABLE `xtn_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rulename` varchar(100) NOT NULL COMMENT '角色名称',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '角色状态',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of xtn_rule
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `xtn_userinfo`;
CREATE TABLE `xtn_userinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(500) NOT NULL COMMENT '用户名',
  `password` varchar(40) NOT NULL COMMENT '密码',
  `tel` varchar(15) DEFAULT '' COMMENT '电话',
  `address` varchar(200) DEFAULT '' COMMENT '地址',
  `createdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of xtn_userinfo
-- ----------------------------
INSERT INTO `xtn_userinfo` VALUES ('1', 'admin', 'admin', '1112', '1123', '2017-07-02 18:15:32');
INSERT INTO `xtn_userinfo` VALUES ('4', '23', '21ad0bd836b90d08f4cf640b4c298e7c', 'dd', 'ee', '2017-07-08 14:53:01');
INSERT INTO `xtn_userinfo` VALUES ('5', '23', '21ad0bd836b90d08f4cf640b4c298e7c', 'dd', 'ee', '2017-07-08 14:54:25');
INSERT INTO `xtn_userinfo` VALUES ('6', '23', '21ad0bd836b90d08f4cf640b4c298e7c', '123', 'ee', '2017-07-08 14:59:36');
INSERT INTO `xtn_userinfo` VALUES ('7', '23', '21ad0bd836b90d08f4cf640b4c298e7c', 'dd', 'ee', '2017-07-08 14:59:49');
INSERT INTO `xtn_userinfo` VALUES ('8', 'update xtn_userinfo set username=\'23\' where username=\'aa\'', '21ad0bd836b90d08f4cf640b4c298e7c', 'dd', 'ee', '2017-07-08 15:08:14');
INSERT INTO `xtn_userinfo` VALUES ('9', 'delete xtn_userinfo where username=\'23\'', '21ad0bd836b90d08f4cf640b4c298e7c', '1111', 'ee', '2017-07-08 15:10:03');
INSERT INTO `xtn_userinfo` VALUES ('16', 'asdfasdf', '68eee0308454ed1e4195554afc6568a7', '123', 'asdfasdfa', '2017-07-08 22:31:12');
INSERT INTO `xtn_userinfo` VALUES ('17', '295ff6ab-68f2-11e7-9e50-0022645f5c4b', 'daf828384bbe2a5a5dad2d9134ae0c0e', 'tel', '哈哈', '2017-07-15 08:11:34');
INSERT INTO `xtn_userinfo` VALUES ('45', '97224655458271259', '916d6fc9d2d83659f38946ea35e8186b', '123', '哈哈', '2017-07-15 08:52:47');

-- ----------------------------
-- Table structure for xtn_user_deps
-- ----------------------------
DROP TABLE IF EXISTS `xtn_user_deps`;
CREATE TABLE `xtn_user_deps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键值',
  `depid` int(11) NOT NULL COMMENT '部门ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户部分表';

-- ----------------------------
-- Records of xtn_user_deps
-- ----------------------------

-- ----------------------------
-- Table structure for xtn_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `xtn_user_rule`;
CREATE TABLE `xtn_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `userid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `ruleid` int(10) unsigned NOT NULL COMMENT '角色ID',
  `status` bit(1) NOT NULL DEFAULT b'1' COMMENT '状态',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

-- ----------------------------
-- Records of xtn_user_rule
-- ----------------------------
