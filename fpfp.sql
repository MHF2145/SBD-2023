-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2023 at 06:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fpfp`
--

-- --------------------------------------------------------

--
-- Table structure for table `collectioncard`
--

CREATE TABLE `collectioncard` (
  `cc_ID` char(5) NOT NULL,
  `cc_name` varchar(255) NOT NULL,
  `cc_series` varchar(50) NOT NULL,
  `cc_rarity` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collectioncard`
--

INSERT INTO `collectioncard` (`cc_ID`, `cc_name`, `cc_series`, `cc_rarity`) VALUES
('CC001', 'Thunder Dragon', 'Yu GI Oh', 'Ultra Rare'),
('CC002', 'Charizard', 'Pokemon', 'Rare'),
('CC003', 'Jace, the Mind Sculptor', 'Magic: The Gathering', 'Mythic Rare'),
('CC004', 'Dark Magician', 'Yu GI Oh', 'Super Rare'),
('CC005', 'Pikachu', 'Pokemon', 'Common');

-- --------------------------------------------------------

--
-- Table structure for table `collectiontransaction`
--

CREATE TABLE `collectiontransaction` (
  `ct_ID` char(5) NOT NULL,
  `ct_date` datetime NOT NULL DEFAULT current_timestamp(),
  `ct_isChecked` tinyint(1) NOT NULL DEFAULT 0,
  `ct_isApproved` tinyint(1) NOT NULL DEFAULT 0,
  `p1_p_ID` char(5) NOT NULL,
  `p1_cc_ID` char(5) DEFAULT NULL,
  `p1_cardQuantity` int(11) DEFAULT NULL,
  `p1_price` decimal(10,2) DEFAULT NULL,
  `p2_p_ID` char(5) DEFAULT NULL,
  `p2_cc_ID` char(5) DEFAULT NULL,
  `p2_cardQuantity` int(11) DEFAULT NULL,
  `p2_price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `e_ID` char(5) NOT NULL,
  `e_name` varchar(100) NOT NULL,
  `e_address` varchar(255) NOT NULL,
  `e_phoneNumber` varchar(15) NOT NULL,
  `e_position` varchar(50) NOT NULL,
  `e_email` varchar(60) NOT NULL,
  `e_age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`e_ID`, `e_name`, `e_address`, `e_phoneNumber`, `e_position`, `e_email`, `e_age`) VALUES
('E0001', 'Xiao Yuu', 'Jl. Jenderal Sudirman No. 123', '555-1111', 'Owner', 'xiaoyuu@gmail.com', 29),
('E0002', 'Hakken Ryou', 'Jl. Thamrin No. 456', '555-2222', 'Cashier', 'hakken@yahoo.com', 25),
('E0003', 'Ronan Loch', 'Jl. Hayam Wuruk No. 789', '555-3333', 'Game Room Assistant', 'ronan@outlook.com', 24),
('E0004', 'Adam Stewart', 'Jl. Kebon Sirih No. 101', '555-4444', 'Janitor', 'adam@yahoo.com', 26),
('E0005', 'David Wicaksono', 'Jl. MH. Thamrin No. 202', '555-5555', 'Janitor', 'davidw@gmail.com', 25);

-- --------------------------------------------------------

--
-- Table structure for table `gameroom`
--

CREATE TABLE `gameroom` (
  `gr_ID` char(5) NOT NULL,
  `gr_type` varchar(50) NOT NULL,
  `gr_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gameroom`
--

INSERT INTO `gameroom` (`gr_ID`, `gr_type`, `gr_price`) VALUES
('GR001', 'Reguler', 20000.00),
('GR002', 'Deluxe', 40000.00),
('GR003', 'VIP', 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `m_ID` char(5) NOT NULL,
  `m_name` varchar(120) NOT NULL,
  `m_email` varchar(60) NOT NULL,
  `m_dateRegistered` date NOT NULL DEFAULT current_timestamp(),
  `m_totalPoin` int(11) NOT NULL DEFAULT 0 CHECK (`m_totalPoin` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`m_ID`, `m_name`, `m_email`, `m_dateRegistered`, `m_totalPoin`) VALUES
('M0001', 'Oda', 'oda@gmail.com', '2023-01-01', 100),
('M0002', 'Arsene', 'arsene@hotmail.com', '2023-02-15', 150),
('M0003', 'Rozen', 'rozen@yahoo.com', '2023-03-30', 200),
('M0004', 'Flan', 'flan@gmail.com', '2023-04-10', 120),
('M0005', 'Fyodor', 'fyodor@rocketmail.com', '2023-05-22', 180),
('M0006', 'Salvanse', 'salvanse@hotmail.com', '2023-06-05', 220),
('M0007', 'Cyanstar', 'lordk@gmail.com', '2023-07-15', 90);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `p_ID` char(5) NOT NULL,
  `p_name` varchar(100) NOT NULL,
  `p_address` varchar(255) DEFAULT NULL,
  `p_phoneNumber` varchar(15) DEFAULT NULL,
  `p_m_ID` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`p_ID`, `p_name`, `p_address`, `p_phoneNumber`, `p_m_ID`) VALUES
('P0001', 'Teja Hoshizora', 'Jl. Merdeka No. 123', '555-1234', 'M0001'),
('P0002', 'Leo Leon', 'Jl. Kebon Sirih No. 456', '555-5678', 'M0002'),
('P0003', 'Alif Satria', 'Jl. Sudirman No. 789', '555-9012', 'M0003'),
('P0004', 'Rafli Rai', 'Jl. Pangeran Antasari No. 101', '555-3456', 'M0004'),
('P0005', 'Moris Idris', 'Jl. Gatot Subroto No. 202', '555-7890', 'M0005'),
('P0006', 'Hanif Kan', 'Jl. Thamrin No. 303', '555-1234', 'M0006'),
('P0007', 'Lord Kaisar', 'Jl. Hayam Wuruk No. 404', '555-5678', 'M0007'),
('P0008', 'Kang Ryu', 'Jl. Wahid Hasyim No. 505', '555-9012', NULL),
('P0009', 'Ian Harris', 'Jl. Diponegoro No. 606', '555-3456', NULL),
('P0010', 'Julia Clark', 'Jl. HR. Rasuna Said No. 707', '555-7890', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `productcatalog`
--

CREATE TABLE `productcatalog` (
  `pc_ID` char(5) NOT NULL,
  `pc_name` varchar(255) NOT NULL,
  `pc_type` varchar(50) NOT NULL,
  `pc_price` decimal(10,2) NOT NULL,
  `pc_stock` int(11) NOT NULL DEFAULT 0 CHECK (`pc_stock` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productcatalog`
--

INSERT INTO `productcatalog` (`pc_ID`, `pc_name`, `pc_type`, `pc_price`, `pc_stock`) VALUES
('PC002', 'Scarlet & Violet Booster Pack', 'Pokemon Booster Pack', 65000.00, 10),
('PC003', 'Sword & Shield Booster Pack', 'Pokemon Booster Pack', 45000.00, 15),
('PC004', 'Brave Destroyer Booster Pack', 'Yu GI Oh Booster Pack', 50000.00, 15),
('PC005', 'Legendary Duel: Soul-Burning Volcano Booster Pack', 'Yu GI Oh Booster Pack', 70000.00, 5),
('PC006', 'Draft Booster', 'Magic: The Gathering Booster Pack', 60000.00, 10),
('PC007', 'Jumpstart Booster', 'Magic: The Gathering Booster Pack', 55000.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `productshoppingcart`
--

CREATE TABLE `productshoppingcart` (
  `psc_pc_ID` char(5) NOT NULL,
  `psc_pt_ID` char(5) NOT NULL,
  `psc_quantity` int(11) NOT NULL CHECK (`psc_quantity` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productshoppingcart`
--

INSERT INTO `productshoppingcart` (`psc_pc_ID`, `psc_pt_ID`, `psc_quantity`) VALUES
('PC002', 'T0001', 2),
('PC002', 'T0004', 3),
('PC003', 'T0003', 2),
('PC004', 'T0001', 1),
('PC004', 'T0005', 1),
('PC005', 'T0002', 3),
('PC005', 'T0004', 2),
('PC006', 'T0003', 1),
('PC006', 'T0005', 2),
('PC007', 'T0002', 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomshoppingcart`
--

CREATE TABLE `roomshoppingcart` (
  `rsc_pt_ID` char(5) NOT NULL,
  `rsc_gr_ID` char(5) NOT NULL,
  `rsc_time_in` datetime NOT NULL DEFAULT current_timestamp(),
  `rsc_time_out` datetime NOT NULL DEFAULT (current_timestamp() + interval 1 hour) CHECK (`rsc_time_out` > `rsc_time_in`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomshoppingcart`
--

INSERT INTO `roomshoppingcart` (`rsc_pt_ID`, `rsc_gr_ID`, `rsc_time_in`, `rsc_time_out`) VALUES
('T0001', 'GR001', '2023-11-01 12:30:00', '2023-11-01 15:30:00'),
('T0002', 'GR002', '2023-11-02 14:45:00', '2023-11-02 17:45:00'),
('T0003', 'GR003', '2023-11-03 10:15:00', '2023-11-03 12:15:00'),
('T0004', 'GR001', '2023-11-04 16:00:00', '2023-11-04 19:00:00'),
('T0005', 'GR002', '2023-11-05 11:30:00', '2023-11-05 14:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `t_ID` char(5) NOT NULL,
  `t_date` datetime NOT NULL DEFAULT current_timestamp(),
  `t_totalPrice` decimal(10,2) NOT NULL DEFAULT 0.00 CHECK (`t_totalPrice` >= 0),
  `t_isAMember` tinyint(1) NOT NULL DEFAULT 0,
  `t_e_ID` char(5) NOT NULL,
  `t_p_ID` char(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`t_ID`, `t_date`, `t_totalPrice`, `t_isAMember`, `t_e_ID`, `t_p_ID`) VALUES
('T0001', '2023-11-01 12:30:00', 240000.00, 1, 'E0001', 'P0001'),
('T0002', '2023-11-02 14:45:00', 385000.00, 1, 'E0002', 'P0002'),
('T0003', '2023-11-03 10:15:00', 250000.00, 1, 'E0003', 'P0003'),
('T0004', '2023-11-04 16:00:00', 395000.00, 1, 'E0004', 'P0004'),
('T0005', '2023-11-05 11:30:00', 290000.00, 1, 'E0005', 'P0005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collectioncard`
--
ALTER TABLE `collectioncard`
  ADD PRIMARY KEY (`cc_ID`);

--
-- Indexes for table `collectiontransaction`
--
ALTER TABLE `collectiontransaction`
  ADD PRIMARY KEY (`ct_ID`),
  ADD KEY `CollectionCard_CollectionTransaction_P1` (`p1_cc_ID`),
  ADD KEY `CollectionTransaction_CollectionCard_P2` (`p2_cc_ID`),
  ADD KEY `CollectionTransaction_Player_P1` (`p1_p_ID`),
  ADD KEY `CollectionTransaction_Player_P2` (`p2_p_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`e_ID`);

--
-- Indexes for table `gameroom`
--
ALTER TABLE `gameroom`
  ADD PRIMARY KEY (`gr_ID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`m_ID`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`p_ID`),
  ADD KEY `Player_Membership` (`p_m_ID`);

--
-- Indexes for table `productcatalog`
--
ALTER TABLE `productcatalog`
  ADD PRIMARY KEY (`pc_ID`);

--
-- Indexes for table `productshoppingcart`
--
ALTER TABLE `productshoppingcart`
  ADD PRIMARY KEY (`psc_pc_ID`,`psc_pt_ID`),
  ADD KEY `ProductCatalog_Transaction_Transaction` (`psc_pt_ID`);

--
-- Indexes for table `roomshoppingcart`
--
ALTER TABLE `roomshoppingcart`
  ADD PRIMARY KEY (`rsc_pt_ID`,`rsc_gr_ID`),
  ADD KEY `Transaction_GameRoom_GameRoom` (`rsc_gr_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`t_ID`),
  ADD KEY `ProductTransaction_Employee` (`t_e_ID`),
  ADD KEY `ProductTransaction_Player` (`t_p_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collectiontransaction`
--
ALTER TABLE `collectiontransaction`
  ADD CONSTRAINT `CollectionCard_CollectionTransaction_P1` FOREIGN KEY (`p1_cc_ID`) REFERENCES `collectioncard` (`cc_ID`),
  ADD CONSTRAINT `CollectionTransaction_CollectionCard_P2` FOREIGN KEY (`p2_cc_ID`) REFERENCES `collectioncard` (`cc_ID`),
  ADD CONSTRAINT `CollectionTransaction_Player_P1` FOREIGN KEY (`p1_p_ID`) REFERENCES `player` (`p_ID`),
  ADD CONSTRAINT `CollectionTransaction_Player_P2` FOREIGN KEY (`p2_p_ID`) REFERENCES `player` (`p_ID`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `Player_Membership` FOREIGN KEY (`p_m_ID`) REFERENCES `membership` (`m_ID`);

--
-- Constraints for table `productshoppingcart`
--
ALTER TABLE `productshoppingcart`
  ADD CONSTRAINT `ProductCatalog_Transaction_ProductCatalog` FOREIGN KEY (`psc_pc_ID`) REFERENCES `productcatalog` (`pc_ID`),
  ADD CONSTRAINT `ProductCatalog_Transaction_Transaction` FOREIGN KEY (`psc_pt_ID`) REFERENCES `transaction` (`t_ID`);

--
-- Constraints for table `roomshoppingcart`
--
ALTER TABLE `roomshoppingcart`
  ADD CONSTRAINT `Transaction_GameRoom_GameRoom` FOREIGN KEY (`rsc_gr_ID`) REFERENCES `gameroom` (`gr_ID`),
  ADD CONSTRAINT `Transaction_GameRoom_Transaction` FOREIGN KEY (`rsc_pt_ID`) REFERENCES `transaction` (`t_ID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `ProductTransaction_Employee` FOREIGN KEY (`t_e_ID`) REFERENCES `employee` (`e_ID`),
  ADD CONSTRAINT `ProductTransaction_Player` FOREIGN KEY (`t_p_ID`) REFERENCES `player` (`p_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
