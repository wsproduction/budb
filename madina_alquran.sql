-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2013 at 02:37 PM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `madina_alquran`
--

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` varchar(8) NOT NULL,
  `product_type` varchar(8) NOT NULL,
  `product_code` int(3) unsigned zerofill NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_description` text,
  `product_status` tinyint(1) NOT NULL,
  `product_entry` datetime NOT NULL,
  `product_entry_update` datetime NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_fk2` (`product_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_type`, `product_code`, `product_name`, `product_description`, `product_status`, `product_entry`, `product_entry_update`) VALUES
('13030001', '13030001', 001, 'Shock Pink', 'Al-quran + Cover + Pin + Inspairing Stori', 1, '2013-03-28 18:00:14', '2013-03-28 18:00:17'),
('13030002', '13030002', 001, 'Shock Pink', 'Cover', 1, '2013-03-28 18:02:16', '2013-03-28 18:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE IF NOT EXISTS `product_category` (
  `category_id` varchar(5) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `category_status` tinyint(1) NOT NULL,
  `category_entry` datetime NOT NULL,
  `category_entry_update` datetime NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`category_id`, `category_name`, `category_status`, `category_entry`, `category_entry_update`) VALUES
('13001', 'Al-Quran Madina', 1, '2013-03-26 22:22:40', '2013-03-26 22:22:43'),
('13002', 'Cover Al-Quran', 1, '2013-03-26 00:00:00', '2013-03-26 23:38:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE IF NOT EXISTS `product_size` (
  `size_id` varchar(5) NOT NULL,
  `size_category` varchar(5) NOT NULL,
  `size_description` varchar(20) NOT NULL,
  `size_entry` datetime NOT NULL,
  `size_entry_update` datetime NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`size_id`, `size_category`, `size_description`, `size_entry`, `size_entry_update`) VALUES
('13001', '13001', 'A6 (9.5 x 13.5 cm)', '2013-03-26 22:24:31', '2013-03-26 22:24:34'),
('13002', '13002', 'A6 (9.5 x 13.5 cm)', '2013-03-26 23:46:31', '2013-03-26 23:46:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_size_aggregation`
--

CREATE TABLE IF NOT EXISTS `product_size_aggregation` (
  `aggregation_id` varchar(8) NOT NULL,
  `aggregation_size` varchar(5) NOT NULL,
  `aggregation_category` varchar(5) NOT NULL,
  PRIMARY KEY (`aggregation_id`),
  KEY `product_size_aggregation_fk1` (`aggregation_size`),
  KEY `product_size_aggregation_fk2` (`aggregation_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE IF NOT EXISTS `product_type` (
  `type_id` varchar(5) NOT NULL,
  `type_code` varchar(2) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `type_entry` datetime NOT NULL,
  `type_entry_update` datetime NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`type_id`, `type_code`, `type_name`, `type_entry`, `type_entry_update`) VALUES
('13001', 'MR', 'Madina Raihan', '2013-03-26 22:40:06', '2013-03-26 22:40:09'),
('13002', 'ZD', 'Zhafira Denim', '2013-03-26 22:39:31', '2013-03-26 22:39:33'),
('13003', 'ZF', 'Zhafira Flower', '2013-03-26 22:40:56', '2013-03-26 22:40:58'),
('13004', 'ZG', 'Zhafira Geometric', '2013-03-26 22:38:28', '2013-03-26 22:38:30'),
('13005', 'ZL', 'Zhafira Line', '2013-03-26 22:37:48', '2013-03-26 22:37:50'),
('13006', 'ZP', 'Zhafira Paisley', '2013-03-26 22:39:03', '2013-03-26 22:39:05');

-- --------------------------------------------------------

--
-- Table structure for table `product_type_aggregation`
--

CREATE TABLE IF NOT EXISTS `product_type_aggregation` (
  `aggregation_id` varchar(8) NOT NULL,
  `aggregation_type` varchar(5) NOT NULL,
  `aggregation_category` varchar(5) NOT NULL,
  PRIMARY KEY (`aggregation_id`),
  KEY `product_type_aggregation_fk1` (`aggregation_type`),
  KEY `product_type_aggregation_fk2` (`aggregation_category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_type_aggregation`
--

INSERT INTO `product_type_aggregation` (`aggregation_id`, `aggregation_type`, `aggregation_category`) VALUES
('13030001', '13003', '13001'),
('13030002', '13003', '13002');

-- --------------------------------------------------------

--
-- Table structure for table `pruduct_item`
--

CREATE TABLE IF NOT EXISTS `pruduct_item` (
  `item_id` varchar(8) NOT NULL,
  `item_product` varchar(8) NOT NULL,
  `item_size` varchar(8) NOT NULL,
  `item_stock` int(11) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_discount` int(11) NOT NULL,
  `item_entry` datetime NOT NULL,
  `item_entry_update` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `product_item_fk1` (`item_product`),
  KEY `product_item_fk2` (`item_size`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reseller`
--

CREATE TABLE IF NOT EXISTS `reseller` (
  `reseller_id` varchar(10) NOT NULL,
  `reseller_name` varchar(50) NOT NULL,
  `reseller_nickname` varchar(10) NOT NULL,
  `reseller_gender` char(1) NOT NULL,
  `reseller_address` varchar(250) NOT NULL,
  `reseller_city` int(11) NOT NULL,
  `reseller_birthplace` varchar(30) NOT NULL,
  `reseller_birthdate` date NOT NULL,
  `reseller_last_education` varchar(20) DEFAULT NULL,
  `reseller_jobs` varchar(20) DEFAULT NULL,
  `reseller_phone_number` varchar(12) DEFAULT NULL,
  `reseller_email` varchar(50) DEFAULT NULL,
  `reseller_facebook` varchar(50) DEFAULT NULL,
  `reseller_twitter` varchar(50) DEFAULT NULL,
  `reseller_entry` datetime NOT NULL,
  `reseller_entry_update` datetime NOT NULL,
  PRIMARY KEY (`reseller_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_fk2` FOREIGN KEY (`product_type`) REFERENCES `product_type_aggregation` (`aggregation_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_size_aggregation`
--
ALTER TABLE `product_size_aggregation`
  ADD CONSTRAINT `product_size_aggregation_fk2` FOREIGN KEY (`aggregation_category`) REFERENCES `product_category` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_size_aggregation_fk1` FOREIGN KEY (`aggregation_size`) REFERENCES `product_size` (`size_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_type_aggregation`
--
ALTER TABLE `product_type_aggregation`
  ADD CONSTRAINT `product_type_aggregation_fk2` FOREIGN KEY (`aggregation_category`) REFERENCES `product_category` (`category_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_type_aggregation_fk1` FOREIGN KEY (`aggregation_type`) REFERENCES `product_type` (`type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `pruduct_item`
--
ALTER TABLE `pruduct_item`
  ADD CONSTRAINT `product_item_fk1` FOREIGN KEY (`item_product`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_item_fk2` FOREIGN KEY (`item_size`) REFERENCES `product_size_aggregation` (`aggregation_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
