-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2020 at 11:55 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `projet`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `idC` int(30) NOT NULL,
  `nomC` varchar(30) NOT NULL,
  `famille` varchar(30) NOT NULL,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`idC`, `nomC`, `famille`) VALUES
(123, 'af@gmail', 'aa'),
(258, 'ff@gmail', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE IF NOT EXISTS `ingredient` (
  `idI` int(30) NOT NULL,
  `nomI` varchar(30) NOT NULL,
  `quantiteI` int(30) NOT NULL,
  `description` varchar(30) NOT NULL,
  `prix` int(30) NOT NULL,
  `image` varchar(80) NOT NULL,
  `idC` int(30) NOT NULL,
  PRIMARY KEY (`idI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`idI`, `nomI`, `quantiteI`, `description`, `prix`, `image`, `idC`) VALUES
(12, 'hama', 99, 'good', 12, '', 123);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
