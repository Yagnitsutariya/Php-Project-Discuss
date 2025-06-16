-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 11:13 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) NOT NULL,
  `answer` varchar(300) NOT NULL,
  `question_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `question_id`, `user_id`) VALUES
(1, 'yes php is good\r\n', 1, 0),
(3, 'not so good in my opinion\r\n', 1, 8),
(4, 'yes java is good language and better than php\r\n', 2, 8),
(5, 'Locho.\r\nSurti Sev Khamani.\r\nGhari.\r\nUndhiyu.\r\nBhajiya.\r\nPonk Vadas.\r\nCollegian.\r\nNan Khatai.', 8, 9),
(6, 'yes ', 7, 13),
(7, 'Rasmus Lerdorf', 14, 16),
(8, 'Rasmus Lerdorf', 15, 15),
(9, 'php is server side scripting language', 16, 17);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'mobile'),
(2, 'laptop'),
(3, 'food'),
(4, 'coding'),
(5, 'general');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(30) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(300) NOT NULL,
  `category_id` int(10) NOT NULL,
  `user_id` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `description`, `category_id`, `user_id`) VALUES
(1, 'is Php good progaming language', 'is Php good progaming language', 4, '8'),
(4, 'Should I buy I Phone?', '', 1, '8'),
(5, 'what is the full form of OK?', '', 5, '8'),
(6, 'is AI good for devlopers', '', 4, '8'),
(7, 'is DSA importsnt for jobs', '', 4, '8'),
(8, 'What is famous in Surat to eat?', '', 3, '10'),
(9, 'What is famous in Bhavnagar to eat?', '', 3, '10'),
(16, 'what is php?', '', 4, '18');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(30) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `address`) VALUES
(17, 'yagnit', 'shakibgalxy108@gmail.com', '123456', 'patel park'),
(18, 'yagnit sutariya', 'fwejfsjvfjsfvjsf@gmai.com', '1234556', 'MUMBAI');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
