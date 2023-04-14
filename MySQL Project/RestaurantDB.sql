-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db-capstone-project
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db-capstone-project` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `db-capstone-project` ;

-- -----------------------------------------------------
-- Table `db-capstone-project`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`customer` (
  `Customer_Id` INT NOT NULL,
  `Customer_Name` VARCHAR(45) NOT NULL,
  `Phone_number` INT NOT NULL,
  PRIMARY KEY (`Customer_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`bookings` (
  `booking_id` INT NOT NULL,
  `date` DATE NULL DEFAULT NULL,
  `table_number` INT NULL DEFAULT NULL,
  `Customer_Id` INT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE INDEX `table_number_UNIQUE` (`table_number` ASC) VISIBLE,
  INDEX `fk_bookings_customer1_idx` (`Customer_Id` ASC) VISIBLE,
  CONSTRAINT `fk_bookings_customer1`
    FOREIGN KEY (`Customer_Id`)
    REFERENCES `db-capstone-project`.`customer` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Menu` (
  `Cuisines` VARCHAR(45) NOT NULL,
  `Starter` VARCHAR(45) NULL DEFAULT NULL,
  `Course` VARCHAR(45) NULL DEFAULT NULL,
  `Drink` VARCHAR(45) NULL DEFAULT NULL,
  `Dessert` VARCHAR(45) NULL DEFAULT NULL,
  `Product_Id` INT NOT NULL,
  UNIQUE INDEX `Menucol_UNIQUE` (`Cuisines` ASC) VISIBLE,
  PRIMARY KEY (`Product_Id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`staff_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`staff_information` (
  `Role` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Salary` INT NOT NULL,
  `Staff_Id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Staff_Id`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`Orders` (
  `OrderId` INT NOT NULL,
  `orderDate` DATE NOT NULL,
  `quantity` INT NULL DEFAULT NULL,
  `total cost` FLOAT NULL DEFAULT NULL,
  `customer_Customer_Id` INT NOT NULL,
  `Product_Id` INT NOT NULL,
  `Staff_Id` INT NOT NULL,
  PRIMARY KEY (`OrderId`),
  INDEX `fk_orders_customer1_idx` (`customer_Customer_Id` ASC) VISIBLE,
  UNIQUE INDEX `Product_Id_UNIQUE` (`Product_Id` ASC) VISIBLE,
  UNIQUE INDEX `Staff_Id_UNIQUE` (`Staff_Id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer1`
    FOREIGN KEY (`customer_Customer_Id`)
    REFERENCES `db-capstone-project`.`customer` (`Customer_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Menu1`
    FOREIGN KEY (`Product_Id`)
    REFERENCES `db-capstone-project`.`Menu` (`Product_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_staff_information1`
    FOREIGN KEY (`Staff_Id`)
    REFERENCES `db-capstone-project`.`staff_information` (`Staff_Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `db-capstone-project`.`order_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db-capstone-project`.`order_status` (
  `delivery_date` DATE NOT NULL,
  `order_status` VARCHAR(45) NOT NULL,
  `OrderId` INT NOT NULL,
  PRIMARY KEY (`delivery_date`),
  UNIQUE INDEX `OrderId_UNIQUE` (`OrderId` ASC) VISIBLE,
  CONSTRAINT `fk_order_status_Orders1`
    FOREIGN KEY (`OrderId`)
    REFERENCES `db-capstone-project`.`Orders` (`OrderId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
