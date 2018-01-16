CREATE DATABASE  IF NOT EXISTS `inzert`;
USE `inzert`;

SET foreign_key_checks = 0;

DROP TABLE IF EXISTS `customer`;
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

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) DEFAULT NULL,
  `lastName` varchar(45) DEFAULT NULL,
  `login` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `adress` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT FK_AdressCustomer FOREIGN KEY (adress)
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
  `customer` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `reported` int(5) DEFAULT NULL,
  `created` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  CONSTRAINT FK_CustomerAdvertisement FOREIGN KEY (customer)
  REFERENCES customer(id),
  
  
CONSTRAINT FK_CategoryAdvertisement FOREIGN KEY (category)
  REFERENCES category(id)
 
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `response` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `advertisement` int(11) DEFAULT NULL,
  `customer` int(11) DEFAULT NULL,
  `text` varchar(45) DEFAULT NULL,  
  PRIMARY KEY (`id`),
  CONSTRAINT FK_AdvertisementResponse FOREIGN KEY (advertisement)
  REFERENCES response(id), 
  CONSTRAINT FK_customerResponse FOREIGN KEY (customer)
  REFERENCES `customer`(id)
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerMaker` int(11) DEFAULT NULL,  
  `customerTaker` int(11) DEFAULT NULL,  
  `value` float(2) DEFAULT NULL,    
  PRIMARY KEY (`id`),
  CONSTRAINT FK_customerTakerRating FOREIGN KEY (customerTaker)
  REFERENCES customer(id), 
  CONSTRAINT FK_customerMakerRating FOREIGN KEY (customerMaker)
  REFERENCES customer(id) 
) AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;




