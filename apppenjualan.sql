-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 02, 2013 at 01:56 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `apppenjualan`
--

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `supplier_id` varchar(12) NOT NULL,
  `supplier_name` varchar(50) NOT NULL,
  `supplier_address` varchar(250) DEFAULT NULL,
  `supplier_phone` varchar(12) DEFAULT NULL,
  `supplier_email` varchar(50) DEFAULT NULL,
  `supplier_lastmodif` datetime NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `supplier_name`, `supplier_address`, `supplier_phone`, `supplier_email`, `supplier_lastmodif`) VALUES
('SUP130124001', 'PT. Cetar Membahana', NULL, '085222229880', 'warmansuganda@yahoo.com', '2013-01-24 11:04:24'),
('SUP130125001', '1', '1', '1', '1', '2013-01-25 19:13:40'),
('SUP130125002', 'heseweleh', 'oho', 'ihi', 'uhu', '2013-01-25 20:04:17'),
('SUP130125003', 'qwerty', 's', '', '', '2013-01-25 20:16:28'),
('SUP130125004', 'warman suganda', 'sss', 'ss', '', '2013-01-25 20:16:49'),
('SUP130125005', 'risnandar', '', '', '', '2013-01-25 21:33:20'),
('SUP130125006', 'dodi', '', '', '', '2013-01-25 23:36:51'),
('SUP130125007', 'semelekete', '', '', '', '2013-01-25 23:42:01'),
('SUP130126001', 'tenaga dalam', '', '', '', '2013-01-26 00:23:59'),
('SUP130126002', 'tuyul', '', '', '', '2013-01-26 00:27:16'),
('SUP130126003', 'jadilah apa yang ka', '', '', '', '2013-01-26 11:16:29'),
('SUP130126004', 'KEmana', 'Saja', 'kamu', 'Selama', '2013-01-26 11:16:59'),
('SUP130126005', 'bikin ', 'hepi', '', '', '2013-01-26 12:28:53'),
('SUP130128001', 'wertyu', 'gg', 'gg', 'gg', '2013-01-28 10:03:33');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
