-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema af25enoca1_college_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema af25enoca1_college_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `af25enoca1_college_db` DEFAULT CHARACTER SET utf8 ;
USE `af25enoca1_college_db` ;

-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`people` (
  `people_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `gender` VARCHAR(10) NOT NULL COMMENT 'Possible values:\nF = Females\nM = Males',
  `address` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`people_id`),
  INDEX `idx_full_name` (`first_name` ASC, `last_name` ASC) VISIBLE,
  INDEX `idx_email` (`email` ASC) VISIBLE,
  INDEX `idx_phone` (`phone_number` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number_UNIQUE` (`phone_number` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`department_id`),
  INDEX `idx_department_name` (`department_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`semester`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`semester` (
  `semester_id` INT NOT NULL AUTO_INCREMENT,
  `semester_term` VARCHAR(45) NOT NULL COMMENT 'Possible values:\nSummer\nFall\nSpring\n',
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  `year` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  PRIMARY KEY (`semester_id`),
  INDEX `idx_year` (`year` ASC) VISIBLE,
  INDEX `idx_term` (`semester_term` ASC) VISIBLE,
  INDEX `idx_start_date` (`start_date` ASC) VISIBLE,
  INDEX `idx_end_date` (`end_date` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`room`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`room` (
  `room_id` INT NOT NULL AUTO_INCREMENT,
  `room_number` VARCHAR(45) NOT NULL,
  `building` VARCHAR(255) NOT NULL,
  `capacity` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`room_id`),
  INDEX `idx_room_capacity` (`capacity` ASC) VISIBLE,
  INDEX `idx_room_building` (`building` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_code` VARCHAR(20) NOT NULL,
  `course_title` VARCHAR(45) NOT NULL,
  `credits` INT NOT NULL,
  `department_id` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  INDEX `idx_course_code` (`course_code` ASC) VISIBLE,
  INDEX `idx_course_title` (`course_title` ASC) VISIBLE,
  PRIMARY KEY (`course_id`),
  INDEX `idx_course_department` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`faculty` (
  `faculty_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `office_location` VARCHAR(45) NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_people_idx` (`people_id` ASC) VISIBLE,
  INDEX `fk_faculty_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_faculty_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`course_offering`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`course_offering` (
  `course_offering_id` INT NOT NULL AUTO_INCREMENT,
  `section_number` VARCHAR(45) NULL,
  `course_id` INT NOT NULL,
  `semester_id` INT NOT NULL,
  `room_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`course_offering_id`),
  INDEX `fk_course_offering_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_course_offering_semester1_idx` (`semester_id` ASC) VISIBLE,
  INDEX `fk_course_offering_room1_idx` (`room_id` ASC) VISIBLE,
  INDEX `fk_course_offering_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_offering_course`
    FOREIGN KEY (`course_id`)
    REFERENCES `af25enoca1_college_db`.`course` (`course_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_semester`
    FOREIGN KEY (`semester_id`)
    REFERENCES `af25enoca1_college_db`.`semester` (`semester_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_room`
    FOREIGN KEY (`room_id`)
    REFERENCES `af25enoca1_college_db`.`room` (`room_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_course_offering_faculty`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `af25enoca1_college_db`.`faculty` (`faculty_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`letter_grade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`letter_grade` (
  `letter_grade_id` INT NOT NULL AUTO_INCREMENT,
  `grade_symbol` VARCHAR(45) NOT NULL COMMENT '(A, B, C, D, F, I, W)',
  `grade_points` DECIMAL(3,2) NOT NULL COMMENT '(4.0, 3.0, …)',
  `letter_grade_col` VARCHAR(45) NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`letter_grade_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  `cumulative_gpa` DECIMAL(3,2) NOT NULL,
  `advisor_id` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`student_id`),
  INDEX `fk_people_student_id_idx` (`people_id` ASC) VISIBLE,
  INDEX `fk_student_faculty1_idx` (`advisor_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_student_faculty`
    FOREIGN KEY (`advisor_id`)
    REFERENCES `af25enoca1_college_db`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`enrollment` (
  `enrollment_id` INT NOT NULL AUTO_INCREMENT,
  `letter_grade_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `course_offering_id` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`enrollment_id`),
  INDEX `fk_enrollment_letter_grade1_idx` (`letter_grade_id` ASC) VISIBLE,
  INDEX `fk_enrollment_student1_idx` (`student_id` ASC) VISIBLE,
  INDEX `fk_enrollment_course_offering1_idx` (`course_offering_id` ASC) VISIBLE,
  CONSTRAINT `fk_enrollment_letter_grade`
    FOREIGN KEY (`letter_grade_id`)
    REFERENCES `af25enoca1_college_db`.`letter_grade` (`letter_grade_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollment_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `af25enoca1_college_db`.`student` (`student_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_enrollment_course_offering`
    FOREIGN KEY (`course_offering_id`)
    REFERENCES `af25enoca1_college_db`.`course_offering` (`course_offering_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `af25enoca1_college_db`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `af25enoca1_college_db`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `people_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  `audit_user_id` INT NOT NULL,
  `audit_timestamp` TIMESTAMP NOT NULL DEFAULT current_timestamp on update current_timestamp,
  PRIMARY KEY (`staff_id`),
  INDEX `fk_staff_people_idx` (`people_id` ASC) VISIBLE,
  INDEX `fk_staff_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_staff_people`
    FOREIGN KEY (`people_id`)
    REFERENCES `af25enoca1_college_db`.`people` (`people_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_staff_department`
    FOREIGN KEY (`department_id`)
    REFERENCES `af25enoca1_college_db`.`department` (`department_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
