CREATE DATABASE  IF NOT EXISTS `inzert`;
USE `inzert`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `adress`;
DROP TABLE IF EXISTS `advertisement`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `admin`;
DROP TABLE IF EXISTS `rating`;
DROP TABLE IF EXISTS `response`;

SET foreign_key_checks = 1;

CREATE TABLE `adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zipCode` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL, 
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adress` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_AdressUser FOREIGN KEY (adress)
  REFERENCES adress(id) 
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `reported` int(5) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `price` float(10) DEFAULT 0,
  # 0 = sell; 1 = buy
  `type` tinyint default 0,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserAdvertisement FOREIGN KEY (user)
  REFERENCES user(id),
  CONSTRAINT FK_CategoryAdvertisement FOREIGN KEY (category)
  REFERENCES category(id)
 
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advertisement` int(11) DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  CONSTRAINT FK_AdvertisementResponse FOREIGN KEY (advertisement)
  REFERENCES response(id), 
  CONSTRAINT FK_UserResponse FOREIGN KEY (user)
  REFERENCES `user`(id)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userMaker` int(11) DEFAULT NULL,  
  `userTaker` int(11) DEFAULT NULL,  
  `value` float(2) DEFAULT NULL,    
  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserTakerRating FOREIGN KEY (userTaker)
  REFERENCES user(id), 
  CONSTRAINT FK_UserMakerRating FOREIGN KEY (userMaker)
  REFERENCES user(id) 
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




