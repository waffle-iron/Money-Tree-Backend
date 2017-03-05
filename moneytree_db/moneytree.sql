-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2017 at 05:51 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moneytree`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE IF NOT EXISTS `block` (
  `block_id` int(11) NOT NULL,
  `side` varchar(50) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `limit_price` int(11) NOT NULL,
  `stop_price` int(11) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `executed_quantity` int(11) NOT NULL,
  `open_quantity` int(11) NOT NULL,
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='block details';

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access_type` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the username password and access type of the user';

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL,
  `side` varchar(50) NOT NULL,
  `symbol` varchar(11) NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `limit_price` int(11) NOT NULL,
  `stop_price` int(11) NOT NULL,
  `open_quantity` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `manager` varchar(11) NOT NULL,
  `portfolio_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='order details';

-- --------------------------------------------------------

--
-- Table structure for table `order_block`
--

CREATE TABLE IF NOT EXISTS `order_block` (
  `order_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE IF NOT EXISTS `stock` (
  `stock_name` varchar(30) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_block`
--
ALTER TABLE `order_block`
  ADD CONSTRAINT `order_block_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `order_block_ibfk_2` FOREIGN KEY (`block_id`) REFERENCES `block` (`block_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
