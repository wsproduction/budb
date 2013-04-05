-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 05, 2013 at 10:37 AM
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
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `members_id` varchar(10) NOT NULL,
  `members_name` varchar(50) NOT NULL,
  `members_nickname` varchar(10) NOT NULL,
  `members_gender` char(1) NOT NULL,
  `members_address` varchar(250) NOT NULL,
  `members_birthplace` varchar(30) NOT NULL,
  `members_birthdate` date NOT NULL,
  `members_last_education` varchar(20) DEFAULT NULL,
  `members_jobs` varchar(20) DEFAULT NULL,
  `members_phone_number` varchar(12) DEFAULT NULL,
  `members_email` varchar(50) DEFAULT NULL,
  `members_facebook` varchar(50) DEFAULT NULL,
  `members_twitter` varchar(50) DEFAULT NULL,
  `members_status` tinyint(1) NOT NULL,
  `members_entry` datetime NOT NULL,
  `members_entry_update` datetime NOT NULL,
  PRIMARY KEY (`members_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`members_id`, `members_name`, `members_nickname`, `members_gender`, `members_address`, `members_birthplace`, `members_birthdate`, `members_last_education`, `members_jobs`, `members_phone_number`, `members_email`, `members_facebook`, `members_twitter`, `members_status`, `members_entry`, `members_entry_update`) VALUES
('1303290001', 'Warman Suganda', 'Warman', '1', 'Jawura RT. 08/02 Pagaden Subang 41252', 'Subang', '1988-09-22', 'S1', 'Staff IT', '085222229880', 'warman.suganda@gmail.com', 'warman.suganda', '@WarmanSuganda', 1, '2013-03-29 08:51:50', '2013-04-04 10:56:47'),
('1303290002', 'Indra Irawan', 'Indra', '0', 'Cibogo wetan', 'Cianjur', '1988-02-01', 'S1', 'Marketing', '0997748739', 'indra@gmail.com', 'indra.irawan', '@indra_irawan', 1, '2013-03-29 13:00:49', '2013-04-04 11:24:44');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` varchar(10) NOT NULL,
  `order_members` varchar(10) NOT NULL,
  `order_note` varchar(250) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `order_entry` datetime NOT NULL,
  `order_entry_update` datetime NOT NULL,
  `payment_status` int(11) NOT NULL,
  `payment_type` int(11) DEFAULT NULL,
  `payment_note` varchar(150) DEFAULT NULL,
  `shipping_status` int(11) NOT NULL,
  `shipping_address` varchar(250) NOT NULL,
  `shipping_date` date DEFAULT NULL,
  `shipping_courier` varchar(30) DEFAULT NULL,
  `shipping_cost` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `order_fk2` (`payment_type`),
  KEY `order_fk1` (`order_members`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_members`, `order_note`, `order_status`, `order_entry`, `order_entry_update`, `payment_status`, `payment_type`, `payment_note`, `shipping_status`, `shipping_address`, `shipping_date`, `shipping_courier`, `shipping_cost`) VALUES
('1203290001', '1303290001', ' ', 1, '2013-03-29 14:46:25', '2013-03-29 14:46:29', 0, -1, NULL, 0, 'Jln. Letjen Soeprapto 105 Subang 41211', NULL, NULL, 8000);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE IF NOT EXISTS `order_detail` (
  `detail_id` varchar(12) NOT NULL,
  `detail_order` varchar(10) NOT NULL,
  `detail_item` varchar(8) NOT NULL,
  `detail_price` int(11) DEFAULT NULL,
  `detail_discount` int(11) NOT NULL,
  `detail_order_quantity` int(11) NOT NULL,
  `detail_ready_quantity` int(11) DEFAULT NULL,
  `detail_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`detail_id`),
  KEY `order_detail_fk2` (`detail_item`),
  KEY `order_detail_fk1` (`detail_order`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`detail_id`, `detail_order`, `detail_item`, `detail_price`, `detail_discount`, `detail_order_quantity`, `detail_ready_quantity`, `detail_status`) VALUES
('120329000001', '1203290001', '13030001', 72500, 20, 5, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE IF NOT EXISTS `payment_type` (
  `payment_type_id` int(11) NOT NULL,
  `payment_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`payment_type_id`, `payment_type_name`) VALUES
(-1, ' '),
(1, 'Cash'),
(2, 'Transfer');

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
('13030002', '13030002', 001, 'Shock Pink', 'Cover', 1, '2013-03-28 18:02:16', '2013-03-28 18:02:18'),
('13030004', '13030001', 003, 'Purple Abstract', '-', 1, '2013-03-28 23:29:55', '2013-03-29 07:40:25'),
('13030005', '13030001', 004, 'Orange Flower', '-', 1, '2013-03-28 23:46:43', '2013-03-29 07:40:58'),
('13030007', '13030002', 002, 'Purple Abstract', '-', 1, '2013-03-29 00:59:57', '2013-03-29 07:41:36');

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
  `size_description` varchar(20) NOT NULL,
  `size_entry` datetime NOT NULL,
  `size_entry_update` datetime NOT NULL,
  PRIMARY KEY (`size_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`size_id`, `size_description`, `size_entry`, `size_entry_update`) VALUES
('13001', 'A6 (9.5 x 13.5 cm)', '2013-03-26 22:24:31', '2013-03-26 22:24:34');

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

--
-- Dumping data for table `product_size_aggregation`
--

INSERT INTO `product_size_aggregation` (`aggregation_id`, `aggregation_size`, `aggregation_category`) VALUES
('13030001', '13001', '13001'),
('13030002', '13001', '13002');

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
  `item_status` tinyint(1) NOT NULL,
  `item_entry` datetime NOT NULL,
  `item_entry_update` datetime NOT NULL,
  PRIMARY KEY (`item_id`),
  KEY `product_item_fk1` (`item_product`),
  KEY `product_item_fk2` (`item_size`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pruduct_item`
--

INSERT INTO `pruduct_item` (`item_id`, `item_product`, `item_size`, `item_stock`, `item_price`, `item_discount`, `item_status`, `item_entry`, `item_entry_update`) VALUES
('13030001', '13030001', '13030001', 20, 72500, 20, 0, '2013-03-29 06:50:01', '2013-03-29 06:50:04'),
('13030002', '13030004', '13030001', 56, 72500, 20, 0, '2013-03-29 08:07:22', '2013-03-29 08:07:22'),
('13030003', '13030005', '13030001', 30, 72500, 20, 0, '2013-03-29 08:08:03', '2013-03-29 08:41:18'),
('13030004', '13030002', '13030002', 15, 29000, 20, 0, '2013-03-29 10:28:23', '2013-03-29 10:28:38');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `order_fk1` FOREIGN KEY (`order_members`) REFERENCES `members` (`members_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_fk2` FOREIGN KEY (`payment_type`) REFERENCES `payment_type` (`payment_type_id`) ON UPDATE CASCADE;

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_fk1` FOREIGN KEY (`detail_order`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_detail_fk2` FOREIGN KEY (`detail_item`) REFERENCES `pruduct_item` (`item_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_fk2` FOREIGN KEY (`product_type`) REFERENCES `product_type_aggregation` (`aggregation_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_size_aggregation`
--
ALTER TABLE `product_size_aggregation`
  ADD CONSTRAINT `product_size_aggregation_fk1` FOREIGN KEY (`aggregation_size`) REFERENCES `product_size` (`size_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_size_aggregation_fk2` FOREIGN KEY (`aggregation_category`) REFERENCES `product_category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `product_type_aggregation`
--
ALTER TABLE `product_type_aggregation`
  ADD CONSTRAINT `product_type_aggregation_fk1` FOREIGN KEY (`aggregation_type`) REFERENCES `product_type` (`type_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_type_aggregation_fk2` FOREIGN KEY (`aggregation_category`) REFERENCES `product_category` (`category_id`) ON UPDATE CASCADE;

--
-- Constraints for table `pruduct_item`
--
ALTER TABLE `pruduct_item`
  ADD CONSTRAINT `product_item_fk1` FOREIGN KEY (`item_product`) REFERENCES `product` (`product_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `product_item_fk2` FOREIGN KEY (`item_size`) REFERENCES `product_size_aggregation` (`aggregation_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
