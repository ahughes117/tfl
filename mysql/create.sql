SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `tfl` ;
CREATE SCHEMA IF NOT EXISTS `tfl` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `tfl` ;

-- -----------------------------------------------------
-- Table `station`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station` ;

CREATE  TABLE IF NOT EXISTS `station` (
  `stationID` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Authority` VARCHAR(45) NOT NULL ,
  `DateOpened` DATE NOT NULL ,
  `Usage` FLOAT NULL ,
  `Desc` TEXT NULL ,
  `AltNames` TEXT NULL ,
  `Longitute` FLOAT NULL ,
  `Latitude` FLOAT NULL ,
  `DateClosed` DATE NULL ,
  PRIMARY KEY (`stationID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `picture`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `picture` ;

CREATE  TABLE IF NOT EXISTS `picture` (
  `uuid` VARCHAR(40) NOT NULL ,
  `stationID` INT NOT NULL ,
  PRIMARY KEY (`uuid`) ,
  INDEX `fk_pic_station_idx` (`stationID` ASC) ,
  CONSTRAINT `fk_pic_station`
    FOREIGN KEY (`stationID` )
    REFERENCES `station` (`stationID` )
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `zone` ;

CREATE  TABLE IF NOT EXISTS `zone` (
  `zone` INT NOT NULL ,
  `Desc` TEXT NULL ,
  PRIMARY KEY (`zone`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `station_zone`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station_zone` ;

CREATE  TABLE IF NOT EXISTS `station_zone` (
  `stationID` INT NOT NULL ,
  `zoneID` INT NOT NULL ,
  PRIMARY KEY (`stationID`, `zoneID`) ,
  INDEX `fk_station_has_zone_zone1_idx` (`zoneID` ASC) ,
  INDEX `fk_station_has_zone_station1_idx` (`stationID` ASC) ,
  CONSTRAINT `fk_station_has_zone_station1`
    FOREIGN KEY (`stationID` )
    REFERENCES `station` (`stationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_station_has_zone_zone1`
    FOREIGN KEY (`zoneID` )
    REFERENCES `zone` (`zone` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `line` ;

CREATE  TABLE IF NOT EXISTS `line` (
  `lineID` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Colour` VARCHAR(7) NOT NULL ,
  `Desc` TEXT NULL ,
  PRIMARY KEY (`lineID`) ,
  UNIQUE INDEX `name_UNIQUE` (`Name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `station_line`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station_line` ;

CREATE  TABLE IF NOT EXISTS `station_line` (
  `lineID` INT NOT NULL ,
  `stationID` INT NOT NULL ,
  PRIMARY KEY (`lineID`, `stationID`) ,
  INDEX `fk_line_has_station_station1_idx` (`stationID` ASC) ,
  INDEX `fk_line_has_station_line1_idx` (`lineID` ASC) ,
  CONSTRAINT `fk_line_has_station_line1`
    FOREIGN KEY (`lineID` )
    REFERENCES `line` (`lineID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_line_has_station_station1`
    FOREIGN KEY (`stationID` )
    REFERENCES `station` (`stationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `borough`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `borough` ;

CREATE  TABLE IF NOT EXISTS `borough` (
  `boroughID` INT NOT NULL AUTO_INCREMENT ,
  `Name` VARCHAR(45) NOT NULL ,
  `Desc` TEXT NULL ,
  PRIMARY KEY (`boroughID`) ,
  UNIQUE INDEX `name_UNIQUE` (`Name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `station_borough`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `station_borough` ;

CREATE  TABLE IF NOT EXISTS `station_borough` (
  `boroughID` INT NOT NULL ,
  `stationID` INT NOT NULL ,
  PRIMARY KEY (`boroughID`, `stationID`) ,
  INDEX `fk_borough_has_station_station1_idx` (`stationID` ASC) ,
  INDEX `fk_borough_has_station_borough1_idx` (`boroughID` ASC) ,
  CONSTRAINT `fk_borough_has_station_borough1`
    FOREIGN KEY (`boroughID` )
    REFERENCES `borough` (`boroughID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_borough_has_station_station1`
    FOREIGN KEY (`stationID` )
    REFERENCES `station` (`stationID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `tfl` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
