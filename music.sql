-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 29, 2024 at 02:06 PM
-- Server version: 8.4.3
-- PHP Version: 8.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `music`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `name`) VALUES
(1, 'Michael Jackson'),
(2, 'Madonna'),
(3, 'Prince'),
(4, 'Whitney Houston'),
(5, 'Bon Jovi'),
(6, 'Cyndi Lauper'),
(7, 'Queen'),
(8, 'George Michael'),
(9, 'Phil Collins'),
(10, 'Tina Turner');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Pop'),
(2, 'Rock'),
(3, 'R&B'),
(4, 'Soul'),
(5, 'Dance'),
(6, 'New Wave'),
(7, 'Synth-pop'),
(8, 'Disco'),
(9, 'Jazz'),
(10, 'Blues');

-- --------------------------------------------------------

--
-- Table structure for table `songs`
--

CREATE TABLE `songs` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `year` int NOT NULL,
  `artist_id` int NOT NULL,
  `genre_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `songs`
--

INSERT INTO `songs` (`id`, `title`, `year`, `artist_id`, `genre_id`) VALUES
(1, 'Billie Jean', 1983, 1, 1),
(2, 'Thriller', 1982, 1, 1),
(3, 'Like a Virgin', 1984, 2, 1),
(4, 'Material Girl', 1985, 2, 1),
(5, 'Purple Rain', 1984, 3, 3),
(6, 'When Doves Cry', 1984, 3, 3),
(7, 'I Wanna Dance with Somebody', 1987, 4, 1),
(8, 'How Will I Know', 1985, 4, 1),
(9, 'Livin\' on a Prayer', 1986, 5, 2),
(10, 'You Give Love a Bad Name', 1986, 5, 2),
(11, 'Girls Just Want to Have Fun', 1983, 6, 1),
(12, 'Time After Time', 1984, 6, 1),
(13, 'Another One Bites the Dust', 1980, 7, 2),
(14, 'Radio Ga Ga', 1984, 7, 2),
(15, 'Careless Whisper', 1984, 8, 1),
(16, 'Faith', 1987, 8, 1),
(17, 'In the Air Tonight', 1981, 9, 4),
(18, 'Against All Odds', 1984, 9, 4),
(19, 'What\'s Love Got to Do with It', 1984, 10, 6),
(20, 'Private Dancer', 1984, 10, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artist_song` (`artist_id`),
  ADD KEY `fk_genre_song` (`genre_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `songs`
--
ALTER TABLE `songs`
  ADD CONSTRAINT `fk_artist_song` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `fk_genre_song` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
