-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2022 at 09:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `advisor`
--

CREATE TABLE `advisor` (
  `ID` bigint(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`ID`, `Name`, `Phone`, `Email`) VALUES
(0, 'Arthur Holms', '0812223333', 'AH@mail.com'),
(1, 'Ben Simsons', '0812223334', 'BS@mail.com'),
(2, 'Wong Lee', '0812223335', 'WL@mail.com'),
(3, 'Decap Prio', '0812223336', 'DP@mail.com'),
(4, 'Rajeet Ishme', '0812223337', 'RI@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `approvedprocess`
--

CREATE TABLE `approvedprocess` (
  `pro_ID` int(11) NOT NULL,
  `approveby` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

CREATE TABLE `program` (
  `limits` int(11) DEFAULT NULL,
  `universityID` int(11) DEFAULT NULL,
  `GPA_Requirement` double(11,2) DEFAULT NULL,
  `Engscore_Requirement` double(11,2) DEFAULT NULL,
  `Program_ID` int(11) NOT NULL,
  `ProgramName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`limits`, `universityID`, `GPA_Requirement`, `Engscore_Requirement`, `Program_ID`, `ProgramName`) VALUES
(10, 0, 3.00, 7.00, 1, 'America-Thailand Exchange'),
(5, 1, 3.50, 6.00, 2, 'AT nation'),
(12, 3, 2.75, 5.00, 3, 'India v1'),
(2, 2, 3.70, 7.50, 4, 'Advance Ex.'),
(5, 4, 3.00, 0.00, 5, 'One china'),
(12, 3, 2.75, 5.00, 6, 'India v2');

-- --------------------------------------------------------

--
-- Table structure for table `progress`
--

CREATE TABLE `progress` (
  `Status` varchar(20) DEFAULT NULL,
  `Priority` varchar(20) DEFAULT NULL,
  `ID` int(11) NOT NULL,
  `Student_ID` bigint(20) NOT NULL,
  `university_ID` int(11) NOT NULL,
  `Program_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` bigint(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DOB` date NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `GPA` int(4) NOT NULL,
  `EngScore` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Username`, `Password`, `Gender`, `Email`, `DOB`, `Phone`, `GPA`, `EngScore`) VALUES
(6322771294, 'sake', 'Zake29', '1234', '', '', '0000-00-00', '', 4, 9);

-- --------------------------------------------------------

--
-- Table structure for table `university`
--

CREATE TABLE `university` (
  `ID` int(11) NOT NULL,
  `University_name` varchar(255) DEFAULT NULL,
  `Addr` varchar(255) DEFAULT NULL,
  `zip` varchar(15) DEFAULT NULL,
  `Country` varchar(15) DEFAULT NULL,
  `Mangaeby` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`ID`, `University_name`, `Addr`, `zip`, `Country`, `Mangaeby`) VALUES
(0, 'University of Detroit Mercy', '4001 W McNichols Rd, Detroit', '48221', 'United States', 1),
(1, 'Duke University', 'Durham', 'NC 27708', 'United States', 1),
(2, 'Oxford University', 'Oxford', 'OX1 2JD', 'United Kingdom', 0),
(3, 'Indian Institute of Science', 'CV Raman Rd, Bengaluru, Karnataka', '560012', 'India', 4),
(4, 'Shanghai la university', '8,pk road, lala, shanghai', '51523', 'China', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `approvedprocess`
--
ALTER TABLE `approvedprocess`
  ADD KEY `approveby` (`approveby`),
  ADD KEY `pro_ID` (`pro_ID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`Program_ID`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `progress_ibfk_1` (`Student_ID`),
  ADD KEY `Program_ID` (`Program_ID`),
  ADD KEY `university_ID` (`university_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_ID`);

--
-- Indexes for table `university`
--
ALTER TABLE `university`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Mangaeby` (`Mangaeby`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approvedprocess`
--
ALTER TABLE `approvedprocess`
  ADD CONSTRAINT `approvedprocess_ibfk_1` FOREIGN KEY (`approveby`) REFERENCES `advisor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `approvedprocess_ibfk_2` FOREIGN KEY (`pro_ID`) REFERENCES `program` (`Program_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`Program_ID`) REFERENCES `program` (`Program_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_ibfk_3` FOREIGN KEY (`university_ID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`Mangaeby`) REFERENCES `advisor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
