-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2021 at 10:24 AM
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
-- Database: `gadgetbadget_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `beneficiares`
--

CREATE TABLE `beneficiares` (
  `inventorID` int(11) NOT NULL,
  `inventorUsername` varchar(15) CHARACTER SET latin1 NOT NULL,
  `inventorAge` varchar(20) CHARACTER SET latin1 NOT NULL,
  `inventorAddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `inventorPassword` varchar(8) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `beneficiares`
--

INSERT INTO `beneficiares` (`inventorID`, `inventorUsername`, `inventorAge`, `inventorAddress`, `inventorPassword`) VALUES
(1, 'HeshN', '25years', 'Srilanka', 'rtidk8'),
(2, 'Gayan@Y', '30years', 'Kurunegala,Srilanka', 'G678se#t');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` int(11) NOT NULL,
  `customerName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `nic` varchar(10) CHARACTER SET latin1 NOT NULL,
  `phoneNo` int(10) NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cusAddress` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cusPassword` varchar(8) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `fundingtest1`
--

CREATE TABLE `fundingtest1` (
  `fundId` int(11) NOT NULL,
  `funderName` varchar(100) NOT NULL,
  `fundDate` date NOT NULL,
  `fundPrice` double NOT NULL,
  `fundCate` varchar(50) NOT NULL,
  `fundDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `date` varchar(20) NOT NULL,
  `payment_amount` decimal(5,2) NOT NULL,
  `payment_description` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `date`, `payment_amount`, `payment_description`) VALUES
(1, '2020-02-09', '500.00', 'oooo');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(50) CHARACTER SET latin1 NOT NULL,
  `productPrice` decimal(5,2) NOT NULL,
  `warrenty` varchar(50) CHARACTER SET latin1 NOT NULL,
  `productDesc` varchar(200) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`productID`, `productName`, `productPrice`, `warrenty`, `productDesc`) VALUES
(2, 'Electric%2B', '200.00', '3', 'yhgdtt'),
(3, 'cloths', '10.00', 'no', 'rtghikm'),
(5, 'kjhft', '600.00', '6 months', 'yhgdtttt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `beneficiares`
--
ALTER TABLE `beneficiares`
  ADD PRIMARY KEY (`inventorID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `fundingtest1`
--
ALTER TABLE `fundingtest1`
  ADD PRIMARY KEY (`fundId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `beneficiares`
--
ALTER TABLE `beneficiares`
  MODIFY `inventorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fundingtest1`
--
ALTER TABLE `fundingtest1`
  MODIFY `fundId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
