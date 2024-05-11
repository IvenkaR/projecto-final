-- MySQL Workbench Forward Engineering

DROP SCHEMA IF EXISTS los_artesanos ;


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema los_artesanos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema los_artesanos
-- -----------------------------------------------------


CREATE SCHEMA IF NOT EXISTS `los_artesanos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `los_artesanos` ;

-- -----------------------------------------------------
-- Table `los_artesanos`.`auditoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`auditoria` (
  `ID_Auditoria` INT NOT NULL AUTO_INCREMENT,
  `Accion` VARCHAR(50) NULL DEFAULT NULL,
  `Usuario` VARCHAR(20) NULL DEFAULT NULL,
  `Fecha_Hora` DATETIME NULL DEFAULT NULL,
  `Observacion` TEXT NULL DEFAULT NULL,
  `Campo_Anterior` VARCHAR(50) NULL DEFAULT NULL,
  `Campo_Nuevo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Auditoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 1814
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_artesanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_artesanos` (
  `ID_Art` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Art` VARCHAR(100) NULL DEFAULT NULL,
  `Apellido_Art` VARCHAR(100) NULL DEFAULT NULL,
  `Calle_Art` VARCHAR(50) NULL DEFAULT NULL,
  `Numero_Art` VARCHAR(50) NULL DEFAULT NULL,
  `Codigo_Postal_Art` VARCHAR(50) NULL DEFAULT NULL,
  `Region_Art` VARCHAR(100) NULL DEFAULT NULL,
  `Ciudad_Art` VARCHAR(100) NULL DEFAULT NULL,
  `Prefijo_Art` VARCHAR(10) NULL DEFAULT NULL,
  `Telefono_Art` VARCHAR(100) NULL DEFAULT NULL,
  `Email_Art` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Art`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_categorias` (
  `ID_Cat` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Cat` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Cat`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_estructura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_estructura` (
  `ID_Estruct` TINYINT NOT NULL,
  `Sector_Estruct` ENUM('A', 'B', 'C', 'D', 'E') NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Estruct`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_puestos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_puestos` (
  `ID_Puesto` TINYINT NOT NULL AUTO_INCREMENT,
  `ID_Art` INT NULL DEFAULT NULL,
  `ID_Estruct` TINYINT NULL DEFAULT NULL,
  `Nombre_Puesto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Puesto`),
  INDEX `FK_PUESTOS_ARTESANOS` (`ID_Art` ASC) VISIBLE,
  INDEX `FK_PUESTOS_ESTRUCTURA` (`ID_Estruct` ASC) VISIBLE,
  CONSTRAINT `FK_PUESTOS_ARTESANOS`
    FOREIGN KEY (`ID_Art`)
    REFERENCES `los_artesanos`.`tabla_artesanos` (`ID_Art`),
  CONSTRAINT `FK_PUESTOS_ESTRUCTURA`
    FOREIGN KEY (`ID_Estruct`)
    REFERENCES `los_artesanos`.`tabla_estructura` (`ID_Estruct`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_productos` (
  `ID_Prod` INT NOT NULL AUTO_INCREMENT,
  `ID_Cat` INT NULL DEFAULT NULL,
  `ID_Puesto` TINYINT NULL DEFAULT NULL,
  `Nombre_Prod` VARCHAR(100) NULL DEFAULT NULL,
  `Precio_Prod` DOUBLE NULL DEFAULT NULL,
  `Stock_Prod` INT NULL DEFAULT NULL,
  `Moneda` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Prod`),
  INDEX `FK_PRODUCTOS_CATEGORIA` (`ID_Cat` ASC) VISIBLE,
  INDEX `FK_PRODUCTOS_PUESTOS` (`ID_Puesto` ASC) VISIBLE,
  CONSTRAINT `FK_PRODUCTOS_CATEGORIA`
    FOREIGN KEY (`ID_Cat`)
    REFERENCES `los_artesanos`.`tabla_categorias` (`ID_Cat`),
  CONSTRAINT `FK_PRODUCTOS_PUESTOS`
    FOREIGN KEY (`ID_Puesto`)
    REFERENCES `los_artesanos`.`tabla_puestos` (`ID_Puesto`))
ENGINE = InnoDB
AUTO_INCREMENT = 114
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_venta` (
  `ID_Vta` MEDIUMINT NOT NULL AUTO_INCREMENT,
  `Fecha_Hora` DATETIME NULL DEFAULT NULL,
  `Precio_vta` MEDIUMINT NULL DEFAULT NULL,
  `articulos_vendidos_vta` INT NULL DEFAULT NULL,
  `ID_Art` INT NULL DEFAULT NULL,
  `ID_Estruct` TINYINT NULL DEFAULT NULL,
  `ID_Puesto` TINYINT NULL DEFAULT NULL,
  `Nombre_Puesto` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Vta`),
  INDEX `FK_VENTA_ARTESANO` (`ID_Art` ASC) VISIBLE,
  INDEX `FK_VENTA_ESTRUCTURA` (`ID_Estruct` ASC) VISIBLE,
  INDEX `FK_VENTA_PUESTO` (`ID_Puesto` ASC) VISIBLE,
  CONSTRAINT `FK_VENTA_ARTESANO`
    FOREIGN KEY (`ID_Art`)
    REFERENCES `los_artesanos`.`tabla_artesanos` (`ID_Art`),
  CONSTRAINT `FK_VENTA_ESTRUCTURA`
    FOREIGN KEY (`ID_Estruct`)
    REFERENCES `los_artesanos`.`tabla_estructura` (`ID_Estruct`),
  CONSTRAINT `FK_VENTA_PUESTO`
    FOREIGN KEY (`ID_Puesto`)
    REFERENCES `los_artesanos`.`tabla_puestos` (`ID_Puesto`))
ENGINE = InnoDB
AUTO_INCREMENT = 501
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_boleta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_boleta` (
  `ID_Boleta` INT NOT NULL AUTO_INCREMENT,
  `ID_Vta` MEDIUMINT NOT NULL,
  `ID_Prod` INT NULL DEFAULT NULL,
  `Precio_Prod` DOUBLE NULL DEFAULT NULL,
  `Unidad_Prod` TINYINT NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Boleta`),
  INDEX `FK_BOLETA_VENTA` (`ID_Vta` ASC) VISIBLE,
  INDEX `FK_BOLETA_PRODUCTO` (`ID_Prod` ASC) VISIBLE,
  CONSTRAINT `FK_BOLETA_PRODUCTO`
    FOREIGN KEY (`ID_Prod`)
    REFERENCES `los_artesanos`.`tabla_productos` (`ID_Prod`),
  CONSTRAINT `FK_BOLETA_VENTA`
    FOREIGN KEY (`ID_Vta`)
    REFERENCES `los_artesanos`.`tabla_venta` (`ID_Vta`))
ENGINE = InnoDB
AUTO_INCREMENT = 1858
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `los_artesanos`.`tabla_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`tabla_factura` (
  `ID_Vta` MEDIUMINT NULL DEFAULT NULL,
  `Total_vta` DOUBLE NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `los_artesanos` ;

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`artesanos_por_region`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`artesanos_por_region` (`Region de Artesanos` INT, `Total_Artesanos` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`ciudad_de_artesanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`ciudad_de_artesanos` (`Ciudad de Artesanos` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`largo_del_nombre_del_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`largo_del_nombre_del_producto` (`Nombre Producto` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`nombre_en_mayuscula_del_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`nombre_en_mayuscula_del_producto` (`Nombre Producto` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`nombre_en_minuscula_del_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`nombre_en_minuscula_del_producto` (`Nombre Producto` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`numero_de_artesanos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`numero_de_artesanos` (`Cantidad de Artesanos` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`productos_por_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`productos_por_categoria` (`Nombre_Cat` INT, `TotalProductos` INT);

-- -----------------------------------------------------
-- Placeholder table for view `los_artesanos`.`resumen_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `los_artesanos`.`resumen_ventas` (`ID_Art` INT, `Dia` INT, `Hora` INT, `Total_Ventas` INT);