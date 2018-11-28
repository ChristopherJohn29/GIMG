-- MySQL Script generated by MySQL Workbench
-- Wednesday, 28 November, 2018 10:03:09 AM PST
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mobile_drs
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mobile_drs
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mobile_drs` DEFAULT CHARACTER SET utf8 ;
USE `mobile_drs` ;

-- -----------------------------------------------------
-- Table `mobile_drs`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`roles` (
  `roles_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `roles_name` VARCHAR(45) NULL,
  PRIMARY KEY (`roles_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`user` (
  `user_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_firstname` VARCHAR(45) NULL,
  `user_lastname` VARCHAR(45) NULL,
  `user_email` VARCHAR(45) NULL,
  `user_dateCreated` TIMESTAMP NULL,
  `user_password` VARCHAR(255) NULL,
  `user_roleID` INT UNSIGNED NULL,
  `user_dateOfBirth` DATE NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_roleID_idx` (`user_roleID` ASC),
  CONSTRAINT `user_roleID`
    FOREIGN KEY (`user_roleID`)
    REFERENCES `mobile_drs`.`roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`permissions` (
  `permissions_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `permissions_name` VARCHAR(255) NULL,
  `permissions_module` VARCHAR(45) NULL,
  PRIMARY KEY (`permissions_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`roles_permission`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`roles_permission` (
  `rp_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rp_rolesID` INT UNSIGNED NULL,
  `rp_permissionsID` INT UNSIGNED NULL,
  PRIMARY KEY (`rp_id`),
  INDEX `rp_rolesID_idx` (`rp_rolesID` ASC),
  INDEX `rp_permissionsID_idx` (`rp_permissionsID` ASC),
  CONSTRAINT `rp_rolesID`
    FOREIGN KEY (`rp_rolesID`)
    REFERENCES `mobile_drs`.`roles` (`roles_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rp_permissionsID`
    FOREIGN KEY (`rp_permissionsID`)
    REFERENCES `mobile_drs`.`permissions` (`permissions_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`provider` (
  `provider_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `provider_firstname` VARCHAR(45) NULL,
  `provider_lastname` VARCHAR(45) NULL,
  `provider_contactNum` VARCHAR(45) NULL,
  `provider_email` VARCHAR(45) NULL,
  `provider_address` VARCHAR(255) NULL,
  `provider_dateOfBirth` DATE NULL,
  `provider_languages` VARCHAR(255) NULL,
  `provider_areas` VARCHAR(255) NULL,
  `provider_npi` VARCHAR(45) NULL,
  `provider_dea` VARCHAR(45) NULL,
  `provider_license` VARCHAR(45) NULL,
  `provider_dateCreated` TIMESTAMP NULL,
  `provider_rate_initialVisit` VARCHAR(10) NULL,
  `provider_rate_followUpVisit` VARCHAR(10) NULL,
  `provider_rate_aw` VARCHAR(10) NULL,
  `provider_rate_acp` VARCHAR(10) NULL,
  `provider_rate_noShowPT` VARCHAR(10) NULL,
  `provider_rate_others` VARCHAR(10) NULL,
  `provider_rate_mileage` VARCHAR(10) NULL,
  PRIMARY KEY (`provider_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`home_health_care`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`home_health_care` (
  `hhc_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `hhc_name` VARCHAR(45) NULL,
  `hhc_contact_name` VARCHAR(45) NULL,
  `hhc_phoneNumber` VARCHAR(45) NULL,
  `hhc_faxNumber` VARCHAR(45) NULL,
  `hhc_email` VARCHAR(45) NULL,
  `hhc_address` VARCHAR(255) NULL,
  `hhc_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`hhc_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`patient` (
  `patient_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_firstname` VARCHAR(45) NULL,
  `patient_lastname` VARCHAR(45) NULL,
  `patient_sex` VARCHAR(2) NULL,
  `patient_referralDate` DATE NULL,
  `patient_medicareNum` VARCHAR(45) NULL,
  `patient_dateOfBirth` DATE NULL,
  `patient_phoneNum` VARCHAR(45) NULL,
  `patient_address` VARCHAR(255) NULL,
  `patient_hhcID` INT UNSIGNED NULL,
  `patient_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `patient_hhcID_idx` (`patient_hhcID` ASC),
  CONSTRAINT `patient_hhcID`
    FOREIGN KEY (`patient_hhcID`)
    REFERENCES `mobile_drs`.`home_health_care` (`hhc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`type_of_visits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`type_of_visits` (
  `tov_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `tov_name` VARCHAR(45) NULL,
  PRIMARY KEY (`tov_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`patient_transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`patient_transactions` (
  `pt_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pt_tovID` INT UNSIGNED NULL,
  `pt_patientID` INT UNSIGNED NULL,
  `pt_providerID` INT UNSIGNED NULL,
  `pt_dateOfService` DATE NULL,
  `pt_deductible` VARCHAR(10) NULL,
  `pt_serviceStatus` VARCHAR(10) NULL,
  `pt_aw_ippe_date` DATE NULL,
  `pt_aw_ippe_code` VARCHAR(10) NULL,
  `pt_aw_ippe_performed` TINYINT(1) NULL,
  `pt_acp` TINYINT(1) NULL,
  `pt_diabetes` TINYINT(1) NULL,
  `pt_tobacco` TINYINT(1) NULL,
  `pt_tcm` TINYINT(1) NULL,
  `pt_others` VARCHAR(45) NULL,
  `pt_icd10_codes` VARCHAR(255) NULL,
  `pt_dateBilled` DATE NULL,
  `pt_visitBilled` DATE NULL,
  `pt_dateRefEmailed` DATE NULL,
  `pt_comments` VARCHAR(255) NULL,
  `pt_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`pt_id`),
  INDEX `pt_patientID_idx` (`pt_patientID` ASC),
  INDEX `pt_providerID_idx` (`pt_providerID` ASC),
  INDEX `pt_tovID_idx` (`pt_tovID` ASC),
  CONSTRAINT `pt_patientID`
    FOREIGN KEY (`pt_patientID`)
    REFERENCES `mobile_drs`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pt_providerID`
    FOREIGN KEY (`pt_providerID`)
    REFERENCES `mobile_drs`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pt_tovID`
    FOREIGN KEY (`pt_tovID`)
    REFERENCES `mobile_drs`.`type_of_visits` (`tov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`patient_CPO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`patient_CPO` (
  `ptcpo_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptcpo_patientID` INT UNSIGNED NULL,
  `ptcpo_period` VARCHAR(45) NULL,
  `ptcpo_dateSigned` DATE NULL,
  `ptcpo_firstMonthCPO` VARCHAR(45) NULL,
  `ptcpo_secondMonthCPO` VARCHAR(45) NULL,
  `ptcpo_thirdMonthCPO` VARCHAR(45) NULL,
  `ptcpo_dischargeDate` DATE NULL,
  `ptcpo_dateBilled` DATE NULL,
  `ptcpo_status` VARCHAR(30) NULL,
  `ptcpo_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`ptcpo_id`),
  INDEX `ptcpo_patientID_idx` (`ptcpo_patientID` ASC),
  CONSTRAINT `ptcpo_patientID`
    FOREIGN KEY (`ptcpo_patientID`)
    REFERENCES `mobile_drs`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`patient_communication_notes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`patient_communication_notes` (
  `ptcn_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ptcn_patientID` INT UNSIGNED NULL,
  `ptcn_message` VARCHAR(255) NULL,
  `ptcn_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`ptcn_id`),
  INDEX `ptcn_patientID_idx` (`ptcn_patientID` ASC),
  CONSTRAINT `ptcn_patientID`
    FOREIGN KEY (`ptcn_patientID`)
    REFERENCES `mobile_drs`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`provider_route_sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`provider_route_sheet` (
  `prs_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prs_providerID` INT UNSIGNED NULL,
  `prs_dateOfService` DATE NULL,
  `prs_dateCreated` TIMESTAMP NULL,
  PRIMARY KEY (`prs_id`),
  INDEX `prs_providerID_idx` (`prs_providerID` ASC),
  CONSTRAINT `prs_providerID`
    FOREIGN KEY (`prs_providerID`)
    REFERENCES `mobile_drs`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mobile_drs`.`provider_route_sheet_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mobile_drs`.`provider_route_sheet_list` (
  `prsl_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `prsl_prsID` INT UNSIGNED NULL,
  `prsl_time` VARCHAR(10) NULL,
  `prsl_patientID` INT UNSIGNED NULL,
  `prsl_hhcID` INT UNSIGNED NULL,
  `prsl_tovID` INT UNSIGNED NULL,
  `notes` VARCHAR(255) NULL,
  PRIMARY KEY (`prsl_id`),
  INDEX `prsl_hhcID_idx` (`prsl_hhcID` ASC),
  INDEX `prsl_patientID_idx` (`prsl_patientID` ASC),
  INDEX `prsl_prsID_idx` (`prsl_prsID` ASC),
  INDEX `prsl_tovID_idx` (`prsl_tovID` ASC),
  CONSTRAINT `prsl_hhcID`
    FOREIGN KEY (`prsl_hhcID`)
    REFERENCES `mobile_drs`.`home_health_care` (`hhc_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prsl_patientID`
    FOREIGN KEY (`prsl_patientID`)
    REFERENCES `mobile_drs`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prsl_prsID`
    FOREIGN KEY (`prsl_prsID`)
    REFERENCES `mobile_drs`.`provider_route_sheet` (`prs_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prsl_tovID`
    FOREIGN KEY (`prsl_tovID`)
    REFERENCES `mobile_drs`.`type_of_visits` (`tov_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mobile_drs`.`roles`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile_drs`;
INSERT INTO `mobile_drs`.`roles` (`roles_id`, `roles_name`) VALUES (1, 'Super Administrator');
INSERT INTO `mobile_drs`.`roles` (`roles_id`, `roles_name`) VALUES (2, 'Administrator');
INSERT INTO `mobile_drs`.`roles` (`roles_id`, `roles_name`) VALUES (3, 'Normal');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile_drs`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile_drs`;
INSERT INTO `mobile_drs`.`user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_dateCreated`, `user_password`, `user_roleID`, `user_dateOfBirth`) VALUES (1, 'Nikkolai', 'Fernandez', 'nikkolaifernandez14@gmaiml.com', '2018/11/25', '$2y$10$NRfEbjlqjRpXiSZaw.DzW.d5.Zw2I5q8HOODaKPvsfAM3HFmgrOrW', 1, '1992/11/14');
INSERT INTO `mobile_drs`.`user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_dateCreated`, `user_password`, `user_roleID`, `user_dateOfBirth`) VALUES (2, 'Jayson', 'Arcayna', 'jayson.arcayna@gmail.com', '2018/11/25', '$2y$10$CVTPVGMFB4QcC4OXyQcYMOsDdxjRQ57E0/nGNrn3P3QVdLS3b0zZq', 1, '1992/11/14');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile_drs`.`permissions`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile_drs`;
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (1, 'add_user', 'UM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (2, 'edit_user', 'UM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (3, 'view_user', 'UM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (4, 'search_user', 'UM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (5, 'list_user', 'UM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (6, 'add_provider', 'PPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (7, 'edit_provider', 'PPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (8, 'view_provider', 'PPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (9, 'search_provider', 'PPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (10, 'list_provider', 'PPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (11, 'add_hhc', 'HHCPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (12, 'edit_hhc', 'HHCPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (13, 'view_hhc', 'HHCPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (14, 'search_hhc', 'HHCPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (15, 'list_hhc', 'HHCPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (16, 'add_pt', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (17, 'edit_pt', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (18, 'view_pt', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (19, 'search_pt', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (20, 'list_pt', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (21, 'add_tr', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (22, 'edit_tr', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (23, 'view_tr', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (24, 'list_tr', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (25, 'add_cn', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (26, 'edit_cn', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (27, 'list_cn', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (28, 'view_cn', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (29, 'add_cpo', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (30, 'edit_cpo', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (31, 'view_cpo', 'PTPM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (32, 'add_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (33, 'edit_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (34, 'view_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (35, 'list_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (36, 'search_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (37, 'download_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (38, 'print_prs', 'PRSM');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (39, 'generate_pr', 'PRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (40, 'save_pr', 'PRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (41, 'print_pr', 'PRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (42, 'send_pr', 'PRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (43, 'paid_batch_pr', 'PRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (44, 'generate_sbawr', 'SBAWRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (45, 'save_sbawr', 'SBAWRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (46, 'print_sbawr', 'SBAWRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (47, 'generate_sbhvr', 'SBHVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (48, 'save_sbhvr', 'SBHVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (49, 'print_sbhvr', 'SBHVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (50, 'generate_sbfvr', 'SBFVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (51, 'save_sbfvr', 'SBFVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (52, 'print_sbfvr', 'SBFVRG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (53, 'generate_sbcpor', 'SBCPORG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (54, 'save__sbcpor', 'SBCPORG');
INSERT INTO `mobile_drs`.`permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES (55, 'print__sbcpor', 'SBCPORG');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile_drs`.`roles_permission`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile_drs`;
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 1);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 2);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 3);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 4);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 5);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 6);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 7);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 8);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 9);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 10);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 11);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 12);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 13);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 14);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 15);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 16);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 17);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 18);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 19);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 20);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 21);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 22);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 23);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 24);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 25);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 26);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 27);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 28);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 29);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 30);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 31);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 32);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 33);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 34);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 35);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 36);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 37);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 38);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 39);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 40);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 41);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 42);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 43);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 44);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 45);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 46);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 47);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 48);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 49);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 50);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 51);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 52);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 53);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 54);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (1, 55);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 1);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 2);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 3);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 4);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 5);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 6);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 7);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 8);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 9);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 10);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 11);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 12);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 13);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 14);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 15);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 16);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 17);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 18);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 19);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 20);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 21);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 22);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 23);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 24);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 25);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 26);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 27);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 28);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 29);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 30);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 31);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 32);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 33);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 34);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 35);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 36);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 37);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 38);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 39);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 40);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 41);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 42);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 43);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 44);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 45);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 46);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 47);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 48);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 49);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 50);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 51);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 52);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 53);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 54);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (2, 55);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 16);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 17);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 18);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 19);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 20);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 21);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 22);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 23);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 24);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 25);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 26);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 27);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 28);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 29);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 30);
INSERT INTO `mobile_drs`.`roles_permission` (`rp_rolesID`, `rp_permissionsID`) VALUES (3, 31);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mobile_drs`.`type_of_visits`
-- -----------------------------------------------------
START TRANSACTION;
USE `mobile_drs`;
INSERT INTO `mobile_drs`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (1, 'Initial Visit (Home)');
INSERT INTO `mobile_drs`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (2, 'Initial Visit (Facility)');
INSERT INTO `mobile_drs`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (3, 'Follow-up Visit ');
INSERT INTO `mobile_drs`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (4, 'No Show');
INSERT INTO `mobile_drs`.`type_of_visits` (`tov_id`, `tov_name`) VALUES (5, 'Cancelled');

COMMIT;

