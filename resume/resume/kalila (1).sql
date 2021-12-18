-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2020 at 05:11 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kalila`
--

-- --------------------------------------------------------

--
-- Table structure for table `brandmaster`
--

CREATE TABLE `brandmaster` (
  `id` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `mrp` decimal(10,2) NOT NULL,
  `saleprice` decimal(10,2) NOT NULL,
  `real_price` decimal(10,2) NOT NULL,
  `gst` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `categoryimage` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`, `categoryimage`, `slug`, `created_at`, `updated_at`) VALUES
(14, 'Household1', '1602680373.png', 'Household', '2020-10-14 12:59:36', '2020-10-14 13:01:45');

-- --------------------------------------------------------

--
-- Table structure for table `childcategory`
--

CREATE TABLE `childcategory` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_id` int(11) NOT NULL,
  `childcategory` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `childcategory`
--

INSERT INTO `childcategory` (`id`, `cat_id`, `subcat_id`, `childcategory`, `slug`, `created_at`, `updated_at`) VALUES
(15, 14, 21, 'Water', 'Water', '2020-10-16 12:51:45', '2020-10-16 12:51:45');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marchant`
--

CREATE TABLE `marchant` (
  `id` int(11) NOT NULL,
  `category_id` varchar(200) NOT NULL,
  `vender` varchar(255) NOT NULL,
  `c_person` varchar(255) NOT NULL,
  `gst` varchar(100) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobileno` varchar(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marchant`
--

INSERT INTO `marchant` (`id`, `category_id`, `vender`, `c_person`, `gst`, `address`, `email`, `password`, `mobileno`, `image`, `created_at`, `updated_at`) VALUES
(3, '5,8', 'Rahul', 'Nagendra', 'Gtn3535', 'Lucknow', 'nagendra123@gmail.com', '12345678', '0', '1601625185.jpeg', '2020-10-02 07:53:06', '2020-10-02 07:53:06'),
(4, '5,6', 'Rahul', 'Abhishek', 'at747sd', 'Lucknow', 'ram@gmail.com', '443859454', '7574364533', '1601625787.jpeg', '2020-10-02 08:03:07', '2020-10-02 08:03:07'),
(5, '5,6', 'Manish', 'Rahul', 'gt34u89', 'Azamgharh', 'manishprajapati8533@gmail.com', '12345', '566767678', '1601632839.jpeg', '2020-10-02 10:00:39', '2020-10-02 10:00:39'),
(6, '7,8', 'Ankur', 'Dev', 'at747sd', 'Gomati Nagar', 'ankurssri87@gmail.com', 'eyJpdiI6IjdvelJqdHpERjNuRzh2V0lDdktMOWc9PSIsInZhbHVlIjoiNnNYWmV4b3VWZFp4WTlNWHBmMXpDbEIza2ZmTW42SnUzRUZ1UjdWMnZ3WT0iLCJtYWMiOiI1YzhhZjQwZDA3ZjdhMDY2NGE2MzNhYmU3ZGNkNWM0NGEwMTk4ZTI2MzVlNDNmYzVhNWU1ODc4NzMxOTllODFiIn0=', '85459506', '1601634042.jpeg', '2020-10-02 10:20:42', '2020-10-02 10:20:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productmaster`
--

CREATE TABLE `productmaster` (
  `id` int(11) NOT NULL,
  `vendor_id` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `childcategory_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `sku_code` varchar(255) NOT NULL,
  `hsn_code` varchar(255) NOT NULL,
  `mrp` decimal(10,2) NOT NULL,
  `sell_price` decimal(10,2) NOT NULL,
  `real_price` decimal(10,2) NOT NULL,
  `gst` decimal(10,2) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sizemaster`
--

CREATE TABLE `sizemaster` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sizemaster`
--

INSERT INTO `sizemaster` (`id`, `name`, `slug`, `size`, `created_at`, `updated_at`) VALUES
(2, 'shoose', 'shoose', '10,5,7,8', '2020-10-15 10:53:57', '2020-10-15 10:53:57'),
(5, 'cloth', 'cloth', 'xm,small,large', '2020-10-18 08:59:06', '2020-10-18 08:59:06');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `cat_id` varchar(255) NOT NULL,
  `subcategory` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `cat_id`, `subcategory`, `slug`, `created_at`, `updated_at`) VALUES
(21, '14', 'Coockwere1', 'Coockwere', '2020-10-14 13:02:03', '2020-10-14 13:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `businessname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gstin` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('0','1','2') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '0 for admin, 1 for vendor, 2 for customer',
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `businessname`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `mobile`, `address`, `gstin`, `type`, `pincode`, `city`, `state`, `logo`, `category`, `slug`) VALUES
(3, 'Admin', NULL, 'admin@gmail.com', NULL, '$2y$10$xWxALGoJ8c2ClADSO5qQd.92YA967LPzyhrjAfk1d1w5wvml81GHO', NULL, '2020-10-07 15:04:54', '2020-10-07 15:04:54', '', '', NULL, '0', '', '', '', NULL, NULL, ''),
(5, 'Sachin Srivastava', 'Akupaad marketing Limited', 'sachin16@gmail.com', NULL, '$2y$10$ONbPb..qWJ1r3ajgbiGnIOCo.C80YJYjQxOEDmebNt4/qeAND8Hme', NULL, '2020-10-07 16:01:46', '2020-10-07 16:01:46', '8299639330', 'Civil Lines', '123123v123123v123', '1', '229001', 'Raebareli', 'UP', '1602106306.jpg', '8', ''),
(7, 'Ankur Srivastava', 'RKS Technical', 'ankurssri87@gmail.com', NULL, '$2y$10$oqrtsOY/wJV8r5qtbG3pnuslmfEMQ46NWNzRF/YVL0RJKBFLzm8Bq', NULL, '2020-10-07 16:31:21', '2020-10-07 16:31:21', '7607477004', 'Civil Lines', '123123v123123v123', '1', '229001', 'Raebareli', 'UP', '1602108081.jpg', '5', 'rks-technical');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brandmaster`
--
ALTER TABLE `brandmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `childcategory`
--
ALTER TABLE `childcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marchant`
--
ALTER TABLE `marchant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `productmaster`
--
ALTER TABLE `productmaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizemaster`
--
ALTER TABLE `sizemaster`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brandmaster`
--
ALTER TABLE `brandmaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `childcategory`
--
ALTER TABLE `childcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marchant`
--
ALTER TABLE `marchant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `productmaster`
--
ALTER TABLE `productmaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sizemaster`
--
ALTER TABLE `sizemaster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
