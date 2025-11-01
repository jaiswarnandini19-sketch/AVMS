-- Create the database
CREATE DATABASE IF NOT EXISTS `avmsdb`;
USE `avmsdb`;

-- Set environment
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;

-- Table: tbladmin
CREATE TABLE `tbladmin` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `AdminName` varchar(45) DEFAULT NULL,
  `UserName` char(45) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Email` varchar(120) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Role` VARCHAR(50) NOT NULL DEFAULT 'Resident',
  `AdminRegdate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Sample users with roles
INSERT INTO `tbladmin` (`AdminName`, `UserName`, `MobileNumber`, `Email`, `Password`, `Role`) VALUES
('Resident User', 'resident1', 9876543210, 'resident1@example.com', MD5('residentpass'), 'Resident'),
('Guard User', 'guard1', 9876543211, 'guard1@example.com', MD5('guardpass'), 'Security Guard'),
('Admin User', 'admin1', 9876543212, 'admin1@example.com', MD5('adminpass'), 'Society Admin'),
('Admin user', 'admin', 7898799797, 'admin@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 'Society Admin');

-- Table: tblcategory
CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(120) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Sample categories
INSERT INTO `tblcategory` (`categoryName`) VALUES
('Maid'), ('NewsPaper'), ('Cook'), ('Milkman'), ('Driver'),
('Gardener'), ('Car Cleaner'), ('Other'), ('Guest');

-- Table: tblvisitor
CREATE TABLE `tblvisitor` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(120) DEFAULT NULL,
  `VisitorName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Apartment` varchar(120) NOT NULL,
  `Floor` varchar(120) NOT NULL,
  `WhomtoMeet` varchar(120) DEFAULT NULL,
  `ReasontoMeet` varchar(120) DEFAULT NULL,
  `EnterDate` timestamp NULL DEFAULT current_timestamp(),
  `remark` varchar(255) DEFAULT NULL,
  `outtime` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Sample visitors
INSERT INTO `tblvisitor` (`categoryName`, `VisitorName`, `MobileNumber`, `Address`, `Apartment`, `Floor`, `WhomtoMeet`, `ReasontoMeet`, `remark`, `outtime`) VALUES
('Guest', 'Amit Kumar', 1212121233, 'H 1223 Sector 15 noida UP', 'Q707', '7', 'Anuj Kumar', 'Personal', 'NA', '2022-12-04 18:36:04'),
('Milkman', 'Sunny', 1425363625, 'NA', 'H911', '9', 'Amit ', 'Milk Distribution', 'Your Milkman has been out', '2022-12-05 05:49:09'),
('Driver', 'Sukhdev Singh', 1425362514, 'NA', 'T501', '5', 'Amit Kumar', 'Driver', NULL, NULL);

-- Table: tblvisitorpass
CREATE TABLE `tblvisitorpass` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `passnumber` bigint(20) DEFAULT NULL,
  `categoryName` varchar(120) DEFAULT NULL,
  `VisitorName` varchar(120) DEFAULT NULL,
  `MobileNumber` bigint(11) DEFAULT NULL,
  `Address` varchar(250) DEFAULT NULL,
  `Apartment` varchar(120) NOT NULL,
  `Floor` varchar(120) NOT NULL,
  `passDetails` varchar(120) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `fromDate` date DEFAULT NULL,
  `toDate` date NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Sample visitor passes
INSERT INTO `tblvisitorpass` (`passnumber`, `categoryName`, `VisitorName`, `MobileNumber`, `Address`, `Apartment`, `Floor`, `passDetails`, `fromDate`, `toDate`) VALUES
(94395973, 'Car Cleaner', 'Amit', 1414253625, 'NA', 'A512', '5', 'For Car Cleaning', '2022-12-06', '2023-01-31'),
(94395972, 'Maid', 'Savita', 1233211230, 'NA', 'Q707', '7', 'Maid', '2022-12-10', '2023-03-10');

COMMIT;