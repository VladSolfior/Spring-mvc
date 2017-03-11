USE test;
DROP TABLE IF EXISTS `test`;
CREATE TABLE  `test` (
  `id` INT(8) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(25) NOT NULL,
  `created_date` TIMESTAMP NOT NULL,
  `age` INT(11) NOT NULL,
  `is_admin` BIT(1) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('1', 'User', '2017/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('2', 'User', '1999/1/1', '15', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('3', 'User', '2018/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('4', 'User4', '2000/1/1', '42', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('5', 'User', '2017/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('6', 'User6', '1999/1/1', '2', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('7', 'User', '1980/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('8', 'User', '1999/1/1', '3', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('9', 'User9', '2020/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('10', 'User', '2010/1/1', '32', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('11', 'User', '2011/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('12', 'User12', '2002/1/1', '12', b'0');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('13', 'User13', '2016/1/1', '11', b'1');
INSERT INTO `test`.`test` (`id`, `name`, `created_date`, `age`, `is_admin`) VALUES ('14', 'User14', '2015/1/1', '12', b'0');