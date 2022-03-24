-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2021 at 11:27 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `no` int(11) NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `index_no` varchar(8) DEFAULT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `ap_status` tinyint(1) DEFAULT NULL,
  `sender_is_read` tinyint(1) NOT NULL,
  `receiver_is_read` tinyint(1) NOT NULL,
  `file_location` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`no`, `full_name`, `index_no`, `sender`, `receiver`, `type`, `content`, `date_time`, `ap_status`, `sender_is_read`, `receiver_is_read`, `file_location`) VALUES
(1, '{$first_name} {$last_name}', 'L0000002', 'dahami@emc.lk', 'admin@emc.lk', 4, 'Please can you give the permission to create a Lecture account.<br>thank you.', '2021-03-21 13:41:50', NULL, 1, 0, NULL),
(2, 'Sathira Liyanapathirana', 'S0000001', 'sathira@emc.lk', 'asanka@emc.lk', 1, '<br><br><p><span>On: 2021/03/21   </span><span> At: 9:19 am </span></p><p><b>Mr. Sathira Liyanapathirana</b></p><br>late add drop for modulw M00001<br><br><p><span>On: 2021/03/21   </span><span> At: 10:13 am </span></p><p><b>Mr. Asanka Withana</b></p><br>please send photocopy of ID and passbook<br><br><p><span>On: 2021/03/21   </span><span> At: 10:53 am </span></p><p><b>Mr. Sathira Liyanapathirana</b></p><br>thank you sir. Here I uploaded files.<br><br>', '2021-03-21 15:23:18', 0, 0, 1, '../submissions/1~Screenshot (269).png,../submissions/2~Screenshot (270).png'),
(3, 'Sathira Liyanapathirana', 'S000001', 'sathira@emc.lk', 'asanka@emc.lk', 2, '<p><span>On: 2021/03/21   </span><span> At: 9:22 am </span></p><p><b>Mr. Sathira Liyanapathirana</b></p><br>Extending Assignment submissions for module M00001<br><br>', '2021-03-21 13:52:03', NULL, 1, 0, ''),
(4, 'Sathira Liyanapathirana', 'S000001', 'sathira@emc.lk', 'gihan@emc.lk', 3, '<p><span>On: 2021/03/21   </span><span> At: 9:24 am </span></p><p><b>Mr. Sathira Liyanapathirana</b></p><br>Sit for repeat exam module M00002<br><br>', '2021-03-21 13:54:14', NULL, 1, 0, ''),
(5, '{$first_name} {$last_name}', 'L000004', 'deshan@emc.lk', 'admin@emc.lk', 4, 'Please can you give the permission to create a Lecture account.<br>thank you.', '2021-03-21 14:10:04', NULL, 1, 0, NULL),
(6, 'Sathira Liyanapathirana', 'S0000001', 'sathira@emc.lk', 'dahami@emc.lk', 4, '<p><span>On: 2021/03/21   </span><span> At: 11:02 am </span></p><p><b>Mr. Sathira Liyanapathirana</b></p><br>madam please can you send me some tutorials of module M00002,on OOP principles.<br><br>', '2021-03-21 15:32:18', NULL, 1, 0, ''),
(7, 'Yasith Heshan', 'S0000002', 'yasith@emc.lk', 'asanka@emc.lk', 3, '<p><span>On: 2021/03/21   </span><span> At: 11:13 am </span></p><p><b>Mr. Yasith Heshan</b></p><br>I am a 18 batch student in your department. I want to sit to the exam of module M00001.<br><br>', '2021-03-21 15:43:49', NULL, 1, 0, ''),
(8, 'Yasith Heshan', 'S0000002', 'yasith@emc.lk', 'asanka@emc.lk', 4, '<p><span>On: 2021/03/21   </span><span> At: 11:17 am </span></p><p><b>Mr. Yasith Heshan</b></p><br>Please can you send me the exam timetable of module M00001.<br><br>', '2021-03-21 15:47:18', NULL, 1, 0, ''),
(9, 'Yasith Heshan', 'S0000002', 'yasith@emc.lk', 'admin@emc.lk', 4, '<p><span>On: 2021/03/21   </span><span> At: 11:20 am </span></p><p><b>Mr. Yasith Heshan</b></p><br>This is my  personal emal : yasithheshan@gmail.com <br>sending massages is not functioning can you check that .please pay your attention.<br>', '2021-03-21 15:50:03', NULL, 1, 0, NULL),
(10, '{$first_name} {$last_name}', 'L0000005', 'kasun@emc.lk', 'admin@emc.lk', 4, 'Please can you give the permission to create a Lecture account.<br>thank you.', '2021-03-21 15:54:22', NULL, 1, 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
