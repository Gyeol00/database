-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema GreenUniv
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema GreenUniv
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `GreenUniv` DEFAULT CHARACTER SET utf8 ;
USE `GreenUniv` ;

-- -----------------------------------------------------
-- Table `GreenUniv`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`user` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`professor` (
  `P_num` INT NOT NULL,
  `P_Pnum` INT NULL,
  `P_name` VARCHAR(5) NULL,
  `P_Ename` VARCHAR(45) NULL,
  `P_gender` TINYINT NULL,
  `P_nation` VARCHAR(15) NULL,
  `P_hp` CHAR(13) NULL,
  `P_email` VARCHAR(50) NULL,
  `P_addr` VARCHAR(100) NULL,
  `P_graduniv` VARCHAR(15) NULL,
  `P_spec` VARCHAR(15) NULL,
  `P_graddate` DATE NULL,
  `P_degree` VARCHAR(10) NULL,
  `P_lesson` VARCHAR(15) NULL,
  `P_spec` VARCHAR(15) NULL,
  `P_appointdate` DATE NULL,
  PRIMARY KEY (`P_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`community_common`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`community_common` (
  `CcommonId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `hit` TINYINT NULL,
  `cate` VARCHAR(10) NULL,
  `wdate` DATE NULL,
  PRIMARY KEY (`CcommonId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`community_news`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`community_news` (
  `CnewsId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `hit` TINYINT NULL,
  `sort` TINYINT NULL,
  `wdate` DATE NULL,
  PRIMARY KEY (`CnewsId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`community_infor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`community_infor` (
  `CinforId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `company` VARCHAR(10) NULL,
  `hit` TINYINT NULL,
  `status` TINYINT NULL,
  `deadline` VARCHAR(16) NULL,
  `wdate` DATE NULL,
  PRIMARY KEY (`CinforId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`community_qna`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`community_qna` (
  `CqnaId` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `status` TINYINT NULL,
  `wdate` DATE NULL,
  PRIMARY KEY (`CqnaId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`community_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`community_comment` (
  `CcommonId` INT NOT NULL,
  `CnewsId` INT NOT NULL,
  `CissueId` INT NOT NULL,
  `CqnaId` INT NOT NULL,
  `content` VARCHAR(50) NULL,
  `writer` VARCHAR(10) NULL,
  `wdate` DATE NULL,
  INDEX `fk_community_comment_community_common_idx` (`CcommonId` ASC) VISIBLE,
  INDEX `fk_community_comment_community_news1_idx` (`CnewsId` ASC) VISIBLE,
  INDEX `fk_community_comment_community_issue1_idx` (`CissueId` ASC) VISIBLE,
  INDEX `fk_community_comment_community_qna1_idx` (`CqnaId` ASC) VISIBLE,
  CONSTRAINT `fk_community_comment_community_common`
    FOREIGN KEY (`CcommonId`)
    REFERENCES `GreenUniv`.`community_common` (`CcommonId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_community_comment_community_news1`
    FOREIGN KEY (`CnewsId`)
    REFERENCES `GreenUniv`.`community_news` (`CnewsId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_community_comment_community_issue1`
    FOREIGN KEY (`CissueId`)
    REFERENCES `GreenUniv`.`community_infor` (`CinforId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_community_comment_community_qna1`
    FOREIGN KEY (`CqnaId`)
    REFERENCES `GreenUniv`.`community_qna` (`CqnaId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`lecture` (
  `LE_num` INT NOT NULL,
  `lecturecol` VARCHAR(45) NULL,
  PRIMARY KEY (`LE_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`student` (
  `S_num` INT NOT NULL,
  `S_Pnum` INT NULL,
  `S_name` VARCHAR(5) NULL,
  `S_Ename` VARCHAR(45) NULL,
  `S_gender` TINYINT NULL,
  `S_nation` VARCHAR(15) NULL,
  `S_hp` CHAR(13) NULL,
  `S_email` VARCHAR(50) NULL,
  `S_addr` VARCHAR(100) NULL,
  `S_addate` INT NULL,
  `S_graddate` INT NULL,
  `S_adstatus` VARCHAR(2) NULL,
  `S_lesson` VARCHAR(15) NULL,
  `S_spec` VARCHAR(15) NULL,
  `S_grade` VARCHAR(3) NULL,
  `S_term` VARCHAR(3) NULL,
  `S_advisor` VARCHAR(10) NULL,
  PRIMARY KEY (`S_num`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`department` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`ent_notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`ent_notice` (
  `ent_notice_no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `hit` TINYINT NULL,
  `wdate` DATE NULL,
  PRIMARY KEY (`ent_notice_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`ent_consult`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`ent_consult` (
  `ent_consult_no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `writer` VARCHAR(10) NULL,
  `wdate` DATE NULL,
  `ent_consultcol` VARCHAR(45) NULL,
  `status` TINYINT NULL,
  `sort` TINYINT NULL,
  PRIMARY KEY (`ent_consult_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`bac_notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`bac_notice` (
  `bac_notice_no` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(20) NULL,
  `content` VARCHAR(100) NULL,
  `writer` VARCHAR(10) NULL,
  `wdate` DATE NULL,
  `hit` TINYINT NULL,
  PRIMARY KEY (`bac_notice_no`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`Common_comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`Common_comment` (
  `bac_notice_bac_notice_no` INT NOT NULL,
  `ent_consult_ent_consult_no` INT NOT NULL,
  `ent_notice_ent_notice_no` INT NOT NULL,
  `content` VARCHAR(50) NULL,
  `writer` VARCHAR(10) NULL,
  `wdate` DATE NULL,
  INDEX `fk_Common_comment_bac_notice1_idx` (`bac_notice_bac_notice_no` ASC) VISIBLE,
  INDEX `fk_Common_comment_ent_consult1_idx` (`ent_consult_ent_consult_no` ASC) VISIBLE,
  INDEX `fk_Common_comment_ent_notice1_idx` (`ent_notice_ent_notice_no` ASC) VISIBLE,
  CONSTRAINT `fk_Common_comment_bac_notice1`
    FOREIGN KEY (`bac_notice_bac_notice_no`)
    REFERENCES `GreenUniv`.`bac_notice` (`bac_notice_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Common_comment_ent_consult1`
    FOREIGN KEY (`ent_consult_ent_consult_no`)
    REFERENCES `GreenUniv`.`ent_consult` (`ent_consult_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Common_comment_ent_notice1`
    FOREIGN KEY (`ent_notice_ent_notice_no`)
    REFERENCES `GreenUniv`.`ent_notice` (`ent_notice_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GreenUniv`.`lecture`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `GreenUniv`.`lecture` (
  `LE_num` INT NOT NULL,
  `lecturecol` VARCHAR(45) NULL,
  PRIMARY KEY (`LE_num`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
