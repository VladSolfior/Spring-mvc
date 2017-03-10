DROP TABLE `test`.`test`;
CREATE TABLE `test`.`test` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `created_date` DATE NOT NULL,
  `age` INT(11) NOT NULL,
  `is_admin` BIT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('1', 'User', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('2', 'User', '2000/1/1', '15', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('3', 'User', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('4', 'User4', '2000/1/1', '42', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('5', 'User', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('6', 'User6', '2000/1/1', '2', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('7', 'User', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('8', 'User', '2000/1/1', '3', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('9', 'User9', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('10', 'User', '2000/1/1', '32', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('11', 'User', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('12', 'User12', '2000/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('13', 'User13', '2000/1/1', '11', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('14', 'User14', '2000/1/1', '12', b'0');