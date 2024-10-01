-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hospitaldb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospitaldb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospitaldb` DEFAULT CHARACTER SET utf8 ;
USE `hospitaldb` ;

-- -----------------------------------------------------
-- Table `hospitaldb`.`physician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`physician` (
  `physicianID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `specialty` VARCHAR(100) NULL,
  `contactInformation` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  `dateStarted` DATE NULL,
  PRIMARY KEY (`physicianID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`patient` (
  `patientID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `dateOfBirth` DATE NULL,
  `gender` VARCHAR(45) NULL,
  `contactInformation` VARCHAR(100) NULL,
  `paymentMethod` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `dateStarted` DATE NULL,
  PRIMARY KEY (`patientID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`appointment` (
  `appointmentID` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `time` TIME NULL,
  `description` VARCHAR(1000) NULL,
  `patientID` INT NULL,
  `physicianID` INT NULL,
  PRIMARY KEY (`appointmentID`),
  INDEX `physicianID_idx` (`physicianID` ASC) VISIBLE,
  INDEX `patientID_idx` (`patientID` ASC) VISIBLE,
  CONSTRAINT `fk_physicianID1`
    FOREIGN KEY (`physicianID`)
    REFERENCES `hospitaldb`.`physician` (`physicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_patientID1`
    FOREIGN KEY (`patientID`)
    REFERENCES `hospitaldb`.`patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`labTechnician`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`labTechnician` (
  `labTechnicianID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `expertise` VARCHAR(100) NULL,
  `contactInformation` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  `dateStarted` DATE NULL,
  PRIMARY KEY (`labTechnicianID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`administrator` (
  `adminID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `role` VARCHAR(100) NULL,
  `contactInformation` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  `dateStarted` DATE NULL,
  PRIMARY KEY (`adminID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`nurse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`nurse` (
  `nurseID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `role` VARCHAR(100) NULL,
  `contactInformation` VARCHAR(100) NULL,
  `address` VARCHAR(45) NULL,
  `dateStarted` DATE NULL,
  PRIMARY KEY (`nurseID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`room` (
  `roomID` INT NOT NULL AUTO_INCREMENT,
  `occupancyStatus` VARCHAR(10) NULL,
  `admissionDate` DATE NULL,
  `dischargeDate` DATE NULL,
  `patientID` INT NULL,
  PRIMARY KEY (`roomID`),
  INDEX `patientID_idx` (`patientID` ASC) VISIBLE,
  CONSTRAINT `fk_patientID5`
    FOREIGN KEY (`patientID`)
    REFERENCES `hospitaldb`.`patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`labTest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`labTest` (
  `testID` INT NOT NULL AUTO_INCREMENT,
  `patientID` INT NULL,
  `labTechnicianID` INT NULL,
  `date` DATE NULL,
  `result` VARCHAR(200) NULL,
  `labTestcol` VARCHAR(45) NULL,
  PRIMARY KEY (`testID`),
  INDEX `patientID_idx` (`patientID` ASC) VISIBLE,
  INDEX `labTechnicianID_idx` (`labTechnicianID` ASC) VISIBLE,
  CONSTRAINT `fk_patientID2`
    FOREIGN KEY (`patientID`)
    REFERENCES `hospitaldb`.`patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_labTechnicianID2`
    FOREIGN KEY (`labTechnicianID`)
    REFERENCES `hospitaldb`.`labTechnician` (`labTechnicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`medication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`medication` (
  `medicationID` INT NOT NULL AUTO_INCREMENT,
  `patientID` INT NULL,
  `physicianID` INT NULL,
  `medicationName` VARCHAR(100) NULL,
  `quantity` DECIMAL(8,2) NULL,
  `expiryDate` DATE NULL,
  `cost` DECIMAL(8,2) NULL,
  PRIMARY KEY (`medicationID`),
  INDEX `patientID_idx` (`patientID` ASC) VISIBLE,
  INDEX `physicianID_idx` (`physicianID` ASC) VISIBLE,
  CONSTRAINT `fk_patientID4`
    FOREIGN KEY (`patientID`)
    REFERENCES `hospitaldb`.`patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_physicianID4`
    FOREIGN KEY (`physicianID`)
    REFERENCES `hospitaldb`.`physician` (`physicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`diagnosis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`diagnosis` (
  `diagnosisID` INT NOT NULL AUTO_INCREMENT,
  `patientID` INT NULL,
  `physicianID` INT NULL,
  `diagnosisDate` DATE NULL,
  `description` VARCHAR(200) NULL,
  `diagnosis` VARCHAR(200) NULL,
  PRIMARY KEY (`diagnosisID`),
  INDEX `patientID_idx` (`patientID` ASC) VISIBLE,
  INDEX `physicianID_idx` (`physicianID` ASC) VISIBLE,
  CONSTRAINT `fk_patientID3`
    FOREIGN KEY (`patientID`)
    REFERENCES `hospitaldb`.`patient` (`patientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_physicianID3`
    FOREIGN KEY (`physicianID`)
    REFERENCES `hospitaldb`.`physician` (`physicianID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`billing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`billing` (
  `billingID` INT NOT NULL AUTO_INCREMENT,
  `appointmentID` INT NULL,
  `totalAmount` DECIMAL(8,2) NULL,
  `paymentStatus` VARCHAR(50) NULL,
  PRIMARY KEY (`billingID`),
  INDEX `appointmentID_idx` (`appointmentID` ASC) VISIBLE,
  CONSTRAINT `fk_appointmentID7`
    FOREIGN KEY (`appointmentID`)
    REFERENCES `hospitaldb`.`appointment` (`appointmentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`payment` (
  `paymentID` INT NOT NULL AUTO_INCREMENT,
  `billingID` INT NULL,
  `amountPaid` DECIMAL(8,2) NULL,
  `paymentDate` DATE NULL,
  PRIMARY KEY (`paymentID`),
  INDEX `billingID_idx` (`billingID` ASC) VISIBLE,
  CONSTRAINT `fk_billingID2`
    FOREIGN KEY (`billingID`)
    REFERENCES `hospitaldb`.`billing` (`billingID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hospitaldb`.`logindetails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospitaldb`.`logindetails` (
  `loginID` INT NOT NULL AUTO_INCREMENT,
  `userID` INT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`loginID`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
