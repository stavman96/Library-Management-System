

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `library`.`readers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(45) NULL DEFAULT NULL,
  `lname` VARCHAR(45) NULL DEFAULT NULL,
  `vat` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`books` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `isbn` VARCHAR(45) NULL DEFAULT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `publishers_id` INT(11) NOT NULL,
  `categories_id` INT(11) NOT NULL,
  `copies` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_books_publishers_idx` (`publishers_id` ASC) ,
  INDEX `fk_books_categories1_idx` (`categories_id` ASC) ,
  CONSTRAINT `fk_books_publishers`
    FOREIGN KEY (`publishers_id`)
    REFERENCES `library`.`publishers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_categories1`
    FOREIGN KEY (`categories_id`)
    REFERENCES `library`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`publishers` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`authors` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`books_has_authors` (
  `books_id` INT(11) NOT NULL,
  `authors_id` INT(11) NOT NULL,
  PRIMARY KEY (`books_id`, `authors_id`),
  INDEX `fk_books_has_authors_authors1_idx` (`authors_id` ASC) ,
  INDEX `fk_books_has_authors_books1_idx` (`books_id` ASC) ,
  CONSTRAINT `fk_books_has_authors_books1`
    FOREIGN KEY (`books_id`)
    REFERENCES `library`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_books_has_authors_authors1`
    FOREIGN KEY (`authors_id`)
    REFERENCES `library`.`authors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`categories` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `library`.`readers_has_books` (
  `readers_id` INT(11) NOT NULL,
  `books_id` INT(11) NOT NULL,
  `date_borrow` DATETIME NOT NULL,
  `date_return` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`readers_id`, `books_id`),
  INDEX `fk_readers_has_books_books1_idx` (`books_id` ASC) ,
  INDEX `fk_readers_has_books_readers1_idx` (`readers_id` ASC) ,
  CONSTRAINT `fk_readers_has_books_readers1`
    FOREIGN KEY (`readers_id`)
    REFERENCES `library`.`readers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_readers_has_books_books1`
    FOREIGN KEY (`books_id`)
    REFERENCES `library`.`books` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
