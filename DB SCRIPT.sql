Table `mydb`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categories` (
  `category_id` INT NOT NULL,
  `category_name` VARCHAR(45) NOT NULL,
  `category_description` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Products` (
  `product_id` INT NOT NULL,
  `product_name` VARCHAR(45) NULL,
  `product_description` VARCHAR(45) NULL,
  `Product_price` VARCHAR(45) NULL,
  `Product_status` VARCHAR(45) NULL,
  PRIMARY KEY (`product_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product-Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product-Categories` (
  `Categories_category_id` INT NOT NULL,
  `Products_product_id` INT NOT NULL,
  INDEX `fk_Product-Categories_Categories_idx` (`Categories_category_id` ASC) VISIBLE,
  INDEX `fk_Product-Categories_Products1_idx` (`Products_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product-Categories_Categories`
    FOREIGN KEY (`Categories_category_id`)
    REFERENCES `mydb`.`Categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product-Categories_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Option Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Option Groups` (
  `option_group_id` INT NOT NULL,
  `group_name` VARCHAR(45) NULL,
  PRIMARY KEY (`option_group_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product _id`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product _id` (
  `idProduct _id` INT NOT NULL,
  `option_group_id` VARCHAR(45) NOT NULL,
  `option_group_type` VARCHAR(45) NULL,
  `Option Groups_option_group_id` INT NOT NULL,
  `Products_product_id` INT NOT NULL,
  PRIMARY KEY (`idProduct _id`, `option_group_id`),
  INDEX `fk_Product _id_Option Groups1_idx` (`Option Groups_option_group_id` ASC) VISIBLE,
  INDEX `fk_Product _id_Products1_idx` (`Products_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product _id_Option Groups1`
    FOREIGN KEY (`Option Groups_option_group_id`)
    REFERENCES `mydb`.`Option Groups` (`option_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product _id_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Options Values`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Options Values` (
  `option_value_id` INT NOT NULL,
  `value_name` VARCHAR(45) NULL,
  PRIMARY KEY (`option_value_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Product Value`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Product Value` (
  `product_id` INT NOT NULL,
  `option_group_id` VARCHAR(45) NOT NULL,
  `option_value_id` VARCHAR(45) NOT NULL,
  `Options Values_option_value_id` INT NOT NULL,
  `Product _id_idProduct _id` INT NOT NULL,
  `Product _id_option_group_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`product_id`, `option_group_id`, `option_value_id`),
  INDEX `fk_Product Value_Options Values1_idx` (`Options Values_option_value_id` ASC) VISIBLE,
  INDEX `fk_Product Value_Product _id1_idx` (`Product _id_idProduct _id` ASC, `Product _id_option_group_id` ASC) VISIBLE,
  CONSTRAINT `fk_Product Value_Options Values1`
    FOREIGN KEY (`Options Values_option_value_id`)
    REFERENCES `mydb`.`Options Values` (`option_value_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Product Value_Product _id1`
    FOREIGN KEY (`Product _id_idProduct _id` , `Product _id_option_group_id`)
    REFERENCES `mydb`.`Product _id` (`idProduct _id` , `option_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Shopping Cart Itens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Shopping Cart Itens` (
  `user_id` INT NOT NULL,
  `product_id` VARCHAR(45) NOT NULL,
  `product_options` VARCHAR(45) NOT NULL,
  `quantity` VARCHAR(45) NULL,
  `Product Value_product_id` INT NOT NULL,
  `Product Value_option_group_id` VARCHAR(45) NOT NULL,
  `Product Value_option_value_id` VARCHAR(45) NOT NULL,
  `Product _id_idProduct _id` INT NOT NULL,
  `Product _id_option_group_id` VARCHAR(45) NOT NULL,
  `Products_product_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `product_id`, `product_options`),
  INDEX `fk_Shopping Cart Itens_Product Value1_idx` (`Product Value_product_id` ASC, `Product Value_option_group_id` ASC, `Product Value_option_value_id` ASC) VISIBLE,
  INDEX `fk_Shopping Cart Itens_Product _id1_idx` (`Product _id_idProduct _id` ASC, `Product _id_option_group_id` ASC) VISIBLE,
  INDEX `fk_Shopping Cart Itens_Products1_idx` (`Products_product_id` ASC) VISIBLE,
  CONSTRAINT `fk_Shopping Cart Itens_Product Value1`
    FOREIGN KEY (`Product Value_product_id` , `Product Value_option_group_id` , `Product Value_option_value_id`)
    REFERENCES `mydb`.`Product Value` (`product_id` , `option_group_id` , `option_value_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping Cart Itens_Product _id1`
    FOREIGN KEY (`Product _id_idProduct _id` , `Product _id_option_group_id`)
    REFERENCES `mydb`.`Product _id` (`idProduct _id` , `option_group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Shopping Cart Itens_Products1`
    FOREIGN KEY (`Products_product_id`)
    REFERENCES `mydb`.`Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


