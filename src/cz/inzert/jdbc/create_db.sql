CREATE DATABASE  IF NOT EXISTS `inzert`;
USE `inzert`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `user`;
DROP TABLE IF EXISTS `advertisement`;
DROP TABLE IF EXISTS `category`;
DROP TABLE IF EXISTS `rating`;
DROP TABLE IF EXISTS `response`;
SET foreign_key_checks = 1;



CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phoneNumber` varchar(45),
  `email` varchar(45) NOT NULL,
  `rating` int(11) DEFAULT 0,
  `privileges` int(2) DEFAULT 0, # 0 = user; 1 = admin
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `advertisement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(1000) DEFAULT "",
  `user` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `reported` int(5) DEFAULT 0,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `price` float(10) DEFAULT 0,
  `location` varchar(10) DEFAULT "",
  `type` tinyint default 0,  # 0 = sell; 1 = buy
  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserAdvertisement FOREIGN KEY (user)
  REFERENCES user(id),
  CONSTRAINT FK_CategoryAdvertisement FOREIGN KEY (category)
  REFERENCES category(id)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advertisement` int(11) NOT NULL,
  `user` int(11) NOT NULL,
  `text` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_AdvertisementResponse FOREIGN KEY (advertisement)
  REFERENCES response(id),
  CONSTRAINT FK_UserResponse FOREIGN KEY (user)
  REFERENCES `user`(id)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userMaker` int(11) NOT NULL,
  `userTaker` int(11) NOT NULL,
  `value` float(2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_UserTakerRating FOREIGN KEY (userTaker)
  REFERENCES user(id),
  CONSTRAINT FK_UserMakerRating FOREIGN KEY (userMaker)
  REFERENCES user(id)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




