mysql --host=localhost --user=root -p
mysql -u root -h localhost -p

DROP DATABASE byos;
CREATE DATABASE byos;
USE byos;

DROP TABLE dark_stormy_night;

CREATE TABLE dark_stormy_night 
(story_text CHAR(250) NOT NULL);

ALTER TABLE dark_stormy_night 
ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST,
ADD from_text_id INT,
ADD timestamp DATETIME NOT NULL;

ALTER TABLE dark_stormy_night
ADD INDEX (from_text_id);

ALTER TABLE dark_stormy_night
CHANGE timestamp timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

ALTER TABLE dark_stormy_night
ADD FOREIGN KEY frm_id (from_text_id)
REFERENCES dark_stormy_night(id)
ON DELETE CASCADE;

DESCRIBE dark_stormy_night;
SHOW INDEXES FROM dark_stormy_night;

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL;

INSERT INTO dark_stormy_night
SET story_text = 'It was a dark and stormy night. I swear.';

INSERT INTO dark_stormy_night
SET story_text = 'I opened a new pack of cigarettes.', from_text_id = '1';
SELECT * FROM dark_stormy_night;

DELETE FROM dark_stormy_night
WHERE id = 1;
SELECT * FROM dark_stormy_night;

TRUNCATE TABLE dark_stormy_night;

------------------------------------------------
------------------------------------------------
------------------------------------------------

DROP TABLE dark_stormy_night;
CREATE TABLE `dark_stormy_night` (
  `id` INT,
  `story_text` char(250) NOT NULL,
  `from_text_id` INT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

ALTER TABLE `dark_stormy_night`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_text_id` (`from_text_id`);

ALTER TABLE `dark_stormy_night`
MODIFY id INT AUTO_INCREMENT;

ALTER TABLE `dark_stormy_night`
  ADD CONSTRAINT `dark_stormy_night_ibfk_1` FOREIGN KEY (`from_text_id`) REFERENCES `dark_stormy_night` (`id`) ON DELETE CASCADE;

------------------------------------------------
------------------------------------------------
------------------------------------------------

DROP TABLE byos_stories;
CREATE TABLE byos_stories (
  id INT,
  story_title char(250) NOT NULL,
  timestamp timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

ALTER TABLE byos_stories
  ADD PRIMARY KEY (`id`);

ALTER TABLE byos_stories
MODIFY id INT AUTO_INCREMENT;

DESCRIBE byos_stories;
SHOW INDEXES FROM byos_stories;

SELECT TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE REFERENCED_TABLE_SCHEMA IS NOT NULL;





-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2017 at 08:16 PM
-- Server version: 5.6.30
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `byos`
--

-- --------------------------------------------------------

--
-- Table structure for table `byos_stories`
--

CREATE TABLE `byos_stories` (
  `id` int(11) NOT NULL,
  `story_title` varchar(100) NOT NULL,
  `story_table_name` varchar(25) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `byos_stories`
--

INSERT INTO `byos_stories` (`id`, `story_title`, `story_table_name`, `timestamp`) VALUES
(1, 'It was a dark and stormy night', '', '2017-03-05 04:07:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `byos_stories`
--
ALTER TABLE `byos_stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `story_table_name` (`story_table_name`),
  ADD UNIQUE KEY `story_title` (`story_title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `byos_stories`
--
ALTER TABLE `byos_stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;



-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Mar 04, 2017 at 08:19 PM
-- Server version: 5.6.30
-- PHP Version: 5.6.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `byos`
--

-- --------------------------------------------------------

--
-- Table structure for table `dark_stormy_night`
--

CREATE TABLE `dark_stormy_night` (
  `id` int(11) NOT NULL,
  `story_text` char(250) NOT NULL,
  `from_text_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dark_stormy_night`
--
ALTER TABLE `dark_stormy_night`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_text_id` (`from_text_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dark_stormy_night`
--
ALTER TABLE `dark_stormy_night`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `dark_stormy_night`
--
ALTER TABLE `dark_stormy_night`
  ADD CONSTRAINT `dark_stormy_night_ibfk_1` FOREIGN KEY (`from_text_id`) REFERENCES `dark_stormy_night` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


