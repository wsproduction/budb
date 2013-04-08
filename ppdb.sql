-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2013 at 11:55 AM
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
-- Table structure for table `academic_period`
--

CREATE TABLE IF NOT EXISTS `academic_period` (
  `period_id` tinyint(4) NOT NULL,
  `period_years_start` int(4) unsigned NOT NULL,
  `period_years_end` int(4) unsigned NOT NULL,
  `period_status` tinyint(1) unsigned NOT NULL,
  `period_entry` datetime NOT NULL,
  `period_entry_update` datetime NOT NULL,
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academic_period`
--

INSERT INTO `academic_period` (`period_id`, `period_years_start`, `period_years_end`, `period_status`, `period_entry`, `period_entry_update`) VALUES
(1, 2012, 2013, 1, '2012-11-11 22:10:14', '2012-11-11 22:10:17'),
(2, 2013, 2014, 0, '2012-11-12 09:54:10', '2012-11-12 09:54:16');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_appilicant_family`
--

CREATE TABLE IF NOT EXISTS `ppdb_appilicant_family` (
  `family_id` varchar(10) NOT NULL,
  `family_applicant` varchar(8) NOT NULL,
  `family_relationship` int(11) DEFAULT NULL,
  `family_name` varchar(50) NOT NULL,
  `family_gender` int(11) NOT NULL,
  `family_address` varchar(250) NOT NULL,
  `family_lasteducation` tinyint(4) DEFAULT NULL,
  `family_jobs` int(11) DEFAULT NULL,
  `family_phone` varchar(12) DEFAULT NULL,
  `family_entry` datetime NOT NULL,
  `family_entry_update` datetime NOT NULL,
  PRIMARY KEY (`family_id`),
  KEY `ppdb_applicant_family_fk1` (`family_applicant`),
  KEY `ppdb_applicant_family_fk2` (`family_lasteducation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_applicant_profile`
--

CREATE TABLE IF NOT EXISTS `ppdb_applicant_profile` (
  `applicant_id` varchar(8) NOT NULL COMMENT 'AABBXXXX',
  `applicant_school` varchar(8) NOT NULL,
  `applicant_name` varchar(50) NOT NULL,
  `applicant_gender` tinyint(1) NOT NULL,
  `applicant_religion` tinyint(2) NOT NULL,
  `applicant_blood_group` int(11) DEFAULT NULL,
  `applicant_birthplace` varchar(50) NOT NULL,
  `applicant_birthdate` datetime NOT NULL,
  `applicant_height` float DEFAULT NULL,
  `applicant_weight` float DEFAULT NULL,
  `applicant_disease` int(11) DEFAULT NULL,
  `applicant_period` tinyint(4) NOT NULL,
  `applicant_entry` datetime NOT NULL,
  `applicant_entry_update` datetime NOT NULL,
  PRIMARY KEY (`applicant_id`),
  KEY `ppdb_applicant_profile_fk1` (`applicant_school`),
  KEY `ppdb_applicant_profile_fk2` (`applicant_gender`),
  KEY `ppdb_applicant_profile_fk3` (`applicant_religion`),
  KEY `ppdb_applicant_profile_fk4` (`applicant_blood_group`),
  KEY `ppdb_applicant_profile_fk5` (`applicant_disease`),
  KEY `ppdb_applicant_profile_fk6` (`applicant_period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_school_profile`
--

CREATE TABLE IF NOT EXISTS `ppdb_school_profile` (
  `school_id` varchar(8) NOT NULL,
  `school_nss` varchar(12) DEFAULT NULL,
  `school_name` varchar(100) NOT NULL,
  `school_address` varchar(250) NOT NULL,
  `school_rt` varchar(5) DEFAULT NULL,
  `school_rw` varchar(5) DEFAULT NULL,
  `school_village` varchar(50) DEFAULT NULL,
  `school_subdistric` varchar(50) DEFAULT NULL,
  `school_distric` varchar(50) DEFAULT NULL,
  `school_province` varchar(50) DEFAULT NULL,
  `school_zipcode` varchar(5) DEFAULT NULL,
  `school_phone` varchar(12) DEFAULT NULL,
  `school_entry` datetime NOT NULL,
  `school_entry_update` datetime NOT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ppdb_school_profile`
--

INSERT INTO `ppdb_school_profile` (`school_id`, `school_nss`, `school_name`, `school_address`, `school_rt`, `school_rw`, `school_village`, `school_subdistric`, `school_distric`, `school_province`, `school_zipcode`, `school_phone`, `school_entry`, `school_entry_update`) VALUES
('12040001', '72144524', 'SD Negeri Sumbersari', 'Kp. Jawura', NULL, NULL, 'Sumbersari', 'Pagaden', 'Subang', NULL, '41252', NULL, '2013-04-07 10:48:11', '2013-04-08 11:02:54'),
('13040001', '101136003005', 'hasewelehj', 'f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-04-08 11:18:23', '2013-04-08 11:20:09');

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_school_score_un`
--

CREATE TABLE IF NOT EXISTS `ppdb_school_score_un` (
  `score_un_id` varchar(6) NOT NULL,
  `score_un_school` varchar(8) DEFAULT NULL,
  `score_un_subject` int(11) DEFAULT NULL,
  `score_un_period` tinyint(4) DEFAULT NULL,
  `score_un_min` int(11) NOT NULL,
  `score_un_max` int(11) NOT NULL,
  `score_un_avg` float NOT NULL,
  `score_un_entry` datetime NOT NULL,
  `score_un_entry_update` datetime NOT NULL,
  PRIMARY KEY (`score_un_id`),
  KEY `ppdb_school_score_un_fk1` (`score_un_school`),
  KEY `ppdb_school_score_un_fk2` (`score_un_subject`),
  KEY `ppdb_school_score_un_fk3` (`score_un_period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_school_student`
--

CREATE TABLE IF NOT EXISTS `ppdb_school_student` (
  `student_id` varchar(6) NOT NULL,
  `student_school` varchar(8) NOT NULL,
  `student_level` enum('I','II','III','IV','V','VI') NOT NULL,
  `student_classgroup_total` int(11) NOT NULL,
  `student_total` int(11) NOT NULL,
  `student_description` varchar(250) DEFAULT NULL,
  `student_entry` datetime NOT NULL,
  `student_entry_update` datetime NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `ppdb_school_student_fk1` (`student_school`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_school_teacher`
--

CREATE TABLE IF NOT EXISTS `ppdb_school_teacher` (
  `teacher_id` varchar(4) NOT NULL,
  `teacher_period` tinyint(4) NOT NULL,
  `teacher_school` varchar(8) NOT NULL,
  `teacher_education` tinyint(4) NOT NULL,
  `teacher_class` int(11) DEFAULT NULL,
  `teacher_subject` int(11) DEFAULT NULL,
  `teacher_entry` datetime NOT NULL,
  `teacher_entry_update` datetime NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `ppdb_school_teacher_fk1` (`teacher_school`),
  KEY `ppdb_school_teacher_fk2` (`teacher_period`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ppdb_subject`
--

CREATE TABLE IF NOT EXISTS `ppdb_subject` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(50) NOT NULL,
  `subject_entry` datetime NOT NULL,
  `subject_entry_update` datetime NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `public_blood_group`
--

CREATE TABLE IF NOT EXISTS `public_blood_group` (
  `blood_id` int(11) NOT NULL,
  `blood_name` varchar(20) NOT NULL,
  `blood_entry` datetime NOT NULL,
  `blood_entry_update` datetime NOT NULL,
  PRIMARY KEY (`blood_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_blood_group`
--

INSERT INTO `public_blood_group` (`blood_id`, `blood_name`, `blood_entry`, `blood_entry_update`) VALUES
(1, 'A', '2013-04-05 11:03:40', '2013-04-05 11:03:44'),
(2, 'B', '2013-04-05 11:03:50', '2013-04-05 11:03:52'),
(3, 'O', '2013-04-05 11:38:22', '2013-04-05 11:38:24'),
(4, 'AB', '2013-04-05 11:38:32', '2013-04-05 11:38:34');

-- --------------------------------------------------------

--
-- Table structure for table `public_disease`
--

CREATE TABLE IF NOT EXISTS `public_disease` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(30) NOT NULL,
  `disease_entry` datetime NOT NULL,
  `disease_entry_update` datetime NOT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `public_education`
--

CREATE TABLE IF NOT EXISTS `public_education` (
  `education_id` tinyint(4) NOT NULL,
  `educaition_title` varchar(20) NOT NULL,
  `education_entry` datetime NOT NULL,
  `education_entry_update` datetime NOT NULL,
  PRIMARY KEY (`education_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_education`
--

INSERT INTO `public_education` (`education_id`, `educaition_title`, `education_entry`, `education_entry_update`) VALUES
(-1, 'Tidak Sekolah', '2013-04-05 10:55:17', '2013-04-05 10:55:20'),
(1, 'TK / PAUD', '2012-11-10 08:55:11', '2012-11-10 08:55:16'),
(2, 'SD / Sederajat', '2012-11-10 08:55:42', '2012-11-10 08:55:45'),
(3, 'SMP / Sederajat', '2012-11-10 08:56:05', '2012-11-10 08:56:07'),
(4, 'SMA / Sederajat', '2012-11-10 08:56:18', '2012-11-10 08:56:20'),
(5, 'D1', '2012-11-10 08:56:39', '2012-11-10 08:56:42'),
(6, 'D2', '2012-11-10 08:57:02', '2012-11-10 08:57:04'),
(7, 'D3', '2012-11-10 08:57:12', '2012-11-10 08:57:15'),
(8, 'D4/S1', '2012-11-10 08:57:36', '2012-11-10 08:57:38'),
(9, 'S2', '2012-11-10 08:57:45', '2012-11-10 08:57:52'),
(10, 'S3', '2012-11-10 08:58:05', '2012-11-10 08:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `public_gender`
--

CREATE TABLE IF NOT EXISTS `public_gender` (
  `gender_id` tinyint(1) NOT NULL,
  `gender_title` varchar(20) NOT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_gender`
--

INSERT INTO `public_gender` (`gender_id`, `gender_title`) VALUES
(1, 'Laki - Laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Table structure for table `public_religion`
--

CREATE TABLE IF NOT EXISTS `public_religion` (
  `religion_id` tinyint(2) NOT NULL,
  `religion_name` varchar(30) NOT NULL,
  `religion_isother` tinyint(1) NOT NULL,
  `religion_entry` datetime NOT NULL,
  `religion_entry_update` datetime NOT NULL,
  PRIMARY KEY (`religion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `public_religion`
--

INSERT INTO `public_religion` (`religion_id`, `religion_name`, `religion_isother`, `religion_entry`, `religion_entry_update`) VALUES
(-1, 'Lainnya', 1, '2012-11-10 08:23:12', '2012-11-10 08:23:25'),
(1, 'Islam', 0, '2012-11-10 08:22:47', '2012-11-10 08:22:50'),
(2, 'Kristen / Protestan', 0, '2012-11-10 08:22:53', '2012-11-10 08:22:56'),
(3, 'Katholik', 0, '2012-11-10 08:23:00', '2012-11-10 08:23:15'),
(4, 'Hindu', 0, '2012-11-10 08:23:03', '2012-11-10 08:23:18'),
(5, 'Budha', 0, '2012-11-10 08:23:06', '2012-11-10 08:23:20'),
(6, 'Khong Hu Chu', 0, '2012-11-10 08:23:09', '2012-11-10 08:23:22');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ppdb_appilicant_family`
--
ALTER TABLE `ppdb_appilicant_family`
  ADD CONSTRAINT `ppdb_applicant_family_fk1` FOREIGN KEY (`family_applicant`) REFERENCES `ppdb_applicant_profile` (`applicant_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_family_fk2` FOREIGN KEY (`family_lasteducation`) REFERENCES `public_education` (`education_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ppdb_applicant_profile`
--
ALTER TABLE `ppdb_applicant_profile`
  ADD CONSTRAINT `ppdb_applicant_profile_fk1` FOREIGN KEY (`applicant_school`) REFERENCES `ppdb_school_profile` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_profile_fk2` FOREIGN KEY (`applicant_gender`) REFERENCES `public_gender` (`gender_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_profile_fk3` FOREIGN KEY (`applicant_religion`) REFERENCES `public_religion` (`religion_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_profile_fk4` FOREIGN KEY (`applicant_blood_group`) REFERENCES `public_blood_group` (`blood_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_profile_fk5` FOREIGN KEY (`applicant_disease`) REFERENCES `public_disease` (`disease_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_applicant_profile_fk6` FOREIGN KEY (`applicant_period`) REFERENCES `academic_period` (`period_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ppdb_school_score_un`
--
ALTER TABLE `ppdb_school_score_un`
  ADD CONSTRAINT `ppdb_school_score_un_fk1` FOREIGN KEY (`score_un_school`) REFERENCES `ppdb_school_profile` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_school_score_un_fk2` FOREIGN KEY (`score_un_subject`) REFERENCES `ppdb_subject` (`subject_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_school_score_un_fk3` FOREIGN KEY (`score_un_period`) REFERENCES `academic_period` (`period_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ppdb_school_student`
--
ALTER TABLE `ppdb_school_student`
  ADD CONSTRAINT `ppdb_school_student_fk1` FOREIGN KEY (`student_school`) REFERENCES `ppdb_school_profile` (`school_id`) ON UPDATE CASCADE;

--
-- Constraints for table `ppdb_school_teacher`
--
ALTER TABLE `ppdb_school_teacher`
  ADD CONSTRAINT `ppdb_school_teacher_fk1` FOREIGN KEY (`teacher_school`) REFERENCES `ppdb_school_profile` (`school_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ppdb_school_teacher_fk2` FOREIGN KEY (`teacher_period`) REFERENCES `academic_period` (`period_id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
