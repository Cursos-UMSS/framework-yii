/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50531
 Source Host           : localhost
 Source Database       : tienda2

 Target Server Type    : MySQL
 Target Server Version : 50531
 File Encoding         : utf-8

 Date: 08/12/2014 16:17:26 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `CARGO`
-- ----------------------------
DROP TABLE IF EXISTS `CARGO`;
CREATE TABLE `CARGO` (
  `COD_CARGO` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CARGO` varchar(150) DEFAULT NULL,
  `DESC_CARGO` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COD_CARGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `CLIENTE`
-- ----------------------------
DROP TABLE IF EXISTS `CLIENTE`;
CREATE TABLE `CLIENTE` (
  `COD_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CLIENTE` varchar(100) DEFAULT NULL,
  `NIT_CLIENTE` int(11) DEFAULT NULL,
  `TELF_CLIENTE` int(11) DEFAULT NULL,
  `TIPO_CLIENTE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_CLIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `CLIENTE`
-- ----------------------------
BEGIN;
INSERT INTO `CLIENTE` VALUES ('3', 'Juan Carlos', '6479332', '70783358', 'A'), ('4', 'Jorge Medrano', '3729773', '79773181', 'A'), ('5', 'marco antezana', '6369214', '79976352', 'A'), ('6', 'Juan Carlos', '5575744', '70987623', 'A'), ('7', 'Juan Carlos', '6456332', '7093947', 'A');
COMMIT;

-- ----------------------------
--  Table structure for `DEVOLUCION`
-- ----------------------------
DROP TABLE IF EXISTS `DEVOLUCION`;
CREATE TABLE `DEVOLUCION` (
  `COD_PROD` int(11) DEFAULT NULL,
  `COD_PROV` int(11) DEFAULT NULL,
  `FECHA_DEV` varchar(100) DEFAULT NULL,
  `CANTIDAD_DEV` int(11) DEFAULT NULL,
  `DESC_DEV` varchar(250) DEFAULT NULL,
  KEY `FK_RELATIONSHIP_7` (`COD_PROD`),
  KEY `FK_RELATIONSHIP_8` (`COD_PROV`),
  CONSTRAINT `FK_RELATIONSHIP_7` FOREIGN KEY (`COD_PROD`) REFERENCES `PRODUCTO` (`COD_PROD`),
  CONSTRAINT `FK_RELATIONSHIP_8` FOREIGN KEY (`COD_PROV`) REFERENCES `PROVEDDOR` (`COD_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `EMPLEADO`
-- ----------------------------
DROP TABLE IF EXISTS `EMPLEADO`;
CREATE TABLE `EMPLEADO` (
  `COD_EMP` int(11) NOT NULL AUTO_INCREMENT,
  `COD_CARGO` int(11) DEFAULT NULL,
  `NOMBRE_EMP` varchar(100) DEFAULT NULL,
  `CI_EMP` int(11) DEFAULT NULL,
  `DIR_EMP` varchar(150) DEFAULT NULL,
  `TELF_EMP` int(11) DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_EMP`),
  KEY `FK_RELATIONSHIP_4` (`COD_CARGO`),
  CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`COD_CARGO`) REFERENCES `CARGO` (`COD_CARGO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `PEDIDO`
-- ----------------------------
DROP TABLE IF EXISTS `PEDIDO`;
CREATE TABLE `PEDIDO` (
  `COD_PROD` int(11) DEFAULT NULL,
  `COD_PROV` int(11) DEFAULT NULL,
  `FECHA_PEDIDO` varchar(100) DEFAULT NULL,
  `CANTIDAD_PEDIDO` int(11) DEFAULT NULL,
  `DETALLE_PEDIDO` varchar(200) DEFAULT NULL,
  `FECHA_LLEGADA` varchar(200) DEFAULT NULL,
  KEY `FK_RELATIONSHIP_5` (`COD_PROD`),
  KEY `FK_RELATIONSHIP_9` (`COD_PROV`),
  CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`COD_PROD`) REFERENCES `PRODUCTO` (`COD_PROD`),
  CONSTRAINT `FK_RELATIONSHIP_9` FOREIGN KEY (`COD_PROV`) REFERENCES `PROVEDDOR` (`COD_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `PRODUCTO`
-- ----------------------------
DROP TABLE IF EXISTS `PRODUCTO`;
CREATE TABLE `PRODUCTO` (
  `COD_PROD` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROD` varchar(100) DEFAULT NULL,
  `EMPRESA_PROD` varchar(100) DEFAULT NULL,
  `DESCRIPCION_PROD` varchar(255) DEFAULT NULL,
  `PRECIO_PROD` int(11) DEFAULT NULL,
  `FECHAVENC_PROD` varchar(100) DEFAULT NULL,
  `cod_bar` int(11) DEFAULT NULL,
  PRIMARY KEY (`COD_PROD`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `PRODUCTO`
-- ----------------------------
BEGIN;
INSERT INTO `PRODUCTO` VALUES ('6', 'Leche en Polvo Instantanea', 'pil andina', 'leche entera de 2.8 kilos', '128', '12/dic/2015', '234345');
COMMIT;

-- ----------------------------
--  Table structure for `PROVEDDOR`
-- ----------------------------
DROP TABLE IF EXISTS `PROVEDDOR`;
CREATE TABLE `PROVEDDOR` (
  `COD_PROV` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROV` varchar(100) DEFAULT NULL,
  `ENCARGADO_PROV` varchar(100) DEFAULT NULL,
  `TELF_PROV` int(11) DEFAULT NULL,
  `DIR_PROV` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`COD_PROV`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Table structure for `VENTA`
-- ----------------------------
DROP TABLE IF EXISTS `VENTA`;
CREATE TABLE `VENTA` (
  `COD_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `COD_EMP` int(11) DEFAULT NULL,
  `COD_PROD` int(11) DEFAULT NULL,
  `COD_CLIENTE` int(11) DEFAULT NULL,
  `FECHA_VENTA` varchar(100) DEFAULT NULL,
  `CANTIDAD_VENTA` int(11) DEFAULT NULL,
  `DESC_VENTA` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`COD_VENTA`),
  KEY `FK_RELATIONSHIP_1` (`COD_CLIENTE`),
  KEY `FK_RELATIONSHIP_2` (`COD_PROD`),
  KEY `FK_RELATIONSHIP_3` (`COD_EMP`),
  CONSTRAINT `FK_RELATIONSHIP_1` FOREIGN KEY (`COD_CLIENTE`) REFERENCES `CLIENTE` (`COD_CLIENTE`),
  CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`COD_PROD`) REFERENCES `PRODUCTO` (`COD_PROD`),
  CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`COD_EMP`) REFERENCES `EMPLEADO` (`COD_EMP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET FOREIGN_KEY_CHECKS = 1;
