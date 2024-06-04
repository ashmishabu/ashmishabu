-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 06:48 AM
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
-- Database: `affiliate_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payout_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payouts`
--

INSERT INTO `payouts` (`id`, `user_id`, `sale_id`, `amount`, `payout_date`) VALUES
(1, 1, 2, 200.00, '2024-05-31 15:50:40'),
(2, 1, 2, 100.00, '2024-05-31 15:50:40'),
(3, 1, 2, 60.00, '2024-05-31 15:50:40'),
(4, 1, 2, 40.00, '2024-05-31 15:50:40'),
(5, 1, 2, 20.00, '2024-05-31 15:50:40'),
(6, 1, 3, 200.00, '2024-05-31 15:50:48'),
(7, 1, 3, 100.00, '2024-05-31 15:50:48'),
(8, 1, 3, 60.00, '2024-05-31 15:50:48'),
(9, 1, 3, 40.00, '2024-05-31 15:50:48'),
(10, 1, 3, 20.00, '2024-05-31 15:50:48'),
(11, 1, 4, 200.00, '2024-05-31 16:08:16'),
(12, 1, 4, 100.00, '2024-05-31 16:08:16'),
(13, 1, 4, 60.00, '2024-05-31 16:08:16'),
(14, 1, 4, 40.00, '2024-05-31 16:08:16'),
(15, 1, 4, 20.00, '2024-05-31 16:08:16');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `amount`, `sale_date`) VALUES
(2, 1, 2000.00, '2024-05-31 15:50:40'),
(3, 1, 2000.00, '2024-05-31 15:50:48'),
(4, 1, 2000.00, '2024-05-31 16:08:16'),
(5, 20, 4500.00, '2024-05-31 17:33:50'),
(6, 20, 4500.00, '2024-05-31 17:33:57'),
(7, 23, 6750.00, '2024-05-31 18:39:42'),
(8, 23, 6750.00, '2024-05-31 18:39:57'),
(9, 23, 6750.00, '2024-05-31 18:40:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `parent_id`) VALUES
(1, 'ashmi', 'ash@gmail.com', 1),
(2, 'Reena', 'reena@gmail.com', 2),
(14, 'appu', 'appu@gamil.com', NULL),
(17, 'malu', 'malu123@gamil.com', NULL),
(20, 'Das', 'dassiva34@gmail.com', NULL),
(21, 'seetha', 'seetha8@gmail.com', NULL),
(23, 'Archana', 'archana@gmail.com', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `sale_id` (`sale_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `parent_id` (`parent_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `payouts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `payouts_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
