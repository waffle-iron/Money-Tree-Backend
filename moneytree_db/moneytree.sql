-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2017 at 02:48 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

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
  `open_qty` int(10) NOT NULL,
  `block_timestamp` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='block details';

-- --------------------------------------------------------

--
-- Table structure for table `equity_trader`
--

CREATE TABLE `equity_trader` (
  `et_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equity_trader`
--

INSERT INTO `equity_trader` (`et_id`, `username`, `password`, `name`) VALUES
(1, 'test_et', 'afaba0afd7702fdcb35403ee679dd3f13477fa85', 'test');

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
  `pm_id` int(10) NOT NULL,
  `s_id` int(10) NOT NULL,
  `current_price` float NOT NULL,
  `order_timestamp` varchar(30) NOT NULL DEFAULT 'CURRENT_TIMESTAMP(6)'
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
-- Table structure for table `pm_et_relations`
--

CREATE TABLE `pm_et_relations` (
  `pm_id` int(10) NOT NULL,
  `et_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `portfolio_manager`
--

CREATE TABLE `portfolio_manager` (
  `pm_id` int(10) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(50) NOT NULL,
  `cash_available` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portfolio_manager`
--

INSERT INTO `portfolio_manager` (`pm_id`, `username`, `password`, `name`, `cash_available`) VALUES
(1, 'test_pm', '88a6a89ff2ad712f1ea0c3f27207e0435785a3cd', 'Test User', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `s_id` int(10) NOT NULL,
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
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`s_id`);

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
