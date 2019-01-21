-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 16, 2018 at 01:32 PM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codoherty18`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assignment`
--

CREATE TABLE IF NOT EXISTS `Assignment` (
  `ProjectID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Contract`
--

CREATE TABLE IF NOT EXISTS `Contract` (
  `ContractID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Start` date NOT NULL,
  `DueFinish` date DEFAULT NULL,
  `ActualFinish` date DEFAULT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `EmployeeID` bigint(20) NOT NULL,
  `Title` varchar(32) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Joined` date DEFAULT NULL,
  `Left` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL DEFAULT '1',
  `Phone` varchar(32) NOT NULL,
  `GradeID` int(11) NOT NULL,
  `Manager` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeSkill`
--

CREATE TABLE IF NOT EXISTS `EmployeeSkill` (
  `EmployeeID` bigint(20) NOT NULL,
  `SkillID` bigint(20) NOT NULL,
  `DateAchieved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE IF NOT EXISTS `Equipment` (
  `EquipmentID` bigint(20) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Make` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `OperationNotes` text,
  `Damaged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EquipmentLoan`
--

CREATE TABLE IF NOT EXISTS `EquipmentLoan` (
  `EmployeeID` bigint(20) NOT NULL,
  `EquipmentID` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL,
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Expense`
--

CREATE TABLE IF NOT EXISTS `Expense` (
  `ExpenseID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `ProjectID` bigint(20) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FileItem`
--

CREATE TABLE IF NOT EXISTS `FileItem` (
  `ItemID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Location` varchar(255) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Grade`
--

CREATE TABLE IF NOT EXISTS `Grade` (
  `GradeID` int(11) NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Code` varchar(16) NOT NULL,
  `SpineMin` int(11) NOT NULL DEFAULT '1',
  `SpineMax` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Payslip`
--

CREATE TABLE IF NOT EXISTS `Payslip` (
  `PayslipID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `Taxable` double NOT NULL DEFAULT '0',
  `NonTaxable` double NOT NULL DEFAULT '0',
  `IncomeTax` double NOT NULL DEFAULT '0',
  `NationalInsurance` double NOT NULL DEFAULT '0',
  `NetPay` double NOT NULL DEFAULT '0',
  `Payday` date NOT NULL,
  `TransferDay` date NOT NULL,
  `TransferRef` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE IF NOT EXISTS `Project` (
  `ProjectID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Notes` text,
  `Internal` tinyint(1) NOT NULL DEFAULT '0',
  `Sensitive` tinyint(1) NOT NULL DEFAULT '0',
  `Started` date NOT NULL,
  `Ended` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Skill`
--

CREATE TABLE IF NOT EXISTS `Skill` (
  `SkillID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignment`
--
ALTER TABLE `Assignment`
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Contract`
--
ALTER TABLE `Contract`
  ADD PRIMARY KEY (`ContractID`),
  ADD UNIQUE KEY `ContractID_2` (`ContractID`),
  ADD KEY `ContractID` (`ContractID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `EmployeeID_2` (`EmployeeID`),
  ADD UNIQUE KEY `Email_2` (`Email`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `Email` (`Email`),
  ADD KEY `FirstName` (`FirstName`),
  ADD KEY `LastName` (`LastName`),
  ADD KEY `Current` (`Current`),
  ADD KEY `Manager` (`Manager`),
  ADD KEY `GradeID` (`GradeID`);

--
-- Indexes for table `EmployeeSkill`
--
ALTER TABLE `EmployeeSkill`
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `SkillID` (`SkillID`);

--
-- Indexes for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`EquipmentID`),
  ADD UNIQUE KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `EquipmentID_2` (`EquipmentID`),
  ADD KEY `Type` (`Type`),
  ADD KEY `Model` (`Model`),
  ADD KEY `Description` (`Description`),
  ADD KEY `Damaged` (`Damaged`);

--
-- Indexes for table `EquipmentLoan`
--
ALTER TABLE `EquipmentLoan`
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `StartDate` (`StartDate`),
  ADD KEY `Current` (`Current`);

--
-- Indexes for table `Expense`
--
ALTER TABLE `Expense`
  ADD PRIMARY KEY (`ExpenseID`),
  ADD UNIQUE KEY `ExpenseID` (`ExpenseID`),
  ADD KEY `ExpenseID_2` (`ExpenseID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `Description` (`Description`);

--
-- Indexes for table `FileItem`
--
ALTER TABLE `FileItem`
  ADD PRIMARY KEY (`ItemID`),
  ADD KEY `ItemID` (`ItemID`),
  ADD KEY `Title` (`Title`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Grade`
--
ALTER TABLE `Grade`
  ADD PRIMARY KEY (`GradeID`),
  ADD UNIQUE KEY `GradeID` (`GradeID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD KEY `GradeID_2` (`GradeID`),
  ADD KEY `Code_2` (`Code`),
  ADD KEY `GradeID_3` (`GradeID`);

--
-- Indexes for table `Payslip`
--
ALTER TABLE `Payslip`
  ADD PRIMARY KEY (`PayslipID`),
  ADD UNIQUE KEY `PayslipID` (`PayslipID`),
  ADD KEY `PayslipID_2` (`PayslipID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD UNIQUE KEY `ProjectID_2` (`ProjectID`),
  ADD KEY `ProjectID` (`ProjectID`),
  ADD KEY `Title` (`Title`);

--
-- Indexes for table `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`SkillID`),
  ADD UNIQUE KEY `SkillID` (`SkillID`),
  ADD UNIQUE KEY `Title` (`Title`),
  ADD KEY `SkillID_2` (`SkillID`),
  ADD KEY `Title_2` (`Title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contract`
--
ALTER TABLE `Contract`
  MODIFY `ContractID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Equipment`
--
ALTER TABLE `Equipment`
  MODIFY `EquipmentID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Expense`
--
ALTER TABLE `Expense`
  MODIFY `ExpenseID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FileItem`
--
ALTER TABLE `FileItem`
  MODIFY `ItemID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Grade`
--
ALTER TABLE `Grade`
  MODIFY `GradeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Payslip`
--
ALTER TABLE `Payslip`
  MODIFY `PayslipID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ProjectID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Skill`
--
ALTER TABLE `Skill`
  MODIFY `SkillID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assignment`
--
ALTER TABLE `Assignment`
  ADD CONSTRAINT `FK_Assignment2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Assignment` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Contract`
--
ALTER TABLE `Contract`
  ADD CONSTRAINT `FK_Contract` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `FK_Emp1` FOREIGN KEY (`GradeID`) REFERENCES `Grade` (`GradeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Emp2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EmployeeSkill`
--
ALTER TABLE `EmployeeSkill`
  ADD CONSTRAINT `FK_EmpSkill2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EmpSkill` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`SkillID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `EquipmentLoan`
--
ALTER TABLE `EquipmentLoan`
  ADD CONSTRAINT `FK_EqL2` FOREIGN KEY (`EquipmentID`) REFERENCES `Equipment` (`EquipmentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_EqL1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Expense`
--
ALTER TABLE `Expense`
  ADD CONSTRAINT `FK_Exp2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Exp1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `FileItem`
--
ALTER TABLE `FileItem`
  ADD CONSTRAINT `FK_Emp` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Payslip`
--
ALTER TABLE `Payslip`
  ADD CONSTRAINT `FK_PayS` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
