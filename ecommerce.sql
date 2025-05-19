-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 19, 2025 at 03:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `addcarts`
--

CREATE TABLE `addcarts` (
  `addcart_id` int(11) NOT NULL,
  `addcart_batch_id` int(10) NOT NULL,
  `addcart_user_id` int(10) NOT NULL,
  `addcart_seller_id` int(10) NOT NULL,
  `addcart_prod_id` int(10) NOT NULL,
  `addcart_pcs` int(10) NOT NULL,
  `addcart_price` int(10) NOT NULL,
  `addcart_status` varchar(255) NOT NULL,
  `addcart_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addcarts`
--

INSERT INTO `addcarts` (`addcart_id`, `addcart_batch_id`, `addcart_user_id`, `addcart_seller_id`, `addcart_prod_id`, `addcart_pcs`, `addcart_price`, `addcart_status`, `addcart_date`) VALUES
(59, 234557, 23, 22, 18, 2, 3500, 'accepted', '2025-05-19 19:50:47'),
(60, 233009, 23, 22, 19, 1, 3500, 'pending', '2025-05-19 21:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `billing_orders`
--

CREATE TABLE `billing_orders` (
  `billing_order_id` int(11) NOT NULL,
  `billing_user_id` int(10) NOT NULL,
  `billing_temp_id` int(10) NOT NULL,
  `billing_fname` varchar(255) NOT NULL,
  `billing_lname` varchar(255) NOT NULL,
  `billing_email` varchar(255) NOT NULL,
  `billing_street_village_purok` varchar(255) NOT NULL,
  `billing_baranggay` varchar(255) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_province` varchar(255) NOT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_postal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `billing_orders`
--

INSERT INTO `billing_orders` (`billing_order_id`, `billing_user_id`, `billing_temp_id`, `billing_fname`, `billing_lname`, `billing_email`, `billing_street_village_purok`, `billing_baranggay`, `billing_city`, `billing_province`, `billing_country`, `billing_postal`) VALUES
(12, 23, 0, 'Jeffry', 'Cabalog', 'djjeffrybommerangpuliran@gmail.com', 'Butuay P5', 'Butuay', 'Jimenez', 'Misamis Occidental', 'Philippines', 7204);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `addcart_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `type` enum('purchase','response') NOT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `sender_id`, `addcart_id`, `message`, `type`, `status`, `created_at`) VALUES
(27, 22, 23, 59, 'Someone purchased your product: Mikrotik / 2 pcs / Price : 3500', 'purchase', 'unread', '2025-05-19 11:48:38'),
(28, 23, 22, 59, 'Your order #59 has been accepted.', 'response', 'unread', '2025-05-19 11:50:47'),
(29, 22, 23, 60, 'Someone purchased your product: Cignal Tv Box / 1 pcs / Price : 3500', 'purchase', 'unread', '2025-05-19 13:03:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_user_id` int(10) NOT NULL,
  `order_billing_id` int(10) NOT NULL,
  `order_batch_id` int(10) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `expires` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `prod_name` varchar(255) NOT NULL,
  `prod_description` varchar(255) NOT NULL,
  `prod_stock` int(10) NOT NULL,
  `prod_price` int(10) NOT NULL,
  `prod_picture` varchar(255) NOT NULL,
  `prod_user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `prod_description`, `prod_stock`, `prod_price`, `prod_picture`, `prod_user_id`) VALUES
(18, 'Mikrotik', 'Mikrotik Router', 10, 3500, 'uploads/1.jpg', 22),
(19, 'Cignal Tv Box', 'Cignal Box', 11, 3500, 'uploads/cignal.jpg', 22);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `user_type` enum('admin','seller','customer') NOT NULL,
  `create_on` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `profile_image` longblob DEFAULT NULL,
  `contact` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `create_on`, `profile_image`, `contact`) VALUES
(21, 'Jeffry', 'djjeffrybommerangpuliran@gmail.com', '$2y$10$r0KXFRbBmvgfOdB8CeRyE.Ti2ZsguR6xpx9I8lAbG3EYjvv1ud7B2', 'customer', '2025-05-19 20:41:04', 0x494d475f36383262303562613962613139392e35323735303430302e6a7067, '09392758077'),
(22, 'SELLER', 'seller@gmail.com', '$2y$10$r0KXFRbBmvgfOdB8CeRyE.Ti2ZsguR6xpx9I8lAbG3EYjvv1ud7B2', 'seller', '2025-05-19 19:46:27', 0x313734373635353138375f696d616765312e6a7067, '09392758077'),
(23, 'CUSTOMER', 'customer@gmail.com', '$2y$10$r0KXFRbBmvgfOdB8CeRyE.Ti2ZsguR6xpx9I8lAbG3EYjvv1ud7B2', 'customer', '2025-05-19 19:47:24', 0x313734373635353234345f3238353035313434325f3137393932333437313132323731395f313637363535313136373935363236343132355f6e2e6a7067, '09392758077'),
(24, 'ADMIN', 'admin@gmail.com', '$2y$10$r0KXFRbBmvgfOdB8CeRyE.Ti2ZsguR6xpx9I8lAbG3EYjvv1ud7B2', 'admin', '2025-05-19 20:17:36', 0x313734373635373035365f696d616765312e6a7067, '09392758077');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addcarts`
--
ALTER TABLE `addcarts`
  ADD PRIMARY KEY (`addcart_id`);

--
-- Indexes for table `billing_orders`
--
ALTER TABLE `billing_orders`
  ADD PRIMARY KEY (`billing_order_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addcarts`
--
ALTER TABLE `addcarts`
  MODIFY `addcart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `billing_orders`
--
ALTER TABLE `billing_orders`
  MODIFY `billing_order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
