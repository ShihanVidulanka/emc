-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2021 at 06:43 PM
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
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

--
-- Dumping data for table `pma__central_columns`
--

INSERT INTO `pma__central_columns` (`db_name`, `col_name`, `col_type`, `col_length`, `col_collation`, `col_isNull`, `col_extra`, `col_default`) VALUES
('userdb', 'email', 'varchar', '100', 'latin1_swedish_ci', 0, ',', ''),
('userdb', 'first_name', 'varchar', '50', 'latin1_swedish_ci', 0, ',', ''),
('userdb', 'gender', 'text', '', 'latin1_swedish_ci', 0, ',', ''),
('userdb', 'id', 'int', '11', '', 0, 'auto_increment,', ''),
('userdb', 'is_deleted', 'tinyint', '1', '', 0, ',', ''),
('userdb', 'last_login', 'datetime', '', '', 0, ',', ''),
('userdb', 'last_name', 'varchar', '100', 'latin1_swedish_ci', 0, ',', ''),
('userdb', 'password', 'varchar', '40', 'latin1_swedish_ci', 0, ',', ''),
('userdb', 'type', 'tinyint', '1', '', 0, ',', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"userdb\",\"table\":\"emails\"},{\"db\":\"userdb\",\"table\":\"user\"},{\"db\":\"userdb\",\"table\":\"acadomicuser\"},{\"db\":\"userdb\",\"table\":\"lecturer\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'userdb', 'emails', '{\"sorted_col\":\"`emails`.`no` ASC\"}', '2021-03-12 17:16:18'),
('root', 'userdb', 'user', '{\"CREATE_TIME\":\"2021-03-07 21:31:24\",\"sorted_col\":\"`user`.`id` ASC\"}', '2021-03-11 11:47:42');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2021-03-12 17:14:48', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `userdb`
--
CREATE DATABASE IF NOT EXISTS `userdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `userdb`;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `no` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `index_no` varchar(8) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `content` text NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `ap_status` tinyint(1) NOT NULL,
  `sender_is_read` tinyint(1) NOT NULL,
  `receiver_is_read` tinyint(1) NOT NULL,
  `file_location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`no`, `full_name`, `index_no`, `sender`, `receiver`, `type`, `content`, `date_time`, `ap_status`, `sender_is_read`, `receiver_is_read`, `file_location`) VALUES
(2, 'janindu ', '1234567H', 'janindu@bestjobslk.com', 'suranga@bestjobslk.com', 1, 'value=\"\"wafsasgSDGSDG D', '2021-03-01 12:15:43', 0, 1, 0, ''),
(3, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'asanka@bestjobslk.com', 0, 'Please can you give the permission to create a Lecture account.<br>thank you.<p><span>On: 2021/03/11   </span><span> At: 8:14 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>iframe.php?no={$no}<br>', '2021-03-12 00:44:31', 0, 0, 1, ''),
(4, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'chamath@bestjobslk.com', 2, 'Please can you give the permission to create a Lecture account.<br>thank you.', '2021-01-19 13:12:29', 0, 1, 0, ''),
(5, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'dahami@bestjobslk.com', 0, 'Please can you give the permission to create a Lecture account.<br>thank you.<p><span>On: 2021/03/11   </span><span> At: 8:23 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:53:48', 0, 0, 1, ''),
(6, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'gihani@bestjobslk.com', 3, 'Please can you give the permission to create a Lecture account.<br>thank you.<p><span>On: 2021/03/11   </span><span> At: 8:24 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:54:50', 0, 0, 1, ''),
(11, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'gihani@bestjobslk.com', 3, '<p>\r\n						<p>On:<span> 2021/03/11 </span><span> At: 1:22 pm.</span></p>\r\n						<p><b>Mrs. Visaka Nanayakkara:</b></p>\r\n						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n						<br>\r\n						<br>\r\n						<p>On:<span>06/01/2021</span><span> At:07:00 a.m.</span></p>\r\n						<p><b>you:</b></p>\r\n						Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\n						tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\n						quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\n						consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\n						cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\n						proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n					</p>', '2021-03-01 13:30:49', 0, 1, 0, ''),
(12, 'janindu', '1234567H', 'janindu@bestjobslk.com', 'chamath@bestjobslk.com', 2, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<p><span>On: 2021/03/11   </span><span> At: 8:24 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:54:56', 0, 0, 1, ''),
(13, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'chamath@bestjobslk.com', 0, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<p><span>On: 2021/03/11   </span><span> At: 8:03 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:33:38', 0, 0, 1, ''),
(14, 'Janindu Gomas', '1234567H', 'suranga@bestjobslk.com', 'chamath@bestjobslk.com', 3, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2020-12-17 22:44:32', 0, 1, 0, ''),
(15, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'chamath@bestjobslk.com', 0, '<p><span>On: \'2021/03/11 \'</span><span> \'3:17 pm\'</span></p><p><b></b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br><br><p><span>On: 2021/03/11   </span><span> At: 7:41 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>reply<br><br>', '2021-03-12 00:11:54', 0, 0, 1, ''),
(16, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'dahami@bestjobslk.com', 2, '<p><span>On: \'2021/03/11 \'</span><span> \'3:26 pm\'</span></p><p><b></b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br><p><span>On: 2021/03/11   </span><span> At: 8:04 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:34:20', 0, 0, 1, ''),
(17, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'dahami@bestjobslk.com', 2, '<p><span>On: \'2021/03/11 \'</span><span> \'3:50 pm\'</span></p><p><b>janindu@bestjobslk.com\'</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br><br><p><span>On: 2021/03/11   </span><span> At: 7:52 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><p><span>On: 2021/03/11   </span><span> At: 8:00 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><p><span>On: 2021/03/11   </span><span> At: 8:01 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:31:00', 0, 0, 1, ''),
(18, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'asanka@bestjobslk.com', 3, '<p><span>On: \'2021/03/11 \' </span><span> At: \'4:03 pm\' </span></p><p><b>\'Mrs.\' \'Janindu Gomas\'</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br><br><p><span>On: 2021/03/11   </span><span> At: 8:08 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:38:01', 0, 0, 1, ''),
(19, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'gihani@bestjobslk.com', 1, '<p><span>On: 2021/03/11   </span><span> At: 7:34 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br><p><span>On: 2021/03/11  </span><span> At: 4:05 pm </span></p><p><b>Mrs. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br><br><br><br><p><span>On: 2021/03/11   </span><span> At: 7:46 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><br><p><span>On: 2021/03/11   </span><span> At: 7:48 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br><p><span>On: 2021/03/11   </span><span> At: 7:50 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 00:20:11', 0, 0, 1, ''),
(20, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'asanka@bestjobslk.com', 1, '<p><span>On: 2021/03/11  </span><span>&emsp At:  4:07 pm </span></p><p><b>Mrs. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n<br><br><p><span>On: 2021/03/11   </span><span> At: 7:41 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>reply<br><br>', '2021-03-12 00:11:05', 0, 0, 1, ''),
(21, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'chamath@bestjobslk.com', 0, '<p><span>On: 2021/03/12   </span><span> At: 12:25 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.<br>', '2021-03-12 16:55:09', 0, 1, 0, ''),
(22, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'Admin@bestjobslk.com', 3, '<p><span>On: 2021/03/12   </span><span> At: 12:27 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>This is my  personal emal : janindugomas@gmail.com <br> This is a stupid mail system.<br>', '2021-03-12 16:57:37', 0, 1, 0, ''),
(23, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'dahami@bestjobslk.com', 0, '<p><span>On: 2021/03/12   </span><span> At: 1:16 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument<br>', '2021-03-12 17:46:14', 0, 1, 0, ''),
(24, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'asanka@bestjobslk.com', 1, '<p><span>On: 2021/03/12   </span><span> At: 1:21 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>The oldest classical Greek and Latin writing had little or no space between words and could be written in boustrophedon (alternating directions). Over time, text direction (left to right) became standardized, and word dividers and terminal punctuation became common. The first way to divide sentences into groups was the original paragraphs, similar to an underscore at the beginning of the new group.[2] The Greek parágraphos evolved into the pilcrow (¶), which in English manuscripts in the Middle Ages can be seen inserted inline between sentences. The hedera leaf (e.g. ☙) has also been used in the same way.\r\n\r\n\r\nIndented paragraphs demonstrated in the US Constitution\r\nIn ancient manuscripts, another means to divide sentences into paragraphs was a line break (newline) followed by an initial at the beginning of the next paragraph. An initial is an oversized capital letter, sometimes outdented beyond the margin of the text. This style can be seen, for example, in the original Old English manuscript of Beowulf. Outdenting is still used in English typography, though not commonly.[3] Modern English typography usually indicates a new paragraph by indenting the first line. This style can be seen in the (handwritten) United States Constitution from 1787. For additional ornamentation, a hedera leaf or other symbol can be added to the inter-paragraph white space, or put in the indentation space.<br>', '2021-03-12 17:51:00', 0, 1, 0, ''),
(25, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'asanka@bestjobslk.com', 1, '<br><br><br><br><br><br><p><span>On: 2021/03/12   </span><span> At: 2:14 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><p><span>On: 2021/03/12   </span><span> At: 2:17 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>jbabdkjfbiabsfbsagdiubasdkjnsdv<br><p><span>On: 2021/03/12   </span><span> At: 2:19 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><p><span>On: 2021/03/12   </span><span> At: 2:19 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><p><span>On: 2021/03/12   </span><span> At: 2:20 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><br><p><span>On: 2021/03/12   </span><span> At: 2:20 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><br><p><span>On: 2021/03/12   </span><span> At: 2:22 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br><br>', '2021-03-12 18:52:18', 0, 0, 1, ''),
(26, 'Janindu Gomas', '1234567H', 'janindu@bestjobslk.com', 'gihani@bestjobslk.com', 2, '<p><span>On: 2021/03/12   </span><span> At: 2:23 pm </span></p><p><b>Mr. Janindu Gomas</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.<br>', '2021-03-12 18:53:05', 0, 1, 0, ''),
(27, 'Anushka Vithana', '1234567B', 'anushka@bestjobslk.com', 'gihani@bestjobslk.com', 3, '<p><span>On: 2021/03/12   </span><span> At: 3:54 pm </span></p><p><b>Mr. Anushka Vithana</b></p><br>A paragraph is a series of related sentences developing a central idea, called the topic. Try to think about paragraphs in terms of thematic unity: a paragraph is a sentence or a group of sentences that supports one central, unified idea. Paragraphs add one idea at a time to your broader argument.\r\n<br><br>', '2021-03-12 20:24:21', 0, 1, 0, '');

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
(1, 'Admin', 'Admin', '', 'Admin@bestjobslk.com', '1234567A', '7f965560c9f2ce126407eda7c7dbbdb75037ef4d', 'Male', NULL, '', '', '2021-03-01 12:15:43', 0),
(2, 'Student', 'Anushka', 'Vithana', 'anushka@bestjobslk.com', '1234567B', 'f2c57870308dc87f432e5912d4de6f8e322721ba', 'Male', '2021-03-10', 'sfx', 'afasfasf', '2021-03-12 20:22:52', 0),
(3, 'Lecturer', 'Asanka', 'Perera', 'asanka@bestjobslk.com', '1234567C', '7f965560c9f2ce126407eda7c7dbbdb75037ef4d', 'Male', NULL, '', '', '2021-03-12 22:47:50', 0),
(4, 'Student', 'Suranga', 'Ranatunga', 'suranga@bestjobslk.com', '1234567D', '7f965560c9f2ce126407eda7c7dbbdb75037ef4d', 'Male', NULL, '', '', '0000-00-00 00:00:00', 0),
(5, 'Student', 'Amal', 'Jayawickrema', 'amal@bestjobslk.com', '1234567E', '7f965560c9f2ce126407eda7c7dbbdb75037ef4d', 'Male', NULL, '', '', '0000-00-00 00:00:00', 0),
(6, 'Student', 'Buddika', 'Hiripitiya', 'buddika@bestjobslk.com', '1234567F', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, '', '', '0000-00-00 00:00:00', 0),
(7, 'Lecturer', 'Dileep', 'Kariyawasam', 'dileep@bestjobslk.com', '1234567G', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', '', '2021-03-07 18:26:51', 0),
(8, 'Student', 'janindu', 'gomas', 'janindu@bestjobslk.com', '1234567H', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', '', '2021-03-12 22:31:18', 0),
(10, 'Student', 'nimesha', 'manori', 'nimeshaAdmin@bestjobslk.com', '1234567I', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, '', '', '0000-00-00 00:00:00', 0),
(12, 'Lecturer', 'gihani', 'perera', 'gihani@bestjobslk.com', '1234567J', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, '', '', '2021-03-12 22:51:45', 0),
(13, 'Lecturer', 'dahami', 'perera', 'dahami@bestjobslk.com', '1234567K', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', '', '2021-03-12 21:46:44', 0),
(15, 'Lecturer', 'chamath', 'gamage', 'chamath@bestjobslk.com', '1234567L', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', '', '0000-00-00 00:00:00', 0),
(16, 'Student', 'mamaa', 'mamama', 'mama@bestjobslk.com', '1234567M', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', NULL, '0000-00-00 00:00:00', 0),
(17, 'notAllow', 'me', 'mama', 'me@bestjobslk.com', '1234567N', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', NULL, '0000-00-00 00:00:00', 0),
(18, 'Student', 'bala', 'mala', 'bala@bestjobslk.com', '1234567O', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, '', NULL, '0000-00-00 00:00:00', 0),
(20, 'notAllow', 'gimhani', 'sasanka', 'gimhani@bestjobslk.com', '1234567P', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Female', NULL, '', NULL, '0000-00-00 00:00:00', 0),
(21, 'Student', 'sathira', 'liyanapathirana', 'sathira@bestjobslk.com', '1234567Q', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '2021-03-10 19:40:04', 0),
(22, 'notAllow', 'pasan', 'lokugamage', 'pasan@bestjobslk.com', '1234567R', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(23, 'notAllow', 'changa', 'lakruwan', 'changa@bestjobslk.com', '1234567S', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(24, 'notAllow', 'asfaf', 'asfasfas', 'asfaf@bestjobslk.com', '1234567T', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0),
(26, 'Student', 'asfcasf', 'asfasfa', 'asfcasf@bestjobslk.com', '1234567U', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Male', NULL, NULL, NULL, '0000-00-00 00:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
