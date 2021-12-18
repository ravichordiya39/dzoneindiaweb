-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 24, 2021 at 09:49 PM
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
-- Database: `dzoneist_bvkmain`
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
(34, 'CASE PAGE JULY 20 2020', '1610790557.jpg', 'COVID-19 and food safety', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:07:48', '2021-01-02 12:07:48'),
(35, 'CASE PAGE JULY 20 2020', '1610790565.jpg', 'Juice, Nectars and Still drinks using less water and energy', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:13:27', '2021-01-02 12:13:27'),
(36, 'CASE PAGE JULY 20 2020', '1610790573.jpg', 'Shakarganj® launches all-purpose UHT milk in Tetra Brik® Aseptic', 'Should I wash food cartons after bringing them home from shopping? The pandemic has radically changed our world. Find out more about food safety and COVID-19', '1', '2021-01-02 12:14:55', '2021-01-02 12:14:55');

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
(13, 'slider-1.jpg', '1', '2021-01-16 09:42:04', '2021-01-16 09:42:04'),
(14, 'demofile.png', '0', '2021-02-16 11:02:31', '2021-02-16 11:02:31');

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
(21, '1610790172.jpg', '<div><h1>Making&nbsp; food safe and available everywhere</h1></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<p>The<b> COVID-19 </b>outbreak is an unprecedented event, affecting communities worldwide. None of us have previously experienced a situation like the one we are currently going through . Our thoughts are with those most affected. In this context, extraordinary measures are needed to ensure we can continue to deliver on our promise to protect what\'s good.</p></div>', '1', '2021-01-01 11:50:47', '2021-01-01 11:50:47');

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
(14, '1610790202.jpg', '0', '<div><h3>End to end solutions</h3></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <p>Processing, packaging and service solutions, maintaining the highest standards of food safety, operational performance and sustainability.</p></div>', '0', '2020-12-30 11:46:42', '2020-12-30 11:46:42');

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
(7, '1610790243.jpg', '1', '<div><h4 class=\"solution-title\">Processing Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>Processing solutions and equipment for dairy, cheese, ice cream, beverages and prepared food. </p></div></div>', '0', '2020-12-31 08:51:22', '2020-12-31 08:51:22'),
(8, '1610790263.jpg', '2', '<div><h4 class=\"solution-title\">Service Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>Services helps you improve your performance, optimize costs and ensure food safety throughout the lifecycle of your operations. </p></div></div>', '0', '2020-12-31 09:01:03', '2020-12-31 09:01:03'),
(9, '1610790284.jpg', '3', '<div><h4 class=\"solution-title\">Packaging Solutions</h4></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<div class=\"solution-content\"><p>A complete carton packaging range for consuming fresh products, offering user convenience, easy opening and optimal shelf life.</p></div></div>', '0', '2020-12-31 09:01:20', '2020-12-31 09:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `metakeywords` varchar(255) NOT NULL,
  `metadescription` longtext NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `description`, `metakeywords`, `metadescription`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Demo Title,', 'Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description Demo Description&nbsp;', 'Demo Description', 'Demo Description', 'demo-title,', '1612118680.jpg', '1', '2021-01-31 18:44:40', '2021-01-31 18:44:40');

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
  `templateone_content` longtext DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `metakeywords` varchar(255) NOT NULL,
  `metadescription` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `slug` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `templateone_content`, `title`, `description`, `metakeywords`, `metadescription`, `position`, `status`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Insight', 'Insight&nbsp;Insight&nbsp;Insight&nbsp;Insight<br>', 'Insight', 'Insight', NULL, '1', 'insight', '2021-01-20 07:19:17', '2021-01-20 08:18:58'),
(2, NULL, 'The BVK Way', '&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;&nbsp;The BVK Way&nbsp;', 'The BVK Way', 'The BVK Way', NULL, '1', 'the-bvk-way', '2021-01-20 07:20:00', '2021-01-20 08:18:58'),
(3, NULL, 'Vision', 'Vision Vision Vision Vision Vision Vision Vision Vision&nbsp;<br>', 'Vision', 'Vision', NULL, '1', 'vision', '2021-01-20 07:40:53', '2021-01-20 08:18:58'),
(4, NULL, 'Business Philosophy', 'Business Philosophy&nbsp;Business Philosophy<br>', 'Business Philosophy', 'Business Philosophy', NULL, '1', 'business-philosophy', '2021-01-20 07:41:27', '2021-01-20 08:18:58'),
(5, NULL, 'Our History', 'History Content', 'Our History', 'Our History', NULL, '1', 'our-history', '2021-01-20 07:42:19', '2021-01-20 08:18:58'),
(6, NULL, 'Our Partner', 'Our Partner Content<br>', 'Our Partner', 'Our Partner', NULL, '1', 'our-partner', '2021-01-20 07:42:37', '2021-01-20 08:18:58'),
(7, NULL, 'Our Partners', 'Our Partners Content<br>', 'Our Partners', 'Our Partners', NULL, '1', 'our-partners', '2021-01-20 07:43:06', '2021-01-20 08:18:58'),
(8, NULL, 'Code of Conduct', 'Code of Conduct Content<br>', 'Code of Conduct', 'Code of Conduct', NULL, '1', 'code-of-conduct', '2021-01-20 07:43:24', '2021-01-20 08:18:58'),
(9, NULL, 'Group Values', 'Group Values Content<br>', 'Group Values', 'Group Values', NULL, '1', 'group-values', '2021-01-20 07:43:45', '2021-01-20 08:18:58'),
(10, NULL, 'Governance', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"34\" style=\"width: 26pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"34\" style=\"height:15.6pt;width:26pt\">Governance Content</td></tr></tbody></table>', 'Governance', 'Governance', NULL, '1', 'governance', '2021-01-20 07:46:55', '2021-01-20 08:18:58'),
(11, NULL, 'Awards & Recogniton', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"34\" style=\"width: 26pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"34\" style=\"height:15.6pt;width:26pt\">Awards &amp;\r\n  Recogniton Content</td></tr></tbody></table>', 'Awards & Recogniton', 'Awards & Recogniton', NULL, '1', 'awards-&-recogniton', '2021-01-20 07:47:09', '2021-01-20 08:18:58'),
(12, NULL, 'Business interests', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">Business\r\n  interests</td></tr></tbody></table>', 'Business interests', 'Business interests', NULL, '1', 'business-interests', '2021-01-20 07:47:30', '2021-01-20 08:18:58'),
(13, NULL, 'WMW Metal Fabrics Ltd', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 128pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:128pt\">WMW Metal Fabrics\r\n  Ltd</td></tr></tbody></table>', 'WMW Metal Fabrics Ltd', 'WMW Metal Fabrics Ltd', NULL, '1', 'wmw-metal-fabrics-ltd', '2021-01-20 07:47:41', '2021-01-20 08:18:58'),
(14, NULL, 'GKD India Ltd', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 128pt;\"><tbody><tr height=\"38\" style=\"mso-height-source:userset;height:28.95pt\">\r\n  <td height=\"38\" width=\"170\" style=\"height:28.95pt;width:128pt\">GKD India Ltd</td></tr></tbody></table>', 'GKD India Ltd', 'GKD India Ltd', NULL, '1', 'gkd-india-ltd', '2021-01-20 07:47:51', '2021-01-20 08:18:58'),
(15, NULL, 'BVK Infrasoft services Ltd', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 128pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:128pt\">BVK Infrasoft\r\n  services Ltd</td></tr></tbody></table>', 'BVK Infrasoft services Ltd', 'BVK Infrasoft services Ltd', NULL, '1', 'bvk-infrasoft-services-ltd', '2021-01-20 07:47:59', '2021-01-20 08:18:58'),
(16, NULL, 'Sustainability', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">Sustainability</td></tr></tbody></table>', 'Sustainability', 'Sustainability', NULL, '1', 'sustainability', '2021-01-20 07:48:14', '2021-01-20 08:18:58'),
(17, NULL, 'Our Approach', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Our Approach</td></tr></tbody></table>', 'Our Approach', 'Our Approach', NULL, '1', 'our-approach', '2021-01-20 07:51:32', '2021-01-20 08:18:58'),
(18, NULL, 'Explore', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"38\" style=\"mso-height-source:userset;height:28.95pt\">\r\n  <td height=\"38\" width=\"22\" style=\"height:28.95pt;width:16pt\">Explore</td></tr></tbody></table>', 'Explore', 'Explore', NULL, '1', 'explore', '2021-01-20 07:51:43', '2021-01-20 08:18:58'),
(19, NULL, 'Protecting our Customers', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 127pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:127pt\">Protecting our\r\n  Customers</td></tr></tbody></table>', 'Protecting our Customers', 'Protecting our Customers', NULL, '1', 'protecting-our-customers', '2021-01-20 07:51:53', '2021-01-20 08:18:58'),
(20, NULL, 'Protecting our People', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 127pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:127pt\">Protecting our\r\n  People</td></tr></tbody></table>', 'Protecting our People', 'Protecting our People', NULL, '1', 'protecting-our-people', '2021-01-20 07:52:00', '2021-01-20 08:18:58'),
(21, NULL, 'Protecting our Planet', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 127pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:127pt\">Protecting our\r\n  Planet</td></tr></tbody></table>', 'Protecting our Planet', 'Protecting our Planet', NULL, '1', 'protecting-our-planet', '2021-01-20 07:52:08', '2021-01-20 08:18:58'),
(22, NULL, 'Industry 4.0', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Industry 4.0</td></tr></tbody></table>', 'Industry 4.0', 'Industry 4.0', NULL, '1', 'industry-4.0', '2021-01-20 07:52:19', '2021-01-20 08:18:58'),
(23, NULL, 'EMS', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 127pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:127pt\">EMS</td></tr></tbody></table>', 'EMS', 'EMS', NULL, '1', 'ems', '2021-01-20 07:52:28', '2021-01-20 08:18:58'),
(24, NULL, 'MES', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"170\" style=\"width: 127pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"170\" style=\"height:15.6pt;width:127pt\">MES</td></tr></tbody></table>', 'MES', 'MES', NULL, '1', 'mes', '2021-01-20 07:52:35', '2021-01-20 08:18:58'),
(25, NULL, 'Career at BVK', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">Career at\r\n  BVK</td></tr></tbody></table>', 'Career at BVK', 'Career at BVK', NULL, '1', 'career-at-bvk', '2021-01-20 07:52:45', '2021-01-20 08:18:58'),
(26, NULL, 'Culture at BVK', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Culture at BVK</td></tr></tbody></table>', 'Culture at BVK', 'Culture at BVK', NULL, '1', 'culture-at-bvk', '2021-01-20 07:52:57', '2021-01-20 08:18:58'),
(27, NULL, 'Sports', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"38\" style=\"mso-height-source:userset;height:28.95pt\">\r\n  <td height=\"38\" width=\"150\" style=\"height:28.95pt;width:113pt\">Sports</td></tr></tbody></table>', 'Sports', 'Sports', NULL, '1', 'sports', '2021-01-20 07:54:45', '2021-01-20 08:18:58'),
(28, NULL, 'Lead Retreats', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Lead Retreats</td></tr></tbody></table>', 'Lead Retreats', 'Lead Retreats', NULL, '1', 'lead-retreats', '2021-01-20 07:54:54', '2021-01-20 08:18:58'),
(29, NULL, 'Hub Functions', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Hub Functions</td></tr></tbody></table>', 'Hub Functions', 'Hub Functions', NULL, '1', 'hub-functions', '2021-01-20 07:55:03', '2021-01-20 08:18:58'),
(30, NULL, 'Competencies at BVK', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Competencies at BVK</td></tr></tbody></table>', 'Competencies at BVK', 'Competencies at BVK', NULL, '1', 'competencies-at-bvk', '2021-01-20 07:55:14', '2021-01-20 08:18:58'),
(31, NULL, 'Leading from the front', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Leading from the\r\n  front</td></tr></tbody></table>', 'Leading from the front', 'Leading from the front', NULL, '1', 'leading-from-the-front', '2021-01-20 07:55:24', '2021-01-20 08:18:58'),
(32, NULL, 'Shop floor Excellence', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Shop floor Excellence</td></tr></tbody></table>', 'Shop floor Excellence', 'Shop floor Excellence', NULL, '1', 'shop-floor-excellence', '2021-01-20 07:55:44', '2021-01-20 08:18:58'),
(33, NULL, 'SFM Model', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">SFM Model</td></tr></tbody></table>', 'SFM Model', 'SFM Model', NULL, '1', 'sfm-model', '2021-01-20 07:55:52', '2021-01-20 08:18:58'),
(34, NULL, 'Quality systems', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Quality systems</td></tr></tbody></table>', 'Quality systems', 'Quality systems', NULL, '1', 'quality-systems', '2021-01-20 07:56:01', '2021-01-20 08:18:58'),
(35, NULL, 'People Recognition', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">People Recognition</td></tr></tbody></table>', 'People Recognition', 'People Recognition', NULL, '1', 'people-recognition', '2021-01-20 07:56:09', '2021-01-20 08:18:58'),
(36, NULL, 'Saftey', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Saftey</td></tr></tbody></table>', 'Saftey', 'Saftey', NULL, '1', 'saftey', '2021-01-20 07:56:18', '2021-01-20 08:18:58'),
(37, NULL, 'Training programs', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Training programs</td></tr></tbody></table>', 'Training programs', 'Training programs', NULL, '1', 'training-programs', '2021-01-20 07:56:24', '2021-01-20 08:18:58'),
(38, NULL, 'People Development', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">People Development</td></tr></tbody></table>', 'People Development', 'People Development', NULL, '1', 'people-development', '2021-01-20 07:56:33', '2021-01-20 08:18:58'),
(39, NULL, 'BVK Virtual University', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">BVK Virtual\r\n  University</td></tr></tbody></table>', 'BVK Virtual University', 'BVK Virtual University', NULL, '1', 'bvk-virtual-university', '2021-01-20 07:56:40', '2021-01-20 08:18:58'),
(40, NULL, 'Talent Development', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Talent Development</td></tr></tbody></table>', 'Talent Development', 'Talent Development', NULL, '1', 'talent-development', '2021-01-20 07:56:48', '2021-01-20 08:18:58'),
(41, NULL, 'Internship Program', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"22\" style=\"width: 16pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"22\" style=\"height:15.6pt;width:16pt\">Internship Program</td></tr></tbody></table>', 'Internship Program', 'Internship Program', NULL, '1', 'internship-program', '2021-01-20 07:56:57', '2021-01-20 08:18:58'),
(42, NULL, 'What\'s in it for you', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">What\'s in it for\r\n  you</td></tr></tbody></table>', 'What\'s in it for you', 'What\'s in it for you', NULL, '1', 'what\'s-in-it-for-you', '2021-01-20 07:57:05', '2021-01-20 08:18:58'),
(43, NULL, 'Areas of interest', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Areas of interest</td></tr></tbody></table>', 'Areas of interest', 'Areas of interest', NULL, '1', 'areas-of-interest', '2021-01-20 07:57:11', '2021-01-20 08:18:58'),
(44, NULL, 'CSR', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">CSR</td></tr></tbody></table>', 'CSR', 'CSR', NULL, '1', 'csr', '2021-01-20 07:57:20', '2021-01-20 08:18:58'),
(45, NULL, 'Our Philosophy & Focus', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"160\" style=\"height:15.6pt;width:120pt\">Our Philosophy\r\n  &amp; Focus</td></tr></tbody></table>', 'Our Philosophy & Focus', 'Our Philosophy & Focus', NULL, '1', 'our-philosophy-&-focus', '2021-01-20 07:57:30', '2021-01-20 08:18:58'),
(46, NULL, 'BMK Trust', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"38\" style=\"mso-height-source:userset;height:28.95pt\">\r\n  <td height=\"38\" width=\"160\" style=\"height:28.95pt;width:120pt\">BMK Trust</td></tr></tbody></table>', 'BMK Trust', 'BMK Trust', NULL, '1', 'bmk-trust', '2021-01-20 07:57:38', '2021-01-20 08:18:58'),
(47, NULL, 'Disha Foundation', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"160\" style=\"height:15.6pt;width:120pt\">Disha Foundation</td></tr></tbody></table>', 'Disha Foundation', 'Disha Foundation', NULL, '1', 'disha-foundation', '2021-01-20 07:57:45', '2021-01-20 08:18:58'),
(48, NULL, 'Social Impact', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"160\" style=\"height:15.6pt;width:120pt\">Social Impact</td></tr></tbody></table>', 'Social Impact', 'Social Impact', NULL, '1', 'social-impact', '2021-01-20 07:57:55', '2021-01-20 08:18:58'),
(49, NULL, 'Our Assosiations', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"160\" style=\"height:15.6pt;width:120pt\">Our Assosiations</td></tr></tbody></table>', 'Our Assosiations', 'Our Assosiations', NULL, '1', 'our-assosiations', '2021-01-20 07:58:04', '2021-01-20 08:18:58'),
(50, NULL, 'Support our Inititaives', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"160\" style=\"width: 120pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"160\" style=\"height:15.6pt;width:120pt\">Support our\r\n  Inititaives</td></tr></tbody></table>', 'Support our Inititaives', 'Support our Inititaives', NULL, '1', 'support-our-inititaives', '2021-01-20 07:58:14', '2021-01-20 08:18:58'),
(51, NULL, 'News & Media', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">News &amp;\r\n  Media</td></tr></tbody></table>', 'News & Media', 'News & Media', NULL, '1', 'news-&-media', '2021-01-20 07:58:23', '2021-01-20 08:18:58'),
(52, NULL, 'Latest at BVK', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Latest at BVK</td></tr></tbody></table>', 'Latest at BVK', 'Latest at BVK', NULL, '1', 'latest-at-bvk', '2021-01-20 07:58:30', '2021-01-20 08:18:58'),
(53, NULL, 'Cases & Articles', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"38\" style=\"mso-height-source:userset;height:28.95pt\">\r\n  <td height=\"38\" width=\"150\" style=\"height:28.95pt;width:113pt\">Cases &amp;\r\n  Articles</td></tr></tbody></table>', 'Cases & Articles', 'Cases & Articles', NULL, '1', 'cases-&-articles', '2021-01-20 07:58:38', '2021-01-20 08:18:58'),
(54, NULL, 'Contact us', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"26\" style=\"width: 20pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" class=\"xl65\" width=\"26\" style=\"height:15.6pt;width:20pt\">Contact us</td></tr></tbody></table>', 'Contact us', 'Contact us', NULL, '1', 'contact-us', '2021-01-20 07:58:47', '2021-01-20 08:18:58'),
(55, NULL, 'Locations', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"150\" style=\"width: 113pt;\"><tbody><tr height=\"21\" style=\"height:15.6pt\">\r\n  <td height=\"21\" width=\"150\" style=\"height:15.6pt;width:113pt\">Locations</td></tr></tbody></table>', 'Locations', 'Locations', NULL, '1', 'locations', '2021-01-20 07:58:54', '2021-01-20 08:18:58'),
(56, NULL, 'About Jaipur', '<p style=\"margin-bottom: 1.71429rem; padding: 0px; border: 0px; font-size: 14px; line-height: 1.71429; color: rgb(74, 74, 74); font-family: Montserrat;\">We help our customers to produce cheese for all occasions; from pizza toppings to prepared dishes, gourmet desserts and snacks.</p><p style=\"margin-bottom: 1.71429rem; padding: 0px; border: 0px; font-size: 14px; line-height: 1.71429; color: rgb(74, 74, 74); font-family: Montserrat;\">Cow milk is the most common choice for cheese production, although milk from buffalos, goats and sheep are popular as well. Cheese comes in a multitude of textures and flavours, for example:</p>', 'Cow milk is the most common', 'Cow milk is the most common', NULL, '1', 'About-Jaipur', '2021-01-31 07:05:19', '2021-01-31 07:05:19');

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
  `day` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `googlemap` longtext NOT NULL,
  `contenttext` longtext NOT NULL,
  `contenttext2` longtext NOT NULL,
  `image2` varchar(255) NOT NULL,
  `contenttext3` longtext NOT NULL,
  `image3` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `image`, `name`, `email`, `phone`, `address`, `day`, `time`, `googlemap`, `contenttext`, `contenttext2`, `image2`, `contenttext3`, `image3`, `created_at`, `updated_at`) VALUES
(10, '16113135243.jpg', 'BVK Group', 'info@bvkgroup.in', '1234567890', 'Alpha School, Patrakar Colony, Mansarovar, Jaipur 302020', 'Monday-Friday', '10:00AM  To 6:00PM', '<iframe\r\n                                    src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3560.0580126938294!2d75.72192811555658!3d26.838107083159727!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x396dca7fb557bf11%3A0x54fc6a06ebe85270!2sAlpha%20Bal%20Academy%20Senior%20Secondary%20School!5e0!3m2!1sen!2sin!4v1608829694058!5m2!1sen!2sin\"\r\n                                    width=\"100%\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"\r\n                                    aria-hidden=\"false\" tabindex=\"0\"></iframe>', 'Please select the country/location and office you wish to contact. Our local offices answer all business-related questions. For questions related to jobs at Tetra Pak,​ please use Apply online in our Career section', 'Our sales teams are happy to answer any sales or product queries.\r\n                                                    Please fill out our form so we can better be of assistance.', '16113135243.jpg', 'Please fill out the form and tell us in more detail about your query and we will get back to you as soon as possible.', '16113135243.jpg', '2021-01-22 10:31:58', '2021-01-22 10:31:58');

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
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` int(11) NOT NULL,
  `company` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `responsibility` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `company`, `title`, `slug`, `keyword`, `location`, `description`, `responsibility`, `created_at`, `updated_at`) VALUES
(11, 'BVK Group', 'Customer Service Executive', 'BVK-Group1610364281', 'Calling, Customer Care', 'Jaipur Rajasthan', '<p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">At Tetra Pak we touch millions of people’s lives every day, ensuring better nutrition and healthier lifestyles through safe packaging and food processing solutions. Guided by our global brand promise, PROTECTS WHAT’S GOOD, we strive to make a difference by protecting food, people and our futures.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">To do this we need more than smart technology.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">We are looking for world-class engineering and scientific talent.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">People like you, who want to work with people like us.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">&nbsp;</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\"><span style=\"font-weight: bolder; color: rgb(58, 56, 155);\">Public Affairs Director</span></p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">We are looking for a Public Affairs Director for our GMEA cluster.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">This role is a local contract to be based in Turkey , Egypt or Pakistan.</p>', '<p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\"><span style=\"font-weight: bolder; color: rgb(58, 56, 155);\">What will you do</span></p><p style=\"margin-bottom: 10px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\">As a Public Affairs Director you will:</p><ul style=\"margin-bottom: 15px; padding-left: 20px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\"><li style=\"margin-bottom: 8px; position: relative;\">Develop and lead implementation of an public affairs plan to engage with the policy environment and position Tetra Pak as partner and solution provider in areas relevant for the execution of growth strategy in the region, set the priorities and objectives for the region.</li><li style=\"margin-bottom: 8px; position: relative;\">Proactively monitor public policy and regulatory developments, emerging trends, and other political or public issues in the region and key markets.</li><li style=\"margin-bottom: 8px; position: relative;\">Ensure measurable deliverables and metrics aligned within the Communications function and the cluster/country leadership.</li></ul><ul style=\"margin-bottom: 15px; padding-left: 20px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\"><li style=\"margin-bottom: 8px; position: relative;\">Lead/coordinate advocacy campaigns and external positioning with policy stakeholders; identify external opportunities and platforms to strategically deploy thought leadership.</li></ul><ul style=\"margin-bottom: 15px; padding-left: 20px; color: rgb(33, 33, 33); font-family: Roboto, sans-serif; text-align: justify;\"><li style=\"margin-bottom: 8px; position: relative;\">Represent Tetra Pak in regional trade associations and stakeholder platforms, including leveraging existing opportunities or creating new ones, and mobilizing resources.</li><li style=\"margin-bottom: 8px; position: relative;\">Ensure to build and manage relationships with key policy stakeholders as well as coalitions with competitors/industry, NGOs and other influencers, secure Tetra Pak representation in key industry associations and networks.</li><li style=\"margin-bottom: 8px; position: relative;\">Provide strategic direction to in-market teams in the creation and execution of local public affairs engagement and/or direct local teams, as needed.</li><li style=\"margin-bottom: 8px; position: relative;\">Support development of Tetra Pak corporate positions and Public Affairs tools, secure quality of advocacy materials and visibility in external &amp; internal communication channels.</li><li style=\"margin-bottom: 8px; position: relative;\">Build / enhance capabilities, conduct trainings, coach &amp; mentor local teams .</li></ul>', '2021-01-11 11:24:41', '2021-01-11 11:24:41'),
(13, 'Sekawati Bags', 'Punching Bag', 'Sekawati-Bags1610523718', 'Bag, Garment', 'Jaipur Rajasthan', '<p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><br></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br></span></p><p><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br></span></p>', '<div><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><span style=\"color: rgb(255, 255, 255); font-family: helvetica, &quot;helvetica neue&quot;, Helvetica, Arial, sans-serif; font-size: 12.6px; background-color: rgba(0, 0, 0, 0.6);\"><br></span></div><div><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\">This beautiful yellow shoulder tote by Robert Matthew allows you to bring everything with you whenever you need to, but fashionably of course! Keep yourself organized with the interior and exterior pockets while getting compliments from everyone on the gorgeous gold hardware on this stunning bag.</span><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br></span></div><div><span style=\"color: rgb(14, 23, 36); font-family: Roboto, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;\"><br></span></div>', '2021-01-13 07:41:58', '2021-01-13 08:40:05'),
(14, 'BVK', 'Designer & Sales Marketing', 'BVK1610523862', 'Dsigning. Garment', 'Bangalore, KA, IN', '<span style=\"color: rgb(17, 17, 17); font-family: Arial, Verdana; font-size: 13.3013px; text-align: justify;\">Design is provided by the buyer. After placing an order buyer send the technical sheet and art-work of an order to the merchandiser. This process is done both manually or by using the computer.</span><br><div><span style=\"color: rgb(17, 17, 17); font-family: Arial, Verdana; font-size: 13.3013px; text-align: justify;\">Complete garments are packed here by using the buyer’s instructed poly bag. Garments packing are done by using the manual method.</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, Verdana; font-size: 13.3013px; text-align: justify;\"><br></span></div><div><span style=\"color: rgb(17, 17, 17); font-family: Arial, Verdana; font-size: 13.3013px; text-align: justify;\">Complete garments are packed here by using the buyer’s instructed poly bag. Garments packing are done by using the manual method.</span><span style=\"color: rgb(17, 17, 17); font-family: Arial, Verdana; font-size: 13.3013px; text-align: justify;\"><br></span></div>', '<ol style=\"margin-bottom: 5px; padding: 0px 0px 0px 15px; border: 0px; font-size: 10.5px; font-family: Verdana, Geneva, sans-serif; vertical-align: baseline; zoom: 1; overflow: auto; color: rgb(85, 85, 85);\"><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Has&nbsp;the<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>responsibility&nbsp;for<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>running<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>the&nbsp;garment&nbsp;department&nbsp;including&nbsp;production</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">&nbsp;planning,<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>operation&nbsp;control,&nbsp;measuring<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>and&nbsp;monitoring<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>of&nbsp;product&nbsp;and&nbsp;the&nbsp;process.</span></li><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Establishing&nbsp;and&nbsp;maintaining&nbsp;identification&nbsp;and&nbsp;traceability<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.15pt;\">&nbsp;</span>requirement.</span></li><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Inspection&nbsp;test&nbsp;status,<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>taking&nbsp;corrective<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>and&nbsp;preventive<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>action.</span></li><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Controlling<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>nonconforming&nbsp;products&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">at</span>&nbsp;intermediate&nbsp;and&nbsp;final&nbsp;stages&nbsp;<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">in</span>&nbsp;Garment</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">&nbsp;Department.</span></li><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Analyzing<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>product&nbsp;and&nbsp;process&nbsp;performance&nbsp;from<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>measurement&nbsp;process&nbsp;to&nbsp;identify&nbsp;area</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">&nbsp;for&nbsp;improvement.</span></li><li style=\"margin: 0px 0px 0px 15px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 13px; font-family: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">Provide<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>supports<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>for&nbsp;approval&nbsp;and&nbsp;maintenance&nbsp;of&nbsp;equipment&nbsp;related&nbsp;to&nbsp;Garment</span><span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-size: 12pt; font-family: &quot;Times New Roman&quot;, serif; vertical-align: baseline; line-height: 18.4px; color: black;\">&nbsp;Department&nbsp;and&nbsp;training<span style=\"margin: 0px; padding: 0px; border: 0px; font-weight: inherit; font-style: inherit; font-family: inherit; vertical-align: baseline; letter-spacing: -0.1pt;\">&nbsp;</span>of&nbsp;stuff&nbsp;in&nbsp;the&nbsp;department.</span></li></ol>', '2021-01-13 07:44:22', '2021-01-13 07:44:22'),
(15, 'Dzoneindia', 'sales Marketing', 'Dzoneindia1610876393', 'It Sales. SOftware Sales', 'Jaipur Rajstan', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><br><div><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\"><br></span></div><div><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\"><br></span></div>', '<span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><br><div><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\">In this role you will drive the implementation of the Tetra Pak Public Affairs strategy across the region to ensure a regulatory environment that supports, or does not harm, our business objectives.</span><span style=\"color: rgb(33, 33, 33); font-family: Roboto, sans-serif; font-size: 14px; text-align: justify;\"><br></span></div>', '2021-01-17 09:39:53', '2021-01-17 09:46:58');

-- --------------------------------------------------------

--
-- Table structure for table `jobapply`
--

CREATE TABLE `jobapply` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jobapply`
--

INSERT INTO `jobapply` (`id`, `job_id`, `name`, `email`, `phone`, `image`, `description`, `created_at`, `updated_at`) VALUES
(24, 11, 'manish', 'manishprajapati8533@gmail.com', '7521024187', '1610870146.pdf', 'vgkhjhuj', '2021-01-17 07:55:46', '2021-01-17 07:55:46'),
(26, 11, 'manish', 'info@maamarts.com', '7521024187', '1610872807.pdf', 'ghyhjmjk', '2021-01-17 08:40:07', '2021-01-17 08:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `position` enum('1','0') NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `label_menu` varchar(100) NOT NULL,
  `url_menu` varchar(300) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `label_menu`, `url_menu`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Insight 1', 'insight', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(2, 'The BVK Way', 'The BVK Way', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(3, 'Vision', 'vision', 2, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(4, 'Business Philosophy', 'business-philosophy', 2, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(5, 'Our History', 'business-interests', 2, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(6, 'Our Partner', 'our-partner', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(7, 'Our Partners', 'our-partners', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(8, 'Code of Conduct', 'code-of-conduct', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(9, 'Group Values', 'group-values', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(10, 'Governance', 'governance', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(11, 'Awards & Recogniton', 'awards-&-recogniton', 1, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(12, 'Business interests', 'business-interests', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(13, 'WMW Metal Fabrics Ltd', 'wmw-metal-fabrics-ltd', 12, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(14, 'GKD India Ltd', 'gkd-india-ltd', 12, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(15, 'BVK Infrasoft services Ltd', 'bvk-infrasoft-services-ltd', 12, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(16, 'Sustainability', 'sustainability', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(17, 'Our Approach', 'our-approach', 16, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(18, 'Explore', 'explore', 16, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(19, 'Protecting our Customers', 'protecting-our-customers', 18, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(20, 'Protecting our People', 'protecting-our-people', 18, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(21, 'Protecting our Planet', 'protecting-our-planet', 18, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(22, 'Industry 4.0', 'industry-4.0', 16, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(23, 'EMS', 'ems', 22, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(24, 'MES', 'mes', 22, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(25, 'Career at BVK', 'career-at-bvk', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(26, 'Culture at BVK', 'culture-at-bvk', 25, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(27, 'Sports', 'sports', 26, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(28, 'Lead Retreats', 'lead-retreats', 26, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(29, 'Hub Functions', 'hub-functions', 26, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(30, 'Competencies at BVK', 'competencies-at-bvk', 25, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(31, 'Leading from the front', 'leading-from-the-front', 30, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(32, 'Shop floor Excellence', 'shop-floor-excellence', 25, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(33, 'SFM Model', 'sfm-model', 32, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(34, 'Quality systems', 'quality-systems', 32, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(35, 'People Recognition', 'people-recognition', 32, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(36, 'Saftey', 'saftey', 32, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(37, 'Training programs', 'training-programs', 32, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(38, 'People Development', 'people-development', 25, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(39, 'BVK Virtual University', 'bvk-virtual-university', 38, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(40, 'Talent Development', 'talent-development', 38, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(41, 'Internship Program', 'internship-program', 25, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(42, 'What\'s in it for you', 'what\'s-in-it-for-you', 41, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(43, 'Areas of interest', 'areas-of-interest', 41, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(44, 'CSR', 'csr', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(45, 'Our Philosophy & Focus', 'our-philosophy-&-focus', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(46, 'BMK Trust', 'bmk-trust', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(47, 'Disha Foundation', 'disha-foundation', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(48, 'Social Impact', 'social-impact', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(49, 'Our Assosiations', 'our-assosiations', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(50, 'Support our Inititaives', 'support-our-inititaives', 44, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(51, 'News & Media', 'news-&-media', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(52, 'Latest at BVK', 'latest-at-bvk', 51, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(53, 'Cases & Articles', 'cases-&-articles', 51, '2021-02-23 05:34:04', '2021-02-23 05:34:04'),
(54, 'About Jaipur', 'about-jaipur', 0, '2021-02-23 05:34:04', '2021-02-23 05:34:04');

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
(33, '1610790486.jpg', '1', 'Recognized with prestigious double ‘A’ score for global climate and forests stewardship', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests<br>', '0', '2021-01-02 09:36:58', '2021-01-02 09:36:58'),
(34, '1610790504.jpg', '2', 'Research study reveals food safety-environment dilemma fostered by COVID-19 pandemic', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests<br>', '0', '2021-01-02 09:42:25', '2021-01-02 09:42:25'),
(35, '1610790529.jpg', '3', 'Stora Enso to explore the building of a recycling line for used beverage cartons', 'It has been recognized for leadership in corporate sustainability by global environmental non-profit CDP, securing a place on its prestigious ‘A List’ for tackling climate change, as well as acting to protect forests&nbsp;<br>', '1', '2021-01-02 09:43:33', '2021-01-02 09:43:33');

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
(18, 'Syfer-XT', '1610790345.jpg', '1', 'Total iron care... test', '0', '2021-01-01 12:39:18', '2021-01-01 12:39:18'),
(19, 'Syfer-XT', '1610790365.jpg', '2', 'Total iron care...', '0', '2021-01-01 12:40:08', '2021-01-01 12:40:08'),
(20, 'Syfer-XT', '1610790378.jpg', '3', 'Total iron care...', '0', '2021-01-01 12:40:42', '2021-01-01 12:40:42'),
(21, 'Syfer-XT', '1610790394.jpg', '4', 'Total iron care...', '0', '2021-01-01 12:40:53', '2021-01-01 12:40:53');

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
-- Table structure for table `photogallery`
--

CREATE TABLE `photogallery` (
  `id` int(11) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'BVK', '1', 'info@bvkgroup.in', '8299639330', 'Maam Arts', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20', NULL, '$2y$10$GT8fJgkYF59P3n07on6.zO8gzJXi8Ivx/6wBo29k2ZoGGAG085vbW', NULL, '2020-08-13 09:14:39', '2020-08-13 09:14:39'),
(4, 'Ankur Srivastava', '0', 'ankurssri87@gmail.com', '+918299639330', 'E-279 Mailkmau Colony', '1,5', NULL, '$2y$10$3mLgwuO7olGV9SQdBeV6QuBC8huTL39UrQMyCn1glIZ7Gqm6YxRtm', NULL, '2020-10-25 04:12:56', '2020-10-25 04:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `videogallery`
--

CREATE TABLE `videogallery` (
  `id` int(11) NOT NULL,
  `video` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
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
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobapply`
--
ALTER TABLE `jobapply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
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
-- Indexes for table `photogallery`
--
ALTER TABLE `photogallery`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `videogallery`
--
ALTER TABLE `videogallery`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `home_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `block2`
--
ALTER TABLE `block2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `block3`
--
ALTER TABLE `block3`
  MODIFY `ob_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `block4`
--
ALTER TABLE `block4`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `clientslogo`
--
ALTER TABLE `clientslogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `contactform`
--
ALTER TABLE `contactform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job`
--
ALTER TABLE `job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `jobapply`
--
ALTER TABLE `jobapply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
-- AUTO_INCREMENT for table `photogallery`
--
ALTER TABLE `photogallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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

--
-- AUTO_INCREMENT for table `videogallery`
--
ALTER TABLE `videogallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
