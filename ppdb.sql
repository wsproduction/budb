-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 04, 2013 at 07:59 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ppdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_applicant_profile`
--

CREATE TABLE IF NOT EXISTS `ppdb_applicant_profile` (
  `applicant_id` varchar(8) NOT NULL COMMENT 'AABBXXXX',
  `applicant_name` varchar(50) NOT NULL,
  `applicant_gender` int(11) NOT NULL,
  `applicant_religion` int(11) NOT NULL,
  `applicant_blood_group` int(11) DEFAULT NULL,
  `applicant_birthplace` varchar(50) NOT NULL,
  `applicant_birthdate` datetime NOT NULL,
  `applicant_height` float DEFAULT NULL,
  `applicant_weight` float DEFAULT NULL,
  `applicant_disease` int(11) DEFAULT NULL,
  `applicant_entry` datetime NOT NULL,
  `applicant_entry_update` datetime NOT NULL,
  PRIMARY KEY (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_school_profile`
--

CREATE TABLE IF NOT EXISTS `ppdb_school_profile` (
  `school_npsn` varchar(8) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(250) NOT NULL,
  `school_zipcode` varchar(5) DEFAULT NULL,
  `school_phone` varchar(12) DEFAULT NULL,
  `school_entry` datetime NOT NULL,
  `school_entry_update` datetime NOT NULL,
  PRIMARY KEY (`school_npsn`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
