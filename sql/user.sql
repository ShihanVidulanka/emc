-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2021 at 11:26 AM
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
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `type` varchar(8) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `index_no` varchar(8) NOT NULL,
  `password` varchar(40) NOT NULL,
  `gender` text NOT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `about_me` text DEFAULT NULL,
  `last_login` datetime NOT NULL,
  `is_deleted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `type`, `first_name`, `last_name`, `email`, `index_no`, `password`, `gender`, `birthday`, `address`, `about_me`, `last_login`, `is_deleted`) VALUES
(1, 'Admin', 'admin', 'admin', 'admin@emc.lk', '', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '2021-03-21 15:54:58', 0),
(2, 'Lecturer', 'Gihan', 'Perera', 'gihan@emc.lk', 'L0000001', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(3, 'Lecturer', 'Dahami', 'gamage', 'dahami@emc.lk', 'L0000002', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(4, 'Lecturer', 'Asanka', 'Withana', 'asanka@emc.lk', 'L0000003', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '2021-03-21 15:20:15', 0),
(5, 'Student', 'Sathira', 'Liyanapathirana', 'sathira@emc.lk', 'S0000001', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '2021-03-21 15:21:24', 0),
(6, 'Student', 'Yasith', 'Heshan', 'yasith@emc.lk', 'S0000002', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '2021-03-21 15:39:47', 0),
(7, 'Student', 'Harshani', 'Bandara', 'harshani@emc.lk', 'S0000003', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(8, 'notAllow', 'deshan', 'silva', 'deshan@emc.lk', 'L0000004', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(9, 'notAllow', 'Kasun', 'Jayasinghe', 'kasun@emc.lk', 'L0000005', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
