-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2021 at 09:58 PM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dzoneist_bvk`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `short_description`, `image`, `title`, `content`, `status`, `created_at`, `updated_at`) VALUES
(34, 'CASE PAGE JULY 20 2020', '1609589268.jpg', 'COVID-19 and food safety', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:07:48', '2021-01-02 12:07:48'),
(35, 'CASE PAGE JULY 20 2020', '1609589607.jpg', 'Juice, Nectars and Still drinks using less water and energy', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:13:27', '2021-01-02 12:13:27'),
(36, 'CASE PAGE JULY 20 2020', '1609589694.jpg', 'Shakarganj® launches all-purpose UHT milk in Tetra Brik® Aseptic', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:14:55', '2021-01-02 12:14:55');

-- --------------------------------------------------------

--
-- Table structure for table `block1`
--

CREATE TABLE `block1` (
  `home_id` int(11) NOT NULL,
  `home_image` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block1`
--

INSERT INTO `block1` (`home_id`, `home_image`, `status`, `created_at`, `updated_at`) VALUES
(9, 'slider-1.jpg', '1', '2020-12-29 12:23:57', '2020-12-29 12:23:57');

-- --------------------------------------------------------

--
-- Table structure for table `block2`
--

CREATE TABLE `block2` (
  `id` int(11) NOT NULL,
  `about_image` varchar(255) NOT NULL,
  `about_content` longtext NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block2`
--

INSERT INTO `block2` (`id`, `about_image`, `about_content`, `status`, `created_at`, `updated_at`) VALUES
(22, '1609831531.jpg', '<br><div><table class=\"table table-striped\" style=\"background-color: rgb(241, 241, 241); width: 1121px;\"><tbody><tr><td style=\"line-height: 1.42857; max-width: 400px;\"><div><h1>Making food safe and&nbsp;</h1><h1>&nbsp; &nbsp; available everywhere</h1></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<p>The COVID-19 outbreak is an unprecedented event, affecting communities worldwide.</p><p>None of us have previously experienced a situation like the one we are currently going through .</p><p>&nbsp;Our thoughts are with those most affected. In this context, extraordinary measures are needed to&nbsp;</p><p>ensure we can continue to deliver on our promise to protect what\'s good.</p></div></td></tr></tbody></table></div>', '1', '2021-01-05 07:25:32', '2021-01-05 07:25:32');

-- --------------------------------------------------------

--
-- Table structure for table `block3`
--

CREATE TABLE `block3` (
  `ob_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `position` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16') NOT NULL,
  `about_content` longtext NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block3`
--

INSERT INTO `block3` (`ob_id`, `image`, `position`, `about_content`, `status`, `created_at`, `updated_at`) VALUES
(14, '1609328802.jpg', '0', '<div><h3>End to end solutions</h3></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <p>Processing, packaging and service solutions, maintaining the highest standards of food safety, operational performance and sustainability.</p></div>', '0', '2020-12-30 11:46:42', '2020-12-30 11:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `block4`
--

CREATE TABLE `block4` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `position` enum('0','1','2','3','4') NOT NULL,
  `description` longtext NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `block4`
--

INSERT INTO `block4` (`id`, `image`, `position`, `description`, `status`, `created_at`, `updated_at`) VALUES
(7, '1609404682.jpg', '1', '<div><h4 class=\"solution-title\">Processing Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>Processing solutions and equipment for dairy, cheese, ice cream, beverages and prepared food. </p></div></div>', '0', '2020-12-31 08:51:22', '2020-12-31 08:51:22'),
(8, '1609405263.jpg', '2', '<div><h4 class=\"solution-title\">Service Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>Services helps you improve your performance, optimize costs and ensure food safety throughout the lifecycle of your operations. </p></div></div>', '0', '2020-12-31 09:01:03', '2020-12-31 09:01:03'),
(9, '1609405280.jpg', '3', '<div><h4 class=\"solution-title\">Packaging Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>A complete carton packaging range for consuming fresh products, offering user convenience, easy opening and optimal shelf life.</p></div></div>', '0', '2020-12-31 09:01:20', '2020-12-31 09:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `clientslogo`
--

CREATE TABLE `clientslogo` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clientslogo`
--

INSERT INTO `clientslogo` (`id`, `title`, `logo`, `created_at`, `updated_at`) VALUES
(2, 'DW Shop', '1600076020.png', '2020-09-12 06:58:54', '2020-09-14 09:33:40'),
(3, 'Patrons of Peace', '1600076070.png', '2020-09-12 06:59:10', '2020-09-14 09:34:30'),
(4, 'Marie Claire', '1600076110.png', '2020-09-12 08:03:55', '2020-09-14 09:35:10'),
(5, 'Natura', '1600076166.jpeg', '2020-09-12 08:04:25', '2020-09-14 09:36:06'),
(6, 'Triburg', '1600076200.png', '2020-09-12 08:04:45', '2020-09-14 09:36:40'),
(7, 'Shop Luba', '1600076259.jpg', '2020-09-12 08:05:32', '2020-09-14 09:37:39'),
(8, 'Hotel-shops', '1600076304.jpg', '2020-09-12 08:05:50', '2020-09-14 09:38:24'),
(9, 'Alme Paris', '1600076358.png', '2020-09-12 08:06:17', '2020-09-14 09:39:18'),
(10, 'Global Desi', '1600076408.png', '2020-09-12 08:06:35', '2020-09-14 09:40:08'),
(11, 'AND', '1600076455.png', '2020-09-12 08:06:56', '2020-09-14 09:40:56'),
(12, 'Westside', '1600076491.png', '2020-09-12 08:07:11', '2020-09-14 09:41:31'),
(13, 'Pantaloons', '1600076542.jpg', '2020-09-12 08:07:40', '2020-09-14 09:42:22'),
(14, 'Max', '1600076574.png', '2020-09-12 08:08:30', '2020-09-14 09:42:54');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `metakeywords` varchar(255) NOT NULL,
  `metadescription` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `title`, `description`, `metakeywords`, `metadescription`, `position`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(12, 'Who We Are', 'Under Construction', 'Under Construction', 'Under Construction', '2', '1', 'who-we-are', '2020-09-15 10:51:57', '2020-09-15 10:51:57'),
(13, 'Our Leaders', 'Under Construction', 'Our Leaders', 'Our Leaders', '2', '1', 'our-leaders', '2020-09-15 10:52:28', '2020-09-15 10:52:28'),
(14, 'Technology/ Automation', 'Under Construction', 'Under Construction', 'Under Construction', '2', '1', 'technology/-automation', '2020-09-15 10:52:53', '2020-09-15 10:52:53'),
(15, 'Blogs', 'Under Construction', 'Under Construction', 'Under Construction', '2', '1', 'blogs', '2020-09-15 10:54:01', '2020-09-15 10:54:01'),
(16, 'Gallery', 'Under Construction', 'Under Construction', 'Under Construction', '2', '1', 'gallery', '2020-09-15 10:54:15', '2020-09-15 10:54:15'),
(17, 'Design', 'Under Construction', 'Under Construction', 'Under Construction', '1', '1', 'design', '2020-09-15 10:57:50', '2020-09-15 10:57:50'),
(18, 'Manufacturing', 'Under Construction', 'Under Construction', 'Under Construction', '1', '1', 'manufacturing', '2020-09-15 10:58:31', '2020-09-15 10:58:31'),
(19, 'Sustainability', 'Under Construction', 'Under Construction', 'Under Construction', '1', '1', 'sustainability', '2020-09-15 11:04:42', '2020-09-15 11:04:42'),
(20, 'Quality', 'Under Construction', 'Under Construction', 'Under Construction', '1', '1', 'quality', '2020-09-15 11:04:56', '2020-09-15 11:04:56'),
(21, 'Complaince', 'Under Construction', 'Under Construction', 'Under Construction', '1', '1', 'complaince', '2020-09-15 11:05:06', '2020-09-15 11:05:06');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `image`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(4, '1609746030.png', 'BVK Group', 'jipl@jiplibrary.org', '916376259804', 'Alpha School, Patrakar Colony, Mansarovar, Jaipur 302020', '2021-01-04 07:40:30', '2021-01-04 07:40:30');

-- --------------------------------------------------------

--
-- Table structure for table `contactform`
--

CREATE TABLE `contactform` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `position` enum('0','1','2','3','4','5','6','7','8','9','10') DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `image`, `position`, `title`, `description`, `status`, `created_at`, `updated_at`) VALUES
(33, '1609580218.jpg', '1', 'Recognized with prestigious double ‘A’ score for global climate and forests stewardship', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests<br>', '0', '2021-01-02 09:36:58', '2021-01-02 09:36:58'),
(34, '1609580545.jpg', '2', 'Research study reveals food safety-environment dilemma fostered by COVID-19 pandemic', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests<br>', '0', '2021-01-02 09:42:25', '2021-01-02 09:42:25'),
(35, '1609580613.jpg', '3', 'Stora Enso to explore the building of a recycling line for used beverage cartons', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests&nbsp;<br>', '1', '2021-01-02 09:43:33', '2021-01-02 09:43:33');

-- --------------------------------------------------------

--
-- Table structure for table `ourproduct`
--

CREATE TABLE `ourproduct` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `position` enum('0','1','2','3','4','5','6') CHARACTER SET utf8mb4 NOT NULL,
  `content` varchar(255) NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ourproduct`
--

INSERT INTO `ourproduct` (`id`, `title`, `image`, `position`, `content`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Syfer-XT', '1609504758.jpg', '1', 'Total iron care...', '0', '2021-01-01 12:39:18', '2021-01-01 12:39:18'),
(19, 'Syfer-XT', '1609504808.jpg', '3', 'Total iron care...', '0', '2021-01-01 12:40:08', '2021-01-01 12:40:08'),
(20, 'Syfer-XT', '1609504842.jpg', '2', 'Total iron care...', '0', '2021-01-01 12:40:42', '2021-01-01 12:40:42'),
(21, 'Syfer-XT', '1609504853.jpg', '4', 'Total iron care...', '0', '2021-01-01 12:40:53', '2021-01-01 12:40:53');

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
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `category_id` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `templatedata` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `product_description`, `category_id`, `template`, `templatedata`, `slug`, `created_at`, `updated_at`) VALUES
(23, 'Boutique', 'Red Carpet Is Waiting For You', '28', 't2', '{\"t2b2heading\":\"Boutique\",\"t2b2description\":\"Red Carpet Is Waiting For You\",\"t2b3heading\":\"Boutique\",\"t2b3description\":\"Red Carpet Is Waiting For You\",\"t2b1baseimage1\":\"16008446801.jpg\",\"t2b1baseimage2\":\"16008446802.jpg\",\"t2b1baseimage3\":\"16008446803.jpg\",\"t2b2image1\":\"16008446804.jpg\",\"t2b3image1\":\"16008446806.jpg\",\"t2b3image2\":\"16008446807.jpg\",\"t2b3image3\":\"16008446808.jpg\"}', 'boutique', '2020-09-23 07:04:40', '2020-09-23 07:04:40'),
(22, 'Prints', 'Prints Culture', '26', 't2', '{\"t2b2heading\":\"Prints\",\"t2b2description\":\"Prints Culture\",\"t2b3heading\":\"Prints\",\"t2b3description\":\"Prints Culture\",\"t2b1baseimage1\":\"16008431671.jpg\",\"t2b1baseimage2\":\"16008431672.jpg\",\"t2b1baseimage3\":\"16008431673.jpg\",\"t2b2image1\":\"16008431674.jpg\",\"t2b3image1\":\"16008431676.jpg\",\"t2b3image2\":\"16008431677.jpg\",\"t2b3image3\":\"16008431678.jpg\"}', 'prints', '2020-09-23 06:39:28', '2020-09-23 06:39:28'),
(21, 'Denims', 'Denim Street', '27', 't3', '{\"t3b1baseimage1\":\"16008422021.jpg\",\"t3b1baseimage2\":\"16008422022.jpg\",\"t3b2heading\":\"Denim street\",\"t3b2description\":\"Denim Street\",\"t3b2image1\":\"16008422023.jpg\",\"t3b2image2\":\"16008422024.jpg\",\"t3b2image3\":\"16008422035.jpg\"}', 'denims', '2020-09-23 06:23:23', '2020-09-23 06:23:23'),
(20, 'Embroideries', 'Play with Yarn', '24', 't1', '{\"t1b2heading\":\"Summer 2020\",\"t1b2description\":\"Maam Arts embroidery Collection\",\"t1b3heading\":\"embroidery winter\",\"t1b3description\":\"maam arts winter collection\",\"t1b1baseimage\":\"16008411401.jpg\",\"t1b2image1\":\"16008411412.jpg\",\"t1b2image2\":\"16008411413.jpg\",\"t1b2image3\":\"16008411424.jpg\",\"t1b3image1\":\"16008411425.jpg\",\"t1b3image2\":\"16008411426.jpg\",\"t1b3image3\":\"16008411427.jpg\"}', 'embroideries', '2020-09-23 06:05:42', '2020-09-23 06:05:42'),
(24, 'Boutique', 'Red Carpet Is Waiting For You', '28', 't2', '{\"t2b2heading\":\"Boutique\",\"t2b2description\":\"Red Carpet Is Waiting For You\",\"t2b3heading\":\"Boutique\",\"t2b3description\":null,\"t2b1baseimage1\":\"16008448161.jpg\",\"t2b1baseimage2\":\"16008448162.jpg\",\"t2b1baseimage3\":\"16008448163.jpg\",\"t2b2image1\":\"16008448164.jpg\",\"t2b3image1\":\"16008448166.jpg\",\"t2b3image2\":\"16008448177.jpg\",\"t2b3image3\":\"16008448178.jpg\"}', 'boutique', '2020-09-23 07:06:57', '2020-09-23 07:06:57'),
(25, 'Beaches', 'Feel The Sand', '30', 't3', '{\"t3b1baseimage1\":\"16008453451.jpg\",\"t3b1baseimage2\":\"16008453452.jpg\",\"t3b2heading\":\"Beach\",\"t3b2description\":\"Feel The Sand\",\"t3b2image1\":\"16008453453.jpg\",\"t3b2image2\":\"16008453454.jpg\",\"t3b2image3\":\"16008453455.jpg\"}', 'beaches', '2020-09-23 07:15:45', '2020-09-23 15:23:11'),
(28, 'jackets', 'jackets', '29', 't3', '{\"t3b1baseimage1\":\"16008498961.jpg\",\"t3b1baseimage2\":\"16008498962.jpg\",\"t3b2heading\":\"jackets\",\"t3b2description\":\"jackets\",\"t3b2image1\":\"16008498963.jpg\",\"t3b2image2\":\"16008498964.jpg\",\"t3b2image3\":\"16008498965.jpg\"}', 'jackets', '2020-09-23 08:31:37', '2020-09-23 08:31:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `type`, `email`, `mobile`, `address`, `permissions`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'BVK', '1', 'info@bvkgroup.com', '8299639330', 'BVK Group', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', NULL, '$2y$10$GT8fJgkYF59P3n07on6.zO8gzJXi8Ivx/6wBo29k2ZoGGAG085vbW', NULL, '2020-08-13 09:14:39', '2020-08-13 09:14:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block1`
--
ALTER TABLE `block1`
  ADD PRIMARY KEY (`home_id`);

--
-- Indexes for table `block2`
--
ALTER TABLE `block2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `block3`
--
ALTER TABLE `block3`
  ADD PRIMARY KEY (`ob_id`);

--
-- Indexes for table `block4`
--
ALTER TABLE `block4`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clientslogo`
--
ALTER TABLE `clientslogo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contactform`
--
ALTER TABLE `contactform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ourproduct`
--
ALTER TABLE `ourproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
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
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `block1`
--
ALTER TABLE `block1`
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `block2`
--
ALTER TABLE `block2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `block3`
--
ALTER TABLE `block3`
  MODIFY `ob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `block4`
--
ALTER TABLE `block4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `clientslogo`
--
ALTER TABLE `clientslogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contactform`
--
ALTER TABLE `contactform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ourproduct`
--
ALTER TABLE `ourproduct`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
