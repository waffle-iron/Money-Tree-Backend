-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2017 at 02:00 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moneytree`
--

-- --------------------------------------------------------

--
-- Table structure for table `block`
--

CREATE TABLE `block` (
  `block_id` int(10) NOT NULL,
  `side` varchar(50) NOT NULL,
  `symbol` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `limit_price` int(11) NOT NULL,
  `stop_price` int(11) NOT NULL,
  `total_qty` int(10) NOT NULL,
  `executed_qty` int(10) NOT NULL,
  `open_qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='block details';

-- --------------------------------------------------------

--
-- Table structure for table `equity_trader`
--

CREATE TABLE `equity_trader` (
  `et_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equity_trader`
--

INSERT INTO `equity_trader` (`et_id`, `name`) VALUES
(1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `u_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `access_type` varchar(50) NOT NULL,
  `pm_id` int(10) DEFAULT NULL,
  `et_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Stores the username password and access type of the user';

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`u_id`, `username`, `password`, `access_type`, `pm_id`, `et_id`) VALUES
(1, 'test_pm', 'test_pm', 'pm', 1, NULL),
(2, 'test_et', 'test_et', 'et', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `side` varchar(50) NOT NULL,
  `symbol` varchar(11) NOT NULL,
  `total_qty` int(10) NOT NULL,
  `limit_price` int(11) NOT NULL,
  `stop_price` int(11) NOT NULL,
  `open_qty` int(10) NOT NULL,
  `allocated_qty` int(10) NOT NULL DEFAULT '0',
  `status` varchar(50) NOT NULL,
  `et_id` int(10) NOT NULL,
  `pm_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='order details';

-- --------------------------------------------------------

--
-- Table structure for table `order_block`
--

CREATE TABLE `order_block` (
  `order_id` int(10) NOT NULL,
  `block_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pm_et`
--

CREATE TABLE `pm_et` (
  `pm_id` int(10) NOT NULL,
  `et_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_manager`
--

CREATE TABLE `portfolio_manager` (
  `pm_id` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cash_available` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio_manager`
--

INSERT INTO `portfolio_manager` (`pm_id`, `name`, `cash_available`) VALUES
(1, 'Test User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `stock_name` varchar(30) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `block`
--
ALTER TABLE `block`
  ADD PRIMARY KEY (`block_id`);

--
-- Indexes for table `equity_trader`
--
ALTER TABLE `equity_trader`
  ADD PRIMARY KEY (`et_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_block`
--
ALTER TABLE `order_block`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `block_id` (`block_id`);

--
-- Indexes for table `portfolio_manager`
--
ALTER TABLE `portfolio_manager`
  ADD PRIMARY KEY (`pm_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `block`
--
ALTER TABLE `block`
  MODIFY `block_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `equity_trader`
--
ALTER TABLE `equity_trader`
  MODIFY `et_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `u_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `portfolio_manager`
--
ALTER TABLE `portfolio_manager`
  MODIFY `pm_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
