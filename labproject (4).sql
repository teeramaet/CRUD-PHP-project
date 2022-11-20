-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2022 at 11:26 PM
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
  `Email` varchar(50) NOT NULL,
  `image_URL` varchar(600) NOT NULL,
  `Region` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `advisor`
--

INSERT INTO `advisor` (`ID`, `Name`, `Phone`, `Email`, `image_URL`, `Region`, `password`) VALUES
(0, 'Arthur Holms', '0812223333', 'AH@mail.com', 'https://images.unsplash.com/photo-1664575600796-ffa828c5cb6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8MXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 'Europe', 'AH'),
(1, 'Ben Simsons', '0812223334', 'BS@mail.com', 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 'Oceania', 'BS'),
(2, 'Wong Lee', '0812223335', 'WL@mail.com', 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 'North America', 'WL'),
(3, 'Decap Prio', '0812223336', 'DP@mail.com', 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 'ASIA', 'DP'),
(4, 'Rajeet Ishme', '0812223337', 'RI@mail.com', 'https://images.unsplash.com/photo-1657214059388-a35554015a42?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxzZWFyY2h8OHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 'South America', 'RI');

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
  `Program_ID` int(11) NOT NULL,
  `Approveby` bigint(20) NOT NULL,
  `essay` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `progress`
--

INSERT INTO `progress` (`Status`, `Priority`, `ID`, `Student_ID`, `university_ID`, `Program_ID`, `Approveby`, `essay`) VALUES
('0', '3', 4, 6322771294, 1, 4, 0, 'lol'),
('1', '1', 15, 2222, 1, 4, 0, ''),
('0', '5', 65, 6322771294, 3, 6, 0, 'ha');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Student_ID` bigint(10) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `GPA` double(5,2) NOT NULL,
  `EngScore` double(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`Student_ID`, `Name`, `Password`, `GPA`, `EngScore`) VALUES
(1234, 'success', 'wwww', 3.00, 3.00),
(2222, 'qqqq', '1111', 0.00, 0.00),
(2345, 'test2', '1111', 0.00, 0.00),
(5555, 'wwww', '5555', 0.00, 0.00),
(6322771294, 'sake', '1234', 4.00, 9.00);

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
  `Mangaeby` bigint(20) NOT NULL,
  `image_URL` varchar(600) NOT NULL,
  `Info` varchar(1200) NOT NULL,
  `image_URL1` varchar(600) NOT NULL,
  `image_URL2` varchar(600) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `university`
--

INSERT INTO `university` (`ID`, `University_name`, `Addr`, `zip`, `Country`, `Mangaeby`, `image_URL`, `Info`, `image_URL1`, `image_URL2`) VALUES
(0, 'University of Detroit Mercy', '4001 W McNichols Rd, Detroit', '48221', 'United States', 1, 'https://www.udmercy.edu/admission/images/fountain-fall-students.jpg', 'University of Detroit Mercy\'s origin dates back to 1877 with the founding of \"Detroit College,\" near Detroit\'s downtown, by the Society of Jesus, under the leadership of John Baptist Miège, S.J. The college became the University of Detroit in 1911, and in 1927 Fr. John P. McNichols, S.J., the then president of the University of Detroit, established a second campus that ended up being known by its Spanish architecture and large elm trees. In 1941, the Sisters of Mercy opened Mercy College of Detroit. Both schools saw a great deal of success and developed many distinguished alumni.\r\nNotable alumni include political and business leaders such as U.S. senator Gary Peters and former Ford CEO Jim Padilla, both from the University of Detroit. In 1990, despite some opposition, these two institutions consolidated to become \"University of Detroit Mercy.\" Since the merger, the university has produced the likes of actor Keegan-Michael Key and news anchor Allison Payne.\r\nThe school appointed Donald Taylor as its 26th president in July 2022.', 'https://upload.wikimedia.org/wikipedia/en/thumb/8/8d/University_of_Detroit_Mercy_seal.svg/1200px-University_of_Detroit_Mercy_seal.svg.png', 'https://images.squarespace-cdn.com/content/v1/55d1dd88e4b0dee65a6594f0/1585146156631-JWDQSWTR58I0GPGI3BSJ/03-20_DetroitMercy.jpg?format=1000w'),
(1, 'Duke University', 'Durham', 'NC 27708', 'United States', 1, 'https://cdn.britannica.com/84/116684-050-19ADAA60/Duke-University-Chapel-Durham-NC.jpg', 'Duke University is a private research university in Durham, North Carolina. Founded by Methodists and Quakers in the present-day city of Trinity in 1838, the school moved to Durham in 1892. In 1924, tobacco and electric power industrialist James Buchanan Duke established The Duke Endowment and the institution changed its name to honor his deceased father, Washington Duke. The campus spans over 8,600 acres (3,500 hectares) on three contiguous sub-campuses in Durham, and a marine lab in Beaufort. The West Campus—designed largely by architect Julian Abele, an African American architect who graduated first in his class at the University of Pennsylvania School of Design—incorporates Gothic architecture with the 210-foot (64-meter) Duke Chapel at the campus\' center and highest point of elevation, is adjacent to the Medical Center. East Campus, 1.5 miles (2.4 kilometers) away, home to all first-years, contains Georgian-style architecture. The university administers two concurrent schools in Asia, Duke-NUS Medical School in Singapore (established in 2005) and Duke Kunshan University in Kunshan, China (established in 2013).', 'https://upload.wikimedia.org/wikipedia/en/thumb/c/ce/Duke_University_seal.svg/800px-Duke_University_seal.svg.png', 'https://today.duke.edu/sites/default/files/20200721_westcampus004.png'),
(2, 'Oxford University', 'Oxford', 'OX1 2JD', 'United Kingdom', 0, 'https://cdn.britannica.com/03/117103-050-F4C2FC83/view-University-of-Oxford-England-Oxfordshire.jpg', 'The University of Oxford is a collegiate research university in Oxford, England. There is evidence of teaching as early as 1096, making it the oldest university in the English-speaking world and the world\'s second-oldest university in continuous operation. It grew rapidly from 1167 when Henry II banned English students from attending the University of Paris. After disputes between students and Oxford townsfolk in 1209, some academics fled north-east to Cambridge where they established what became the University of Cambridge. The two English ancient universitiesshare many common features, are jointly referred to as Oxbridge. Both are ranked among the most prestigious universities in the world.\r\nThe university is made up of thirty-nine semi-autonomous constituent colleges, six permanent private halls, and a range of academic departments which are organised into four divisions. All the colleges are self-governing institutions within the university, each controlling its own membership and with its own internal structure and activities. All students are members of a college.', 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Coat_of_arms_of_the_University_of_Oxford.svg/270px-Coat_of_arms_of_the_University_of_Oxford.svg.png', 'https://localhistories.org/wp-content/uploads/2022/03/image-100.png'),
(3, 'Indian Institute of Science', 'CV Raman Rd, Bengaluru, Karnataka', '560012', 'India', 4, 'https://media-exp1.licdn.com/dms/image/C4D1BAQH0_UeKoteJyA/company-background_10000/0/1519799836128?e=1669309200&v=beta&t=m9Q9dL9mGFscSj7-J4Q7Eivq0rImMp6C0Z7iRwPUDuA', 'The Indian Institute of Science (IISc) is a public, deemed, research university for higher education and research in science, engineering, design, and management. It is located in Bengaluru, in the Indian state of Karnataka. The institute was established in 1909 with active support from Jamsetji Tata and thus is also locally known as the \"Tata Institute\". It is ranked among the most prestigious academic institutions in India[6] and has the highest citation per faculty among all the universities in the world. It was granted the deemed to be university status in 1958 and the Institute of Eminence status in 2018.', 'https://upload.wikimedia.org/wikipedia/en/thumb/3/3b/Indian_Institute_of_Science_2019_logo.svg/440px-Indian_Institute_of_Science_2019_logo.svg.png', 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/IISC_Bangalore_01.jpg/440px-IISC_Bangalore_01.jpg'),
(4, 'Shanghai la university', '8,pk road, lala, shanghai', '51523', 'China', 2, 'https://studyinchinas.com/wp-content/uploads/2018/08/Shanghai-University-e1558080809601.jpg', 'Shanghai University, commonly referred to as SHU, or colloquially Shangda (Chinese: 上大; pinyin: Shàngdà), is a public research university located in Shanghai. The 555-acre main Baoshan campus is situated in the north of Shanghai, and there are two other campuses in Jiading and Jing\'an. It is co-funded by Chinese Ministry of Education and Shanghai Municipal Government as part of the Project 211 and the Double First Class University Plan for leading national universities.  Jointly founded by the Nationalists and the Communists in 1922, the original cause for the Shanghai University was to nurture leaders for the Chinese revolution. It contributed a group of influential people to the cause of Chinese liberation and development. The university was discontinued in 1927 as a consequence of the Shanghai Massacre, in which the Nationalists purged all communist-related organizations. In 1983, the Chinese government reopened Shanghai University. And then in 1994, by integrating three other universities, it became the largest higher learning institution run by Shanghai Municipality. ', 'https://upload.wikimedia.org/wikipedia/en/thumb/e/ec/SHU_VI_LOGO.svg/340px-SHU_VI_LOGO.svg.png', 'https://studyinchinas.com/wp-content/uploads/2018/08/shu2-e1560753287300.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advisor`
--
ALTER TABLE `advisor`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `program`
--
ALTER TABLE `program`
  ADD PRIMARY KEY (`Program_ID`),
  ADD KEY `universityID` (`universityID`);

--
-- Indexes for table `progress`
--
ALTER TABLE `progress`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `progress_ibfk_1` (`Student_ID`),
  ADD KEY `Program_ID` (`Program_ID`),
  ADD KEY `university_ID` (`university_ID`),
  ADD KEY `Approveby` (`Approveby`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `progress`
--
ALTER TABLE `progress`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `program`
--
ALTER TABLE `program`
  ADD CONSTRAINT `program_ibfk_1` FOREIGN KEY (`universityID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `progress`
--
ALTER TABLE `progress`
  ADD CONSTRAINT `progress_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_ibfk_2` FOREIGN KEY (`Program_ID`) REFERENCES `program` (`Program_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_ibfk_3` FOREIGN KEY (`university_ID`) REFERENCES `university` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `progress_ibfk_4` FOREIGN KEY (`Approveby`) REFERENCES `advisor` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `university`
--
ALTER TABLE `university`
  ADD CONSTRAINT `university_ibfk_1` FOREIGN KEY (`Mangaeby`) REFERENCES `advisor` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
