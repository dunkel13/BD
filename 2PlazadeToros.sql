DROP SCHEMA IF EXISTS `Plaza_toros` ;
CREATE SCHEMA IF NOT EXISTS `Plaza_toros`;
USE `Plaza_toros` ;
-- -----------------------------------------------------
-- Table `APODERADO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `apoderado` ;

CREATE TABLE `plaza_toros`.`apoderado` (
  `APO_CC` INT NOT NULL,
  `APO_Nombre` VARCHAR(45) NOT NULL,
  `APO_Telefono` INT NOT NULL,
  `APO_Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`APO_CC`));
-- -----------------------------------------------------
-- Table `PLAZA`
-- ----------------------------------------------------- 
DROP TABLE IF EXISTS `plaza` ;

CREATE TABLE `plaza_toros`.`plaza` (
  `PLA_Id` INT NOT NULL,
  `PLA_Nombre` VARCHAR(45) NOT NULL,
  `PLA_Direccion` VARCHAR(45) NOT NULL,
  `PLA_Localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PLA_Id`));
-- -----------------------------------------------------
-- Table `GANADERIA`
-- -----------------------------------------------------  
DROP TABLE IF EXISTS `ganaderia` ;

CREATE TABLE `plaza_toros`.`ganaderia` (
  `GAN_Codigo` INT NOT NULL,
  `GAN_Fecha` DATE NOT NULL,
  `GAN_localidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`GAN_Codigo`));
-- -----------------------------------------------------
-- Table `FERIA`
-- -----------------------------------------------------  
DROP TABLE IF EXISTS `feria` ;

CREATE TABLE `plaza_toros`.`feria` (
  `FER_Id` INT NOT NULL,
  `FER_Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`FER_Id`));
-- -----------------------------------------------------
-- Table `TORERO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `torero` ;

CREATE TABLE `plaza_toros`.`torero` (
  `TOR_CC` INT NOT NULL,
  `TOR_Nombre` VARCHAR(45) NOT NULL,
  `TOR_Apodo` VARCHAR(45) NOT NULL,
  `TOR_FechaAlt` DATE NOT NULL,
  `CC_Apoderado` INT NOT NULL,
  PRIMARY KEY (`TOR_CC`),
  INDEX `fk_CC_Apoderado_idx` (`CC_Apoderado` ASC),
  CONSTRAINT `fk_CC_Apoderado`
    FOREIGN KEY (`CC_Apoderado`)
    REFERENCES `plaza_toros`.`apoderado` (`APO_CC`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `CORRIDA`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `corrida` ;

CREATE TABLE `plaza_toros`.`corrida` (
  `COR_Orden` INT NOT NULL,
  `COR_Año` VARCHAR(45) NOT NULL,
  `PLAZA_Id` INT NOT NULL,
  PRIMARY KEY (`COR_Orden`),
  INDEX `fk_PLA_Id_idx` (`PLAZA_Id` ASC),
  CONSTRAINT `fk_PLA_Id`
    FOREIGN KEY (`PLAZA_Id`)
    REFERENCES `plaza_toros`.`plaza` (`PLA_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION); 
-- -----------------------------------------------------
-- Table `TORO`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `toro` ;

CREATE TABLE `plaza_toros`.`toro` (
  `TORO_Codigo` INT NOT NULL,
  `TORO_Nombre` VARCHAR(45) NOT NULL,
  `TORO_Orden` INT NOT NULL,
  `TORO_Color` VARCHAR(45) NOT NULL,
  `TORO_ANacimiento` YEAR NOT NULL,
  `GAN_Codigo` INT NOT NULL,
  PRIMARY KEY (`TORO_Codigo`),
  INDEX `fk_GAN_Codigo_idx` (`GAN_Codigo` ASC),
  CONSTRAINT `fk_GAN_Codigo`
    FOREIGN KEY (`GAN_Codigo`)
    REFERENCES `plaza_toros`.`ganaderia` (`GAN_Codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
