/*
 Navicat Premium Data Transfer

 Source Server         : SQL Saya
 Source Server Type    : MySQL
 Source Server Version : 100137
 Source Host           : localhost:3306
 Source Schema         : sewa_alatcamping

 Target Server Type    : MySQL
 Target Server Version : 100137
 File Encoding         : 65001

 Date: 30/06/2020 20:37:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for daftar_alat
-- ----------------------------
DROP TABLE IF EXISTS `daftar_alat`;
CREATE TABLE `daftar_alat`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `no_alat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `jenis` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `no_alat`(`no_alat`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of daftar_alat
-- ----------------------------
INSERT INTO `daftar_alat` VALUES (1, 'D0001', 'Tenda Dome', 'Tenda', 'Ada');
INSERT INTO `daftar_alat` VALUES (2, 'D0002', 'Tenda Tunnel', 'Tenda', 'Ada');
INSERT INTO `daftar_alat` VALUES (3, 'D0003', 'Ransel 30L', 'Ransel', 'Tidak Ada');
INSERT INTO `daftar_alat` VALUES (4, 'D0004', 'Kompor Portable', 'Alat Memasak', 'Ada');
INSERT INTO `daftar_alat` VALUES (5, 'D0005', 'Pisau Set', 'Alat ', 'Ada');
INSERT INTO `daftar_alat` VALUES (6, 'D0006', 'Jas Hujan', 'Perlengkapan', 'Tidak Ada');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `login_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`login_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, 'danang', '1234');
INSERT INTO `login` VALUES (2, 'danang', '1234');

-- ----------------------------
-- Table structure for pelanggan
-- ----------------------------
DROP TABLE IF EXISTS `pelanggan`;
CREATE TABLE `pelanggan`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `alamat` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `no_tlp` decimal(15, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_pelanggan`(`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pelanggan
-- ----------------------------
INSERT INTO `pelanggan` VALUES (1, 'P0001', 'Rizky', 'Sidoarjo', 8564323323);
INSERT INTO `pelanggan` VALUES (2, 'P0002', 'Galuh', 'Surabaya', 872323232);
INSERT INTO `pelanggan` VALUES (3, 'P0003', 'Arbi', 'Malang', 86232312);

-- ----------------------------
-- Table structure for pengembalian
-- ----------------------------
DROP TABLE IF EXISTS `pengembalian`;
CREATE TABLE `pengembalian`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `idalat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `idpelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_kembali` date NULL DEFAULT NULL,
  `lama` int(15) NULL DEFAULT NULL,
  `denda` int(15) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_pengembalian_idpelanggan`(`idpelanggan`) USING BTREE,
  INDEX `foreign_pengembalian_idalat`(`idalat`) USING BTREE,
  CONSTRAINT `foreign_pengembalian_idalat` FOREIGN KEY (`idalat`) REFERENCES `sewa_alat` (`id_alat`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `foreign_pengembalian_idpelanggan` FOREIGN KEY (`idpelanggan`) REFERENCES `pelanggan` (`id_pelanggan`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of pengembalian
-- ----------------------------
INSERT INTO `pengembalian` VALUES (1, 'D0003', 'P0001', '2020-06-30', 0, 0);
INSERT INTO `pengembalian` VALUES (2, 'D0006', 'P0001', '2020-06-30', 0, 0);
INSERT INTO `pengembalian` VALUES (3, 'D0005', 'P0002', '2020-06-23', 7, 140000);

-- ----------------------------
-- Table structure for sewa_alat
-- ----------------------------
DROP TABLE IF EXISTS `sewa_alat`;
CREATE TABLE `sewa_alat`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_alat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_pelanggan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harga_sewa` int(15) NULL DEFAULT NULL,
  `tgl_sewa` date NULL DEFAULT NULL,
  `tgl_kembali` date NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_alat`(`id_alat`) USING BTREE,
  INDEX `fereign_sewa_`(`id_pelanggan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sewa_alat
-- ----------------------------
INSERT INTO `sewa_alat` VALUES (1, 'D0003', 'P0001', 100000, '2020-06-30', '2020-06-30');
INSERT INTO `sewa_alat` VALUES (3, 'D0006', 'P0001', 1000000, '2020-06-16', '2020-07-02');
INSERT INTO `sewa_alat` VALUES (5, 'D0005', 'P0001', 200000, '2020-06-22', '2020-06-29');

SET FOREIGN_KEY_CHECKS = 1;
