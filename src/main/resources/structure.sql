/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : car_repairing_backend

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-28 14:08:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `business_type` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `level` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKtms9onytw1xuqqukihkuqkhk5` (`parent_id`),
  CONSTRAINT `FKtms9onytw1xuqqukihkuqkhk5` FOREIGN KEY (`parent_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('402881d15f6b15f0015f6b174bec0000', '1509330209769', '', '0', '1509330209770', null, '辽宁省', null);
INSERT INTO `address` VALUES ('402881d15f6b15f0015f6b17cf650001', '1509330243429', '', '0', '1509330243429', null, '营口市', '402881d15f6b15f0015f6b174bec0000');
INSERT INTO `address` VALUES ('402881d15f6b15f0015f6b17f4ec0002', '1509330253035', '', '0', '1509330253035', null, '鲅鱼圈区', '402881d15f6b15f0015f6b17cf650001');
INSERT INTO `address` VALUES ('402881d15f6b15f0015f6b18d5440003', '1509330310468', '', '0', '1509330310468', null, '丹东市', '402881d15f6b15f0015f6b174bec0000');
INSERT INTO `address` VALUES ('402881d15f6b15f0015f6b18ec230004', '1509330316323', '', '0', '1509330399627', null, '元宝区', '402881d15f6b15f0015f6b18d5440003');

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('402881c45eff19a4015eff80ec080002', null, '', '0', '1516344556962', 'admin', null, '$2a$10$iVCowG5hxgiIIsVDDGXaDOCs9n0WIwQy6Os1to2BJh1zObvEDIyMS', 'ADMIN', '超级管理员');
INSERT INTO `admin` VALUES ('402881c46179366d01617966d7040006', '1518160238340', '', '0', '1518160238340', 'gongzhang', null, '$2a$10$SE68P.mJjwlhHjbxjV0T7OOKhrO/Hml9sdS2LHt3U.D5u7shr.2m6', 'ADMIN', '工长');
INSERT INTO `admin` VALUES ('402881c4618932200161893827cb0005', '1518425614283', '', '0', '1518425614283', 'kuguan', null, '$2a$10$WE3jRIkihEHQQsAH1IEwXOGdOrf3euimaSHfu61iO5NERi6f4jrTa', 'ADMIN', '库存管理员');
INSERT INTO `admin` VALUES ('402881d161262c49016126324d7c0000', '1516764286330', '', '0', '1516764286330', 'jiedai', null, '$2a$10$pdYWzUuzXHZRvaMHS5rC5.8dze2HQCzw2pjQ1sZ4ExmIZuHkRww5u', 'ADMIN', '接待');
INSERT INTO `admin` VALUES ('402881d161262c49016126bf0b3c000c', '1516773509948', '', '0', '1516773509948', 'jichu', null, '$2a$10$hZCRcUyZk7q3AIPLSkAmgOmFea40tBdxdpUIug.Am5xPhR3/DRbyS', 'ADMIN', '基础数据管理员');

-- ----------------------------
-- Table structure for `admin_roles`
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `admin_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  KEY `FKcjlqrvoka3pq87dm3nhyx6h5c` (`role_id`),
  KEY `FK1bcjwl07gm1kcu8h3dhiyd3ol` (`admin_id`),
  CONSTRAINT `FK1bcjwl07gm1kcu8h3dhiyd3ol` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKcjlqrvoka3pq87dm3nhyx6h5c` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('402881c45eff19a4015eff80ec080002', '402881c45effd975015effdcc87d0000');
INSERT INTO `admin_roles` VALUES ('402881d161262c49016126324d7c0000', '402881d1611b601501611c8c2dab0000');
INSERT INTO `admin_roles` VALUES ('402881d161262c49016126bf0b3c000c', '402881d161262c49016126beb9c2000b');
INSERT INTO `admin_roles` VALUES ('402881c46179366d01617966d7040006', '402881c46179366d0161796676140005');
INSERT INTO `admin_roles` VALUES ('402881c4618932200161893827cb0005', '402881c46189322001618937ee1e0004');

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `size` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('402881cf5f485d77015f485f1f3a0002', '1508747714362', '', '0', '1508749530568', 'jpg', '061607301kbo.jpg', '\\nfs-client\\admin\\2017-10-23\\1508747714348.jpg', '257737');
INSERT INTO `attachment` VALUES ('402881cf5f486060015f4863e2950003', '1508748026517', '', '0', '1508749635149', 'png', '25164146bto4.png', '/nfs-client/admin/2017-10-23/1508748026513.png', '510319');
INSERT INTO `attachment` VALUES ('402881cf5f486060015f486475780007', '1508748064120', '', '0', '1508749645325', 'jpg', '241638173oi3.jpg', '/nfs-client/admin/2017-10-23/1508748064114.jpg', '182504');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd71559280006', '1511142021416', '', '0', '1511142021416', 'jpg', 'WeChat Image_20171120092133.jpg', '/nfs-client/admin/2017-11-20/1511142021404.jpg', '222353');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd71737460009', '1511142143814', '', '0', '1511142143814', 'jpg', 'WeChat Image_20171120092135.jpg', '/nfs-client/admin/2017-11-20/1511142143808.jpg', '137123');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd7183317000c', '1511142208278', '', '0', '1511142208278', 'jpg', 'WeChat Image_20171120092138.jpg', '/nfs-client/admin/2017-11-20/1511142208273.jpg', '118383');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd718fb35000f', '1511142259509', '', '0', '1511142259509', 'jpg', 'WeChat Image_20171120092141.jpg', '/nfs-client/admin/2017-11-20/1511142259505.jpg', '74214');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd71da5780012', '1511142565240', '', '0', '1511142565240', 'jpg', 'WeChat Image_20171120092144.jpg', '/nfs-client/admin/2017-11-20/1511142565236.jpg', '110670');
INSERT INTO `attachment` VALUES ('402881d15fd70dd2015fd71e767e0015', '1511142618750', '', '0', '1511142618750', 'jpg', 'WeChat Image_20171120092146.jpg', '/nfs-client/admin/2017-11-20/1511142618743.jpg', '152194');
INSERT INTO `attachment` VALUES ('402881d15fd72b2c015fd72f0c4f0000', '1511143705675', '', '0', '1511143705675', 'jpg', 'WeChat Image_20171120092149.jpg', '/nfs-client/admin/2017-11-20/1511143705670.jpg', '139812');
INSERT INTO `attachment` VALUES ('402881d15fd72b2c015fd7304da30003', '1511143787938', '', '0', '1511143787938', 'jpg', 'WeChat Image_20171120092153.jpg', '/nfs-client/admin/2017-11-20/1511143787930.jpg', '134463');
INSERT INTO `attachment` VALUES ('402881d1600b575701600b89bb0c0000', '1512022063882', '', '0', '1512022063882', 'png', '24085857diht.png', '/nfs-client/admin/2017-11-30/1512022063877.png', '77209');
INSERT INTO `attachment` VALUES ('402881d160499a3f0160499c15d10001', '1513063454161', '', '0', '1513063454161', 'png', 'menu_icon4.png', '/nfs-client/mall/18640019220/2017-12-12/1513063454159.png', '4296');
INSERT INTO `attachment` VALUES ('402881d16052f28b01605301a9280000', '1513221105955', '', '0', '1513221105955', 'png', '2_02.png', '/nfs-client/mall/admin/2017-12-14/1513221105949.png', '6241');
INSERT INTO `attachment` VALUES ('402881d16052f28b01605302cffe0002', '1513221181438', '', '0', '1513221181438', 'png', '7_02.png', '/nfs-client/mall/admin/2017-12-14/1513221181436.png', '9062');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053038bef0004', '1513221229551', '', '0', '1513221229551', 'png', '15_02.png', '/nfs-client/mall/admin/2017-12-14/1513221229548.png', '9541');
INSERT INTO `attachment` VALUES ('402881d16052f28b0160530590af0007', '1513221361838', '', '0', '1513221361838', 'png', '13_02.png', '/nfs-client/mall/admin/2017-12-14/1513221361835.png', '12489');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053065159000a', '1513221411161', '', '0', '1513221411161', 'png', '9_02.png', '/nfs-client/mall/admin/2017-12-14/1513221411157.png', '13749');
INSERT INTO `attachment` VALUES ('402881d16052f28b01605306968c000d', '1513221428875', '', '0', '1513221428875', 'png', '8_02.png', '/nfs-client/mall/admin/2017-12-14/1513221428873.png', '13060');
INSERT INTO `attachment` VALUES ('402881d16052f28b01605308d18c0010', '1513221575052', '', '0', '1513221575052', 'png', '11_02.png', '/nfs-client/mall/admin/2017-12-14/1513221575049.png', '11049');
INSERT INTO `attachment` VALUES ('402881d16052f28b0160530918cf0012', '1513221593295', '', '0', '1513221593295', 'png', '6_02.png', '/nfs-client/mall/admin/2017-12-14/1513221593292.png', '8426');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053a3514a0014', '1513231700296', '', '0', '1513231700296', 'png', '4_02.png', '/nfs-client/mall/admin/2017-12-14/1513231700293.png', '13033');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053a3afbe0016', '1513231724478', '', '0', '1513231724478', 'png', '12_02.png', '/nfs-client/mall/admin/2017-12-14/1513231724475.png', '5253');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053a467530019', '1513231771475', '', '0', '1513231771475', 'png', '10_02.png', '/nfs-client/mall/admin/2017-12-14/1513231771471.png', '5032');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053a56f19001c', '1513231839001', '', '0', '1513231839001', 'png', '14_02.png', '/nfs-client/mall/admin/2017-12-14/1513231838997.png', '6682');
INSERT INTO `attachment` VALUES ('402881d16052f28b016053a6a676001f', '1513231918709', '', '0', '1513231918709', 'png', '3_02.png', '/nfs-client/mall/admin/2017-12-14/1513231918705.png', '15253');
INSERT INTO `attachment` VALUES ('402881d16076f583016076f5c30f0000', '1513824305932', '', '0', '1513824305932', 'png', '1588108_audi.png', '/nfs-client/mall/admin/2017-12-21/1513824305920.png', '25254');
INSERT INTO `attachment` VALUES ('402881d1608b32fd01608b7fd2a30000', '1514168898206', '', '0', '1514168898206', 'jpg', 'C:\\Users\\He\\Desktop\\u=2957000527,354388035&fm=27&gp=0.jpg', '/nfs-client/mall/admin/2017-12-25/1514168898200.jpg', '9562');
INSERT INTO `attachment` VALUES ('402881d1608b32fd01608b8296970001', '1514169079447', '', '0', '1514169079447', 'jpg', 'C:\\Users\\He\\Desktop\\timg.jpg', '/nfs-client/mall/admin/2017-12-25/1514169079443.jpg', '14625');
INSERT INTO `attachment` VALUES ('402881d160b455650160b45b5ab40002', '1514854374068', '', '0', '1514854374068', 'png', '4966A799C1379D0D.png@330w_330h_100Q.png', '/nfs-client/mall/admin/2018-01-02/1514854374060.png', '43177');
INSERT INTO `attachment` VALUES ('402881d160b455650160b45bb8110003', '1514854397969', '', '0', '1514854397969', 'png', '2fcec7f1d58c0ade4ed41ad1_w750_h980.png', '/nfs-client/mall/admin/2018-01-02/1514854397966.png', '954574');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47512400001', '1514856059455', '', '0', '1514856059455', 'jpg', 'C6B6861FE8518347.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514856059449.jpg', '48871');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47627d80002', '1514856130519', '', '0', '1514856130519', 'jpg', '56CD6FF0645DE14E.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514856130514.jpg', '25942');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47665dc0003', '1514856146395', '', '0', '1514856146395', 'jpg', 'f85c399b6f03dbc210be6973_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514856146390.jpg', '29778');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b476bcf20004', '1514856168690', '', '0', '1514856168690', 'png', '0a2f5181f069add9fad613b3_w750_h950.png', '/nfs-client/mall/admin/2018-01-02/1514856168687.png', '547690');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47e9d660006', '1514856684902', '', '0', '1514856684902', 'jpg', 'f85c399b6f03dbc210be6973_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514856684897.jpg', '64632');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f79ea0007', '1514856741354', '', '0', '1514856741354', 'jpg', '0ea9c9421330c2d5571000bd_w880_h333.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741345.jpg', '210744');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f79ef0008', '1514856741359', '', '0', '1514856741359', 'jpg', '45cf887f5c9b8ee20711485d_w880_h215.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741355.jpg', '101472');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f79f50009', '1514856741364', '', '0', '1514856741364', 'jpg', '297ea532a048b241b2945841_w880_h567.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741360.jpg', '265975');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f79fa000a', '1514856741370', '', '0', '1514856741370', 'jpg', '5794a1e718ae284fd80bd080_w880_h332.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741365.jpg', '212789');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f79ff000b', '1514856741375', '', '0', '1514856741375', 'jpg', '11825dea61a2326e1ef7c89c_w880_h333.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741371.jpg', '210842');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f7a04000c', '1514856741379', '', '0', '1514856741379', 'jpg', '73541e7b7ced441497634f61_w880_h334.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741375.jpg', '206998');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b47f7a08000d', '1514856741384', '', '0', '1514856741384', 'jpg', 'f108bf2d8e4d45823edc3635_w880_h333.jpg', '/nfs-client/mall/admin/2018-01-02/1514856741380.jpg', '207937');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48b3c0b000f', '1514857511947', '', '0', '1514857511947', 'jpg', '8a283bac082f288371af9f3e_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514857511942.jpg', '14862');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48b3c110010', '1514857511953', '', '0', '1514857511953', 'jpg', '56edde0ab9c8dbf40af466d4_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514857511947.jpg', '28051');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48b3c180011', '1514857511960', '', '0', '1514857511960', 'jpg', '7990b8d656b3355432a7bc24_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514857511953.jpg', '32644');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48ba3e80012', '1514857538536', '', '0', '1514857538536', 'jpg', '2e1f5ff16671b032d863eb61_w800_h475.jpg', '/nfs-client/mall/admin/2018-01-02/1514857538529.jpg', '100505');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48f59990014', '1514857781657', '', '0', '1514857781657', 'jpg', '5ed5b89af6cf7fbf2ea420fb_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514857781650.jpg', '23378');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48f599e0015', '1514857781661', '', '0', '1514857781661', 'jpg', 'c80be9e1f35f8c1648ac6cad_w1000_h1000.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514857781657.jpg', '25860');
INSERT INTO `attachment` VALUES ('402881d160b473a50160b48fdb3b0016', '1514857814843', '', '0', '1514857814843', 'jpg', 'e2b6251b98facdff3de0648b_w800_h443.jpg', '/nfs-client/mall/admin/2018-01-02/1514857814839.jpg', '122510');
INSERT INTO `attachment` VALUES ('402881d160b499420160b49b682d0000', '1514858571817', '', '0', '1514858571817', 'jpg', 'CS-MS300.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514858571809.jpg', '44244');
INSERT INTO `attachment` VALUES ('402881d160b499420160b49b829e0001', '1514858578590', '', '0', '1514858578590', 'jpg', 'TR-CS-MS360_001.JPG@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514858578585.jpg', '57213');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4a5599d0003', '1514859223452', '', '0', '1514859223452', 'jpg', '2ed1bf8c0494f18ad3d14758_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859223448.jpg', '19023');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4a947a40005', '1514859480996', '', '0', '1514859480996', 'jpg', '1ed1bf8c0494f18ad3d14758_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859480991.jpg', '21925');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4ab423c0007', '1514859610684', '', '0', '1514859610684', 'jpg', '44C2102E904E0995.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859610679.jpg', '59348');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4abe1880009', '1514859651464', '', '0', '1514859651464', 'jpg', '29bc560738a996180a978900_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859651460.jpg', '20940');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4ac5d06000b', '1514859683078', '', '0', '1514859683078', 'jpg', '2fed70b7c63690f81a1193ca_w800_h800.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859683073.jpg', '22842');
INSERT INTO `attachment` VALUES ('402881d160b499420160b4ad4a49000d', '1514859743817', '', '0', '1514859743817', 'jpg', 'HX7-5W40-4-1.jpg@330w_330h_100Q.jpg', '/nfs-client/mall/admin/2018-01-02/1514859743813.jpg', '82473');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44a36eb0015', '1515121686251', '', '0', '1515121686251', 'png', '养车111_02.png', '/nfs-client/mall/admin/2018-01-05/1515121686247.png', '226540');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44a6ade0017', '1515121699550', '', '0', '1515121699550', 'png', '养车777_02.png', '/nfs-client/mall/admin/2018-01-05/1515121699547.png', '226640');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44b1ccf0019', '1515121745102', '', '0', '1515121745102', 'png', '养车1511_02.png', '/nfs-client/mall/admin/2018-01-05/1515121745099.png', '224293');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44b7d26001c', '1515121769766', '', '0', '1515121769766', 'png', '养车1311_02.png', '/nfs-client/mall/admin/2018-01-05/1515121769763.png', '220790');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44ba908001f', '1515121781000', '', '0', '1515121781000', 'png', '养车999_02.png', '/nfs-client/mall/admin/2018-01-05/1515121780999.png', '225254');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44bddd80022', '1515121794520', '', '0', '1515121794520', 'png', '养车888_02.png', '/nfs-client/mall/admin/2018-01-05/1515121794518.png', '225319');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44c1a340025', '1515121809972', '', '0', '1515121809972', 'png', '养车1111_02.png', '/nfs-client/mall/admin/2018-01-05/1515121809963.png', '225180');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44c3dce0027', '1515121819086', '', '0', '1515121819086', 'png', '养车666_02.png', '/nfs-client/mall/admin/2018-01-05/1515121819084.png', '226112');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44c59540029', '1515121826132', '', '0', '1515121826132', 'png', '养车444_02.png', '/nfs-client/mall/admin/2018-01-05/1515121826129.png', '225994');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44c75b4002b', '1515121833396', '', '0', '1515121833396', 'png', '养车1211_02.png', '/nfs-client/mall/admin/2018-01-05/1515121833394.png', '224259');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44ccac9002e', '1515121855177', '', '0', '1515121855177', 'png', '养车1010_02.png', '/nfs-client/mall/admin/2018-01-05/1515121855175.png', '226617');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44d0f190031', '1515121872665', '', '0', '1515121872665', 'png', '养车1411_02.png', '/nfs-client/mall/admin/2018-01-05/1515121872662.png', '225654');
INSERT INTO `attachment` VALUES ('402881d160c42ceb0160c44d90290034', '1515121905704', '', '0', '1515121905704', 'png', '养车333_02.png', '/nfs-client/mall/admin/2018-01-05/1515121905702.png', '232651');

-- ----------------------------
-- Table structure for `cart`
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKix170nytunweovf2v9137mx2o` (`member_id`),
  CONSTRAINT `FKix170nytunweovf2v9137mx2o` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart
-- ----------------------------

-- ----------------------------
-- Table structure for `cart_item`
-- ----------------------------
DROP TABLE IF EXISTS `cart_item`;
CREATE TABLE `cart_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `cart_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `sku_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  KEY `FKj2hskhk5pw7fcpx84ojy8ig6t` (`sku_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKj2hskhk5pw7fcpx84ojy8ig6t` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cart_item
-- ----------------------------

-- ----------------------------
-- Table structure for `coupon`
-- ----------------------------
DROP TABLE IF EXISTS `coupon`;
CREATE TABLE `coupon` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `end_date` bigint(20) DEFAULT NULL,
  `marketing_type` varchar(30) DEFAULT NULL,
  `min_amount` double DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `obtain_type` varchar(30) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `start_date` bigint(20) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhvhb7mgtp18yu2q9girsbd7lq` (`client_id`),
  CONSTRAINT `FKhvhb7mgtp18yu2q9girsbd7lq` FOREIGN KEY (`client_id`) REFERENCES `oauth_client_details` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of coupon
-- ----------------------------
INSERT INTO `coupon` VALUES ('402881c45f32c738015f32dd7b790000', '1508386896754', '', '0', '1510281432991', '10', '1512000000000', 'CASH_OFF', '100', '秋季特惠', 'LOGIN', null, '1507680000000', 'tonr');
INSERT INTO `coupon` VALUES ('402881d15fa4a7fc015fa4f2df730000', '1510300901226', '', '0', '1512551605463', '50', '1512691200000', 'CASH_OFF', '100', '海鲜大杂烩', 'LOGIN', null, '1509494400000', 'tonr');
INSERT INTO `coupon` VALUES ('402881d160499a3f016049ddc41a0003', '1513067758613', '', '0', '1513067758613', '10', '1514678400000', 'CASH_OFF', '50', '测试', 'LOGIN', null, '1512086400000', 'tonr');

-- ----------------------------
-- Table structure for `dictionary`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE `dictionary` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `dictionary_category_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5karylm6jn6jkkvfifx4l9h30` (`dictionary_category_id`),
  CONSTRAINT `FK5karylm6jn6jkkvfifx4l9h30` FOREIGN KEY (`dictionary_category_id`) REFERENCES `dictionary_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dictionary
-- ----------------------------
INSERT INTO `dictionary` VALUES ('402881bc613110e701613142f3a60001', '1516949926822', '', '0', '1516950070750', 'g', '克', '402881bc613110e70161314135990000');
INSERT INTO `dictionary` VALUES ('402881bc613110e7016131430af10002', '1516949932785', '', '0', '1516949932785', 'kg', '千克', '402881bc613110e70161314135990000');
INSERT INTO `dictionary` VALUES ('402881bc613110e701613182c9940005', '1516954110356', '', '0', '1516957249230', '1', '1', '402881bc613110e70161314450460003');
INSERT INTO `dictionary` VALUES ('402881bc613110e701613182eb4e0006', '1516954118990', '', '0', '1516957248062', '2', '2', '402881bc613110e70161314450460003');
INSERT INTO `dictionary` VALUES ('402881bc6144c31d016144c38ef90000', '1517277122294', '', '0', '1517277127523', null, 'c', '402881bc614494c40161449913eb0000');
INSERT INTO `dictionary` VALUES ('402881bc6145ad51016145d3b1cd0001', '1517294957005', '', '0', '1517452668340', null, '机电', '402881bc6145ad51016145d37dab0000');
INSERT INTO `dictionary` VALUES ('402881bc61464dfe01614651f7030003', '1517303232259', '', '0', '1517303232259', null, '个', '402881bc613110e70161314135990000');
INSERT INTO `dictionary` VALUES ('402881bd61650a450161653bff9f0002', '1517821886367', '', '0', '1517821886367', null, '海尔', '402881bc614494c40161449913eb0000');
INSERT INTO `dictionary` VALUES ('402881bd61650a450161653c18bf0003', '1517821892799', '', '0', '1517821892799', null, '太平洋保险', '402881bc613f59be01613f67fe180000');

-- ----------------------------
-- Table structure for `dictionary_category`
-- ----------------------------
DROP TABLE IF EXISTS `dictionary_category`;
CREATE TABLE `dictionary_category` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdgpx4q8hdcqgg16pwnrjmuqu3` (`parent_id`),
  CONSTRAINT `FKdgpx4q8hdcqgg16pwnrjmuqu3` FOREIGN KEY (`parent_id`) REFERENCES `dictionary_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dictionary_category
-- ----------------------------
INSERT INTO `dictionary_category` VALUES ('402881bc613110e70161314135990000', '1516949812631', '', '0', '1517274303978', 'unit', '单位', null);
INSERT INTO `dictionary_category` VALUES ('402881bc613110e70161314450460003', '1516950016070', '', '0', '1516957250790', 'standard', '规格', null);
INSERT INTO `dictionary_category` VALUES ('402881bc613110e70161314675800004', '1516950156672', '', '0', '1516950919687', null, '1', '402881bc613110e70161314135990000');
INSERT INTO `dictionary_category` VALUES ('402881bc613f59be01613f67fe180000', '1517187235341', '', '0', '1517187235341', 'insurance_company', '保险公司', null);
INSERT INTO `dictionary_category` VALUES ('402881bc614494c40161449913eb0000', '1517274338282', '', '0', '1517274338282', 'vendor', '供应商', null);
INSERT INTO `dictionary_category` VALUES ('402881bc6145ad51016145d37dab0000', '1517294943657', '', '0', '1517294943657', 'work_type', '工种', null);

-- ----------------------------
-- Table structure for `dispatch_form`
-- ----------------------------
DROP TABLE IF EXISTS `dispatch_form`;
CREATE TABLE `dispatch_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `entrust_form_id` varchar(36) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `worker_id` varchar(36) DEFAULT NULL,
  `working_team_id` varchar(36) DEFAULT NULL,
  `entrust_form_order_number` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dispatch_form
-- ----------------------------
INSERT INTO `dispatch_form` VALUES ('402881c46184288a01618428f0520000', '1518340730956', '', '0', '1519351766200', '402881c461797d01016179b453840004', '02111718502086', '402881c46179366d01617966d7040006', null, '02091635161645', 'DRAWING');
INSERT INTO `dispatch_form` VALUES ('402881c4618793d80161879eefc30000', '1518398795708', '', '0', '1518421498600', '402881c461797d010161797d9bd50000', '02120926352490', null, '402881bc61451b650161458ed2ba0001', '02091535301146', 'DRAWING');
INSERT INTO `dispatch_form` VALUES ('402881c461c6e8720161c6fa99c50009', '1519461767616', '', '0', '1519461770043', '402881c461c6e8720161c6fa648c0004', '02241642471315', '402881c46179366d01617966d7040006', null, '02241642331169', 'DRAWING');
INSERT INTO `dispatch_form` VALUES ('402881c461c6e8720161c70b361a0013', '1519462856218', '', '0', '1519462867177', '402881c461c6e8720161c70ac5a5000f', '02241700566264', null, '402881bc61451b650161458ed2ba0001', '02241700274845', 'DRAWING');
INSERT INTO `dispatch_form` VALUES ('402881ca61d9d8a30161da04f9490000', '1519781214529', '', '0', '1519781214529', '402881c461c6e8720161c70ac5a5000f', '02280926541124', '402881c46179366d01617966d7040006', null, '02241700274845', 'NEW');

-- ----------------------------
-- Table structure for `drawing_form`
-- ----------------------------
DROP TABLE IF EXISTS `drawing_form`;
CREATE TABLE `drawing_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `entrust_form_id` varchar(36) DEFAULT NULL,
  `entrust_form_order_number` varchar(20) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `worker_id` varchar(36) DEFAULT NULL,
  `working_team_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of drawing_form
-- ----------------------------
INSERT INTO `drawing_form` VALUES ('402881c46188f8a1016188f95afc0000', '1518421498615', '', '0', '1519460788453', '402881c461797d010161797d9bd50000', '02091535301146', '02121544581987', 'OUT_STORE', null, '402881bc61451b650161458ed2ba0001');
INSERT INTO `drawing_form` VALUES ('402881c461c064860161c06c1cc80000', '1519351766212', '', '0', '1519457349381', '402881c461797d01016179b453840004', '02091635161645', '02231009261101', 'OUT_STORE', '402881c46179366d01617966d7040006', null);
INSERT INTO `drawing_form` VALUES ('402881c461c6e8720161c6faa33d000a', '1519461770045', '', '0', '1519461777189', '402881c461c6e8720161c6fa648c0004', '02241642331169', '02241642501192', 'OUT_STORE', '402881c46179366d01617966d7040006', null);
INSERT INTO `drawing_form` VALUES ('402881c461c6e8720161c70b60e90014', '1519462867177', '', '0', '1519462897138', '402881c461c6e8720161c70ac5a5000f', '02241700274845', '02241701077352', 'OUT_STORE', null, '402881bc61451b650161458ed2ba0001');

-- ----------------------------
-- Table structure for `entrust_form`
-- ----------------------------
DROP TABLE IF EXISTS `entrust_form`;
CREATE TABLE `entrust_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `kilometres` double DEFAULT NULL,
  `clerk_id` varchar(36) DEFAULT NULL,
  `creator_id` varchar(36) DEFAULT NULL,
  `insurance_company_id` varchar(36) DEFAULT NULL,
  `operator_id` varchar(36) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `contact_tel` varchar(20) DEFAULT NULL,
  `approach_date` datetime DEFAULT NULL,
  `plan_finish_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `final_pay` double DEFAULT NULL,
  `balance_pay` double DEFAULT NULL,
  `cash_pay` double DEFAULT NULL,
  `pay_status` varchar(20) DEFAULT NULL,
  `pay_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqqr50p4s8rc3dl1o9vi5fgav6` (`clerk_id`),
  KEY `FKm1hpeb6lsdx0n786heotfnhe4` (`creator_id`),
  KEY `FKbptxmx0k818a7tmpirx7aknqj` (`insurance_company_id`),
  KEY `FKo6lgdff19yudiymi9jhxshvds` (`operator_id`),
  KEY `FK885i5o7e7t1rd72i2596o36cf` (`vehicle_id`),
  CONSTRAINT `FK885i5o7e7t1rd72i2596o36cf` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FKbptxmx0k818a7tmpirx7aknqj` FOREIGN KEY (`insurance_company_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FKm1hpeb6lsdx0n786heotfnhe4` FOREIGN KEY (`creator_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKo6lgdff19yudiymi9jhxshvds` FOREIGN KEY (`operator_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKqqr50p4s8rc3dl1o9vi5fgav6` FOREIGN KEY (`clerk_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of entrust_form
-- ----------------------------
INSERT INTO `entrust_form` VALUES ('402881c461797d010161797d9bd50000', '1518161730512', '', '0', '1518398795692', null, '402881d161262c49016126324d7c0000', '402881d161262c49016126324d7c0000', null, '402881d161262c49016126324d7c0000', '402881d160c02ce10160c03a36c60000', '02091535301146', '18640019220', '2018-02-04 00:00:00', null, 'DISPATCHING', null, null, null, 'UNPAY', null);
INSERT INTO `entrust_form` VALUES ('402881c461797d01016179b453840004', '1518165316484', '', '0', '1518340730943', null, '402881d161262c49016126324d7c0000', '402881d161262c49016126324d7c0000', null, '402881d161262c49016126324d7c0000', '402881bd616a2b6201616a3733cb0000', '02091635161645', '18640068590', '2018-02-06 00:00:00', null, 'DISPATCHING', null, null, null, 'UNPAY', null);
INSERT INTO `entrust_form` VALUES ('402881c461c6e8720161c6fa648c0004', '1519461753991', '', '0', '1519783265717', null, '402881c46179366d01617966d7040006', '402881c45eff19a4015eff80ec080002', null, '402881c46179366d01617966d7040006', '402881bd616a2b6201616a3733cb0000', '02241642331169', '18640019220', '2018-02-13 00:00:00', null, 'NEW', '10145', '20', '100', 'PAYED', 'OFFLINE');
INSERT INTO `entrust_form` VALUES ('402881c461c6e8720161c70ac5a5000f', '1519462827429', '', '0', '1519781805306', '10000', '402881c46179366d01617966d7040006', '402881c45eff19a4015eff80ec080002', '402881bd61650a450161653c18bf0003', '402881c46179366d01617966d7040006', '402881c461c6e8720161c70ac5a4000e', '02241700274845', '13555770684', '2018-02-01 00:00:00', '2018-02-20 00:00:00', 'FINISHED', '1205', '200', '100', 'PAYED', 'OFFLINE');

-- ----------------------------
-- Table structure for `entrust_form_item`
-- ----------------------------
DROP TABLE IF EXISTS `entrust_form_item`;
CREATE TABLE `entrust_form_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `entrust_form_id` varchar(36) DEFAULT NULL,
  `maintenance_item_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKihmhau3sh7b2fddh83togjy0w` (`entrust_form_id`),
  KEY `FKc4howvsbdyu25r817gvwet6tu` (`maintenance_item_id`),
  CONSTRAINT `FKc4howvsbdyu25r817gvwet6tu` FOREIGN KEY (`maintenance_item_id`) REFERENCES `maintenance_item` (`id`),
  CONSTRAINT `FKihmhau3sh7b2fddh83togjy0w` FOREIGN KEY (`entrust_form_id`) REFERENCES `entrust_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of entrust_form_item
-- ----------------------------
INSERT INTO `entrust_form_item` VALUES ('402881c461797d01016179b60dde000a', '1518165429726', '', '0', '1518165429726', '402881c461797d01016179b453840004', '402881bc614a021e01614a9d07f50000');
INSERT INTO `entrust_form_item` VALUES ('402881c461797d01016179c2fe36000f', '1518166277686', '', '0', '1518166277686', '402881c461797d010161797d9bd50000', '402881bc6145ad51016145fc56380002');
INSERT INTO `entrust_form_item` VALUES ('402881ca61d117410161d16ed9ae000f', '1519637158318', '', '0', '1519637158318', '402881c461c6e8720161c70ac5a5000f', '402881bc6145ad51016145fc56380002');
INSERT INTO `entrust_form_item` VALUES ('402881ca61d117410161d16ff5cf0012', '1519637231055', '', '0', '1519637231055', '402881c461c6e8720161c6fa648c0004', '402881bc6145ad51016145fc56380002');
INSERT INTO `entrust_form_item` VALUES ('402881ca61d117410161d16ff5d00013', '1519637231056', '', '0', '1519637231056', '402881c461c6e8720161c6fa648c0004', '402881bc614a021e01614a9d07f50000');

-- ----------------------------
-- Table structure for `entrust_form_parts`
-- ----------------------------
DROP TABLE IF EXISTS `entrust_form_parts`;
CREATE TABLE `entrust_form_parts` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `entrust_form_id` varchar(36) DEFAULT NULL,
  `parts_id` varchar(36) DEFAULT NULL,
  `count` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs2cnp3qs3276lqmewak437h7q` (`entrust_form_id`),
  KEY `FKsm5vcmgl072k30qp56vddrjav` (`parts_id`),
  CONSTRAINT `FKs2cnp3qs3276lqmewak437h7q` FOREIGN KEY (`entrust_form_id`) REFERENCES `entrust_form` (`id`),
  CONSTRAINT `FKsm5vcmgl072k30qp56vddrjav` FOREIGN KEY (`parts_id`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of entrust_form_parts
-- ----------------------------
INSERT INTO `entrust_form_parts` VALUES ('402881c461797d01016179b60ddf000b', '1518165429727', '', '0', '1518165429727', '402881c461797d01016179b453840004', '402881bc61464dfe01614651c56e0002', '30');
INSERT INTO `entrust_form_parts` VALUES ('402881c461797d01016179c2fe360010', '1518166277686', '', '0', '1518166277686', '402881c461797d010161797d9bd50000', '402881bc61464dfe01614651c56e0002', '1');
INSERT INTO `entrust_form_parts` VALUES ('402881c461797d01016179c2fe360011', '1518166277686', '', '0', '1518166277686', '402881c461797d010161797d9bd50000', '402881c4617832d501617860d570000f', '3');
INSERT INTO `entrust_form_parts` VALUES ('402881ca61d117410161d16ed9ae0010', '1519637158318', '', '0', '1519637158318', '402881c461c6e8720161c70ac5a5000f', '402881bc61464dfe01614651c56e0002', '1');
INSERT INTO `entrust_form_parts` VALUES ('402881ca61d117410161d16ed9ae0011', '1519637158318', '', '0', '1519637158318', '402881c461c6e8720161c70ac5a5000f', '402881c4617832d501617860d570000f', '3');
INSERT INTO `entrust_form_parts` VALUES ('402881ca61d117410161d16ff5d00014', '1519637231056', '', '0', '1519637231056', '402881c461c6e8720161c6fa648c0004', '402881bc61464dfe01614651c56e0002', '31');
INSERT INTO `entrust_form_parts` VALUES ('402881ca61d117410161d16ff5d10015', '1519637231057', '', '0', '1519637231057', '402881c461c6e8720161c6fa648c0004', '402881c4617832d501617860d570000f', '3');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `relation_id` varchar(36) DEFAULT NULL,
  `store_id` varchar(36) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('402881c461c6a0f50161c6a170340001', '1519455924272', '', '0', '1519462950298', '77', '402881bc61464dfe01614651c56e0002', '402881c4618932200161894418dc0006', null);
INSERT INTO `goods` VALUES ('402881c461c6a0f50161c6a170520002', '1519455924305', '', '0', '1519462897153', '94', '402881c4617832d501617860d570000f', '402881c4618932200161894418dc0006', null);

-- ----------------------------
-- Table structure for `in_store_form`
-- ----------------------------
DROP TABLE IF EXISTS `in_store_form`;
CREATE TABLE `in_store_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `business_type` varchar(20) DEFAULT NULL,
  `in_store_date` datetime DEFAULT NULL,
  `operator_id` varchar(36) DEFAULT NULL,
  `store_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of in_store_form
-- ----------------------------
INSERT INTO `in_store_form` VALUES ('402881c461c5d5600161c5d5f1220000', '1519442587932', '', '0', '1519442587932', 'PURCHASE', '2018-02-24 11:23:08', null, null);
INSERT INTO `in_store_form` VALUES ('402881c461c64d4e0161c691fd030002', '1519454911742', '', '0', '1519454911742', 'PURCHASE', '2018-02-24 14:48:32', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c692f70161c69339770000', '1519454992753', '', '0', '1519454992753', 'PURCHASE', '2018-02-24 14:49:53', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c6944d0161c694d13b0000', '1519455097141', '', '0', '1519455097141', 'PURCHASE', '2018-02-24 14:51:37', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c6944d0161c695d3500003', '1519455163216', '', '0', '1519455163216', 'PURCHASE', '2018-02-24 14:52:37', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c696700161c696bfd40000', '1519455223759', '', '0', '1519455223759', 'PURCHASE', '2018-02-24 14:53:44', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c696700161c6971baf0003', '1519455247279', '', '0', '1519455247279', 'PURCHASE', '2018-02-24 14:54:11', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c6a0f50161c6a170100000', '1519455924234', '', '0', '1519455924234', 'PURCHASE', '2018-02-24 15:05:24', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c6e8720161c6f9de8a0003', '1519461719685', '', '0', '1519461719685', 'PURCHASE', '2018-02-24 16:42:00', null, '402881c4618932200161894418dc0006');
INSERT INTO `in_store_form` VALUES ('402881c461c6e8720161c70ca598001a', '1519462950296', '', '0', '1519462950296', 'PURCHASE', '2018-02-24 17:02:30', null, '402881c4618932200161894418dc0006');

-- ----------------------------
-- Table structure for `in_store_form_item`
-- ----------------------------
DROP TABLE IF EXISTS `in_store_form_item`;
CREATE TABLE `in_store_form_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `in_store_form_id` varchar(36) DEFAULT NULL,
  `relation_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of in_store_form_item
-- ----------------------------
INSERT INTO `in_store_form_item` VALUES ('402881c461c5d5600161c5d5f1310001', '1519442587948', '', '0', '1519442587948', '1', '402881c461c5d5600161c5d5f1220000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c5d5600161c5d5f1320002', '1519442587954', '', '0', '1519442587954', '6', '402881c461c5d5600161c5d5f1220000', '402881c4617832d501617860d570000f');
INSERT INTO `in_store_form_item` VALUES ('402881c461c64d4e0161c691fd0b0003', '1519454911750', '', '0', '1519454911750', '1', '402881c461c64d4e0161c691fd030002', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c692f70161c69380b90001', '1519455010995', '', '0', '1519455010995', '1', '402881c461c692f70161c69339770000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c692f70161c69380b90002', '1519455011001', '', '0', '1519455011001', '6', '402881c461c692f70161c69339770000', '402881c4617832d501617860d570000f');
INSERT INTO `in_store_form_item` VALUES ('402881c461c6944d0161c6950f610001', '1519455113052', '', '0', '1519455113052', '1', '402881c461c6944d0161c694d13b0000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c6944d0161c6950f610002', '1519455113057', '', '0', '1519455113057', '6', '402881c461c6944d0161c694d13b0000', '402881c4617832d501617860d570000f');
INSERT INTO `in_store_form_item` VALUES ('402881c461c6944d0161c695d3540004', '1519455163220', '', '0', '1519455163220', '1', '402881c461c6944d0161c695d3500003', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c6944d0161c695d3540005', '1519455163220', '', '0', '1519455163220', '6', '402881c461c6944d0161c695d3500003', '402881c4617832d501617860d570000f');
INSERT INTO `in_store_form_item` VALUES ('402881c461c696700161c696bff00001', '1519455223788', '', '0', '1519455223788', '1', '402881c461c696700161c696bfd40000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c696700161c696bff10002', '1519455223793', '', '0', '1519455223793', '6', '402881c461c696700161c696bfd40000', '402881c4617832d501617860d570000f');
INSERT INTO `in_store_form_item` VALUES ('402881c461c696700161c697c1f10004', '1519455289841', '', '0', '1519455289841', '1', '402881c461c696700161c6971baf0003', '402881bc61464dfe01614651c56e0002');
INSERT INTO `in_store_form_item` VALUES ('402881c461c696700161c697c1f10005', '1519455289841', '', '0', '1519455289841', '6', '402881c461c696700161c6971baf0003', '402881c4617832d501617860d570000f');

-- ----------------------------
-- Table structure for `maintenance_item`
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_item`;
CREATE TABLE `maintenance_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `man_hour_price` double DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `work_type_id` varchar(36) DEFAULT NULL,
  `working_team_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6jio1vy3d2i5u39dc37p1go8t` (`work_type_id`),
  KEY `FK8tt8amnag24wokku4sglvlnsi` (`working_team_id`),
  CONSTRAINT `FK6jio1vy3d2i5u39dc37p1go8t` FOREIGN KEY (`work_type_id`) REFERENCES `dictionary` (`id`),
  CONSTRAINT `FK8tt8amnag24wokku4sglvlnsi` FOREIGN KEY (`working_team_id`) REFERENCES `working_team` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of maintenance_item
-- ----------------------------
INSERT INTO `maintenance_item` VALUES ('402881bc6145ad51016145fc56380002', '1517297620528', '', '0', '1518143870017', '10', '机电 更换机油——滤', '402881bc6145ad51016145d3b1cd0001', '402881bc61451b650161458ed2ba0001');
INSERT INTO `maintenance_item` VALUES ('402881bc614a021e01614a9d07f50000', '1517375260649', '', '0', '1518142920290', '0', '机电 更换外球笼罩包', '402881bc6145ad51016145d3b1cd0001', '402881bc61451b650161458ed2ba0001');

-- ----------------------------
-- Table structure for `maintenance_item_parts`
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_item_parts`;
CREATE TABLE `maintenance_item_parts` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `maintenance_item_id` varchar(36) DEFAULT NULL,
  `parts_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKfam2qy1dnisksjsa1h22w84th` (`maintenance_item_id`),
  KEY `FK25ihrgol9bjm406bfa299xn9b` (`parts_id`),
  CONSTRAINT `FK25ihrgol9bjm406bfa299xn9b` FOREIGN KEY (`parts_id`) REFERENCES `parts` (`id`),
  CONSTRAINT `FKfam2qy1dnisksjsa1h22w84th` FOREIGN KEY (`maintenance_item_id`) REFERENCES `maintenance_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of maintenance_item_parts
-- ----------------------------
INSERT INTO `maintenance_item_parts` VALUES ('402881c4617832d50161785e9662000d', '1518142920290', '', '0', '1518142920290', '30', '402881bc614a021e01614a9d07f50000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `maintenance_item_parts` VALUES ('402881c4617832d50161786d14410012', '1518143870017', '', '0', '1518143870017', '3', '402881bc6145ad51016145fc56380002', '402881c4617832d501617860d570000f');
INSERT INTO `maintenance_item_parts` VALUES ('402881c4617832d50161786d14410013', '1518143870017', '', '0', '1518143870017', '1', '402881bc6145ad51016145fc56380002', '402881bc61464dfe01614651c56e0002');

-- ----------------------------
-- Table structure for `member`
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `birthday` bigint(20) DEFAULT NULL,
  `card_no` varchar(20) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `openid` varchar(36) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `sale_point` int(11) DEFAULT NULL,
  `head_photo_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKolx1jg6jck1x309mcafyf1b8b` (`head_photo_id`),
  CONSTRAINT `FKolx1jg6jck1x309mcafyf1b8b` FOREIGN KEY (`head_photo_id`) REFERENCES `attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('1', null, '', '0', '1513067839665', '18640019221', '18640019220', '$2a$10$wZSX1D1Ik/weVruPxeXcXuV0N7M6MRDJ7BCinsxVB7Wkcq7GJvtSK', 'MEMBER', '唐赫1', '570', '1505347200000', '11', '1', '2206021991019234', '测试', '', '6348', '1137', null);
INSERT INTO `member` VALUES ('402881b65e792228015e7929024f0000', null, '', '0', '1514256780522', '18640019220', '18640019220', '$2a$10$uxxZGcMNmnKbaWRT3tgLv.F387CiaaWZDIvbpYJ26RqSKwaP6oQv6', 'MEMBER', null, '320', null, '001', '0', '', '唐赫', '', '6810', '1292', '402881d160499a3f0160499c15d10001');

-- ----------------------------
-- Table structure for `member_address`
-- ----------------------------
DROP TABLE IF EXISTS `member_address`;
CREATE TABLE `member_address` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `default_address` bit(1) DEFAULT NULL,
  `detail_address` varchar(500) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `address_id` varchar(36) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc1mlhav8xpi04w64t263v8qvf` (`address_id`),
  KEY `FKeslc8586cwl3ej73mv7gr83x2` (`member_id`),
  CONSTRAINT `FKc1mlhav8xpi04w64t263v8qvf` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FKeslc8586cwl3ej73mv7gr83x2` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member_address
-- ----------------------------

-- ----------------------------
-- Table structure for `member_coupon`
-- ----------------------------
DROP TABLE IF EXISTS `member_coupon`;
CREATE TABLE `member_coupon` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `used` bit(1) DEFAULT NULL,
  `coupon_id` varchar(36) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKkxw7ja7v55gk4a368w3gs6s0j` (`coupon_id`),
  KEY `FKf8n3lu0dfwmhvcikamg220lgg` (`member_id`),
  CONSTRAINT `FKf8n3lu0dfwmhvcikamg220lgg` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKkxw7ja7v55gk4a368w3gs6s0j` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for `member_level`
-- ----------------------------
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `need_point` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of member_level
-- ----------------------------

-- ----------------------------
-- Table structure for `module`
-- ----------------------------
DROP TABLE IF EXISTS `module`;
CREATE TABLE `module` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `navi_id_path` varchar(500) DEFAULT NULL,
  `navi_name_path` varchar(500) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKovripa3rfs5f9qu2pvyhgo6xi` (`parent_id`),
  CONSTRAINT `FKovripa3rfs5f9qu2pvyhgo6xi` FOREIGN KEY (`parent_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of module
-- ----------------------------
INSERT INTO `module` VALUES ('24746c09-2960-11e7-b497-21af0a259a98', null, '', '2', '1516698197053', null, '', '管理员管理', 'b8c06782-2a58-11e7-b497-21af0a259a98/24746c09-2960-11e7-b497-21af0a259a98', '系统管理 /管理员管理', 'MENU', '/admin/admin/list', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `module` VALUES ('24a90d78-2a21-11e7-b497-21af0a259a98', '1493170723000', '', '0', '1501859765000', null, '', '删除', '98b33553-827e-11e7-9f6e-708bcdac0848/8fe09b87-296d-11e7-b497-21af0a259a98/24a90d78-2a21-11e7-b497-21af0a259a98', '权限管理 /模块管理 /删除 ', 'FUNCTION', '', '8fe09b87-296d-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('301b3096-2970-11e7-b497-21af0a259a98', '1493094725000', '', '0', '1501859672000', null, '', '保存', 'b8c06782-2a58-11e7-b497-21af0a259a98/24746c09-2960-11e7-b497-21af0a259a98/301b3096-2970-11e7-b497-21af0a259a98', '系统管理 /人员管理 /保存', 'FUNCTION', '', '24746c09-2960-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('36f353ad-2a20-11e7-b497-21af0a259a98', '1493170324000', '', '0', '1501859681000', null, '', '查询', '98b33553-827e-11e7-9f6e-708bcdac0848/3ffd622d-2a1f-11e7-b497-21af0a259a98/36f353ad-2a20-11e7-b497-21af0a259a98', '权限管理 /角色管理 /查询', 'FUNCTION', '', '3ffd622d-2a1f-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('3ffd622d-2a1f-11e7-b497-21af0a259a98', '1493169910000', '', '1', '1516698200796', null, '', '角色管理', '98b33553-827e-11e7-9f6e-708bcdac0848/3ffd622d-2a1f-11e7-b497-21af0a259a98', '权限管理 /角色管理', 'MENU', '/admin/role/list', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `module` VALUES ('402881bc61451b650161457e951f0000', '1517289379102', '', '0', '1517289379102', null, null, '班组维护', null, null, 'MENU', '/admin/basic-data/maintenance/working-team', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881c35eb1d777015eb25f901f0002', null, '', '0', '1519369070998', null, '', '业务中心', '', '', 'MENU', '/admin/member/businessCenter', '6c2f0a65-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('402881c45f04dd28015f050b64a50000', null, '', '4', '1519369163628', null, 'fa fa-suitcase', '客户端管理', '', '', 'MENU', '/admin/oauthclient/list', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `module` VALUES ('402881c45f323425015f3243612a0000', null, '', '0', '1519369107900', null, null, '优惠券管理', '', '', 'MENU', '/admin/coupon/list', '402883835f2fa17a015f2fa9ec4e0003');
INSERT INTO `module` VALUES ('402881c45f333384015f333436040000', null, '', '2', '1519369069220', null, null, '会员等级维护', '', '', 'MENU', '/admin/member/level', '6c2f0a65-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('402881c46179366d016179652d130004', '1518160129299', '', '0', '1518395831384', null, null, '派工', null, null, 'MENU', '/admin/entrust-form/dispatch', '402881c4618767d601618770fed00000');
INSERT INTO `module` VALUES ('402881c4618767d601618770fed00000', '1518395784907', '', '0', '1518395784907', null, null, '车间调度', null, null, 'MENU', null, null);
INSERT INTO `module` VALUES ('402881c4618767d601618786f09f0001', '1518397223071', '', '0', '1518397223071', null, null, '派工单', null, null, 'MENU', '/admin/dispatch-form/dispatch-form', '402881c4618767d601618770fed00000');
INSERT INTO `module` VALUES ('402881c46189322001618934034f0000', '1518425342796', '', '0', '1518425342796', null, null, '仓库管理', null, null, 'MENU', null, null);
INSERT INTO `module` VALUES ('402881c46189322001618935908c0001', '1518425444492', '', '0', '1518425444492', null, null, '仓库管理', null, null, 'MENU', '/admin/store/store', '402881c46189322001618934034f0000');
INSERT INTO `module` VALUES ('402881c4618932200161893717830002', '1518425544579', '', '0', '1518425544579', null, null, '领料出库', null, null, 'MENU', '/admin/store/draw', '402881c46189322001618934034f0000');
INSERT INTO `module` VALUES ('402881c46189322001618937765d0003', '1518425568861', '', '0', '1518425568861', null, null, '采购入库', null, null, 'MENU', '/admin/store/purchase', '402881c46189322001618934034f0000');
INSERT INTO `module` VALUES ('402881c461c1608f0161c17617660003', '1519369197414', '', '0', '1519369197414', null, null, '配件采购', null, null, 'MENU', null, null);
INSERT INTO `module` VALUES ('402881c461c1608f0161c17752020004', '1519369277954', '', '0', '1519369313187', null, null, '采购单管理', null, null, 'MENU', '/admin/purchase/purchase-form', '402881c461c1608f0161c17617660003');
INSERT INTO `module` VALUES ('402881c55f38c257015f38c2e4d00000', '1508485817544', '', '0', '1516763581961', null, null, '附件管理', '', '', 'MENU', '/admin/attachment/list', 'b8c06782-2a58-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('402881d15f8ff42a015f8ff67b560000', '1509948816208', '', '3', '1519369125915', null, 'fa fa-fw fa-file-text-o', '订单管理', '', '', 'MENU', '', null);
INSERT INTO `module` VALUES ('402881d15f8ff42a015f9001a9a90001', '1509949548968', '', '0', '1519369122309', null, null, '销售列表', '', '', 'MENU', '/admin/orderform/list', '402881d15f8ff42a015f8ff67b560000');
INSERT INTO `module` VALUES ('402881d1602ec25f01602f8636df0006', '1512625813214', '', '0', '1519369139605', null, null, '库存预警', '', '', 'MENU', '/admin/product/stockWarning', '8901fc42-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('402881d1604d6cc901604efa523e0004', '1513153516093', '', '0', '1519369100748', null, 'fa fa-fw fa-bank', '店铺管理', '', '', 'MENU', '', null);
INSERT INTO `module` VALUES ('402881d1604d6cc901604efa9f520005', '1513153535825', '', '0', '1519369097423', null, null, '店铺维护', '', '', 'MENU', '/admin/shop/list', '402881d1604d6cc901604efa523e0004');
INSERT INTO `module` VALUES ('402881d16053cf32016053d9280c0002', '1513235228681', '', '0', '1519369092666', null, 'fa fa-fw fa-car', '车辆管理', '', '', 'MENU', '', null);
INSERT INTO `module` VALUES ('402881d16053cf3201605430a7680003', '1513240962920', '', '0', '1519369089148', '', null, '车辆类别管理', '', '', 'MENU', '/admin/vehicle/category-list', '402881d16053cf32016053d9280c0002');
INSERT INTO `module` VALUES ('402881d161207598016120d1f6ad0000', '1516674086569', '', '3', '1516675134328', null, 'fa fa-fw fa-file-text-o', '21', '', '', 'MENU', null, null);
INSERT INTO `module` VALUES ('402881d161207598016120e21f080001', '1516675145479', '', '0', '1516675149936', null, null, 'ces', null, null, 'MENU', null, '402881d16053cf32016053d9280c0002');
INSERT INTO `module` VALUES ('402881d161262c490161263300fc0001', '1516764332284', '', '0', '1518160117016', null, null, '委托书', null, null, 'MENU', null, null);
INSERT INTO `module` VALUES ('402881d161262c490161263861540002', '1516764684628', '', '0', '1518160149079', null, null, '登记委托书', null, null, 'MENU', '/admin/entrust-form/reg-entrust-form', '402881d161262c490161263300fc0001');
INSERT INTO `module` VALUES ('402881d161262c49016126bbf1f70003', '1516773306871', '', '999', '1516773306871', null, null, '基础数据维护', null, null, 'MENU', '', null);
INSERT INTO `module` VALUES ('402881d161262c49016126bc96cf0004', '1516773349071', '', '0', '1517275398510', null, null, '供应商维护', null, null, 'MENU', '/admin/vendor/vendor', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126bd803d0005', '1516773408829', '', '0', '1517289294949', null, null, '车型维护', null, null, 'MENU', '/admin/basic-data/vehicle/type', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126bd95eb0006', '1516773414378', '', '0', '1517289305118', null, null, '零件维护', null, null, 'MENU', '/admin/basic-data/vehicle/parts', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126bdb59c0007', '1516773422491', '', '0', '1517289289603', null, null, '维修项目维护', null, null, 'MENU', '/admin/basic-data/maintenance/item', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126be0aaf0008', '1516773444270', '', '0', '1517275412468', null, null, '项目需求配件维护', null, null, 'MENU', '/admin/maintenance/parts', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126be27e20009', '1516773451746', '', '0', '1517275414323', null, null, '保险公司维护', null, null, 'MENU', '/admin/insurance/Insurance', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402881d161262c49016126be4ab6000a', '1516773460662', '', '0', '1517289311597', null, null, '车辆维护', null, null, 'MENU', '/admin/basic-data/vehicle/vehicle', '402881d161262c49016126bbf1f70003');
INSERT INTO `module` VALUES ('402883835f2fa17a015f2fa27de00000', null, '', '0', '1516763636256', null, null, '字典维护', '', '', 'MENU', '/admin/dictionary/list', 'b8c06782-2a58-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('402883835f2fa17a015f2fa2a5df0001', null, '', '0', '1516763953995', null, null, '字典类别管理', '', '', 'MENU', '/admin/dictionary/categoryList', 'b8c06782-2a58-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('402883835f2fa17a015f2fa2cea90002', null, '', '0', '1516764100656', null, null, '地址管理', '', '', 'MENU', '/admin/address/list', 'b8c06782-2a58-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('402883835f2fa17a015f2fa9ec4e0003', null, '', '0', '1519369111212', null, 'fa fa-fw fa-star', '营销管理', '', '', 'MENU', '', null);
INSERT INTO `module` VALUES ('402883835f2fa17a015f2faaa6400004', null, '', '0', '1519369106871', '', null, '充值红包管理', '', '', 'MENU', '/admin/redpacket/list', '402883835f2fa17a015f2fa9ec4e0003');
INSERT INTO `module` VALUES ('4705b0bd-8278-11e7-9f6e-708bcdac0848', '1502883830000', '', '1', '1516677396968', '', 'am-icon-file', '测试', '98b33553-827e-11e7-9f6e-708bcdac0848/8fe09b87-296d-11e7-b497-21af0a259a98/4705b0bd-8278-11e7-9f6e-708bcdac0848', '权限管理/模块管理/测试', 'MENU', '', '8fe09b87-296d-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('6c2f0a65-4a8c-11e7-82ff-58da3c9e6316', '1496735117000', '', '0', '1519369077387', null, 'fa fa-users', '会员管理', '6c2f0a65-4a8c-11e7-82ff-58da3c9e6316', '会员管理', 'MENU', '', null);
INSERT INTO `module` VALUES ('724b1acc-2a20-11e7-b497-21af0a259a98', '1493170423000', '', '0', '1501859683000', null, '', '删除', '98b33553-827e-11e7-9f6e-708bcdac0848/3ffd622d-2a1f-11e7-b497-21af0a259a98/724b1acc-2a20-11e7-b497-21af0a259a98', '权限管理/角色管理 /删除', 'FUNCTION', '', '3ffd622d-2a1f-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('7f9e1d2d-4a8c-11e7-82ff-58da3c9e6316', '1496735150000', '', '1', '1519369065710', null, '', '会员维护', '6c2f0a65-4a8c-11e7-82ff-58da3c9e6316/7f9e1d2d-4a8c-11e7-82ff-58da3c9e6316', '会员管理 /会员维护', 'MENU', '/admin/member/list', '6c2f0a65-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('8901fc42-4a8c-11e7-82ff-58da3c9e6316', '1496735165000', '', '2', '1519369142795', null, 'glyphicon glyphicon-list-alt', '商品管理', '8901fc42-4a8c-11e7-82ff-58da3c9e6316', '商品管理', 'MENU', '', null);
INSERT INTO `module` VALUES ('8f772bb9-2a21-11e7-b497-21af0a259a98', '1493170902000', '', '0', '1501859675000', null, '', '删除', 'b8c06782-2a58-11e7-b497-21af0a259a98/24746c09-2960-11e7-b497-21af0a259a98/8f772bb9-2a21-11e7-b497-21af0a259a98', '系统管理 /人员管理 /删除', 'FUNCTION', '', '24746c09-2960-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('8fe09b87-296d-11e7-b497-21af0a259a98', '1493093598000', '', '0', '1516698204401', null, '', '模块管理', '98b33553-827e-11e7-9f6e-708bcdac0848/8fe09b87-296d-11e7-b497-21af0a259a98', '权限管理/模块管理', 'MENU', '/admin/module/list', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `module` VALUES ('98b33553-827e-11e7-9f6e-708bcdac0848', '1502886544000', '', '5', '1516692405333', null, 'glyphicon glyphicon-lock', '权限管理', '98b33553-827e-11e7-9f6e-708bcdac0848', '权限管理', 'MENU', '', null);
INSERT INTO `module` VALUES ('9e936709-4a8c-11e7-82ff-58da3c9e6316', '1496735201000', '', '0', '1519369138492', '', '', '商品分类维护', '8901fc42-4a8c-11e7-82ff-58da3c9e6316/9e936709-4a8c-11e7-82ff-58da3c9e6316', '商品管理 /商品分类维护', 'MENU', '/admin/product/productCategoryList', '8901fc42-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('a3909276-297c-11e7-b497-21af0a259a98', '1493100073000', '', '0', '1501859762000', null, '', '保存', '98b33553-827e-11e7-9f6e-708bcdac0848/8fe09b87-296d-11e7-b497-21af0a259a98/a3909276-297c-11e7-b497-21af0a259a98', '权限管理 /模块管理 /保存 ', 'FUNCTION', '', '8fe09b87-296d-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('a6fd0442-4a8c-11e7-82ff-58da3c9e6316', '1496735216000', '', '1', '1519369137484', '', '', '商品维护', '8901fc42-4a8c-11e7-82ff-58da3c9e6316/a6fd0442-4a8c-11e7-82ff-58da3c9e6316', '商品管理 /商品维护', 'MENU', '/admin/product/productList', '8901fc42-4a8c-11e7-82ff-58da3c9e6316');
INSERT INTO `module` VALUES ('b8c06782-2a58-11e7-b497-21af0a259a98', '1493194593000', '', '6', '1516692410499', null, 'fa fa-fw fa-wrench', '系统管理', 'b8c06782-2a58-11e7-b497-21af0a259a98', '系统管理', 'MENU', '', null);
INSERT INTO `module` VALUES ('c9f178a3-2a20-11e7-b497-21af0a259a98', '1493170570000', '', '0', '1501859759000', null, '', '查询', '98b33553-827e-11e7-9f6e-708bcdac0848/8fe09b87-296d-11e7-b497-21af0a259a98/c9f178a3-2a20-11e7-b497-21af0a259a98', '权限管理 /模块管理 /查询', 'FUNCTION', '', '8fe09b87-296d-11e7-b497-21af0a259a98');
INSERT INTO `module` VALUES ('f959cd6f-2a1f-11e7-b497-21af0a259a98', '1493170221000', '', '0', '1501859690000', null, '', '保存', '98b33553-827e-11e7-9f6e-708bcdac0848/3ffd622d-2a1f-11e7-b497-21af0a259a98/f959cd6f-2a1f-11e7-b497-21af0a259a98', '权限管理/角色管理 /保存', 'FUNCTION', '', '3ffd622d-2a1f-11e7-b497-21af0a259a98');

-- ----------------------------
-- Table structure for `oauth_access_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_token`;
CREATE TABLE `oauth_access_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(128) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  `authentication` blob,
  `refresh_token` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_access_token
-- ----------------------------
INSERT INTO `oauth_access_token` VALUES ('79b50fdd84d1e5dd40318dd98d1ba563', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001618BAD63F1787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002439366561616433632D303034372D343337662D393937362D3263626663363963636663627371007E0009770800000161C13E12C878737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002461306566623166642D643937662D343530342D616536362D393961633734356436643061, '0ade7d7970c764fb26bb21888ffa467f', 'jichu', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400056A6963687578737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, 'c41dcc3ee980eeee35b5b7f51651bdbe');
INSERT INTO `oauth_access_token` VALUES ('f2f49bb9bbe4a8a65a86f491f1a899e7', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C9A3166C787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002433316430393762322D366566332D343335382D613532382D6363643135393338663361667371007E000977080000016213E5C21178737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002466656333616130392D396136612D346664332D393763622D653761626435656263376162, '0b883991f151094545aaab3614951d08', 'gongzhang', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D65740009676F6E677A68616E6778737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '916c8862eb6d987cfd27afea4dc6ba69');
INSERT INTO `oauth_access_token` VALUES ('22a5dd27512bd8b1e9fcd7160f4bc1dd', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016147593F1E787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002439383735376131662D316131372D343533662D613630382D3337343064303564643138617371007E0009770800000161DF44D91D78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000043F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002465356362663730302D653864642D346466632D383639352D383934613263313730626639, '2239da922a27a5086d14241d9018f14d', null, 'syhgjd', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B72656469726563745572697400124C6A6176612F6C616E672F537472696E673B4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0011787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000F4C001172657175657374506172616D657465727371007E000E4C000573636F706571007E00117870740006737968676A64737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E000E7870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F74797065740012636C69656E745F63726564656E7469616C73740009636C69656E745F6964740006737968676A6478737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0020770C000000103F40000000000000787371007E00173F40000000000000770800000010000000007870707371007E0020770C000000103F400000000000017400096672616D65776F726B787371007E0020770C000000103F400000000000007870, 'ed3043df4cf641f3943a046d3bea3870');
INSERT INTO `oauth_access_token` VALUES ('07c9a691b2bee46e79fab27719cd6f18', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001618535EFC3787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002433666566303935352D643230322D343861392D396637382D3636323733616362376338347371007E0009770800000161C0E4E6CE78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002430643130336539642D313239362D343134652D386439652D343937386136383631353566, '23538ec77cf6086a0d84c897603904e1', 'jiedai', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400066A696564616978737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '2d736f9b35afa4f36bcf9ff6f064c1b0');
INSERT INTO `oauth_access_token` VALUES ('e5de2432315eac2883cd3b8aa774b0e5', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015ED4048D1F7870737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000043F400000000000027400047265616474000577726974657874000662656172657274002463323538393233392D313635662D343130342D613534392D356635326133353238313339, '2ca14d222efe51873ce379f5f5b68670', null, 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B72656469726563745572697400124C6A6176612F6C616E672F537472696E673B4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0011787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000F4C001172657175657374506172616D657465727371007E000E4C000573636F706571007E00117870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E000E7870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F74797065740012636C69656E745F63726564656E7469616C7374000573636F706574000A7265616420777269746578737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000274000472656164740005777269746578017371007E0020770C000000103F40000000000000787371007E00173F40000000000000770800000010000000007870707371007E0020770C000000103F400000000000017400096672616D65776F726B787371007E0020770C000000103F400000000000007870, null);
INSERT INTO `oauth_access_token` VALUES ('3a34cc7ae6ed5d9339ca6f0836c35e0f', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161DC6CA95E787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002465323138373365662D656531652D343164632D386665382D3233323166656433626165387371007E00097708000001625BE63BFB78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000043F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002431323163363239612D363538662D346462382D626562342D346136396637333238326264, '3b81d145452f5592e6af39f632f56690', 'admin', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '8fd26985d6eb6ab57d7518de4611ab77');
INSERT INTO `oauth_access_token` VALUES ('f6220d36e03e80a58616761afc918bed', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C2F87531787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002466363638383831382D633930332D343565612D616234642D6233326130336435316565307371007E000977080000016223B7037E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000043F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002464663063643762312D373564302D343661352D383533372D643038636631646664316365, '937d17c81cdfe31546ff986c1770f0cd', 'kuguan', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400066B756775616E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '20fa7bd0da504c59d34678debf9a8f06');
INSERT INTO `oauth_access_token` VALUES ('5524d240d3369e59b792f53c33e642c4', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001616719F926787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002465653830623137332D373032622D343534392D383166642D3065653837633137616438637371007E0009770800000161FF05932678737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002433663233353264612D333533372D343963642D613233652D313138373835353465353865, 'a332ec7ccd1dd8819161d91c60aea61f', null, 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B72656469726563745572697400124C6A6176612F6C616E672F537472696E673B4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0011787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000F4C001172657175657374506172616D657465727371007E000E4C000573636F706571007E00117870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E000E7870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F74797065740012636C69656E745F63726564656E7469616C73740009636C69656E745F6964740004746F6E7278737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0020770C000000103F40000000000000787371007E00173F40000000000000770800000010000000007870707371007E0020770C000000103F400000000000017400096672616D65776F726B787371007E0020770C000000103F400000000000007870, 'e97c61db9616907014d08b3fad27297a');
INSERT INTO `oauth_access_token` VALUES ('13bd237aa936ab477f4697d86196ce1d', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001616BB2457E787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002430633566636262302D393465392D343936322D623539612D3066343733616339636134357371007E0009770800000162039DDF7E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000043F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002439616463653933322D313162312D343331392D386663392D373834383066626639626533, 'd6bd452a82f834f5164243cd3fea6d8a', '18640019220', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313836343030313932323078737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '3826380741175bad0fd00f1db3d8feee');
INSERT INTO `oauth_access_token` VALUES ('81452911be5949cb92856426569d13e6', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016156A5C2CC787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002433393662663061662D383532652D346661362D623164642D3065373038323030346530357371007E0009770800000161EE915CCC78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002464313365666364632D316463622D346664392D386463372D663962643735363763333365, 'db1b4be2361605d385939dd1c302ad25', '18519537641', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313835313935333736343178737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, '769dc1832a39419410e20cf9b72b662c');
INSERT INTO `oauth_access_token` VALUES ('146a7432634dadca97d21747b18d9be4', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001604728A23F787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002431626137633061382D303834332D346262352D383331632D6464616235346332343164317371007E0009770800000160DF143C3F78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002438353935646630332D653235342D343566362D623936352D313336643933326266356266, 'e1c5a9b1fce23179c383dc020a2153ec', '18640019221', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313836343030313932323178737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, 'f610b6223995fca565a14f64a8f24798');
INSERT INTO `oauth_access_token` VALUES ('8be38e72b8cd88059d0f243f439d24dc', 0xACED0005737200436F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F4175746832416363657373546F6B656E0CB29E361B24FACE0200064C00156164646974696F6E616C496E666F726D6174696F6E74000F4C6A6176612F7574696C2F4D61703B4C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B4C000C72656672657368546F6B656E74003F4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F636F6D6D6F6E2F4F417574683252656672657368546F6B656E3B4C000573636F706574000F4C6A6176612F7574696C2F5365743B4C0009746F6B656E547970657400124C6A6176612F6C616E672F537472696E673B4C000576616C756571007E000578707372001E6A6176612E7574696C2E436F6C6C656374696F6E7324456D7074794D6170593614855ADCE7D002000078707372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015F72D95668787372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E71007E0002787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C756571007E0005787074002436303362303763662D633735662D346335312D396131612D3366656437643039616434627371007E00097708000001600AC4F06878737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C0001637400164C6A6176612F7574696C2F436F6C6C656374696F6E3B7870737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F4000000000000374000472656164740005777269746574000574727573747874000662656172657274002463336664633138352D323763342D343333352D623161362D306663303336396534303230, 'e45b204730007e2d0b6d4ed06e37406e', '18802482337', 'tonr', 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313838303234383233333778737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021, 'b235589a66d953d730a32ff8526a066b');

-- ----------------------------
-- Table structure for `oauth_approvals`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_approvals`;
CREATE TABLE `oauth_approvals` (
  `userId` varchar(256) DEFAULT NULL,
  `clientId` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `expiresAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastModifiedAt` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_approvals
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_client_details`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_details`;
CREATE TABLE `oauth_client_details` (
  `client_id` varchar(128) NOT NULL,
  `resource_ids` varchar(256) DEFAULT NULL,
  `client_secret` varchar(256) DEFAULT NULL,
  `scope` varchar(256) DEFAULT NULL,
  `authorized_grant_types` varchar(256) DEFAULT NULL,
  `web_server_redirect_uri` varchar(256) DEFAULT NULL,
  `authorities` varchar(256) DEFAULT NULL,
  `access_token_validity` int(11) DEFAULT NULL,
  `refresh_token_validity` int(11) DEFAULT NULL,
  `additional_information` varchar(4096) DEFAULT NULL,
  `autoapprove` varchar(256) DEFAULT NULL,
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `UK_3my6lp6ttga6hhwtsutscqset` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_client_details
-- ----------------------------
INSERT INTO `oauth_client_details` VALUES ('syhgjd', 'framework', 'P@ssWord!$', 'read,write,trust', 'password,refresh_token,client_credentials', null, null, null, null, null, null, '402881d16052ab4e016052b7e2de0000', '1513216271066', '', '0', '1513216284197', '沈阳惠工街店');
INSERT INTO `oauth_client_details` VALUES ('syshjd', 'framework', 'P@ssWord@#', 'read,write,trust', 'password,refresh_token,client_credentials', null, null, null, null, null, null, '402881d1608b32fd01608b838e330003', '1514169142835', '', '0', '1514169156670', '沈阳沈河街店');
INSERT INTO `oauth_client_details` VALUES ('tonr', 'framework', 'secret', 'read,write,trust', 'password,refresh_token,client_credentials', '', '', null, null, null, '', '1', null, '', '0', '1507622214757', '会员管理系统');

-- ----------------------------
-- Table structure for `oauth_client_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_client_token`;
CREATE TABLE `oauth_client_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication_id` varchar(128) NOT NULL,
  `user_name` varchar(256) DEFAULT NULL,
  `client_id` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_client_token
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_code`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_code`;
CREATE TABLE `oauth_code` (
  `code` varchar(256) DEFAULT NULL,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_code
-- ----------------------------

-- ----------------------------
-- Table structure for `oauth_refresh_token`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_token`;
CREATE TABLE `oauth_refresh_token` (
  `token_id` varchar(256) DEFAULT NULL,
  `token` blob,
  `authentication` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of oauth_refresh_token
-- ----------------------------
INSERT INTO `oauth_refresh_token` VALUES ('533a6b4dedf107ca1079fb67999fad29', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002461636438623030612D623431632D343361312D393334392D6531623262633434653232347372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000015F9BB2B65C78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('b235589a66d953d730a32ff8526a066b', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002436303362303763662D633735662D346335312D396131612D3366656437643039616434627372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001600AC4F06878, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313838303234383233333778737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('f610b6223995fca565a14f64a8f24798', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002431626137633061382D303834332D346262352D383331632D6464616235346332343164317372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000160DF143C3F78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313836343030313932323178737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('ed3043df4cf641f3943a046d3bea3870', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002439383735376131662D316131372D343533662D613630382D3337343064303564643138617372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161DF44D91D78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B72656469726563745572697400124C6A6176612F6C616E672F537472696E673B4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0011787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000F4C001172657175657374506172616D657465727371007E000E4C000573636F706571007E00117870740006737968676A64737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E000E7870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F74797065740012636C69656E745F63726564656E7469616C73740009636C69656E745F6964740006737968676A6478737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0020770C000000103F40000000000000787371007E00173F40000000000000770800000010000000007870707371007E0020770C000000103F400000000000017400096672616D65776F726B787371007E0020770C000000103F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('769dc1832a39419410e20cf9b72b662c', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002433393662663061662D383532652D346661362D623164642D3065373038323030346530357372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161EE915CCC78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313835313935333736343178737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('e97c61db9616907014d08b3fad27297a', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002465653830623137332D373032622D343534392D383166642D3065653837633137616438637372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161FF05932678, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A657870000000007704000000007871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B72656469726563745572697400124C6A6176612F6C616E672F537472696E673B4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0011787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000F4C001172657175657374506172616D657465727371007E000E4C000573636F706571007E00117870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E000E7870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000037708000000040000000274000A6772616E745F74797065740012636C69656E745F63726564656E7469616C73740009636C69656E745F6964740004746F6E7278737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0020770C000000103F40000000000000787371007E00173F40000000000000770800000010000000007870707371007E0020770C000000103F400000000000017400096672616D65776F726B787371007E0020770C000000103F400000000000007870);
INSERT INTO `oauth_refresh_token` VALUES ('3826380741175bad0fd00f1db3d8feee', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002430633566636262302D393465392D343936322D623539612D3066343733616339636134357372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000162039DDF7E78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B78707400064D454D4245527871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000B313836343030313932323078737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('2d736f9b35afa4f36bcf9ff6f064c1b0', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002433666566303935352D643230322D343861392D396637382D3636323733616362376338347372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C0E4E6CE78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400066A696564616978737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('c41dcc3ee980eeee35b5b7f51651bdbe', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002439366561616433632D303034372D343337662D393937362D3263626663363963636663627372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000161C13E12C878, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400056A6963687578737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('20fa7bd0da504c59d34678debf9a8f06', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002466363638383831382D633930332D343565612D616234642D6233326130336435316565307372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016223B7037E78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D657400066B756775616E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('8fd26985d6eb6ab57d7518de4611ab77', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002465323138373365662D656531652D343164632D386665382D3233323166656433626165387372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001625BE63BFB78, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D6574000561646D696E78737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);
INSERT INTO `oauth_refresh_token` VALUES ('916c8862eb6d987cfd27afea4dc6ba69', 0xACED00057372004C6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744578706972696E674F417574683252656672657368546F6B656E2FDF47639DD0C9B70200014C000A65787069726174696F6E7400104C6A6176612F7574696C2F446174653B787200446F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E636F6D6D6F6E2E44656661756C744F417574683252656672657368546F6B656E73E10E0A6354D45E0200014C000576616C75657400124C6A6176612F6C616E672F537472696E673B787074002433316430393762322D366566332D343335382D613532382D6363643135393338663361667372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000016213E5C21178, 0xACED0005737200416F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F417574683241757468656E7469636174696F6EBD400B02166252130200024C000D73746F7265645265717565737474003C4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F4F4175746832526571756573743B4C00127573657241757468656E7469636174696F6E7400324C6F72672F737072696E676672616D65776F726B2F73656375726974792F636F72652F41757468656E7469636174696F6E3B787200476F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E416273747261637441757468656E7469636174696F6E546F6B656ED3AA287E6E47640E0200035A000D61757468656E746963617465644C000B617574686F7269746965737400164C6A6176612F7574696C2F436F6C6C656374696F6E3B4C000764657461696C737400124C6A6176612F6C616E672F4F626A6563743B787000737200266A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654C697374FC0F2531B5EC8E100200014C00046C6973747400104C6A6176612F7574696C2F4C6973743B7872002C6A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65436F6C6C656374696F6E19420080CB5EF71E0200014C00016371007E00047870737200136A6176612E7574696C2E41727261794C6973747881D21D99C7619D03000149000473697A65787000000001770400000001737200426F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E617574686F726974792E53696D706C654772616E746564417574686F7269747900000000000001A40200014C0004726F6C657400124C6A6176612F6C616E672F537472696E673B787074000541444D494E7871007E000C707372003A6F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E4F41757468325265717565737400000000000000010200075A0008617070726F7665644C000B617574686F72697469657371007E00044C000A657874656E73696F6E7374000F4C6A6176612F7574696C2F4D61703B4C000B726564697265637455726971007E000E4C00077265667265736874003B4C6F72672F737072696E676672616D65776F726B2F73656375726974792F6F61757468322F70726F76696465722F546F6B656E526571756573743B4C000B7265736F7572636549647374000F4C6A6176612F7574696C2F5365743B4C000D726573706F6E7365547970657371007E0014787200386F72672E737072696E676672616D65776F726B2E73656375726974792E6F61757468322E70726F76696465722E426173655265717565737436287A3EA37169BD0200034C0008636C69656E74496471007E000E4C001172657175657374506172616D657465727371007E00124C000573636F706571007E00147870740004746F6E72737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C654D6170F1A5A8FE74F507420200014C00016D71007E00127870737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F400000000000067708000000080000000374000A6772616E745F7479706574000870617373776F7264740009636C69656E745F6964740004746F6E72740008757365726E616D65740009676F6E677A68616E6778737200256A6176612E7574696C2E436F6C6C656374696F6E7324556E6D6F6469666961626C65536574801D92D18F9B80550200007871007E0009737200176A6176612E7574696C2E4C696E6B656448617368536574D86CD75A95DD2A1E020000787200116A6176612E7574696C2E48617368536574BA44859596B8B7340300007870770C000000103F40000000000003740004726561647400057772697465740005747275737478017371007E0025770C000000103F40000000000000787371007E001A3F40000000000000770800000010000000007870707371007E0025770C000000103F400000000000017400096672616D65776F726B787371007E0025770C000000103F40000000000000787372004F6F72672E737072696E676672616D65776F726B2E73656375726974792E61757468656E7469636174696F6E2E557365726E616D6550617373776F726441757468656E7469636174696F6E546F6B656E00000000000001A40200024C000B63726564656E7469616C7371007E00054C00097072696E636970616C71007E00057871007E0003017371007E00077371007E000B0000000177040000000171007E000F7871007E0032737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E001A3F400000000000067708000000080000000474000D636C69656E745F73656372657474000673656372657471007E001C71007E001D71007E001E71007E001F71007E002071007E0021780070737200326F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657200000000000001A40200075A00116163636F756E744E6F6E457870697265645A00106163636F756E744E6F6E4C6F636B65645A001563726564656E7469616C734E6F6E457870697265645A0007656E61626C65644C000B617574686F72697469657371007E00144C000870617373776F726471007E000E4C0008757365726E616D6571007E000E7870010101017371007E0022737200116A6176612E7574696C2E54726565536574DD98509395ED875B0300007870737200466F72672E737072696E676672616D65776F726B2E73656375726974792E636F72652E7573657264657461696C732E5573657224417574686F72697479436F6D70617261746F7200000000000001A4020000787077040000000171007E000F787071007E0021);

-- ----------------------------
-- Table structure for `operation_record`
-- ----------------------------
DROP TABLE IF EXISTS `operation_record`;
CREATE TABLE `operation_record` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `business_type` varchar(50) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `ip_address` varchar(30) DEFAULT NULL,
  `admin_id` varchar(36) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKdlxl6kpfq3l1hwnaakqgp8udr` (`admin_id`),
  KEY `FKf39ltb5tnf3lvyl2yg2go2hfc` (`client_id`),
  KEY `FKt21pslb6qae9q2opw25w9l2i3` (`member_id`),
  CONSTRAINT `FKdlxl6kpfq3l1hwnaakqgp8udr` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`),
  CONSTRAINT `FKf39ltb5tnf3lvyl2yg2go2hfc` FOREIGN KEY (`client_id`) REFERENCES `oauth_client_details` (`client_id`),
  CONSTRAINT `FKt21pslb6qae9q2opw25w9l2i3` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of operation_record
-- ----------------------------
INSERT INTO `operation_record` VALUES ('402881c45f0aaba1015f0aabd2b80000', '1507712553649', '', '0', '1507712553649', 'RECHARGE', '会员充值金额100.0，其中赠送金额为90.0', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c45f0aaba1015f0aac06dd0003', '1507712567005', '', '0', '1507712567005', 'CONSUME', '现金消费 0.0，余额消费 120.0，积分消费 0消费项：亚特兰蒂斯门票 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c45f0aac6c015f0aacbdce0002', '1507712613833', '', '0', '1507712613833', 'CONSUME', '现金消费 0.0，余额消费 240.0，积分消费 0消费项：亚特兰蒂斯门票 x2', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c45f0ac0a7015f0ac237410000', '1507714021170', '', '0', '1507714021170', 'DEDUCT_BALANCE', '储值消费 20.0 元', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c45f0ac0a7015f0ac26d310001', '1507714034993', '', '0', '1507714034993', 'FAST_INCREASE_POINT', '充值积分 90 分', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c55f37a680015f37a6e2430002', '1508467204671', '', '0', '1508467204671', 'CONSUME', '现金消费 18.0 元，余额消费 100.0 元，积分消费 200 分  消费项：亚特兰蒂斯门票 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881c55f37a680015f386a5c960005', '1508480015504', '', '0', '1508480015504', 'CONSUME', '现金消费 20.0 元，余额消费 100.0 元，积分消费 0 分  消费项：亚特兰蒂斯门票 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d15f8ef004015f8efbd8da0002', '1509932390613', '', '0', '1509932390613', 'CONSUME', '现金消费 596.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x2', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15f8f5164015f8f5187550000', '1509938005840', '', '0', '1509938005840', 'CONSUME', '现金消费 399.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Nox香薰助眠灯（送3块香薰片） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15f8f53be015f8f53f4b20000', '1509938164909', '', '0', '1509938164909', 'CONSUME', '现金消费 399.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Nox香薰助眠灯（送3块香薰片） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15f940767015f940ee00a000a', '1510017523718', '', '0', '1510017523718', 'CONSUME', '现金消费 697.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Nox香薰助眠灯（送3块香薰片） x1,Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fb80a96015fb83820f10000', '1510624207084', '', '0', '1510624207084', 'CONSUME', '现金消费 288.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fb954cb015fb95e7ee90002', '1510643498725', '', '0', '1510643498725', 'CONSUME', '现金消费 296.77 元，余额消费 0.0 元，积分消费 123 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fb954cb015fb9ae40100005', '1510648725520', '', '0', '1510648725520', 'CONSUME', '现金消费 198.0 元，余额消费 100.0 元，积分消费 0 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fbd3fba015fbd42cfb70000', '1510708793263', '', '0', '1510708793263', 'REJECT', '现金退款 296.77 元，余额退款 0.0 元，积分退款 123 分  订单号：11141501301806', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fbd4808015fbd5ce3a40008', '1510710502302', '', '0', '1510710502302', 'CONSUME', '现金消费 196.0 元，余额消费 100.0 元，积分消费 200 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fbd4808015fbd684b670009', '1510711249767', '', '0', '1510711249767', 'REJECT', '现金退款 196.0 元，余额退款 100.0 元，积分退款 200 分  订单号：11150947529840', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fbe70d6015fbe738a700004', '1510728764011', '', '0', '1510728764011', 'CONSUME', '现金消费 399.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Nox香薰助眠灯（送3块香薰片） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d15fc26587015fc2b377a60004', '1510800062369', '', '0', '1510800062369', 'CONSUME', '现金消费 298.0 元，余额消费 0.0 元，积分消费 0 分  消费项：Flexwarm 飞乐思热敷眼罩（送移动电源） x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d1602ea5e001602ea946330000', '1512611333679', '', '0', '1512611333679', 'CONSUME', '现金消费 0.0 元，余额消费 60.0 元，积分消费 200 分  消费项：三星 x2', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d1602ec25f01602ecc0a8a0000', '1512613612165', '', '0', '1512613612165', 'REJECT', '现金退款 0.0 元，余额退款 60.0 元，积分退款 200 分  订单号：12061724421183', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d1602ec25f01602ecca12f0005', '1512613650735', '', '0', '1512613650735', 'CONSUME', '现金消费 297.0 元，余额消费 0.0 元，积分消费 0 分  消费项：精品大蚝丹东牡蛎新鲜鲜活海蛎子新鲜野生生蚝顺丰10斤 x2,三星 x2,三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160444ee901604455e2e20005', '1512974967518', '', '0', '1512974967518', 'CONSUME', '现金消费 334.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d160444ee90160445644af0008', '1512974992559', '', '0', '1512974992559', 'CONSUME', '现金消费 99.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d1604457110160445765380002', '1512975066420', '', '0', '1512975066420', 'CONSUME', '现金消费 99.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d160445711016044578c8a0005', '1512975076490', '', '0', '1512975076490', 'CONSUME', '现金消费 334.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d1604459490160445a23530002', '1512975246159', '', '0', '1512975246159', 'CONSUME', '现金消费 334.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d160499a3f016049df00b00004', '1513067839658', '', '0', '1513067839658', 'RECHARGE', '会员充值金额100.0，其中赠送金额为50.0', '0:0:0:0:0:0:0:1', null, 'tonr', '1');
INSERT INTO `operation_record` VALUES ('402881d160499a3f016049e0bab60009', '1513067952822', '', '0', '1513067952822', 'CONSUME', '现金消费 138.0 元，余额消费 0.0 元，积分消费 0 分  消费项：牛奶奶油草莓新鲜超甜丹东99烘焙现摘蛋糕鲜草莓大 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d16049e1d7016049e4aa0a0000', '1513068210694', '', '0', '1513068210694', 'REJECT', '现金退款 138.0 元，余额退款 0.0 元，积分退款 0 分  订单号：12121639081152', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d16090b354016090bcccfb0002', '1514256780536', '', '0', '1514256780536', 'CONSUME', '现金消费 334.0 元，余额消费 0.0 元，积分消费 0 分  消费项：三星 x1', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160d381bc0160d47f72e50000', '1515393610458', '', '0', '1515393610458', 'CONSUME', '现金消费 239.2 元，余额消费 0.0 元，积分消费 0 分  消费项：左C柱 x1.0,右后视镜 x1.0', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160d8999d0160d8a816a30000', '1515463382686', '', '0', '1515463382686', 'CONSUME', '现金消费 298.0 元，余额消费 0.0 元，积分消费 0 分  消费项：玛吉斯轮胎 MS360 175/65R15 84H Maxxis x1.0', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160d8999d0160d8a988460001', '1515463477318', '', '0', '1515463477318', 'REJECT', '现金退款 298.0 元，余额退款 0.0 元，积分退款 0 分  订单号：01090911051944', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160d8999d0160d8ac8e6a0006', '1515463675498', '', '0', '1515463675498', 'CONSUME', '现金消费 837.9000000000001 元，余额消费 0.0 元，积分消费 0 分  消费项：右后视镜 x1.0,左C柱 x1.0,车顶 x1.0', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160d8999d0160d946eaf7000b', '1515473791735', '', '0', '1515473791735', 'CONSUME', '现金消费 598.0 元，余额消费 0.0 元，积分消费 0 分  消费项：右前翼子板 x1.0,左裙边 x1.0,左C柱 x1.0', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');
INSERT INTO `operation_record` VALUES ('402881d160f743040160f744c6bf0003', '1515976967866', '', '0', '1515976967866', 'CONSUME', '现金消费 598.0 元，余额消费 0.0 元，积分消费 0 分  消费项：前保险杠 x1.0,右前翼子板 x1.0', '0:0:0:0:0:0:0:1', null, 'tonr', '402881b65e792228015e7929024f0000');

-- ----------------------------
-- Table structure for `order_form`
-- ----------------------------
DROP TABLE IF EXISTS `order_form`;
CREATE TABLE `order_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `balance` double(11,2) DEFAULT NULL,
  `cash` double(11,2) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  `deliver_to_address_id` varchar(36) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `coupon_id` varchar(36) DEFAULT NULL,
  `finished_date` bigint(20) DEFAULT NULL,
  `payment_status` varchar(11) DEFAULT NULL,
  `shipping_code` varchar(36) DEFAULT NULL,
  `shipping_date` bigint(20) DEFAULT NULL,
  `shipping_status` varchar(20) DEFAULT NULL,
  `returned_money` double DEFAULT NULL,
  `returned_remark` varchar(500) DEFAULT NULL,
  `apply_reject_remark` varchar(500) DEFAULT NULL,
  `returned_balance` double DEFAULT NULL,
  `returned_point` int(11) DEFAULT NULL,
  `payment_type` varchar(11) DEFAULT NULL,
  `shop_id` varchar(36) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKb9e3fs5b1681pd0epfoaa2tov` (`member_id`),
  KEY `FKi8jonxlvuis46vdmu8rvwthfv` (`deliver_to_address_id`),
  KEY `FKjhowmytuel9dsv0r56x5gm9ow` (`coupon_id`),
  KEY `FKlt5nlfsxut0tyvsitwqak64c` (`shop_id`),
  KEY `FKeihp4oeh9op6i0l072q97d992` (`vehicle_id`),
  CONSTRAINT `FKb9e3fs5b1681pd0epfoaa2tov` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`),
  CONSTRAINT `FKeihp4oeh9op6i0l072q97d992` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FKi8jonxlvuis46vdmu8rvwthfv` FOREIGN KEY (`deliver_to_address_id`) REFERENCES `member_address` (`id`),
  CONSTRAINT `FKjhowmytuel9dsv0r56x5gm9ow` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `FKlt5nlfsxut0tyvsitwqak64c` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_form
-- ----------------------------
INSERT INTO `order_form` VALUES ('402881d160c41f2f0160c42385500000', '1515119150403', '', '0', '1515399326640', '0.00', '239.20', '01051025501841', '0', 'DELIVERED', '402881b65e792228015e7929024f0000', null, null, null, '1515398912167', 'UN_PAY', '43', '1514505600000', null, null, null, null, null, null, 'IN_SHOP', '402881d16052c101016052c3e9690000', '402881d160ba10cb0160ba93cda80001');
INSERT INTO `order_form` VALUES ('402881d160d874940160d87886f20000', '1515460265701', '', '0', '1515463477060', '0.00', '298.00', '01090911051944', '0', 'REJECTED', '402881b65e792228015e7929024f0000', null, null, null, '1515463414843', 'PAYED', '1', '1516320000000', null, '298', null, '确认', '0', '0', 'ONLINE', '402881d16052c101016052c3e9690000', null);
INSERT INTO `order_form` VALUES ('402881d160d8999d0160d8ac1c530002', '1515463646291', '', '0', '1515463675289', '0.00', '837.90', '01091007261137', '0', 'PAYED', '402881b65e792228015e7929024f0000', null, null, null, null, 'PAYED', null, null, null, null, null, null, null, null, 'ONLINE', '402881d16052c101016052c3e9690000', '402881d160c02ce10160c03a36c60000');
INSERT INTO `order_form` VALUES ('402881d160d8999d0160d946aa900007', '1515473775248', '', '0', '1515473980507', '0.00', '598.00', '01091256151645', '0', 'RECEIVED', '402881b65e792228015e7929024f0000', null, null, null, '1515473980507', 'PAYED', '345', '1515024000000', null, null, null, null, null, null, 'ONLINE', '402881d1608b32fd01608b82b6fe0002', '402881d160ba10cb0160ba93cda80001');
INSERT INTO `order_form` VALUES ('402881d160d8999d0160d94a5f15000c', '1515474018069', '', '0', '1515474055343', '0.00', '298.00', '01091300181540', '0', 'DELIVERED', '402881b65e792228015e7929024f0000', null, null, null, null, 'UN_PAY', '345', '1515024000000', null, null, null, null, null, null, 'IN_SHOP', '402881d16052c101016052c3e9690000', null);
INSERT INTO `order_form` VALUES ('402881d160f743040160f743843d0000', '1515976885308', '', '0', '1515976967634', '0.00', '598.00', '01150841251469', '0', 'PAYED', '402881b65e792228015e7929024f0000', null, null, null, null, 'PAYED', null, null, null, null, null, null, null, null, 'ONLINE', '402881d1608b32fd01608b82b6fe0002', '402881d160ba10cb0160ba93cda80001');
INSERT INTO `order_form` VALUES ('402881d160f76f6e0160f783ccfd0000', '1515981098225', '', '0', '1515981098225', '0.00', '298.00', '01150951382049', '0', 'UN_PAY', '402881b65e792228015e7929024f0000', null, null, null, null, 'UN_PAY', null, null, null, null, null, null, null, null, 'ONLINE', '402881d16052c101016052c3e9690000', null);

-- ----------------------------
-- Table structure for `order_item`
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `order_form_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `sku_id` varchar(36) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKig43yb5uck2bs9rooevhos3cl` (`order_form_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  KEY `FKiu6yknruli66pm1e23ujb7kch` (`sku_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKig43yb5uck2bs9rooevhos3cl` FOREIGN KEY (`order_form_id`) REFERENCES `order_form` (`id`),
  CONSTRAINT `FKiu6yknruli66pm1e23ujb7kch` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of order_item
-- ----------------------------
INSERT INTO `order_item` VALUES ('402881d160c41f2f0160c423855c0001', null, '', null, null, '1', '402881d160c41f2f0160c42385500000', '402881d160bfb7230160bfcd44ac004d', '402881d160bfb7230160bfcd44ad004f', '5', '149.50');
INSERT INTO `order_item` VALUES ('402881d160c41f2f0160c423855d0002', null, '', null, null, '1', '402881d160c41f2f0160c42385500000', '402881d160bfb7230160bfcc60ab0041', '402881d160bfb7230160bfcc60ac0043', '5', '89.70');
INSERT INTO `order_item` VALUES ('402881d160d874940160d87886f90001', null, '', null, null, '1', '402881d160d874940160d87886f20000', '402881d160b499420160b49b87e90002', null, '5', '298.00');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d8ac1c540003', null, '', null, null, '1', '402881d160d8999d0160d8ac1c530002', '402881d160bfb7230160bfcc60ab0041', '402881d160bfb7230160bfcc60ac0044', '5', '119.70');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d8ac1c540004', null, '', null, null, '1', '402881d160d8999d0160d8ac1c530002', '402881d160bfb7230160bfcd44ac004d', '402881d160bfb7230160bfcd44ad0050', '5', '199.50');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d8ac1c540005', null, '', null, null, '1', '402881d160d8999d0160d8ac1c530002', '402881d160bfb7230160bfcb567d0031', '402881d160bfb7230160bfcb567e0034', '5', '518.70');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d946aa910008', null, '', null, null, '1', '402881d160d8999d0160d946aa900007', '402881d160bfb7230160bfc85627000c', '402881d160bfb7230160bfc85628000e', '5', '299.00');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d946aa910009', null, '', null, null, '1', '402881d160d8999d0160d946aa900007', '402881d160bfb7230160bfcb910b0035', '402881d160bfb7230160bfcb910d0037', '5', '149.50');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d946aa91000a', null, '', null, null, '1', '402881d160d8999d0160d946aa900007', '402881d160bfb7230160bfcd44ac004d', '402881d160bfb7230160bfcd44ad004f', '5', '149.50');
INSERT INTO `order_item` VALUES ('402881d160d8999d0160d94a5f15000d', null, '', null, null, '1', '402881d160d8999d0160d94a5f15000c', '402881d160b499420160b49b87e90002', null, '5', '298.00');
INSERT INTO `order_item` VALUES ('402881d160f743040160f743844c0001', null, '', null, null, '1', '402881d160f743040160f743843d0000', '402881d160bfb7230160bfc067960000', '402881d160bfb7230160bfc067b40002', '5', '299.00');
INSERT INTO `order_item` VALUES ('402881d160f743040160f743844c0002', null, '', null, null, '1', '402881d160f743040160f743843d0000', '402881d160bfb7230160bfc85627000c', '402881d160bfb7230160bfc85628000e', '5', '299.00');
INSERT INTO `order_item` VALUES ('402881d160f76f6e0160f783ccff0001', null, '', null, null, '1', '402881d160f76f6e0160f783ccfd0000', '402881d160b499420160b49b87e90002', null, '5', '298.00');

-- ----------------------------
-- Table structure for `out_store_form`
-- ----------------------------
DROP TABLE IF EXISTS `out_store_form`;
CREATE TABLE `out_store_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `business_type` varchar(20) DEFAULT NULL,
  `operator_id` varchar(36) DEFAULT NULL,
  `out_store_date` datetime DEFAULT NULL,
  `store_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of out_store_form
-- ----------------------------
INSERT INTO `out_store_form` VALUES ('402881c461c1608f0161c160d0360000', '1519367802927', '', '0', '1519367802927', 'DRAWING', null, '2018-02-23 14:36:43', null);
INSERT INTO `out_store_form` VALUES ('402881c461c6b5cf0161c6b639370000', '1519457286448', '', '0', '1519457286448', 'DRAWING', null, '2018-02-24 15:28:06', null);
INSERT INTO `out_store_form` VALUES ('402881c461c6b5cf0161c6b75e1d0002', '1519457361436', '', '0', '1519457361436', 'DRAWING', null, '2018-02-24 15:29:21', null);
INSERT INTO `out_store_form` VALUES ('402881c461c6b7910161c6b879290000', '1519457433891', '', '0', '1519457433891', 'DRAWING', null, '2018-02-24 15:30:34', '402881c4618932200161894418dc0006');
INSERT INTO `out_store_form` VALUES ('402881c461c6b7910161c6b8c8a70003', '1519457454247', '', '0', '1519457454247', 'DRAWING', null, '2018-02-24 15:30:54', '402881c4618932200161894418dc0006');
INSERT INTO `out_store_form` VALUES ('402881c461c6e8720161c6fabf33000b', '1519461777199', '', '0', '1519461777199', 'DRAWING', null, '2018-02-24 16:42:57', '402881c4618932200161894418dc0006');
INSERT INTO `out_store_form` VALUES ('402881c461c6e8720161c70bd5f70015', '1519462897143', '', '0', '1519462897143', 'DRAWING', null, '2018-02-24 17:01:37', '402881c4618932200161894418dc0006');

-- ----------------------------
-- Table structure for `out_store_form_item`
-- ----------------------------
DROP TABLE IF EXISTS `out_store_form_item`;
CREATE TABLE `out_store_form_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `out_store_form_id` varchar(36) DEFAULT NULL,
  `relation_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of out_store_form_item
-- ----------------------------
INSERT INTO `out_store_form_item` VALUES ('402881c461c1608f0161c160d0460001', '1519367802945', '', '0', '1519367802945', '1', '402881c461c1608f0161c160d0360000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c1608f0161c160d0470002', '1519367802951', '', '0', '1519367802951', '3', '402881c461c1608f0161c160d0360000', '402881c4617832d501617860d570000f');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b5cf0161c6b6394a0001', '1519457286469', '', '0', '1519457286469', '30', '402881c461c6b5cf0161c6b639370000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b5cf0161c6b75e1d0003', '1519457361437', '', '0', '1519457361437', '30', '402881c461c6b5cf0161c6b75e1d0002', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b7910161c6b8793c0001', '1519457433912', '', '0', '1519457433912', '1', '402881c461c6b7910161c6b879290000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b7910161c6b879550002', '1519457433941', '', '0', '1519457433941', '3', '402881c461c6b7910161c6b879290000', '402881c4617832d501617860d570000f');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b7910161c6b8c8a90004', '1519457454249', '', '0', '1519457454249', '1', '402881c461c6b7910161c6b8c8a70003', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6b7910161c6b8c8ac0005', '1519457454252', '', '0', '1519457454252', '3', '402881c461c6b7910161c6b8c8a70003', '402881c4617832d501617860d570000f');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6e8720161c6fabf3d000c', '1519461777209', '', '0', '1519461777209', '31', '402881c461c6e8720161c6fabf33000b', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6e8720161c6fabf41000d', '1519461777216', '', '0', '1519461777216', '3', '402881c461c6e8720161c6fabf33000b', '402881c4617832d501617860d570000f');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6e8720161c70bd5f70016', '1519462897143', '', '0', '1519462897143', '1', '402881c461c6e8720161c70bd5f70015', '402881bc61464dfe01614651c56e0002');
INSERT INTO `out_store_form_item` VALUES ('402881c461c6e8720161c70bd5f90017', '1519462897145', '', '0', '1519462897145', '3', '402881c461c6e8720161c70bd5f70015', '402881c4617832d501617860d570000f');

-- ----------------------------
-- Table structure for `paint`
-- ----------------------------
DROP TABLE IF EXISTS `paint`;
CREATE TABLE `paint` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of paint
-- ----------------------------
INSERT INTO `paint` VALUES ('402881d16053cf32016053d4f4430000', '1513234953272', '', '0', '1513234970416', '标准漆', '299', '起/标准面');
INSERT INTO `paint` VALUES ('402881d16053cf32016053d51d8d0001', '1513234963853', '', '1', '1513234970428', '高端漆', '399', '起/标准面');

-- ----------------------------
-- Table structure for `paint_order_form`
-- ----------------------------
DROP TABLE IF EXISTS `paint_order_form`;
CREATE TABLE `paint_order_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `apply_reject_remark` varchar(500) DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `cash` double DEFAULT NULL,
  `finished_date` bigint(20) DEFAULT NULL,
  `payment_status` int(11) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `returned_balance` double DEFAULT NULL,
  `returned_money` double DEFAULT NULL,
  `returned_point` int(11) DEFAULT NULL,
  `returned_remark` varchar(500) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `coupon_id` varchar(36) DEFAULT NULL,
  `deliver_to_address_id` varchar(36) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  `shop_id` varchar(36) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiacwu1pyn6fxfkpyxh6qm0ff2` (`coupon_id`),
  KEY `FKlhc5v5pn4e21u0tivyn9m8mvp` (`deliver_to_address_id`),
  KEY `FKodtlrsx1uiq500596oj8517jo` (`member_id`),
  KEY `FK9jqjnutuhf1k6h3pjoj4cy4u6` (`shop_id`),
  KEY `FK6imijvc1wcntraod858vouhh3` (`vehicle_id`),
  CONSTRAINT `FK6imijvc1wcntraod858vouhh3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`),
  CONSTRAINT `FK9jqjnutuhf1k6h3pjoj4cy4u6` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `FKiacwu1pyn6fxfkpyxh6qm0ff2` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `FKlhc5v5pn4e21u0tivyn9m8mvp` FOREIGN KEY (`deliver_to_address_id`) REFERENCES `member_address` (`id`),
  CONSTRAINT `FKodtlrsx1uiq500596oj8517jo` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of paint_order_form
-- ----------------------------
INSERT INTO `paint_order_form` VALUES ('402881d16091847d0160918589ad0000', '1514269936032', '', '0', '1514269936032', null, '0', '657.8000000000001', null, '0', '0', null, null, null, null, 'UN_PAY', null, null, '402881b65e792228015e7929024f0000', '402881d16052c101016052c3e9690000', '402881d160916d9c0160916ed8850000', '12261432161927');

-- ----------------------------
-- Table structure for `paint_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `paint_order_item`;
CREATE TABLE `paint_order_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `paint_id` varchar(36) DEFAULT NULL,
  `paint_surface_id` varchar(36) DEFAULT NULL,
  `point` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `order_form_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgy246jh7kgr0ipfg1qgho7a0u` (`paint_id`),
  KEY `FKqblm8mcjft3yhqv4q5rkb079c` (`paint_surface_id`),
  KEY `FK4rsx3dh17k6rbn0k8fmay4dvg` (`order_form_id`),
  CONSTRAINT `FK4rsx3dh17k6rbn0k8fmay4dvg` FOREIGN KEY (`order_form_id`) REFERENCES `paint_order_form` (`id`),
  CONSTRAINT `FKgy246jh7kgr0ipfg1qgho7a0u` FOREIGN KEY (`paint_id`) REFERENCES `paint` (`id`),
  CONSTRAINT `FKqblm8mcjft3yhqv4q5rkb079c` FOREIGN KEY (`paint_surface_id`) REFERENCES `paint_surface` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of paint_order_item
-- ----------------------------
INSERT INTO `paint_order_item` VALUES ('402881d16091847d0160918589ba0001', null, '', null, null, '1', '402881d16053cf32016053d4f4430000', '402881d16052f28b01605308dbe80011', '0', '299', '402881d16091847d0160918589ad0000');
INSERT INTO `paint_order_item` VALUES ('402881d16091847d0160918589ba0002', null, '', null, null, '1', '402881d16053cf32016053d4f4430000', '402881d16052f28b016053091c190013', '0', '299', '402881d16091847d0160918589ad0000');

-- ----------------------------
-- Table structure for `paint_surface`
-- ----------------------------
DROP TABLE IF EXISTS `paint_surface`;
CREATE TABLE `paint_surface` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `standards_percent` double DEFAULT NULL,
  `img_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs112nmqjw2h2t0gkbjd0mb9pm` (`img_id`),
  CONSTRAINT `FKs112nmqjw2h2t0gkbjd0mb9pm` FOREIGN KEY (`img_id`) REFERENCES `attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of paint_surface
-- ----------------------------
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605301b3730001', '1513221108588', '', '1', '1513221108588', '前保险杠', '1', '402881d16052f28b01605301a9280000');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605302d60a0003', '1513221182986', '', '2', '1513221182986', '后保险杠', '1', '402881d16052f28b01605302cffe0002');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053046aa40005', '1513221286564', '', '3', '1513221286564', '左前翼子板', '1', '402881d16052f28b016053038bef0004');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605304d4690006', '1513221313641', '', '4', '1513221313641', '右前翼子板', '1', '402881d16052f28b016053038bef0004');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605305959a0008', '1513221363098', '', '5', '1513221363098', '左后翼子板', '1', '402881d16052f28b0160530590af0007');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605305bf890009', '1513221373833', '', '6', '1513221373833', '右后翼子板', '1', '402881d16052f28b0160530590af0007');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b0160530655da000b', '1513221412314', '', '7', '1513221412314', '左前车门', '1', '402881d16052f28b016053065159000a');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053067811000c', '1513221421073', '', '8', '1513221421073', '右前车门', '1', '402881d16052f28b016053065159000a');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053069c49000e', '1513221430345', '', '9', '1513221430345', '左后车门', '1', '402881d16052f28b01605306968c000d');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605306bb90000f', '1513221438352', '', '10', '1513221438352', '右后车门', '1', '402881d16052f28b01605306968c000d');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b01605308dbe80011', '1513221577704', '', '11', '1513221577704', '前车盖', '1.2', '402881d16052f28b01605308d18c0010');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053091c190013', '1513221594137', '', '12', '1513221594137', '后车盖', '1', '402881d16052f28b0160530918cf0012');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a3553a0015', '1513231701306', '', '13', '1513231701306', '车顶', '1.3', '402881d16052f28b016053a3514a0014');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a3b77b0017', '1513231726458', '', '14', '1513231726458', '左裙边', '0.5', '402881d16052f28b016053a3afbe0016');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a40cd10018', '1513231748305', '', '15', '1513231748305', '右裙边', '0.5', '402881d16052f28b016053a3afbe0016');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a46e6c001a', '1513231773292', '', '16', '1513231773292', '左后视镜', '0.3', '402881d16052f28b016053a467530019');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a4ddc2001b', '1513231801794', '', '17', '1513231801794', '右后视镜', '0.3', '402881d16052f28b016053a467530019');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a57ceb001d', '1513231842538', '', '18', '1513231842538', '左A柱', '0.5', '402881d16052f28b016053a56f19001c');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a5b730001e', '1513231857456', '', '19', '1513231857456', '右A柱', '0.5', '402881d16052f28b016053a56f19001c');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a6b07a0020', '1513231921274', '', '20', '1513231921274', '左C柱', '0.5', '402881d16052f28b016053a6a676001f');
INSERT INTO `paint_surface` VALUES ('402881d16052f28b016053a6d3890021', '1513231930249', '', '21', '1513231930249', '右C柱', '0.5', '402881d16052f28b016053a6a676001f');

-- ----------------------------
-- Table structure for `parts`
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `model_number` varchar(500) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `origin_place` varchar(100) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `standard` varchar(100) DEFAULT NULL,
  `unit_id` varchar(36) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKc2axvn3gk69wl5qrwcijqgade` (`unit_id`),
  KEY `FK80elurrux6xjkufulxb5lrxb7` (`category_id`),
  CONSTRAINT `FK80elurrux6xjkufulxb5lrxb7` FOREIGN KEY (`category_id`) REFERENCES `parts_category` (`id`),
  CONSTRAINT `FKc2axvn3gk69wl5qrwcijqgade` FOREIGN KEY (`unit_id`) REFERENCES `dictionary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of parts
-- ----------------------------
INSERT INTO `parts` VALUES ('402881bc61464dfe0161464eeecf0001', '1517303033547', '', '0', '1517303036135', null, '123', null, '213', null, null, null, null, '402881bc61464dfe0161464ed3090000');
INSERT INTO `parts` VALUES ('402881bc61464dfe01614651c56e0002', '1517303219566', '', '0', '1518068737677', '玛吉斯', 'MS360', '84H Maxxis', '玛吉斯轮胎', '玛吉斯', '298', '175/65R15', '402881bc61464dfe01614651f7030003', '402881d1612ad21501612bc413ae0004');
INSERT INTO `parts` VALUES ('402881c4617832d501617860d570000f', '1518143067499', '', '0', '1518143213887', null, 'mf', '0W-20 SN级', '美孚/Mobil 美孚1号全合成机油 ', null, '299', '4L', '402881bc61464dfe01614651f7030003', '402881c4617832d50161785fb067000e');

-- ----------------------------
-- Table structure for `parts_category`
-- ----------------------------
DROP TABLE IF EXISTS `parts_category`;
CREATE TABLE `parts_category` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl6vl2e59xqtyqrkjbv5l5j261` (`parent_id`),
  CONSTRAINT `FKl6vl2e59xqtyqrkjbv5l5j261` FOREIGN KEY (`parent_id`) REFERENCES `parts_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of parts_category
-- ----------------------------
INSERT INTO `parts_category` VALUES ('402881bc61464dfe0161464ed3090000', '1517303026405', '', '0', '1517303036137', '11', '402881d1612ad21501612bc413ae0004');
INSERT INTO `parts_category` VALUES ('402881c4617832d50161785fb067000e', '1518142992481', '', '0', '1518142992481', '机油', null);
INSERT INTO `parts_category` VALUES ('402881d1612ad21501612bc1fb4e0001', '1516857588558', '', '0', '1516952954721', '77', null);
INSERT INTO `parts_category` VALUES ('402881d1612ad21501612bc27ae00002', '1516857621216', '', '0', '1516952951195', '11', '402881d1612ad21501612bc1fb4e0001');
INSERT INTO `parts_category` VALUES ('402881d1612ad21501612bc2f1760003', '1516857651574', '', '0', '1516952958418', '3', null);
INSERT INTO `parts_category` VALUES ('402881d1612ad21501612bc413ae0004', '1516857725870', '', '0', '1516857725870', '轮胎', null);
INSERT INTO `parts_category` VALUES ('402881d1612fef36016130683a240003', '1516935592484', '', '0', '1516952962681', '1', null);
INSERT INTO `parts_category` VALUES ('402881d1612fef36016130684d7a0004', '1516935597434', '', '0', '1516952960568', '2', '402881d1612fef36016130683a240003');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `price` double(11,2) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `product_category_id` varchar(36) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `on_sale` bit(1) DEFAULT NULL,
  `recommend` bit(1) DEFAULT NULL,
  `cover_image_id` varchar(36) DEFAULT NULL,
  `stock_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKcwclrqu392y86y0pmyrsi649r` (`product_category_id`),
  KEY `FK6wiq3ykcyy7mde1tqmr9k5765` (`cover_image_id`),
  CONSTRAINT `FK6wiq3ykcyy7mde1tqmr9k5765` FOREIGN KEY (`cover_image_id`) REFERENCES `attachment` (`id`),
  CONSTRAINT `FKcwclrqu392y86y0pmyrsi649r` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('402881d160b473a50160b4740d530000', '1514855992624', '', '0', '1514855992624', null, '德国马牌轮胎 ContiPremiumContact2 CPC2 175/65R15 84H ☆ 宝马原装星标 TL Continental[宝马Mini Countryman原配]', '17', '508.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b455650160b45b5ab40002', '1000');
INSERT INTO `product` VALUES ('402881d160b473a50160b47716f30005', '1514856191729', '', '0', '1514856191729', null, '普利司通轮胎 绿歌伴 EP150 175/65R15 84H Bridgestone', '2', '338.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b473a50160b47512400001', '999');
INSERT INTO `product` VALUES ('402881d160b473a50160b47f89c0000e', '1514856745407', '', '0', '1514856832492', null, '韩泰轮胎 傲特马 K715 175/65R15 T Hankook[本田飞度/锋范/夏利N7原配]', '3', '238.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b473a50160b47e9d660006', null);
INSERT INTO `product` VALUES ('402881d160b473a50160b48bc8b20013', '1514857547953', '', '0', '1514857547953', null, '邓禄普轮胎 LM703 175/65R15 84H Dunlop', '5', '355.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b473a50160b48b3c110010', '999');
INSERT INTO `product` VALUES ('402881d160b473a50160b490027e0017', '1514857824894', '', '0', '1514857824894', null, '米其林轮胎 韧悦 ENERGY XM2 175/65R15 84H Michelin', '5', '468.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b473a50160b48f59990014', null);
INSERT INTO `product` VALUES ('402881d160b499420160b49b87e90002', '1514858579931', '', '0', '1515474055344', null, '玛吉斯轮胎 MS360 175/65R15 84H Maxxis', '5', '298.00', null, '402881d160b455650160b45a1dcf0000', null, null, null, '402881d160b499420160b49b682d0000', '998');
INSERT INTO `product` VALUES ('402881d160b499420160b4a5e1950004', '1514859258259', '', '0', '1514859258259', null, '【正品行货】美孚/Mobil 美孚1号全合成机油 0W-40 SN级（4L装）[SN]', '5', '399.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4a5599d0003', '999');
INSERT INTO `product` VALUES ('402881d160b499420160b4a954260006', '1514859484197', '', '0', '1514859484197', null, '【品牌直供】嘉实多/Castrol 极护全合成机油 0W-40 SN（4L装）[SN/CF]', '5', '369.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4a947a40005', '999');
INSERT INTO `product` VALUES ('402881d160b499420160b4ab4ec90008', '1514859613896', '', '0', '1514859613896', null, '【品牌直供】3M 金装全合成润滑油 SN 0W-40 4L PN10081[SN]', '5', '449.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4ab423c0007', '999');
INSERT INTO `product` VALUES ('402881d160b499420160b4abec9e000a', '1514859654301', '', '0', '1514859654301', null, '【品牌直供】雪佛龙/CHEVRON 金富力 SN 0W-40 全合成机油 4L[SN]', '5', '345.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4abe1880009', '999');
INSERT INTO `product` VALUES ('402881d160b499420160b4ac6dc9000c', '1514859687368', '', '0', '1514859687368', null, '【正品行货】壳牌/Shell 金装极净超凡喜力全合成机油ULTRA SN/CF 0W40 4L[SN/CF]', '5', '698.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4ac5d06000b', '999');
INSERT INTO `product` VALUES ('402881d160b499420160b4ad8cc1000e', '1514859760832', '', '0', '1514859760832', null, '【正品行货】壳牌/Shell 喜力半合成机油HX7 5W-40 SN/CF 蓝壳（4L装）[SN/CF]', '5', '238.00', null, '402881d160b455650160b45a45b50001', null, null, null, '402881d160b499420160b4ad4a49000d', '999');
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc067960000', '1515045545860', '', '0', '1515121687654', null, '前保险杠', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44a36eb0015', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc6fbd20004', '1515045977041', '', '1', '1515121715181', null, '后保险杠', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44a6ade0017', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc80db70008', '1515046047158', '', '2', '1515121746393', null, '左前翼子板', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44b1ccf0019', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc85627000c', '1515046065701', '', '3', '1515121760012', null, '右前翼子板', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44b1ccf0019', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc90cf40010', '1515046112499', '', '4', '1515121770773', null, '左后翼子板', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44b7d26001c', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc988940015', '1515046144147', '', '5', '1515121775035', null, '右后翼子板', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44b7d26001c', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfc9c5960019', '1515046159765', '', '6', '1515121781957', null, '左前车门', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44ba908001f', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfca11e5001d', '1515046179299', '', '7', '1515121789068', null, '右前车门', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44ba908001f', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfca59040021', '1515046197507', '', '8', '1515121795364', null, '左后车门', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44bddd80022', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfca8cf50025', '1515046210804', '', '9', '1515121799989', null, '右后车门', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44bddd80022', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcad5bd0029', '1515046229435', '', '10', '1515121810948', null, '前车盖', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44c1a340025', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcb130c002d', '1515046245131', '', '11', '1515121820734', null, '后车盖', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44c3dce0027', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcb567d0031', '1515046262387', '', '12', '1515121827102', null, '车顶', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44c59540029', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcb910b0035', '1515046277386', '', '13', '1515121834243', null, '左裙边', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44c75b4002b', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcbd9ce0039', '1515046296012', '', '14', '1515121839068', null, '右裙边', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44c75b4002b', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcc2433003d', '1515046315058', '', '15', '1515121856124', null, '左后视镜', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44ccac9002e', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcc60ab0041', '1515046330538', '', '16', '1515121861256', null, '右后视镜', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44ccac9002e', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfccc19c0045', '1515046355355', '', '17', '1515121873621', null, '左A柱', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44d0f190031', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfccfe420049', '1515046370881', '', '18', '1515121877876', null, '右A柱', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44d0f190031', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcd44ac004d', '1515046388907', '', '19', '1515121906780', null, '左C柱', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44d90290034', null);
INSERT INTO `product` VALUES ('402881d160bfb7230160bfcd8efb0051', '1515046407930', '', '20', '1515121911011', null, '右C柱', '5', null, null, '402881d160bef6460160bfa8c67d0002', null, null, null, '402881d160c42ceb0160c44d90290034', null);

-- ----------------------------
-- Table structure for `product_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `show_in_index` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKlkvy3axep0ba8ccvrvfoyrfu4` (`parent_id`),
  CONSTRAINT `FKlkvy3axep0ba8ccvrvfoyrfu4` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('402881d160b455650160b45a1dcf0000', '1514854292928', '', '0', '1514854292928', '轮胎', null, null, '');
INSERT INTO `product_category` VALUES ('402881d160b455650160b45a45b50001', '1514854303157', '', '0', '1514854303157', '机油', null, null, '');
INSERT INTO `product_category` VALUES ('402881d160bef6460160bfa8c67d0002', '1515043997305', '', '0', '1515044265314', '钣金喷漆', null, null, '');

-- ----------------------------
-- Table structure for `product_details`
-- ----------------------------
DROP TABLE IF EXISTS `product_details`;
CREATE TABLE `product_details` (
  `product_id` varchar(36) NOT NULL,
  `attachment_id` varchar(36) NOT NULL,
  KEY `FKpoyvhhmwd9a467vtljwxwoqjm` (`attachment_id`),
  KEY `FKrhahp4f26x99lqf0kybcs79rb` (`product_id`),
  CONSTRAINT `FKpoyvhhmwd9a467vtljwxwoqjm` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id`),
  CONSTRAINT `FKrhahp4f26x99lqf0kybcs79rb` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_details
-- ----------------------------
INSERT INTO `product_details` VALUES ('402881d160b473a50160b4740d530000', '402881d160b455650160b45bb8110003');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47716f30005', '402881d160b473a50160b476bcf20004');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f79ef0008');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f79f50009');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f7a04000c');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f7a08000d');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f79ea0007');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f79fa000a');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47f79ff000b');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b48bc8b20013', '402881d160b473a50160b48ba3e80012');
INSERT INTO `product_details` VALUES ('402881d160b473a50160b490027e0017', '402881d160b473a50160b48fdb3b0016');

-- ----------------------------
-- Table structure for `product_product_standard`
-- ----------------------------
DROP TABLE IF EXISTS `product_product_standard`;
CREATE TABLE `product_product_standard` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `product_standard_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrs9oreark6v0pedugqyaylcx` (`product_id`),
  KEY `FKq1s5d05j915j6uab2eas9x994` (`product_standard_id`),
  CONSTRAINT `FKq1s5d05j915j6uab2eas9x994` FOREIGN KEY (`product_standard_id`) REFERENCES `product_standard` (`id`),
  CONSTRAINT `FKrs9oreark6v0pedugqyaylcx` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_product_standard
-- ----------------------------
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44a3c720016', '1515121687666', '', '0', '1515121687666', '402881d160bfb7230160bfc067960000', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44aa7f90018', '1515121715193', '', '0', '1515121715193', '402881d160bfb7230160bfc6fbd20004', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44b21df001a', '1515121746399', '', '0', '1515121746399', '402881d160bfb7230160bfc80db70008', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44b5719001b', '1515121760025', '', '0', '1515121760025', '402881d160bfb7230160bfc85627000c', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44b811c001d', '1515121770780', '', '0', '1515121770780', '402881d160bfb7230160bfc90cf40010', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44b91c0001e', '1515121775040', '', '0', '1515121775040', '402881d160bfb7230160bfc988940015', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44baccb0020', '1515121781963', '', '0', '1515121781963', '402881d160bfb7230160bfc9c5960019', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44bc8920021', '1515121789074', '', '0', '1515121789074', '402881d160bfb7230160bfca11e5001d', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44be12f0023', '1515121795375', '', '0', '1515121795375', '402881d160bfb7230160bfca59040021', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44bf33a0024', '1515121799994', '', '0', '1515121799994', '402881d160bfb7230160bfca8cf50025', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44c1e0a0026', '1515121810954', '', '0', '1515121810954', '402881d160bfb7230160bfcad5bd0029', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44c44450028', '1515121820741', '', '0', '1515121820741', '402881d160bfb7230160bfcb130c002d', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44c5d23002a', '1515121827107', '', '0', '1515121827107', '402881d160bfb7230160bfcb567d0031', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44c7909002c', '1515121834249', '', '0', '1515121834249', '402881d160bfb7230160bfcb910b0035', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44c8be2002d', '1515121839074', '', '0', '1515121839074', '402881d160bfb7230160bfcbd9ce0039', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44cce82002f', '1515121856130', '', '0', '1515121856130', '402881d160bfb7230160bfcc2433003d', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44ce2960030', '1515121861270', '', '0', '1515121861270', '402881d160bfb7230160bfcc60ab0041', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44d12db0032', '1515121873627', '', '0', '1515121873627', '402881d160bfb7230160bfccc19c0045', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44d237a0033', '1515121877882', '', '0', '1515121877882', '402881d160bfb7230160bfccfe420049', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44d94680035', '1515121906792', '', '0', '1515121906792', '402881d160bfb7230160bfcd44ac004d', '402881d160bef6460160bfa8c6700000');
INSERT INTO `product_product_standard` VALUES ('402881d160c42ceb0160c44da4ed0036', '1515121911020', '', '0', '1515121911020', '402881d160bfb7230160bfcd8efb0051', '402881d160bef6460160bfa8c6700000');

-- ----------------------------
-- Table structure for `product_product_standard_items`
-- ----------------------------
DROP TABLE IF EXISTS `product_product_standard_items`;
CREATE TABLE `product_product_standard_items` (
  `product_product_standard_id` varchar(36) NOT NULL,
  `product_standard_item_id` varchar(36) NOT NULL,
  KEY `FK4o786gpwqff3evjiqgquvqm5o` (`product_standard_item_id`),
  KEY `FKt0ffh3ifvcchnub09iq8q9hu3` (`product_product_standard_id`),
  CONSTRAINT `FK4o786gpwqff3evjiqgquvqm5o` FOREIGN KEY (`product_standard_item_id`) REFERENCES `product_standard_item` (`id`),
  CONSTRAINT `FKt0ffh3ifvcchnub09iq8q9hu3` FOREIGN KEY (`product_product_standard_id`) REFERENCES `product_product_standard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_product_standard_items
-- ----------------------------
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44a3c720016', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44a3c720016', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44aa7f90018', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44aa7f90018', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b21df001a', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b21df001a', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b5719001b', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b5719001b', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b811c001d', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b811c001d', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b91c0001e', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44b91c0001e', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44baccb0020', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44baccb0020', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44bc8920021', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44bc8920021', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44be12f0023', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44be12f0023', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44bf33a0024', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44bf33a0024', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c1e0a0026', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c1e0a0026', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c44450028', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c44450028', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c5d23002a', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c5d23002a', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c7909002c', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c7909002c', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c8be2002d', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44c8be2002d', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44cce82002f', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44cce82002f', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44ce2960030', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44ce2960030', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d12db0032', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d12db0032', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d237a0033', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d237a0033', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d94680035', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44d94680035', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44da4ed0036', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `product_product_standard_items` VALUES ('402881d160c42ceb0160c44da4ed0036', '402881d160bef6460160bfacdd5f0004');

-- ----------------------------
-- Table structure for `product_standard`
-- ----------------------------
DROP TABLE IF EXISTS `product_standard`;
CREATE TABLE `product_standard` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `product_category_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4xcwljgyglhw2w341uplyl5jf` (`product_category_id`),
  CONSTRAINT `FK4xcwljgyglhw2w341uplyl5jf` FOREIGN KEY (`product_category_id`) REFERENCES `product_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_standard
-- ----------------------------
INSERT INTO `product_standard` VALUES ('402881d160bef6460160bfa8c6700000', '1515043997286', '', '0', '1515044265311', '油漆', null, '402881d160bef6460160bfa8c67d0002');

-- ----------------------------
-- Table structure for `product_standard_item`
-- ----------------------------
DROP TABLE IF EXISTS `product_standard_item`;
CREATE TABLE `product_standard_item` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `product_standard_id` varchar(36) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk9pnqtt87hdljuh4metrcls0i` (`product_standard_id`),
  CONSTRAINT `FKk9pnqtt87hdljuh4metrcls0i` FOREIGN KEY (`product_standard_id`) REFERENCES `product_standard` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_standard_item
-- ----------------------------
INSERT INTO `product_standard_item` VALUES ('402881d160bef6460160bfacdd5f0003', '1515044265305', '', '0', '1515044265305', '标准漆', '402881d160bef6460160bfa8c6700000', '299');
INSERT INTO `product_standard_item` VALUES ('402881d160bef6460160bfacdd5f0004', '1515044265311', '', '1', '1515044265311', '高端漆', '402881d160bef6460160bfa8c6700000', '399');

-- ----------------------------
-- Table structure for `product_styles`
-- ----------------------------
DROP TABLE IF EXISTS `product_styles`;
CREATE TABLE `product_styles` (
  `product_id` varchar(36) NOT NULL,
  `attachment_id` varchar(36) NOT NULL,
  KEY `FKai6wuue607ay5oedt4xqm19ol` (`attachment_id`),
  KEY `FKp9r0ges42ctt2q3r9vftfv0uu` (`product_id`),
  CONSTRAINT `FKai6wuue607ay5oedt4xqm19ol` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id`),
  CONSTRAINT `FKp9r0ges42ctt2q3r9vftfv0uu` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of product_styles
-- ----------------------------
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b4740d530000', '402881d160b455650160b45b5ab40002');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b47716f30005', '402881d160b473a50160b47512400001');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b47716f30005', '402881d160b473a50160b47627d80002');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b47716f30005', '402881d160b473a50160b47665dc0003');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b47f89c0000e', '402881d160b473a50160b47e9d660006');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b48bc8b20013', '402881d160b473a50160b48b3c0b000f');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b48bc8b20013', '402881d160b473a50160b48b3c110010');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b48bc8b20013', '402881d160b473a50160b48b3c180011');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b490027e0017', '402881d160b473a50160b48f59990014');
INSERT INTO `product_styles` VALUES ('402881d160b473a50160b490027e0017', '402881d160b473a50160b48f599e0015');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b49b87e90002', '402881d160b499420160b49b682d0000');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b49b87e90002', '402881d160b499420160b49b829e0001');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4a5e1950004', '402881d160b499420160b4a5599d0003');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4a954260006', '402881d160b499420160b4a947a40005');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4ab4ec90008', '402881d160b499420160b4ab423c0007');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4abec9e000a', '402881d160b499420160b4abe1880009');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4ac6dc9000c', '402881d160b499420160b4ac5d06000b');
INSERT INTO `product_styles` VALUES ('402881d160b499420160b4ad8cc1000e', '402881d160b499420160b4ad4a49000d');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc067960000', '402881d16052f28b01605301a9280000');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc6fbd20004', '402881d16052f28b01605302cffe0002');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc80db70008', '402881d16052f28b016053038bef0004');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc85627000c', '402881d16052f28b016053038bef0004');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc90cf40010', '402881d16052f28b0160530590af0007');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc988940015', '402881d16052f28b0160530590af0007');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfc9c5960019', '402881d16052f28b016053065159000a');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfca11e5001d', '402881d16052f28b016053065159000a');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfca59040021', '402881d16052f28b01605306968c000d');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfca8cf50025', '402881d16052f28b01605306968c000d');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcad5bd0029', '402881d16052f28b01605308d18c0010');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcb130c002d', '402881d16052f28b0160530918cf0012');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcb567d0031', '402881d16052f28b016053a3514a0014');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcb910b0035', '402881d16052f28b016053a3afbe0016');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcbd9ce0039', '402881d16052f28b016053a3afbe0016');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcc2433003d', '402881d16052f28b016053a467530019');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcc60ab0041', '402881d16052f28b016053a467530019');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfccc19c0045', '402881d16052f28b016053a56f19001c');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfccfe420049', '402881d16052f28b016053a56f19001c');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcd44ac004d', '402881d16052f28b016053a6a676001f');
INSERT INTO `product_styles` VALUES ('402881d160bfb7230160bfcd8efb0051', '402881d16052f28b016053a6a676001f');

-- ----------------------------
-- Table structure for `purchase_form`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_form`;
CREATE TABLE `purchase_form` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `clerk_id` varchar(36) DEFAULT NULL,
  `creator_id` varchar(36) DEFAULT NULL,
  `order_number` varchar(20) DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase_form
-- ----------------------------
INSERT INTO `purchase_form` VALUES ('402881c461c1e6bf0161c1f94deb0000', '1519377796577', '', '0', '1519377838403', '402881c45eff19a4015eff80ec080002', '402881c45eff19a4015eff80ec080002', '02231723161200', null, null);
INSERT INTO `purchase_form` VALUES ('402881c461c1e6bf0161c1fa1ae90002', '1519377849064', '', '0', '1519455924221', '402881c46179366d01617966d7040006', '402881c45eff19a4015eff80ec080002', '02231724091928', '2018-02-07 00:00:00', 'IN_STORE');
INSERT INTO `purchase_form` VALUES ('402881c461c64d4e0161c65843a90000', '1519451128731', '', '0', '1519454911725', '402881c46179366d01617966d7040006', '402881c45eff19a4015eff80ec080002', '02241345281679', '2018-02-07 00:00:00', 'IN_STORE');
INSERT INTO `purchase_form` VALUES ('402881c461c6e8720161c6f9aa140000', '1519461706254', '', '0', '1519461719684', '402881c4618932200161893827cb0005', '402881c45eff19a4015eff80ec080002', '02241641461311', '2018-02-05 00:00:00', 'IN_STORE');
INSERT INTO `purchase_form` VALUES ('402881c461c6e8720161c70c7b9c0018', '1519462939548', '', '0', '1519462950296', '402881c46179366d01617966d7040006', '402881c45eff19a4015eff80ec080002', '02241702196899', '2018-02-05 00:00:00', 'IN_STORE');

-- ----------------------------
-- Table structure for `purchase_form_parts`
-- ----------------------------
DROP TABLE IF EXISTS `purchase_form_parts`;
CREATE TABLE `purchase_form_parts` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `count` double DEFAULT NULL,
  `purchase_form_id` varchar(36) DEFAULT NULL,
  `parts_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKs3nqxhfn733afydb811o3qlh2` (`parts_id`),
  KEY `FKphjfhte7p9ojp9xv50n76tdqt` (`purchase_form_id`),
  CONSTRAINT `FKphjfhte7p9ojp9xv50n76tdqt` FOREIGN KEY (`purchase_form_id`) REFERENCES `purchase_form` (`id`),
  CONSTRAINT `FKs3nqxhfn733afydb811o3qlh2` FOREIGN KEY (`parts_id`) REFERENCES `parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of purchase_form_parts
-- ----------------------------
INSERT INTO `purchase_form_parts` VALUES ('402881c461c1e6bf0161c1f94dfc0001', '1519377796599', '', '0', '1519377796599', '1', '402881c461c1e6bf0161c1f94deb0000', '402881c4617832d501617860d570000f');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c1e6bf0161c1fcde5e0005', '1519378030174', '', '0', '1519378030174', '1', '402881c461c1e6bf0161c1fa1ae90002', '402881bc61464dfe01614651c56e0002');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c1e6bf0161c1fcde5f0006', '1519378030175', '', '0', '1519378030175', '6', '402881c461c1e6bf0161c1fa1ae90002', '402881c4617832d501617860d570000f');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c64d4e0161c65843bc0001', '1519451128760', '', '0', '1519451128760', '1', '402881c461c64d4e0161c65843a90000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c6e8720161c6f9aa220001', '1519461706270', '', '0', '1519461706270', '100', '402881c461c6e8720161c6f9aa140000', '402881bc61464dfe01614651c56e0002');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c6e8720161c6f9aa230002', '1519461706275', '', '0', '1519461706275', '100', '402881c461c6e8720161c6f9aa140000', '402881c4617832d501617860d570000f');
INSERT INTO `purchase_form_parts` VALUES ('402881c461c6e8720161c70c7b9c0019', '1519462939548', '', '0', '1519462939548', '10', '402881c461c6e8720161c70c7b9c0018', '402881bc61464dfe01614651c56e0002');

-- ----------------------------
-- Table structure for `red_packet`
-- ----------------------------
DROP TABLE IF EXISTS `red_packet`;
CREATE TABLE `red_packet` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `amount` double(11,2) DEFAULT NULL,
  `min_amount` double(11,2) DEFAULT NULL,
  `end_date` bigint(20) DEFAULT NULL,
  `start_date` bigint(20) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of red_packet
-- ----------------------------
INSERT INTO `red_packet` VALUES ('1', '1508374858857', '', '0', '1513067682692', '50.00', '100.00', '1514764800000', '1506988800000', null);
INSERT INTO `red_packet` VALUES ('2', '1508375932601', '', '2', '1513067682702', '40.00', '100.00', '1512086400000', '1508457600000', null);
INSERT INTO `red_packet` VALUES ('402881d160499a3f016049dc00930002', '1513067643022', '', '1', '1513067682698', '55.00', '100.00', '1514678400000', '1513123200000', null);

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('402881c45effd975015effdcc87d0000', '1507531212918', '', '0', '1519369289883', '超级管理员');
INSERT INTO `role` VALUES ('402881c46179366d0161796676140005', '1518160213524', '', '0', '1518397229315', '车间工长');
INSERT INTO `role` VALUES ('402881c46189322001618937ee1e0004', '1518425599518', '', '0', '1518425607563', '库存管理员');
INSERT INTO `role` VALUES ('402881d1611b601501611c8c2dab0000', '1516602404245', '', '0', '1516767545656', '前台接待');
INSERT INTO `role` VALUES ('402881d161262c49016126beb9c2000b', '1516773489090', '', '0', '1518397298932', '基础数据管理员');

-- ----------------------------
-- Table structure for `role_modules`
-- ----------------------------
DROP TABLE IF EXISTS `role_modules`;
CREATE TABLE `role_modules` (
  `role_id` varchar(36) NOT NULL,
  `module_id` varchar(36) NOT NULL,
  KEY `FKnxc3e53nguousgf65ti2ayxx3` (`module_id`),
  KEY `FKikj9g5f57f4fixgqbp3j9ddae` (`role_id`),
  CONSTRAINT `FKikj9g5f57f4fixgqbp3j9ddae` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKnxc3e53nguousgf65ti2ayxx3` FOREIGN KEY (`module_id`) REFERENCES `module` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role_modules
-- ----------------------------
INSERT INTO `role_modules` VALUES ('402881d1611b601501611c8c2dab0000', '402881d161262c490161263300fc0001');
INSERT INTO `role_modules` VALUES ('402881d1611b601501611c8c2dab0000', '402881d161262c490161263861540002');
INSERT INTO `role_modules` VALUES ('402881c46179366d0161796676140005', '402881c4618767d601618770fed00000');
INSERT INTO `role_modules` VALUES ('402881c46179366d0161796676140005', '402881c4618767d601618786f09f0001');
INSERT INTO `role_modules` VALUES ('402881c46179366d0161796676140005', '402881c46179366d016179652d130004');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '24746c09-2960-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '8f772bb9-2a21-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '301b3096-2970-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881c45f04dd28015f050b64a50000');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402883835f2fa17a015f2fa27de00000');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881c55f38c257015f38c2e4d00000');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881d161262c49016126bbf1f70003');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881bc61451b650161457e951f0000');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881d161262c49016126be4ab6000a');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881d161262c49016126bd95eb0006');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881d161262c49016126bd803d0005');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '402881d161262c49016126bdb59c0007');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `role_modules` VALUES ('402881d161262c49016126beb9c2000b', 'b8c06782-2a58-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c46189322001618937ee1e0004', '402881c46189322001618934034f0000');
INSERT INTO `role_modules` VALUES ('402881c46189322001618937ee1e0004', '402881c46189322001618937765d0003');
INSERT INTO `role_modules` VALUES ('402881c46189322001618937ee1e0004', '402881c4618932200161893717830002');
INSERT INTO `role_modules` VALUES ('402881c46189322001618937ee1e0004', '402881c46189322001618935908c0001');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c461c1608f0161c17617660003');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c461c1608f0161c17752020004');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c46189322001618934034f0000');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c46189322001618937765d0003');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c4618932200161893717830002');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c46189322001618935908c0001');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c4618767d601618770fed00000');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c4618767d601618786f09f0001');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c46179366d016179652d130004');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c490161263300fc0001');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c490161263861540002');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '98b33553-827e-11e7-9f6e-708bcdac0848');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '8fe09b87-296d-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '24a90d78-2a21-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', 'a3909276-297c-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', 'c9f178a3-2a20-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '3ffd622d-2a1f-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', 'f959cd6f-2a1f-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '724b1acc-2a20-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '36f353ad-2a20-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '24746c09-2960-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '8f772bb9-2a21-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '301b3096-2970-11e7-b497-21af0a259a98');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402883835f2fa17a015f2fa2a5df0001');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402883835f2fa17a015f2fa27de00000');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881c55f38c257015f38c2e4d00000');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c49016126bbf1f70003');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881bc61451b650161457e951f0000');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c49016126be4ab6000a');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c49016126bd95eb0006');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c49016126bd803d0005');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', '402881d161262c49016126bdb59c0007');
INSERT INTO `role_modules` VALUES ('402881c45effd975015effdcc87d0000', 'b8c06782-2a58-11e7-b497-21af0a259a98');

-- ----------------------------
-- Table structure for `shop`
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `oauth_client_details_id` varchar(36) DEFAULT NULL,
  `client_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp5uo91hs0nnphexj0obepxi6j` (`client_id`),
  CONSTRAINT `FKp5uo91hs0nnphexj0obepxi6j` FOREIGN KEY (`client_id`) REFERENCES `oauth_client_details` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('402881d16052c101016052c3e9690000', '1513217059168', '', '0', '1514168899571', '沈阳市沈河区惠工街55-2号', '沈阳惠工街店', null, 'syhgjd');
INSERT INTO `shop` VALUES ('402881d1608b32fd01608b82b6fe0002', '1514169087742', '', '0', '1514169167311', '沈阳市沈和街xx大道xxx路', '沈阳沈河街店', null, 'syshjd');

-- ----------------------------
-- Table structure for `shop_styles`
-- ----------------------------
DROP TABLE IF EXISTS `shop_styles`;
CREATE TABLE `shop_styles` (
  `shop_id` varchar(36) NOT NULL,
  `attachment_id` varchar(36) NOT NULL,
  KEY `FKlqbsn46ejt9e0jdi33vs1gb9t` (`attachment_id`),
  KEY `FKcga10nhnd15se9jhqt48dq748` (`shop_id`),
  CONSTRAINT `FKcga10nhnd15se9jhqt48dq748` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  CONSTRAINT `FKlqbsn46ejt9e0jdi33vs1gb9t` FOREIGN KEY (`attachment_id`) REFERENCES `attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of shop_styles
-- ----------------------------
INSERT INTO `shop_styles` VALUES ('402881d16052c101016052c3e9690000', '402881d1608b32fd01608b7fd2a30000');
INSERT INTO `shop_styles` VALUES ('402881d1608b32fd01608b82b6fe0002', '402881d1608b32fd01608b8296970001');

-- ----------------------------
-- Table structure for `sku`
-- ----------------------------
DROP TABLE IF EXISTS `sku`;
CREATE TABLE `sku` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock_count` bigint(20) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `cover_image_id` varchar(36) DEFAULT NULL,
  `is_default` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKovd96qvc9da3k94gf0j822p3o` (`product_id`),
  KEY `FKopfh0vksxtvp1ipngk53ew8dj` (`cover_image_id`),
  CONSTRAINT `FKopfh0vksxtvp1ipngk53ew8dj` FOREIGN KEY (`cover_image_id`) REFERENCES `attachment` (`id`),
  CONSTRAINT `FKovd96qvc9da3k94gf0j822p3o` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sku
-- ----------------------------
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc067b40002', '1515045545904', '', '0', '1515121687667', '299', '999', '402881d160bfb7230160bfc067960000', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc067b40003', '1515045545908', '', '1', '1515121687667', '399', '999', '402881d160bfb7230160bfc067960000', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc6fbd40006', '1515045977044', '', '0', '1515121715194', '299', '999', '402881d160bfb7230160bfc6fbd20004', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc6fbd40007', '1515045977044', '', '1', '1515121715194', '399', '999', '402881d160bfb7230160bfc6fbd20004', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc80db8000a', '1515046047160', '', '0', '1515121746399', '299', '999', '402881d160bfb7230160bfc80db70008', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc80db8000b', '1515046047160', '', '1', '1515121746400', '399', '999', '402881d160bfb7230160bfc80db70008', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc85628000e', '1515046065704', '', '0', '1515473836090', '299', '998', '402881d160bfb7230160bfc85627000c', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc85628000f', '1515046065704', '', '1', '1515121760026', '399', '999', '402881d160bfb7230160bfc85627000c', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc90cf60012', '1515046112502', '', '0', '1515121770781', '299', '999', '402881d160bfb7230160bfc90cf40010', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc90cf60013', '1515046112502', '', '1', '1515121770781', '399', '999', '402881d160bfb7230160bfc90cf40010', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc988960017', '1515046144150', '', '0', '1515121775041', '299', '999', '402881d160bfb7230160bfc988940015', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc988960018', '1515046144150', '', '1', '1515121775041', '399', '999', '402881d160bfb7230160bfc988940015', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc9c597001b', '1515046159767', '', '0', '1515121781964', '299', '999', '402881d160bfb7230160bfc9c5960019', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfc9c598001c', '1515046159768', '', '1', '1515121781964', '299', '999', '402881d160bfb7230160bfc9c5960019', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca11e6001f', '1515046179302', '', '0', '1515121789075', '299', '999', '402881d160bfb7230160bfca11e5001d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca11e60020', '1515046179302', '', '1', '1515121789075', '399', '999', '402881d160bfb7230160bfca11e5001d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca59050023', '1515046197509', '', '0', '1515121795376', '299', '999', '402881d160bfb7230160bfca59040021', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca59050024', '1515046197509', '', '1', '1515121795376', '399', '999', '402881d160bfb7230160bfca59040021', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca8cf60027', '1515046210806', '', '0', '1515121799995', '299', '999', '402881d160bfb7230160bfca8cf50025', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfca8cf60028', '1515046210806', '', '1', '1515121799995', '399', '999', '402881d160bfb7230160bfca8cf50025', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcad5be002b', '1515046229438', '', '0', '1515121810955', '358.8', '999', '402881d160bfb7230160bfcad5bd0029', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcad5be002c', '1515046229438', '', '1', '1515121810955', '478.8', '999', '402881d160bfb7230160bfcad5bd0029', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb130d002f', '1515046245133', '', '0', '1515121820742', '299', '999', '402881d160bfb7230160bfcb130c002d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb130d0030', '1515046245133', '', '1', '1515121820742', '399', '999', '402881d160bfb7230160bfcb130c002d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb567e0033', '1515046262398', '', '0', '1515121827108', '388.7', '999', '402881d160bfb7230160bfcb567d0031', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb567e0034', '1515046262398', '', '1', '1515121827108', '518.7', '999', '402881d160bfb7230160bfcb567d0031', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb910d0037', '1515046277389', '', '0', '1515473836096', '149.5', '998', '402881d160bfb7230160bfcb910b0035', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcb910d0038', '1515046277389', '', '1', '1515121834250', '199.5', '999', '402881d160bfb7230160bfcb910b0035', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcbd9cf003b', '1515046296015', '', '0', '1515121839074', '149.5', '999', '402881d160bfb7230160bfcbd9ce0039', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcbd9cf003c', '1515046296015', '', '1', '1515121839074', '199.5', '999', '402881d160bfb7230160bfcbd9ce0039', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcc2434003f', '1515046315060', '', '0', '1515121856131', '89.7', '999', '402881d160bfb7230160bfcc2433003d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcc24340040', '1515046315060', '', '1', '1515121856131', '119.7', '999', '402881d160bfb7230160bfcc2433003d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcc60ac0043', '1515046330540', '', '0', '1515399326672', '89.7', '997', '402881d160bfb7230160bfcc60ab0041', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcc60ac0044', '1515046330540', '', '1', '1515121861270', '119.7', '999', '402881d160bfb7230160bfcc60ab0041', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfccc19d0047', '1515046355357', '', '0', '1515121873628', '149.5', '999', '402881d160bfb7230160bfccc19c0045', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfccc19d0048', '1515046355357', '', '1', '1515121873628', '199.5', '999', '402881d160bfb7230160bfccc19c0045', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfccfe43004b', '1515046370883', '', '0', '1515121877883', '149.5', '999', '402881d160bfb7230160bfccfe420049', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfccfe43004c', '1515046370883', '', '1', '1515121877883', '199.5', '999', '402881d160bfb7230160bfccfe420049', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcd44ad004f', '1515046388909', '', '0', '1515473836096', '149.5', '996', '402881d160bfb7230160bfcd44ac004d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcd44ad0050', '1515046388909', '', '1', '1515121906793', '199.5', '999', '402881d160bfb7230160bfcd44ac004d', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcd8efc0053', '1515046407932', '', '0', '1515121911021', '149.5', '999', '402881d160bfb7230160bfcd8efb0051', null, '');
INSERT INTO `sku` VALUES ('402881d160bfb7230160bfcd8efc0054', '1515046407932', '', '1', '1515121911022', '199.5', '999', '402881d160bfb7230160bfcd8efb0051', null, '');

-- ----------------------------
-- Table structure for `sku_product_standard_items`
-- ----------------------------
DROP TABLE IF EXISTS `sku_product_standard_items`;
CREATE TABLE `sku_product_standard_items` (
  `sku_id` varchar(36) NOT NULL,
  `product_standard_item_id` varchar(36) NOT NULL,
  KEY `FKlxlr70i9xw2efss30jlxrbhli` (`product_standard_item_id`),
  KEY `FKbv6rh918d07tj6hei4gnvsyuo` (`sku_id`),
  CONSTRAINT `FKbv6rh918d07tj6hei4gnvsyuo` FOREIGN KEY (`sku_id`) REFERENCES `sku` (`id`),
  CONSTRAINT `FKlxlr70i9xw2efss30jlxrbhli` FOREIGN KEY (`product_standard_item_id`) REFERENCES `product_standard_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sku_product_standard_items
-- ----------------------------
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc067b40002', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc067b40003', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc6fbd40006', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc6fbd40007', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc80db8000a', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc80db8000b', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc85628000e', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc85628000f', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc90cf60012', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc90cf60013', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc988960017', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc988960018', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc9c597001b', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfc9c598001c', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca11e6001f', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca11e60020', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca59050023', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca59050024', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca8cf60027', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfca8cf60028', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcad5be002b', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcad5be002c', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb130d002f', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb130d0030', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb567e0033', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb567e0034', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb910d0037', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcb910d0038', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcbd9cf003b', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcbd9cf003c', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcc2434003f', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcc24340040', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcc60ac0043', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcc60ac0044', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfccc19d0047', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfccc19d0048', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfccfe43004b', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfccfe43004c', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcd44ad004f', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcd44ad0050', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcd8efc0053', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `sku_product_standard_items` VALUES ('402881d160bfb7230160bfcd8efc0054', '402881d160bef6460160bfacdd5f0004');

-- ----------------------------
-- Table structure for `store`
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `admin_id` varchar(36) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('402881c4618932200161894418dc0006', '1518426396886', '', '0', '1518426396886', '402881c4618932200161893827cb0005', '001', '仓库1');

-- ----------------------------
-- Table structure for `vehicle`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle`;
CREATE TABLE `vehicle` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `engine_displacement` varchar(50) DEFAULT NULL,
  `production_year` int(11) DEFAULT NULL,
  `member_id` varchar(36) DEFAULT NULL,
  `is_default` bit(1) DEFAULT NULL,
  `vehicle_category_id` varchar(36) DEFAULT NULL,
  `engine_number` varchar(50) DEFAULT NULL,
  `frame_number` varchar(50) DEFAULT NULL,
  `plate_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKk0ve7pcxk1j456a4fqd35lgfk` (`member_id`),
  KEY `FK9mrb3uwgbu74sb0ml7d7f78om` (`vehicle_category_id`),
  CONSTRAINT `FK9mrb3uwgbu74sb0ml7d7f78om` FOREIGN KEY (`vehicle_category_id`) REFERENCES `vehicle_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle
-- ----------------------------
INSERT INTO `vehicle` VALUES ('402881bd616a2b6201616a3733cb0000', '1517905458105', '', '0', '1519637231055', null, null, '402881b65e792228015e7929024f0000', '', '402881d1607bc58201607cb968b30001', null, null, '辽A12345');
INSERT INTO `vehicle` VALUES ('402881c461c6e8720161c70ac5a4000e', '1519462827428', '', '0', '1519637158318', null, null, '2c911f24616e3ed60161c70ac3780aba', '', '402881d160544ac70160544bc4ad0001', '111', '111', '辽A8H891');
INSERT INTO `vehicle` VALUES ('402881d1607850aa01607852caf90000', '1513847180015', '', '0', '1513925114923', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607bcda4490000', '1513905562696', '', '0', '1513925066356', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607cbaae200002', '1513921097248', '', '0', '1513926122804', null, null, '402881b65e792228015e7929024f0000', '', '402881d1607bc58201607cb968b30001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607cf830b10003', '1513925128369', '', '0', '1513925180801', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607cf911980004', '1513925185944', '', '0', '1513926256467', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607d0957570005', '1513926252375', '', '0', '1514268440221', null, null, '402881b65e792228015e7929024f0000', '', '402881d1607bc58201607cb968b30001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607d098dc10006', '1513926266305', '', '0', '1513926271248', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607d09c6800007', '1513926280832', '', '0', '1513926288273', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1607bc58201607d3c84b90008', '1513929606328', '', '0', '1514268441511', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d1608b32fd01608b939c930004', '1514170195091', '', '0', '1514268438673', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d160916d9c0160916ed8850000', '1514268448899', '', '0', '1518146216587', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', '332', '214ecx', '辽A123456');
INSERT INTO `vehicle` VALUES ('402881d160ba10cb0160ba8f3e360000', '1514958437941', '', '0', '1514958742490', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', null, null, null);
INSERT INTO `vehicle` VALUES ('402881d160ba10cb0160ba93cda80001', '1514958736808', '', '0', '1518146216587', null, null, '2c911f245fd8a5e2015fd958285f0005', '', '402881d1607bc58201607cb968b30001', '6619', 'sdfw2234', '辽A11445');
INSERT INTO `vehicle` VALUES ('402881d160c02ce10160c03a36c60000', '1515053528772', '', '0', '1518166277686', null, null, '402881b65e792228015e7929024f0000', '', '402881d160544ac70160544bc4ad0001', '23ff1', 'sdf341', '辽A77864');

-- ----------------------------
-- Table structure for `vehicle_category`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_category`;
CREATE TABLE `vehicle_category` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `hot` bit(1) DEFAULT NULL,
  `logo_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1se1g8yhee0wqhco4gw10brbt` (`parent_id`),
  KEY `FKrcbifnqdkebgc1diapuqjvfb8` (`logo_id`),
  CONSTRAINT `FK1se1g8yhee0wqhco4gw10brbt` FOREIGN KEY (`parent_id`) REFERENCES `vehicle_category` (`id`),
  CONSTRAINT `FKrcbifnqdkebgc1diapuqjvfb8` FOREIGN KEY (`logo_id`) REFERENCES `attachment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle_category
-- ----------------------------
INSERT INTO `vehicle_category` VALUES ('402881bc613f976e01613fa4f9240006', '1517191231771', '', '0', '1517275305383', '测试', null, null, null);
INSERT INTO `vehicle_category` VALUES ('402881bc613f976e01613fa528bd0007', '1517191243965', '', '0', '1517275301422', '测', '402881bc613f976e01613fa4f9240006', null, null);
INSERT INTO `vehicle_category` VALUES ('402881d160544ac70160544aeb8d0000', '1513242684292', '', '0', '1513824307416', '奥迪', null, null, '402881d16076f583016076f5c30f0000');
INSERT INTO `vehicle_category` VALUES ('402881d160544ac70160544bc4ad0001', '1513242739885', '', '0', '1515053267013', 'A6-一汽大众奥迪', '402881d160544ac70160544aeb8d0000', null, null);
INSERT INTO `vehicle_category` VALUES ('402881d1607bc58201607cb968b30001', '1513921013932', '', '0', '1515053261775', 'A4-一汽大众奥迪', '402881d160544ac70160544aeb8d0000', null, null);

-- ----------------------------
-- Table structure for `vehicle_category_paints`
-- ----------------------------
DROP TABLE IF EXISTS `vehicle_category_paints`;
CREATE TABLE `vehicle_category_paints` (
  `vehicle_category_id` varchar(36) NOT NULL,
  `product_standard_item_id` varchar(36) NOT NULL,
  KEY `FKe8lfi26drhca6wjhpafs3jkir` (`product_standard_item_id`),
  KEY `FKv9gji79imvunoeq9hnwjdaom` (`vehicle_category_id`),
  CONSTRAINT `FKe8lfi26drhca6wjhpafs3jkir` FOREIGN KEY (`product_standard_item_id`) REFERENCES `product_standard_item` (`id`),
  CONSTRAINT `FKv9gji79imvunoeq9hnwjdaom` FOREIGN KEY (`vehicle_category_id`) REFERENCES `vehicle_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of vehicle_category_paints
-- ----------------------------
INSERT INTO `vehicle_category_paints` VALUES ('402881d1607bc58201607cb968b30001', '402881d160bef6460160bfacdd5f0003');
INSERT INTO `vehicle_category_paints` VALUES ('402881d1607bc58201607cb968b30001', '402881d160bef6460160bfacdd5f0004');
INSERT INTO `vehicle_category_paints` VALUES ('402881d160544ac70160544bc4ad0001', '402881d160bef6460160bfacdd5f0004');

-- ----------------------------
-- Table structure for `workflow_instance`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_instance`;
CREATE TABLE `workflow_instance` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `auditor_id` varchar(36) DEFAULT NULL,
  `order_id` varchar(36) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of workflow_instance
-- ----------------------------

-- ----------------------------
-- Table structure for `workflow_record`
-- ----------------------------
DROP TABLE IF EXISTS `workflow_record`;
CREATE TABLE `workflow_record` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `auditor_id` varchar(36) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `order_id` varchar(36) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of workflow_record
-- ----------------------------

-- ----------------------------
-- Table structure for `working_team`
-- ----------------------------
DROP TABLE IF EXISTS `working_team`;
CREATE TABLE `working_team` (
  `id` varchar(36) NOT NULL,
  `created_date` bigint(20) DEFAULT NULL,
  `logically_deleted` bit(1) DEFAULT NULL,
  `sort_number` int(11) DEFAULT NULL,
  `updated_date` bigint(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of working_team
-- ----------------------------
INSERT INTO `working_team` VALUES ('402881bc61451b650161458ed2ba0001', '1517290443441', '', '0', '1517292478494', '机电');

-- ----------------------------
-- Table structure for `working_team_admins`
-- ----------------------------
DROP TABLE IF EXISTS `working_team_admins`;
CREATE TABLE `working_team_admins` (
  `working_team_id` varchar(36) NOT NULL,
  `admin_id` varchar(36) NOT NULL,
  KEY `FKev0iy9d6hm55bau06wvsn32yw` (`admin_id`),
  KEY `FKdvtb7y2p61eoicvsq1cboqpga` (`working_team_id`),
  CONSTRAINT `FKdvtb7y2p61eoicvsq1cboqpga` FOREIGN KEY (`working_team_id`) REFERENCES `working_team` (`id`),
  CONSTRAINT `FKev0iy9d6hm55bau06wvsn32yw` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of working_team_admins
-- ----------------------------
INSERT INTO `working_team_admins` VALUES ('402881bc61451b650161458ed2ba0001', '402881c45eff19a4015eff80ec080002');
INSERT INTO `working_team_admins` VALUES ('402881bc61451b650161458ed2ba0001', '402881d161262c49016126324d7c0000');
INSERT INTO `working_team_admins` VALUES ('402881bc61451b650161458ed2ba0001', '402881d161262c49016126bf0b3c000c');
