CREATE DATABASE PruebaEmpleados;
USE PruebaEmpleados;

CREATE TABLE IF NOT EXISTS `PruebaEmpleados`.`Empleados` (
  `DPI` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellidos` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `No_Seguro` VARCHAR(45) NOT NULL,
  `Telefono` INT(8) NOT NULL,
  PRIMARY KEY (`DPI`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `PruebaEmpleados`.`Departamentos` (
  `Codigo_Departamento` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Codigo_Departamento`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `PruebaEmpleados`.`Contratos` (
  `Codigo_Contratos` INT NOT NULL AUTO_INCREMENT,
  `DPI` INT NOT NULL,
  `Codigo_Departamento` INT NOT NULL,
  `Puesto` VARCHAR(40) NOT NULL,
  `Jerarquia` VARCHAR(40) NOT NULL,
  `Sueldo` DECIMAL(25) NOT NULL,
  `Fecha_Ingreso` DATE NOT NULL,
  `Fecha_Aumento` DATE NOT NULL,
  `Fecha_Baja` DATE NOT NULL,
  PRIMARY KEY (`Codigo_Contratos`),
  INDEX `fk_Contratos_Empleados_idx` (`DPI` ASC) VISIBLE,
  INDEX `fk_Contratos_Departamentos1_idx` (`Codigo_Departamento` ASC) VISIBLE,
  CONSTRAINT `fk_Contratos_Empleados`
    FOREIGN KEY (`DPI`)
    REFERENCES `PruebaEmpleados`.`Empleados` (`DPI`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Contratos_Departamentos1`
    FOREIGN KEY (`Codigo_Departamento`)
    REFERENCES `PruebaEmpleados`.`Departamentos` (`Codigo_Departamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;