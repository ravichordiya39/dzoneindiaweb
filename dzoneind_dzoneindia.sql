-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2021 at 06:56 AM
-- Server version: 5.7.36
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dzoneind_dzoneindia`
--

-- --------------------------------------------------------

--
-- Table structure for table `activation_history`
--

CREATE TABLE `activation_history` (
  `id` int(11) NOT NULL,
  `suser` varchar(255) NOT NULL,
  `ruser` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `date_time` datetime NOT NULL,
  `package` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `coin_rate` float NOT NULL,
  `sms` int(11) NOT NULL,
  `coin_cell_rate` float NOT NULL,
  `daytrade` date DEFAULT NULL,
  `fixtrade` date DEFAULT NULL,
  `speed_trade` date DEFAULT NULL,
  `bg_img` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `coin_rate`, `sms`, `coin_cell_rate`, `daytrade`, `fixtrade`, `speed_trade`, `bg_img`) VALUES
(1, 'admin', '7c4a8d09ca3762af61e59520943dc26494f8941b', 9, 238, 9, '2021-03-07', '2021-03-07', '2021-03-07', '0.02939575');

-- --------------------------------------------------------

--
-- Table structure for table `admin_add`
--

CREATE TABLE `admin_add` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `type` varchar(50) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_banks`
--

CREATE TABLE `admin_banks` (
  `id` int(11) NOT NULL,
  `upi` varchar(255) NOT NULL DEFAULT '',
  `ac_holder` varchar(255) NOT NULL DEFAULT '',
  `ifsc` varchar(255) NOT NULL DEFAULT '',
  `account` varchar(255) NOT NULL DEFAULT '',
  `bank` varchar(255) NOT NULL DEFAULT '',
  `m_id` varchar(255) NOT NULL DEFAULT '0',
  `ac_type` varchar(255) NOT NULL DEFAULT '',
  `paytm_status` enum('No','Yes') NOT NULL DEFAULT 'No',
  `manual_status` enum('No','Yes') NOT NULL DEFAULT 'Yes',
  `min` float NOT NULL DEFAULT '10',
  `max` float NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin_noti`
--

CREATE TABLE `admin_noti` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `date_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `apis`
--

CREATE TABLE `apis` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `transaction_pass` varchar(255) DEFAULT NULL,
  `dispute_email` varchar(255) DEFAULT NULL,
  `timestamps` bigint(20) DEFAULT NULL,
  `api_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `balance` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `apis`
--

INSERT INTO `apis` (`id`, `token`, `user_id`, `password`, `transaction_pass`, `dispute_email`, `timestamps`, `api_name`, `status`, `balance`) VALUES
(1, '40717e12df5c0af3d2c48f2aef2276eda1b0cb67d11dde2312207dc51992c431', '29', '', '', NULL, 1536240451, 'JPRWEBS', 1, 0),
(2, '23ae021f-c559-4ceb-a164-3cdd0e671d27', '29', '', '', NULL, 1536240451, 'STC Recharge', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`) VALUES
(1, '16339326283JG5I.jpg'),
(2, '1634186072773G1.png'),
(3, '1634186076ADEK8.png');

-- --------------------------------------------------------

--
-- Table structure for table `buy_product`
--

CREATE TABLE `buy_product` (
  `id` int(11) NOT NULL,
  `order_history_id` int(11) NOT NULL,
  `product_id` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `mrp` decimal(10,2) NOT NULL,
  `gst` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL,
  `quantity` varchar(255) NOT NULL,
  `discount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Pending','Approved','Delivered','Rejected') NOT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `frenchise_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `frenchise_product_id` int(11) DEFAULT NULL,
  `p_product_id` int(11) DEFAULT NULL,
  `actual_price` float NOT NULL,
  `discount_price` float(10,2) DEFAULT NULL,
  `quantity` float NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car_fund`
--

CREATE TABLE `car_fund` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `car_fund_report`
--

CREATE TABLE `car_fund_report` (
  `id` int(11) NOT NULL,
  `total_turn_over` float(10,2) NOT NULL,
  `elg_u_rank2` int(11) DEFAULT '0',
  `elg_u_rank3` int(11) DEFAULT '0',
  `elg_u_rank4` int(11) DEFAULT '0',
  `elg_u_rank5` int(11) DEFAULT '0',
  `u_bonus_rank2` float(10,2) DEFAULT '0.00',
  `u_bonus_rank3` float(10,2) DEFAULT NULL,
  `u_bonus_rank4` float(10,2) DEFAULT NULL,
  `u_bonus_rank5` float(10,2) DEFAULT NULL,
  `fund_type` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_status` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `circles`
--

CREATE TABLE `circles` (
  `id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circles`
--

INSERT INTO `circles` (`id`, `state_name`) VALUES
(1, 'Andhra Pradesh '),
(2, 'Assam'),
(3, 'Bihar & Jharkhand'),
(4, 'Chennai'),
(5, 'Delhi'),
(6, 'Gujarat'),
(7, 'Haryana'),
(8, 'Himachal Pradesh'),
(9, 'Jammu & Kashmir'),
(10, 'Karnataka'),
(11, 'Kerala'),
(12, 'Kolkata'),
(13, 'Maharashtra'),
(14, 'Madhya Pradesh'),
(15, 'Mumbai'),
(16, 'North East'),
(17, 'Orissa'),
(18, 'Punjab'),
(19, 'Rajasthan'),
(20, 'Tamil Nadu '),
(21, 'Uttar Pradesh - East '),
(22, 'Uttar Pradesh - West '),
(23, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `circle_codes`
--

CREATE TABLE `circle_codes` (
  `id` int(11) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `circle_codes`
--

INSERT INTO `circle_codes` (`id`, `circle_id`, `code`, `api_id`) VALUES
(1, 1, '1', 1),
(2, 2, '2', 1),
(3, 3, '3', 1),
(4, 4, '4', 1),
(5, 5, '5', 1),
(6, 6, '6', 1),
(7, 7, '7', 1),
(8, 8, '8', 1),
(9, 9, '9', 1),
(11, 10, '10', 1),
(12, 11, '11', 1),
(13, 12, '12', 1),
(14, 14, '14', 1),
(15, 13, '13', 1),
(16, 15, '15', 1),
(17, 16, '16', 1),
(18, 17, '17', 1),
(19, 18, '18', 1),
(20, 19, '19', 1),
(21, 20, '20', 1),
(22, 21, '21', 1),
(23, 22, '22', 1),
(24, 23, '23', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company_harder_income`
--

CREATE TABLE `company_harder_income` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `phonecode` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `phonecode`) VALUES
(1, 'Afghanistan', 93),
(2, 'Albania', 355),
(3, 'Algeria', 213),
(4, 'American Samoa', 1684),
(5, 'Andorra', 376),
(6, 'Angola', 244),
(7, 'Anguilla', 1264),
(9, 'Antigua and Barbuda', 1268),
(10, 'Argentina', 54),
(11, 'Armenia', 374),
(12, 'Aruba', 297),
(13, 'Australia', 61),
(14, 'Austria', 43),
(15, 'Azerbaijan', 994),
(16, 'Bahamas', 1242),
(17, 'Bahrain', 973),
(18, 'Bangladesh', 880),
(19, 'Barbados', 1246),
(20, 'Belarus', 375),
(21, 'Belgium', 32),
(22, 'Belize', 501),
(23, 'Benin', 229),
(24, 'Bermuda', 1441),
(25, 'Bhutan', 975),
(26, 'Bolivia', 591),
(27, 'Bosnia and Herzegovina', 387),
(28, 'Botswana', 267),
(30, 'Brazil', 55),
(31, 'British Indian Ocean Territory', 246),
(32, 'Brunei Darussalam', 673),
(33, 'Bulgaria', 359),
(34, 'Burkina Faso', 226),
(35, 'Burundi', 257),
(36, 'Cambodia', 855),
(37, 'Cameroon', 237),
(38, 'Canada', 1),
(39, 'Cape Verde', 238),
(40, 'Cayman Islands', 1345),
(41, 'Central African Republic', 236),
(42, 'Chad', 235),
(43, 'Chile', 56),
(44, 'China', 86),
(45, 'Christmas Island', 61),
(46, 'Cocos (Keeling) Islands', 672),
(47, 'Colombia', 57),
(48, 'Comoros', 269),
(49, 'Congo', 242),
(50, 'Congo, the Democratic Republic of the', 242),
(51, 'Cook Islands', 682),
(52, 'Costa Rica', 506),
(53, 'Cote D\'Ivoire', 225),
(54, 'Croatia', 385),
(55, 'Cuba', 53),
(56, 'Cyprus', 357),
(57, 'Czech Republic', 420),
(58, 'Denmark', 45),
(59, 'Djibouti', 253),
(60, 'Dominica', 1767),
(61, 'Dominican Republic', 1809),
(62, 'Ecuador', 593),
(63, 'Egypt', 20),
(64, 'El Salvador', 503),
(65, 'Equatorial Guinea', 240),
(66, 'Eritrea', 291),
(67, 'Estonia', 372),
(68, 'Ethiopia', 251),
(69, 'Falkland Islands (Malvinas)', 500),
(70, 'Faroe Islands', 298),
(71, 'Fiji', 679),
(72, 'Finland', 358),
(73, 'France', 33),
(74, 'French Guiana', 594),
(75, 'French Polynesia', 689),
(77, 'Gabon', 241),
(78, 'Gambia', 220),
(79, 'Georgia', 995),
(80, 'Germany', 49),
(81, 'Ghana', 233),
(82, 'Gibraltar', 350),
(83, 'Greece', 30),
(84, 'Greenland', 299),
(85, 'Grenada', 1473),
(86, 'Guadeloupe', 590),
(87, 'Guam', 1671),
(88, 'Guatemala', 502),
(89, 'Guinea', 224),
(90, 'Guinea-Bissau', 245),
(91, 'Guyana', 592),
(92, 'Haiti', 509),
(94, 'Holy See (Vatican City State)', 39),
(95, 'Honduras', 504),
(96, 'Hong Kong', 852),
(97, 'Hungary', 36),
(98, 'Iceland', 354),
(99, 'India', 91),
(100, 'Indonesia', 62),
(101, 'Iran, Islamic Republic of', 98),
(102, 'Iraq', 964),
(103, 'Ireland', 353),
(104, 'Israel', 972),
(105, 'Italy', 39),
(106, 'Jamaica', 1876),
(107, 'Japan', 81),
(108, 'Jordan', 962),
(109, 'Kazakhstan', 7),
(110, 'Kenya', 254),
(111, 'Kiribati', 686),
(112, 'Korea, Democratic People\'s Republic of', 850),
(113, 'Korea, Republic of', 82),
(114, 'Kuwait', 965),
(115, 'Kyrgyzstan', 996),
(116, 'Lao People\'s Democratic Republic', 856),
(117, 'Latvia', 371),
(118, 'Lebanon', 961),
(119, 'Lesotho', 266),
(120, 'Liberia', 231),
(121, 'Libyan Arab Jamahiriya', 218),
(122, 'Liechtenstein', 423),
(123, 'Lithuania', 370),
(124, 'Luxembourg', 352),
(125, 'Macao', 853),
(126, 'Macedonia, the Former Yugoslav Republic of', 389),
(127, 'Madagascar', 261),
(128, 'Malawi', 265),
(129, 'Malaysia', 60),
(130, 'Maldives', 960),
(131, 'Mali', 223),
(132, 'Malta', 356),
(133, 'Marshall Islands', 692),
(134, 'Martinique', 596),
(135, 'Mauritania', 222),
(136, 'Mauritius', 230),
(137, 'Mayotte', 269),
(138, 'Mexico', 52),
(139, 'Micronesia, Federated States of', 691),
(140, 'Moldova, Republic of', 373),
(141, 'Monaco', 377),
(142, 'Mongolia', 976),
(143, 'Montserrat', 1664),
(144, 'Morocco', 212),
(145, 'Mozambique', 258),
(146, 'Myanmar', 95),
(147, 'Namibia', 264),
(148, 'Nauru', 674),
(149, 'Nepal', 977),
(150, 'Netherlands', 31),
(151, 'Netherlands Antilles', 599),
(152, 'New Caledonia', 687),
(153, 'New Zealand', 64),
(154, 'Nicaragua', 505),
(155, 'Niger', 227),
(156, 'Nigeria', 234),
(157, 'Niue', 683),
(158, 'Norfolk Island', 672),
(159, 'Northern Mariana Islands', 1670),
(160, 'Norway', 47),
(161, 'Oman', 968),
(162, 'Pakistan', 92),
(163, 'Palau', 680),
(164, 'Palestinian Territory, Occupied', 970),
(165, 'Panama', 507),
(166, 'Papua New Guinea', 675),
(167, 'Paraguay', 595),
(168, 'Peru', 51),
(169, 'Philippines', 63),
(171, 'Poland', 48),
(172, 'Portugal', 351),
(173, 'Puerto Rico', 1787),
(174, 'Qatar', 974),
(175, 'Reunion', 262),
(176, 'Romania', 40),
(177, 'Russian Federation', 70),
(178, 'Rwanda', 250),
(179, 'Saint Helena', 290),
(180, 'Saint Kitts and Nevis', 1869),
(181, 'Saint Lucia', 1758),
(182, 'Saint Pierre and Miquelon', 508),
(183, 'Saint Vincent and the Grenadines', 1784),
(184, 'Samoa', 684),
(185, 'San Marino', 378),
(186, 'Sao Tome and Principe', 239),
(187, 'Saudi Arabia', 966),
(188, 'Senegal', 221),
(189, 'Serbia and Montenegro', 381),
(190, 'Seychelles', 248),
(191, 'Sierra Leone', 232),
(192, 'Singapore', 65),
(193, 'Slovakia', 421),
(194, 'Slovenia', 386),
(195, 'Solomon Islands', 677),
(196, 'Somalia', 252),
(197, 'South Africa', 27),
(199, 'Spain', 34),
(200, 'Sri Lanka', 94),
(201, 'Sudan', 249),
(202, 'Suriname', 597),
(203, 'Svalbard and Jan Mayen', 47),
(204, 'Swaziland', 268),
(205, 'Sweden', 46),
(206, 'Switzerland', 41),
(207, 'Syrian Arab Republic', 963),
(208, 'Taiwan, Province of China', 886),
(209, 'Tajikistan', 992),
(210, 'Tanzania, United Republic of', 255),
(211, 'Thailand', 66),
(212, 'Timor-Leste', 670),
(213, 'Togo', 228),
(214, 'Tokelau', 690),
(215, 'Tonga', 676),
(216, 'Trinidad and Tobago', 1868),
(217, 'Tunisia', 216),
(218, 'Turkey', 90),
(219, 'Turkmenistan', 7370),
(220, 'Turks and Caicos Islands', 1649),
(221, 'Tuvalu', 688),
(222, 'Uganda', 256),
(223, 'Ukraine', 380),
(224, 'United Arab Emirates', 971),
(225, 'United Kingdom', 44),
(226, 'United States', 1),
(227, 'United States Minor Outlying Islands', 1),
(228, 'Uruguay', 598),
(229, 'Uzbekistan', 998),
(230, 'Vanuatu', 678),
(231, 'Venezuela', 58),
(232, 'Viet Nam', 84),
(233, 'Virgin Islands, British', 1284),
(234, 'Virgin Islands, U.s.', 1340),
(235, 'Wallis and Futuna', 681),
(236, 'Western Sahara', 212),
(237, 'Yemen', 967),
(238, 'Zambia', 260),
(239, 'Zimbabwe', 263);

-- --------------------------------------------------------

--
-- Table structure for table `downline`
--

CREATE TABLE `downline` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `sponser_id` varchar(255) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frenchise_product_stock`
--

CREATE TABLE `frenchise_product_stock` (
  `id` int(11) NOT NULL,
  `frenchise_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_quantity` varchar(255) DEFAULT NULL,
  `status` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `created` varchar(255) DEFAULT NULL,
  `updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `frenchise_stock_record`
--

CREATE TABLE `frenchise_stock_record` (
  `id` int(11) NOT NULL,
  `frenchise_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `remainning` varchar(255) DEFAULT NULL,
  `order_stock` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `frenchise_users`
--

CREATE TABLE `frenchise_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET latin1 NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `sec_code` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `mobile` varchar(15) CHARACTER SET latin1 NOT NULL,
  `email` varchar(50) CHARACTER SET latin1 NOT NULL,
  `earnings` decimal(10,2) NOT NULL DEFAULT '0.00',
  `funds` decimal(10,2) NOT NULL DEFAULT '0.00',
  `active_direct` int(11) NOT NULL DEFAULT '0',
  `total_direct` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `earned` decimal(15,2) NOT NULL DEFAULT '0.00',
  `self_business` decimal(20,2) NOT NULL,
  `team_business` decimal(20,2) NOT NULL,
  `sponser_id` varchar(255) CHARACTER SET latin1 NOT NULL,
  `status` enum('Pending','Active','Suspended','Inactive') CHARACTER SET latin1 COLLATE latin1_german2_ci NOT NULL DEFAULT 'Active',
  `address` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_code` int(11) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `date_time` datetime NOT NULL,
  `date` date NOT NULL,
  `activation_date_time` varchar(255) CHARACTER SET latin1 DEFAULT '',
  `country` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `frenchise_users`
--

INSERT INTO `frenchise_users` (`id`, `username`, `password`, `sec_code`, `name`, `mobile`, `email`, `earnings`, `funds`, `active_direct`, `total_direct`, `rank`, `earned`, `self_business`, `team_business`, `sponser_id`, `status`, `address`, `town`, `city`, `state_id`, `state_code`, `district`, `pincode`, `state`, `date_time`, `date`, `activation_date_time`, `country`) VALUES
(22, 'ASPIRAL', '7c4a8d09ca3762af61e59520943dc26494f8941b', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'admin', '123456789', 'admin@gmail.com', 0.00, 0.00, 0, 0, 0, 0.00, 0.00, 0.00, 'ADD', 'Active', NULL, NULL, NULL, 16, 20, NULL, NULL, NULL, '2021-10-08 10:18:57', '2021-01-05', '2021-10-08 10:18:57', 99);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level_incomes`
--

CREATE TABLE `level_incomes` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `per` float NOT NULL,
  `business` float NOT NULL,
  `clevel` int(11) NOT NULL,
  `rbusiness` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level_incomes`
--

INSERT INTO `level_incomes` (`id`, `level`, `per`, `business`, `clevel`, `rbusiness`) VALUES
(1, 1, 10, 0, 1, 0),
(2, 2, 4, 1500, 1, 1500),
(3, 3, 4, 2500, 2, 2500),
(4, 4, 3, 3000, 3, 3000),
(5, 5, 2, 3500, 4, 3500),
(6, 6, 1, 4000, 5, 4000),
(7, 7, 5, 4500, 6, 4500),
(8, 8, 5, 7000, 7, 7000),
(9, 9, 4, 7500, 8, 7500),
(10, 10, 3, 8000, 9, 8000),
(11, 11, 3, 9000, 10, 9000),
(12, 12, 3, 9000, 10, 9000),
(13, 13, 3, 9000, 10, 9000),
(14, 14, 3, 9000, 10, 9000),
(15, 15, 3, 9000, 10, 9000);

-- --------------------------------------------------------

--
-- Table structure for table `login_activity`
--

CREATE TABLE `login_activity` (
  `id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_activity`
--

INSERT INTO `login_activity` (`id`, `comment`, `date_time`) VALUES
(1, 'users page visited127.0.0.1', '2021-10-08 03:42:57'),
(2, 'users page visited127.0.0.1', '2021-10-08 03:43:36'),
(3, 'users page visited127.0.0.1', '2021-10-08 03:43:36'),
(4, 'users page visited127.0.0.1', '2021-10-08 04:53:48'),
(5, 'users update page visited127.0.0.1', '2021-10-08 04:53:50'),
(6, 'users page visited127.0.0.1', '2021-10-08 04:54:06'),
(7, 'users page visited127.0.0.1', '2021-10-10 23:09:54'),
(8, 'users page visited127.0.0.1', '2021-10-10 23:09:58'),
(9, 'users page visited127.0.0.1', '2021-10-10 23:10:04'),
(10, 'users page visited127.0.0.1', '2021-10-10 23:10:04'),
(11, 'users page visited127.0.0.1', '2021-10-10 23:10:28'),
(12, 'users page visited127.0.0.1', '2021-10-10 23:10:28'),
(13, 'users page visited127.0.0.1', '2021-10-10 23:26:24'),
(14, 'users page visited127.0.0.1', '2021-10-10 23:26:28'),
(15, 'users page visited127.0.0.1', '2021-10-10 23:26:32'),
(16, 'users page visited127.0.0.1', '2021-10-10 23:26:50'),
(17, 'users page visited127.0.0.1', '2021-10-10 23:26:50'),
(18, 'users page visited127.0.0.1', '2021-10-10 23:26:53'),
(19, 'users page visited127.0.0.1', '2021-10-10 23:27:01'),
(20, 'users page visited127.0.0.1', '2021-10-10 23:27:01'),
(21, 'users page visited127.0.0.1', '2021-10-10 23:27:08'),
(22, 'users page visited127.0.0.1', '2021-10-10 23:27:10'),
(23, 'users page visited127.0.0.1', '2021-10-10 23:30:42'),
(24, 'users page visited127.0.0.1', '2021-10-10 23:30:45'),
(25, 'admin url vistied 127.0.0.1', '2021-10-10 23:57:58'),
(26, 'users page visited127.0.0.1', '2021-10-11 01:51:59'),
(27, 'users page visited127.0.0.1', '2021-10-11 01:52:43'),
(28, 'users page visited127.0.0.1', '2021-10-11 01:52:46'),
(29, 'users page visited127.0.0.1', '2021-10-11 02:01:29'),
(30, 'users page visited127.0.0.1', '2021-10-11 02:01:38'),
(31, 'users page visited127.0.0.1', '2021-10-11 02:01:45'),
(32, 'users page visited127.0.0.1', '2021-10-11 02:02:21'),
(33, 'users page visited127.0.0.1', '2021-10-11 02:02:52'),
(34, 'users page visited127.0.0.1', '2021-10-11 02:05:01'),
(35, 'users page visited127.0.0.1', '2021-10-11 02:05:03'),
(36, 'users page visited127.0.0.1', '2021-10-11 02:05:03'),
(37, 'users page visited127.0.0.1', '2021-10-11 02:05:19'),
(38, 'users page visited127.0.0.1', '2021-10-11 02:05:19'),
(39, 'users page visited127.0.0.1', '2021-10-11 02:05:24'),
(40, 'users page visited127.0.0.1', '2021-10-11 02:05:24'),
(41, 'users page visited127.0.0.1', '2021-10-11 02:07:00'),
(42, 'users page visited127.0.0.1', '2021-10-11 02:07:13'),
(43, 'users page visited127.0.0.1', '2021-10-11 02:07:13'),
(44, 'users page visited127.0.0.1', '2021-10-11 02:07:29'),
(45, 'users page visited127.0.0.1', '2021-10-11 02:07:29'),
(46, 'admin url vistied 127.0.0.1', '2021-10-11 03:13:53'),
(47, 'admin url vistied 127.0.0.1', '2021-10-11 03:13:57'),
(48, 'admin url vistied 127.0.0.1', '2021-10-11 03:14:03'),
(49, 'login form submit vistied 127.0.0.1', '2021-10-11 03:14:03'),
(50, 'opt page vistied 127.0.0.1', '2021-10-11 03:14:03'),
(51, 'opt page vistied 127.0.0.1', '2021-10-11 03:14:06'),
(52, 'opt submit 127.0.0.1', '2021-10-11 03:14:06'),
(53, 'login success vistied 127.0.0.1', '2021-10-11 03:14:06'),
(54, 'users page visited127.0.0.1', '2021-10-11 03:14:11'),
(55, 'users page visited127.0.0.1', '2021-10-11 03:14:34'),
(56, 'users page visited127.0.0.1', '2021-10-11 03:17:11'),
(57, 'users page visited127.0.0.1', '2021-10-11 03:17:15'),
(58, 'users page visited127.0.0.1', '2021-10-11 03:17:22'),
(59, 'users page visited127.0.0.1', '2021-10-11 03:20:48'),
(60, 'users page visited127.0.0.1', '2021-10-11 03:20:52'),
(61, 'users page visited127.0.0.1', '2021-10-11 03:20:57'),
(62, 'users page visited127.0.0.1', '2021-10-11 03:21:08'),
(63, 'users page visited127.0.0.1', '2021-10-11 03:21:12'),
(64, 'users page visited127.0.0.1', '2021-10-11 03:21:12'),
(65, 'users page visited127.0.0.1', '2021-10-11 03:22:02'),
(66, 'users page visited127.0.0.1', '2021-10-11 03:22:06'),
(67, 'users page visited127.0.0.1', '2021-10-11 03:22:06'),
(68, 'users page visited127.0.0.1', '2021-10-11 03:25:50'),
(69, 'users page visited127.0.0.1', '2021-10-11 03:35:52'),
(70, 'users page visited127.0.0.1', '2021-10-11 03:36:17'),
(71, 'users page visited127.0.0.1', '2021-10-11 03:36:28'),
(72, 'users page visited127.0.0.1', '2021-10-11 03:37:10'),
(73, 'users page visited127.0.0.1', '2021-10-11 03:49:24'),
(74, 'users page visited127.0.0.1', '2021-10-11 03:51:59'),
(75, 'users page visited127.0.0.1', '2021-10-11 03:52:04'),
(76, 'users page visited127.0.0.1', '2021-10-11 03:52:04'),
(77, 'users page visited127.0.0.1', '2021-10-11 03:52:16'),
(78, 'users page visited127.0.0.1', '2021-10-11 03:52:21'),
(79, 'users page visited127.0.0.1', '2021-10-11 03:52:21'),
(80, 'users page visited127.0.0.1', '2021-10-11 03:53:00'),
(81, 'users page visited127.0.0.1', '2021-10-11 03:53:05'),
(82, 'users page visited127.0.0.1', '2021-10-11 03:53:05'),
(83, 'users page visited127.0.0.1', '2021-10-11 03:53:10'),
(84, 'users page visited127.0.0.1', '2021-10-11 04:02:49'),
(85, 'users page visited127.0.0.1', '2021-10-11 04:02:54'),
(86, 'users page visited127.0.0.1', '2021-10-11 04:02:54'),
(87, 'users page visited127.0.0.1', '2021-10-11 04:04:09'),
(88, 'users page visited127.0.0.1', '2021-10-11 04:05:56'),
(89, 'users page visited127.0.0.1', '2021-10-11 04:06:00'),
(90, 'users page visited127.0.0.1', '2021-10-11 04:06:51'),
(91, 'users page visited127.0.0.1', '2021-10-11 04:08:05'),
(92, 'users page visited127.0.0.1', '2021-10-11 21:33:22'),
(93, 'users page visited127.0.0.1', '2021-10-11 21:33:27'),
(94, 'users page visited127.0.0.1', '2021-10-11 21:33:30'),
(95, 'users page visited127.0.0.1', '2021-10-11 21:33:37'),
(96, 'users page visited127.0.0.1', '2021-10-11 21:42:22'),
(97, 'users page visited127.0.0.1', '2021-10-11 21:42:25'),
(98, 'users page visited127.0.0.1', '2021-10-11 21:42:31'),
(99, 'users page visited127.0.0.1', '2021-10-11 21:42:31'),
(100, 'users page visited127.0.0.1', '2021-10-11 21:45:31'),
(101, 'users page visited127.0.0.1', '2021-10-11 21:54:13'),
(102, 'users page visited127.0.0.1', '2021-10-11 21:54:20'),
(103, 'users page visited127.0.0.1', '2021-10-11 21:54:23'),
(104, 'users page visited127.0.0.1', '2021-10-11 21:54:23'),
(105, 'admin url vistied 127.0.0.1', '2021-10-13 21:22:35'),
(106, 'admin url vistied 127.0.0.1', '2021-10-13 21:23:14'),
(107, 'admin url vistied 127.0.0.1', '2021-10-13 21:28:09'),
(108, 'login form submit vistied 127.0.0.1', '2021-10-13 21:28:09'),
(109, 'opt page vistied 127.0.0.1', '2021-10-13 21:28:09'),
(110, 'opt page vistied 127.0.0.1', '2021-10-13 21:28:12'),
(111, 'opt submit 127.0.0.1', '2021-10-13 21:28:12'),
(112, 'login success vistied 127.0.0.1', '2021-10-13 21:28:12'),
(113, 'users page visited127.0.0.1', '2021-10-13 21:31:42'),
(114, 'users page visited127.0.0.1', '2021-10-13 21:31:49'),
(115, 'users page visited127.0.0.1', '2021-10-13 21:31:49'),
(116, 'users page visited127.0.0.1', '2021-10-13 21:31:56'),
(117, 'users page visited127.0.0.1', '2021-10-13 21:31:56'),
(118, 'users page visited127.0.0.1', '2021-10-13 21:34:29'),
(119, 'users page visited127.0.0.1', '2021-10-13 21:34:32'),
(120, 'users page visited127.0.0.1', '2021-10-13 21:34:33'),
(121, 'users page visited127.0.0.1', '2021-10-13 21:34:36'),
(122, 'users page visited127.0.0.1', '2021-10-13 21:34:36'),
(123, 'users page visited127.0.0.1', '2021-10-13 21:49:22'),
(124, 'users page visited127.0.0.1', '2021-10-14 00:30:52'),
(125, 'users page visited127.0.0.1', '2021-10-14 01:36:25'),
(126, 'users page visited127.0.0.1', '2021-10-14 01:36:49'),
(127, 'users page visited127.0.0.1', '2021-10-14 01:36:54'),
(128, 'users page visited127.0.0.1', '2021-10-14 01:39:03'),
(129, 'users page visited127.0.0.1', '2021-10-14 01:43:19'),
(130, 'users page visited127.0.0.1', '2021-10-14 01:43:31'),
(131, 'users page visited127.0.0.1', '2021-10-14 01:43:57'),
(132, 'users page visited127.0.0.1', '2021-10-14 01:44:08'),
(133, 'users page visited127.0.0.1', '2021-10-14 01:44:48'),
(134, 'users page visited127.0.0.1', '2021-10-14 01:44:50'),
(135, 'users page visited127.0.0.1', '2021-10-14 01:46:05'),
(136, 'users page visited127.0.0.1', '2021-10-14 01:46:29'),
(137, 'users page visited127.0.0.1', '2021-10-14 01:46:43'),
(138, 'users page visited127.0.0.1', '2021-10-14 01:47:15'),
(139, 'users page visited127.0.0.1', '2021-10-14 01:47:36'),
(140, 'users page visited127.0.0.1', '2021-10-14 01:47:45'),
(141, 'users page visited127.0.0.1', '2021-10-14 01:48:20'),
(142, 'users page visited127.0.0.1', '2021-10-14 01:48:42'),
(143, 'users page visited127.0.0.1', '2021-10-14 01:49:15'),
(144, 'users page visited127.0.0.1', '2021-10-14 01:49:28'),
(145, 'users page visited127.0.0.1', '2021-10-14 01:49:51'),
(146, 'users page visited127.0.0.1', '2021-10-14 01:49:55'),
(147, 'users page visited127.0.0.1', '2021-10-14 01:50:15'),
(148, 'users page visited127.0.0.1', '2021-10-14 01:52:21'),
(149, 'users page visited127.0.0.1', '2021-10-14 01:52:29'),
(150, 'users page visited127.0.0.1', '2021-10-14 01:52:40'),
(151, 'users page visited127.0.0.1', '2021-10-14 01:52:50'),
(152, 'users page visited127.0.0.1', '2021-10-14 01:53:29'),
(153, 'users page visited127.0.0.1', '2021-10-14 01:54:16'),
(154, 'users page visited127.0.0.1', '2021-10-14 01:55:13'),
(155, 'users page visited127.0.0.1', '2021-10-14 01:55:15'),
(156, 'users page visited127.0.0.1', '2021-10-14 01:57:52'),
(157, 'users page visited127.0.0.1', '2021-10-14 02:21:27'),
(158, 'users page visited127.0.0.1', '2021-10-14 02:21:58'),
(159, 'users page visited127.0.0.1', '2021-10-14 02:22:25'),
(160, 'users page visited127.0.0.1', '2021-10-14 02:22:47'),
(161, 'users page visited127.0.0.1', '2021-10-14 02:22:56'),
(162, 'users page visited127.0.0.1', '2021-10-14 02:23:05'),
(163, 'users page visited127.0.0.1', '2021-10-14 02:23:34'),
(164, 'users page visited127.0.0.1', '2021-10-14 02:23:40'),
(165, 'users page visited127.0.0.1', '2021-10-14 02:25:15'),
(166, 'users page visited127.0.0.1', '2021-10-14 02:25:29'),
(167, 'users page visited127.0.0.1', '2021-10-14 02:25:37'),
(168, 'users page visited127.0.0.1', '2021-10-14 02:25:48'),
(169, 'users page visited127.0.0.1', '2021-10-14 02:25:48'),
(170, 'users page visited127.0.0.1', '2021-10-14 02:26:01'),
(171, 'users page visited127.0.0.1', '2021-10-14 02:26:08'),
(172, 'users page visited127.0.0.1', '2021-10-14 02:26:08'),
(173, 'users page visited127.0.0.1', '2021-10-14 02:26:17'),
(174, 'users page visited127.0.0.1', '2021-10-14 02:26:17'),
(175, 'users page visited127.0.0.1', '2021-10-14 02:28:09'),
(176, 'users page visited127.0.0.1', '2021-10-14 02:28:43'),
(177, 'users page visited127.0.0.1', '2021-10-14 02:29:05'),
(178, 'users page visited127.0.0.1', '2021-10-14 02:30:40'),
(179, 'users page visited127.0.0.1', '2021-10-14 02:31:01'),
(180, 'users page visited127.0.0.1', '2021-10-14 02:31:28'),
(181, 'users page visited127.0.0.1', '2021-10-14 02:31:42'),
(182, 'users page visited127.0.0.1', '2021-10-14 02:32:15'),
(183, 'users page visited127.0.0.1', '2021-10-14 02:35:11'),
(184, 'users page visited127.0.0.1', '2021-10-14 02:35:36'),
(185, 'users page visited127.0.0.1', '2021-10-14 02:36:28'),
(186, 'users page visited127.0.0.1', '2021-10-14 02:36:44'),
(187, 'users page visited127.0.0.1', '2021-10-14 02:36:50'),
(188, 'users page visited127.0.0.1', '2021-10-14 02:37:31'),
(189, 'users page visited127.0.0.1', '2021-10-14 02:37:48'),
(190, 'users page visited127.0.0.1', '2021-10-14 02:40:20'),
(191, 'users page visited127.0.0.1', '2021-10-14 03:17:13'),
(192, 'users page visited127.0.0.1', '2021-10-14 03:17:18'),
(193, 'users page visited127.0.0.1', '2021-10-14 03:17:18'),
(194, 'users page visited127.0.0.1', '2021-10-14 03:17:50'),
(195, 'users page visited127.0.0.1', '2021-10-14 03:17:53'),
(196, 'users page visited127.0.0.1', '2021-10-14 03:17:56'),
(197, 'users page visited127.0.0.1', '2021-10-14 03:18:00'),
(198, 'users page visited127.0.0.1', '2021-10-14 03:18:00'),
(199, 'users page visited127.0.0.1', '2021-10-14 03:18:29'),
(200, 'users page visited127.0.0.1', '2021-10-14 03:18:32'),
(201, 'users page visited127.0.0.1', '2021-10-14 03:18:32'),
(202, 'users page visited127.0.0.1', '2021-10-14 03:18:41'),
(203, 'users page visited127.0.0.1', '2021-10-14 03:18:41'),
(204, 'users page visited127.0.0.1', '2021-10-14 03:18:44'),
(205, 'users page visited127.0.0.1', '2021-10-14 03:18:47'),
(206, 'users page visited127.0.0.1', '2021-10-14 03:20:26'),
(207, 'users page visited127.0.0.1', '2021-10-14 03:22:36'),
(208, 'users page visited127.0.0.1', '2021-10-14 03:22:40'),
(209, 'users page visited127.0.0.1', '2021-10-14 03:23:04'),
(210, 'users page visited127.0.0.1', '2021-10-14 03:23:50'),
(211, 'users page visited127.0.0.1', '2021-10-14 03:24:09'),
(212, 'users page visited127.0.0.1', '2021-10-14 03:24:48'),
(213, 'users page visited127.0.0.1', '2021-10-14 03:36:25'),
(214, 'users page visited127.0.0.1', '2021-10-14 03:36:30'),
(215, 'users page visited127.0.0.1', '2021-10-14 03:36:30'),
(216, 'users page visited127.0.0.1', '2021-10-14 03:36:44'),
(217, 'users page visited127.0.0.1', '2021-10-14 03:37:34'),
(218, 'users page visited127.0.0.1', '2021-10-14 03:37:37'),
(219, 'users page visited127.0.0.1', '2021-10-14 03:38:18'),
(220, 'users page visited127.0.0.1', '2021-10-14 03:38:21'),
(221, 'users page visited127.0.0.1', '2021-10-14 03:59:24'),
(222, 'users page visited127.0.0.1', '2021-10-14 04:15:03'),
(223, 'users page visited127.0.0.1', '2021-10-14 04:15:06'),
(224, 'users page visited127.0.0.1', '2021-10-14 04:15:09'),
(225, 'users page visited127.0.0.1', '2021-10-14 04:15:56'),
(226, 'users page visited127.0.0.1', '2021-10-14 04:16:14'),
(227, 'users page visited127.0.0.1', '2021-10-14 04:16:28'),
(228, 'users page visited127.0.0.1', '2021-10-14 04:16:50'),
(229, 'users page visited127.0.0.1', '2021-10-14 04:17:22'),
(230, 'users page visited127.0.0.1', '2021-10-14 04:18:42'),
(231, 'users page visited127.0.0.1', '2021-10-14 04:18:58'),
(232, 'users page visited127.0.0.1', '2021-10-14 04:19:08'),
(233, 'users page visited127.0.0.1', '2021-10-14 04:19:10'),
(234, 'users page visited127.0.0.1', '2021-10-14 04:20:48'),
(235, 'users page visited127.0.0.1', '2021-10-14 04:20:52'),
(236, 'users page visited127.0.0.1', '2021-10-14 04:21:21'),
(237, 'users page visited127.0.0.1', '2021-10-14 04:22:23'),
(238, 'users page visited127.0.0.1', '2021-10-14 04:22:40'),
(239, 'users page visited127.0.0.1', '2021-10-14 04:23:24'),
(240, 'users page visited127.0.0.1', '2021-10-14 04:23:37'),
(241, 'users page visited127.0.0.1', '2021-10-14 04:23:47'),
(242, 'users page visited127.0.0.1', '2021-10-14 04:24:33'),
(243, 'users page visited127.0.0.1', '2021-10-14 04:27:34'),
(244, 'users page visited127.0.0.1', '2021-10-14 04:28:26'),
(245, 'users page visited127.0.0.1', '2021-10-14 04:28:41'),
(246, 'users page visited127.0.0.1', '2021-10-14 04:28:46'),
(247, 'users page visited127.0.0.1', '2021-10-14 04:29:01'),
(248, 'users page visited127.0.0.1', '2021-10-14 04:29:07'),
(249, 'users page visited127.0.0.1', '2021-10-14 04:29:26'),
(250, 'users page visited127.0.0.1', '2021-10-14 04:29:30'),
(251, 'users page visited127.0.0.1', '2021-10-14 04:29:47'),
(252, 'users page visited127.0.0.1', '2021-10-14 04:30:32'),
(253, 'users page visited127.0.0.1', '2021-10-14 04:31:12'),
(254, 'users page visited127.0.0.1', '2021-10-14 04:36:38'),
(255, 'users page visited127.0.0.1', '2021-10-14 04:37:08'),
(256, 'users page visited127.0.0.1', '2021-10-14 04:37:31'),
(257, 'users page visited127.0.0.1', '2021-10-14 04:37:40'),
(258, 'users page visited127.0.0.1', '2021-10-14 04:38:45'),
(259, 'users page visited127.0.0.1', '2021-10-14 04:38:48'),
(260, 'users page visited127.0.0.1', '2021-10-14 04:39:59'),
(261, 'users page visited127.0.0.1', '2021-10-14 04:40:43'),
(262, 'users page visited127.0.0.1', '2021-10-14 04:41:00'),
(263, 'users page visited127.0.0.1', '2021-10-14 04:41:56'),
(264, 'users page visited127.0.0.1', '2021-10-14 04:41:58'),
(265, 'users page visited127.0.0.1', '2021-10-14 04:42:09'),
(266, 'users page visited127.0.0.1', '2021-10-14 04:42:12'),
(267, 'users page visited127.0.0.1', '2021-10-14 04:42:59'),
(268, 'users page visited127.0.0.1', '2021-10-14 04:43:01'),
(269, 'users page visited127.0.0.1', '2021-10-14 04:43:08'),
(270, 'users page visited127.0.0.1', '2021-10-14 04:58:37'),
(271, 'users page visited127.0.0.1', '2021-10-14 04:58:40'),
(272, 'users page visited127.0.0.1', '2021-10-14 04:58:42'),
(273, 'users page visited127.0.0.1', '2021-10-14 04:58:46'),
(274, 'users page visited127.0.0.1', '2021-10-14 04:58:48'),
(275, 'users page visited127.0.0.1', '2021-10-14 04:59:01'),
(276, 'users page visited127.0.0.1', '2021-10-14 04:59:03'),
(277, 'users page visited127.0.0.1', '2021-10-14 04:59:05'),
(278, 'users page visited127.0.0.1', '2021-10-14 04:59:47'),
(279, 'users page visited127.0.0.1', '2021-10-14 04:59:49'),
(280, 'users page visited127.0.0.1', '2021-10-14 04:59:49'),
(281, 'users page visited127.0.0.1', '2021-10-14 04:59:52'),
(282, 'users page visited127.0.0.1', '2021-10-14 04:59:52'),
(283, 'users page visited127.0.0.1', '2021-10-14 04:59:54'),
(284, 'users page visited127.0.0.1', '2021-10-14 05:00:02'),
(285, 'users page visited127.0.0.1', '2021-10-14 05:00:02'),
(286, 'users page visited127.0.0.1', '2021-10-14 05:00:30'),
(287, 'users page visited127.0.0.1', '2021-10-14 05:00:30'),
(288, 'users page visited127.0.0.1', '2021-10-14 05:00:32'),
(289, 'users page visited127.0.0.1', '2021-10-14 05:00:32'),
(290, 'users page visited127.0.0.1', '2021-10-14 05:00:36'),
(291, 'users page visited127.0.0.1', '2021-10-14 05:01:17'),
(292, 'users page visited127.0.0.1', '2021-10-14 05:01:17'),
(293, 'users page visited127.0.0.1', '2021-10-14 05:01:19'),
(294, 'users page visited127.0.0.1', '2021-10-14 05:01:19'),
(295, 'users page visited127.0.0.1', '2021-10-14 05:01:26'),
(296, 'users page visited127.0.0.1', '2021-10-14 05:01:40'),
(297, 'users page visited127.0.0.1', '2021-10-14 05:01:40'),
(298, 'users page visited127.0.0.1', '2021-10-14 05:01:41'),
(299, 'users page visited127.0.0.1', '2021-10-14 05:01:42'),
(300, 'users page visited127.0.0.1', '2021-10-14 05:02:18'),
(301, 'users page visited127.0.0.1', '2021-10-14 05:02:20'),
(302, 'users page visited127.0.0.1', '2021-10-14 05:02:23'),
(303, 'users page visited127.0.0.1', '2021-10-14 05:02:39'),
(304, 'users page visited127.0.0.1', '2021-10-14 05:02:40'),
(305, 'users page visited127.0.0.1', '2021-10-14 05:02:43'),
(306, 'users page visited127.0.0.1', '2021-10-14 05:02:53'),
(307, 'users page visited127.0.0.1', '2021-10-14 05:02:56'),
(308, 'users page visited127.0.0.1', '2021-10-14 05:02:58'),
(309, 'users page visited127.0.0.1', '2021-10-14 05:02:58'),
(310, 'users page visited127.0.0.1', '2021-10-14 05:03:06'),
(311, 'users page visited127.0.0.1', '2021-10-14 05:03:19'),
(312, 'users page visited127.0.0.1', '2021-10-14 05:03:21'),
(313, 'users page visited127.0.0.1', '2021-10-14 05:03:21'),
(314, 'users page visited127.0.0.1', '2021-10-14 05:03:24'),
(315, 'users page visited127.0.0.1', '2021-10-15 21:16:48'),
(316, 'admin url vistied 127.0.0.1', '2021-10-16 04:57:27'),
(317, 'admin url vistied 127.0.0.1', '2021-10-16 04:57:30'),
(318, 'admin url vistied 127.0.0.1', '2021-10-16 04:57:35'),
(319, 'login form submit vistied 127.0.0.1', '2021-10-16 04:57:35'),
(320, 'opt page vistied 127.0.0.1', '2021-10-16 04:57:35'),
(321, 'opt page vistied 127.0.0.1', '2021-10-16 04:57:37'),
(322, 'opt submit 127.0.0.1', '2021-10-16 04:57:37'),
(323, 'login success vistied 127.0.0.1', '2021-10-16 04:57:37'),
(324, 'users page visited127.0.0.1', '2021-10-16 04:58:00'),
(325, 'users page visited127.0.0.1', '2021-10-16 04:58:09'),
(326, 'users page visited127.0.0.1', '2021-10-16 04:58:15'),
(327, 'users page visited127.0.0.1', '2021-10-16 04:58:19'),
(328, 'users page visited127.0.0.1', '2021-10-16 04:58:23'),
(329, 'users page visited127.0.0.1', '2021-10-16 04:58:28'),
(330, 'users page visited127.0.0.1', '2021-10-16 04:58:32'),
(331, 'users page visited127.0.0.1', '2021-10-16 04:58:39'),
(332, 'users page visited127.0.0.1', '2021-10-16 04:58:40'),
(333, 'admin url vistied 49.36.237.99', '2021-11-11 01:28:48'),
(334, 'admin url vistied 49.36.237.99', '2021-11-11 01:28:49'),
(335, 'login form submit vistied 49.36.237.99', '2021-11-11 01:28:49'),
(336, 'opt page vistied 49.36.237.99', '2021-11-11 01:28:49'),
(337, 'opt page vistied 49.36.237.99', '2021-11-11 01:28:53'),
(338, 'opt page vistied 49.36.237.99', '2021-11-11 01:28:53'),
(339, 'opt page vistied 49.36.237.99', '2021-11-11 01:28:58'),
(340, 'opt submit 49.36.237.99', '2021-11-11 01:28:58'),
(341, 'login success vistied 49.36.237.99', '2021-11-11 01:28:58'),
(342, 'users page visited49.36.237.99', '2021-11-11 01:37:59'),
(343, 'users page visited49.36.237.99', '2021-11-11 01:38:11'),
(344, 'users page visited49.36.237.99', '2021-11-11 01:38:27'),
(345, 'users page visited49.36.237.99', '2021-11-11 01:38:31'),
(346, 'users page visited49.36.237.99', '2021-11-11 01:38:31'),
(347, 'users page visited49.36.237.99', '2021-11-11 01:38:54'),
(348, 'users page visited49.36.237.99', '2021-11-11 01:38:55'),
(349, 'users page visited49.36.237.99', '2021-11-11 01:38:56'),
(350, 'users page visited49.36.237.99', '2021-11-11 01:38:57'),
(351, 'users page visited49.36.237.99', '2021-11-11 01:39:15'),
(352, 'users page visited49.36.237.99', '2021-11-11 01:39:17'),
(353, 'users page visited49.36.237.99', '2021-11-11 01:39:26'),
(354, 'users page visited49.36.237.99', '2021-11-11 01:39:29'),
(355, 'users page visited49.36.237.99', '2021-11-11 01:39:51'),
(356, 'users page visited49.36.237.99', '2021-11-11 01:39:54'),
(357, 'users page visited49.36.237.99', '2021-11-11 01:40:20'),
(358, 'users page visited49.36.237.99', '2021-11-11 01:40:21'),
(359, 'users page visited49.36.237.99', '2021-11-11 01:41:35'),
(360, 'users page visited49.36.237.99', '2021-11-11 01:41:56'),
(361, 'users page visited49.36.237.99', '2021-11-11 01:42:12'),
(362, 'users page visited49.36.237.99', '2021-11-11 01:43:20'),
(363, 'users page visited49.36.237.99', '2021-11-11 01:43:28'),
(364, 'users page visited49.36.237.99', '2021-11-11 01:43:30'),
(365, 'users page visited49.36.237.99', '2021-11-11 01:44:08'),
(366, 'users page visited49.36.237.99', '2021-11-11 01:45:48'),
(367, 'users page visited49.36.237.99', '2021-11-11 01:53:13'),
(368, 'users page visited49.36.237.99', '2021-11-11 01:55:15'),
(369, 'users page visited49.36.237.99', '2021-11-11 01:55:27'),
(370, 'users page visited49.36.237.99', '2021-11-11 01:55:30'),
(371, 'users page visited49.36.237.99', '2021-11-11 01:56:27'),
(372, 'users page visited49.36.237.99', '2021-11-11 01:57:07'),
(373, 'users page visited49.36.237.99', '2021-11-11 01:57:09'),
(374, 'users page visited49.36.237.99', '2021-11-11 01:57:13'),
(375, 'users page visited49.36.237.99', '2021-11-11 01:57:23'),
(376, 'users page visited49.36.237.99', '2021-11-11 01:57:27'),
(377, 'users page visited49.36.237.99', '2021-11-11 01:57:30'),
(378, 'users page visited49.36.237.99', '2021-11-11 01:59:31'),
(379, 'users page visited49.36.237.99', '2021-11-11 01:59:34'),
(380, 'users page visited49.36.237.99', '2021-11-11 02:00:12'),
(381, 'users page visited49.36.237.99', '2021-11-11 02:00:50'),
(382, 'users page visited49.36.237.99', '2021-11-11 02:00:57'),
(383, 'users page visited49.36.237.99', '2021-11-11 02:00:58'),
(384, 'users page visited49.36.237.99', '2021-11-11 02:03:00'),
(385, 'users page visited49.36.237.99', '2021-11-11 02:03:02'),
(386, 'users page visited49.36.237.99', '2021-11-11 02:03:06'),
(387, 'users page visited49.36.237.99', '2021-11-11 02:05:17'),
(388, 'users page visited49.36.237.99', '2021-11-11 02:05:21'),
(389, 'users page visited49.36.237.99', '2021-11-11 02:06:52'),
(390, 'users page visited49.36.237.99', '2021-11-11 02:06:55'),
(391, 'users page visited49.36.237.99', '2021-11-11 02:07:01'),
(392, 'users page visited49.36.237.99', '2021-11-11 02:08:18'),
(393, 'users page visited49.36.237.99', '2021-11-11 02:09:08'),
(394, 'users page visited49.36.237.99', '2021-11-11 02:09:14'),
(395, 'users page visited49.36.237.99', '2021-11-11 02:09:19'),
(396, 'admin url vistied 49.36.237.99', '2021-11-11 02:09:27'),
(397, 'users page visited49.36.237.99', '2021-11-11 02:10:08'),
(398, 'users page visited49.36.237.99', '2021-11-11 02:10:39'),
(399, 'users page visited49.36.237.99', '2021-11-11 02:10:42'),
(400, 'users page visited49.36.237.99', '2021-11-11 02:10:46'),
(401, 'users page visited49.36.237.99', '2021-11-11 02:12:01'),
(402, 'users page visited49.36.237.99', '2021-11-11 02:12:10'),
(403, 'users page visited49.36.237.99', '2021-11-11 02:12:11'),
(404, 'users page visited49.36.237.99', '2021-11-11 02:12:15'),
(405, 'users page visited49.36.237.99', '2021-11-11 02:12:19'),
(406, 'users page visited49.36.237.99', '2021-11-11 02:12:33'),
(407, 'users page visited49.36.237.99', '2021-11-11 02:12:35'),
(408, 'users page visited49.36.237.99', '2021-11-11 02:12:38'),
(409, 'users page visited49.36.237.99', '2021-11-11 02:13:02'),
(410, 'users page visited49.36.237.99', '2021-11-11 02:13:04'),
(411, 'users page visited49.36.237.99', '2021-11-11 02:13:08'),
(412, 'users page visited49.36.237.99', '2021-11-11 02:14:54'),
(413, 'users page visited49.36.237.99', '2021-11-11 02:15:09'),
(414, 'users page visited49.36.237.99', '2021-11-11 02:15:09'),
(415, 'users page visited49.36.237.99', '2021-11-11 02:15:18'),
(416, 'users page visited49.36.237.99', '2021-11-11 02:15:18'),
(417, 'users page visited49.36.237.99', '2021-11-11 02:19:15'),
(418, 'users page visited49.36.237.99', '2021-11-11 02:19:21'),
(419, 'users page visited49.36.237.99', '2021-11-11 02:19:38'),
(420, 'users page visited49.36.237.99', '2021-11-11 02:19:40'),
(421, 'users page visited49.36.237.99', '2021-11-11 02:19:55'),
(422, 'users page visited49.36.237.99', '2021-11-11 02:19:57'),
(423, 'users page visited49.36.237.99', '2021-11-11 02:20:00'),
(424, 'users page visited49.36.237.99', '2021-11-11 02:27:56'),
(425, 'users page visited49.36.237.99', '2021-11-11 02:27:59'),
(426, 'users page visited49.36.237.99', '2021-11-11 02:28:46'),
(427, 'users page visited49.36.237.99', '2021-11-11 02:28:49'),
(428, 'users page visited49.36.237.99', '2021-11-11 02:28:53'),
(429, 'users page visited49.36.237.99', '2021-11-11 02:29:43'),
(430, 'users page visited49.36.237.99', '2021-11-11 02:29:47'),
(431, 'users page visited49.36.237.99', '2021-11-11 02:29:47'),
(432, 'users page visited49.36.237.99', '2021-11-11 02:31:32'),
(433, 'users page visited49.36.237.99', '2021-11-11 02:31:35'),
(434, 'users page visited49.36.237.99', '2021-11-11 02:31:35'),
(435, 'users page visited49.36.237.99', '2021-11-11 02:34:06'),
(436, 'users page visited49.36.237.99', '2021-11-11 02:34:09'),
(437, 'users page visited49.36.237.99', '2021-11-11 02:34:16'),
(438, 'users page visited49.36.237.99', '2021-11-11 02:35:13'),
(439, 'users page visited49.36.237.99', '2021-11-11 02:35:42'),
(440, 'users page visited49.36.237.99', '2021-11-11 02:38:13'),
(441, 'users page visited49.36.237.99', '2021-11-11 02:40:37'),
(442, 'users page visited49.36.237.99', '2021-11-11 02:40:45'),
(443, 'users page visited49.36.237.99', '2021-11-11 02:42:08'),
(444, 'users page visited49.36.237.99', '2021-11-11 02:42:11'),
(445, 'users page visited49.36.237.99', '2021-11-11 02:42:11'),
(446, 'users page visited49.36.237.99', '2021-11-11 02:42:46'),
(447, 'users page visited49.36.237.99', '2021-11-11 02:42:50'),
(448, 'users page visited49.36.237.99', '2021-11-11 02:42:50'),
(449, 'users page visited49.36.237.99', '2021-11-11 02:43:48'),
(450, 'users page visited49.36.237.99', '2021-11-11 02:43:51'),
(451, 'users page visited49.36.237.99', '2021-11-11 02:43:51'),
(452, 'users page visited49.36.237.99', '2021-11-11 02:44:37'),
(453, 'users page visited49.36.237.99', '2021-11-11 02:44:41'),
(454, 'users page visited49.36.237.99', '2021-11-11 02:44:41'),
(455, 'users page visited49.36.237.99', '2021-11-11 02:44:47'),
(456, 'users page visited49.36.237.99', '2021-11-11 02:45:33'),
(457, 'users page visited49.36.237.99', '2021-11-11 02:45:39'),
(458, 'users page visited49.36.237.99', '2021-11-11 02:46:24'),
(459, 'users page visited49.36.237.99', '2021-11-11 02:46:47'),
(460, 'users page visited49.36.237.99', '2021-11-11 02:47:02'),
(461, 'users page visited49.36.237.99', '2021-11-11 02:48:09'),
(462, 'admin url vistied 49.36.237.99', '2021-11-11 03:27:02'),
(463, 'admin url vistied 49.36.237.99', '2021-11-11 03:27:07'),
(464, 'admin url vistied 49.36.237.99', '2021-11-11 03:27:08'),
(465, 'login form submit vistied 49.36.237.99', '2021-11-11 03:27:08'),
(466, 'opt page vistied 49.36.237.99', '2021-11-11 03:27:08'),
(467, 'opt page vistied 49.36.237.99', '2021-11-11 03:27:09'),
(468, 'opt page vistied 49.36.237.99', '2021-11-11 03:27:09'),
(469, 'opt page vistied 49.36.237.99', '2021-11-11 03:27:13'),
(470, 'opt submit 49.36.237.99', '2021-11-11 03:27:13'),
(471, 'login success vistied 49.36.237.99', '2021-11-11 03:27:13'),
(472, 'users page visited49.36.237.99', '2021-11-11 03:27:16'),
(473, 'users page visited49.36.237.99', '2021-11-11 03:27:38'),
(474, 'users page visited49.36.237.99', '2021-11-11 03:27:48'),
(475, 'users page visited49.36.237.99', '2021-11-11 03:27:50'),
(476, 'users page visited49.36.237.99', '2021-11-11 03:28:51'),
(477, 'users page visited49.36.237.99', '2021-11-11 03:28:57'),
(478, 'users page visited49.36.237.99', '2021-11-11 03:30:11'),
(479, 'users page visited49.36.237.99', '2021-11-11 03:30:15'),
(480, 'users page visited49.36.237.99', '2021-11-11 03:30:48'),
(481, 'users page visited49.36.237.99', '2021-11-11 03:30:52'),
(482, 'users page visited49.36.237.99', '2021-11-11 03:31:07'),
(483, 'users page visited49.36.237.99', '2021-11-11 03:31:33'),
(484, 'users page visited49.36.237.99', '2021-11-11 03:31:36'),
(485, 'users page visited49.36.237.99', '2021-11-11 03:33:37'),
(486, 'users page visited49.36.237.99', '2021-11-11 03:33:41'),
(487, 'users page visited49.36.237.99', '2021-11-11 04:00:22'),
(488, 'users page visited49.36.237.99', '2021-11-11 04:00:31'),
(489, 'users page visited49.36.237.99', '2021-11-11 04:00:34'),
(490, 'users page visited49.36.237.99', '2021-11-11 04:00:55'),
(491, 'users page visited49.36.237.99', '2021-11-11 04:00:58'),
(492, 'users page visited49.36.237.99', '2021-11-11 04:00:59'),
(493, 'users page visited49.36.237.99', '2021-11-11 04:01:05'),
(494, 'users page visited49.36.237.99', '2021-11-11 04:01:44'),
(495, 'users page visited49.36.237.99', '2021-11-11 04:02:15'),
(496, 'users page visited49.36.237.99', '2021-11-11 04:02:21'),
(497, 'users page visited49.36.237.99', '2021-11-11 04:02:22'),
(498, 'users page visited49.36.237.99', '2021-11-11 04:02:25'),
(499, 'users page visited49.36.237.99', '2021-11-11 04:02:43'),
(500, 'users page visited49.36.237.99', '2021-11-11 04:02:44'),
(501, 'users page visited49.36.237.99', '2021-11-11 04:02:47'),
(502, 'users page visited49.36.237.99', '2021-11-11 04:02:55'),
(503, 'users page visited49.36.237.99', '2021-11-11 04:02:59'),
(504, 'users page visited49.36.237.99', '2021-11-11 04:03:00'),
(505, 'users page visited49.36.237.99', '2021-11-11 04:03:14'),
(506, 'users page visited49.36.237.99', '2021-11-11 04:03:49'),
(507, 'users page visited49.36.237.99', '2021-11-11 04:03:50'),
(508, 'users page visited49.36.237.99', '2021-11-11 04:04:27'),
(509, 'users page visited49.36.237.99', '2021-11-11 04:04:35'),
(510, 'admin url vistied 49.36.237.99', '2021-11-11 04:08:47'),
(511, 'admin url vistied 49.36.237.99', '2021-11-11 04:08:53'),
(512, 'admin url vistied 49.36.237.99', '2021-11-11 04:08:54'),
(513, 'login form submit vistied 49.36.237.99', '2021-11-11 04:08:54'),
(514, 'opt page vistied 49.36.237.99', '2021-11-11 04:08:54'),
(515, 'opt page vistied 49.36.237.99', '2021-11-11 04:08:57'),
(516, 'opt submit 49.36.237.99', '2021-11-11 04:08:57'),
(517, 'login success vistied 49.36.237.99', '2021-11-11 04:08:57'),
(518, 'users page visited49.36.237.99', '2021-11-11 04:08:59'),
(519, 'users page visited49.36.237.99', '2021-11-11 04:09:01'),
(520, 'users page visited49.36.237.99', '2021-11-11 04:12:05'),
(521, 'users page visited49.36.237.99', '2021-11-11 04:12:08'),
(522, 'users page visited49.36.237.99', '2021-11-11 04:12:21'),
(523, 'users page visited49.36.237.99', '2021-11-11 04:12:41'),
(524, 'users page visited49.36.237.99', '2021-11-11 04:12:42'),
(525, 'users page visited49.36.237.99', '2021-11-11 04:12:59'),
(526, 'users page visited49.36.237.99', '2021-11-11 04:14:01'),
(527, 'users page visited49.36.237.99', '2021-11-11 04:14:07'),
(528, 'users page visited49.36.237.99', '2021-11-11 04:14:44'),
(529, 'users page visited49.36.237.99', '2021-11-11 04:14:45'),
(530, 'users page visited49.36.237.99', '2021-11-11 04:14:45'),
(531, 'users page visited49.36.237.99', '2021-11-11 04:14:46'),
(532, 'users page visited49.36.237.99', '2021-11-11 04:15:09'),
(533, 'users page visited49.36.237.99', '2021-11-11 04:15:09'),
(534, 'users page visited49.36.237.99', '2021-11-11 04:15:11'),
(535, 'users page visited49.36.237.99', '2021-11-11 04:15:23'),
(536, 'users page visited49.36.237.99', '2021-11-11 04:15:35'),
(537, 'users page visited49.36.237.99', '2021-11-11 04:16:28'),
(538, 'users page visited49.36.237.99', '2021-11-11 04:16:33'),
(539, 'users page visited49.36.237.99', '2021-11-11 04:16:54'),
(540, 'users page visited49.36.237.99', '2021-11-11 04:19:29'),
(541, 'users page visited49.36.237.99', '2021-11-11 04:19:32'),
(542, 'users page visited49.36.237.99', '2021-11-11 04:19:34'),
(543, 'users page visited49.36.237.99', '2021-11-11 04:19:41'),
(544, 'users page visited49.36.237.99', '2021-11-11 04:19:42'),
(545, 'users page visited49.36.237.99', '2021-11-11 04:19:43'),
(546, 'users page visited49.36.237.99', '2021-11-11 04:19:50'),
(547, 'users page visited49.36.237.99', '2021-11-11 04:21:00'),
(548, 'users page visited49.36.237.99', '2021-11-11 04:21:17'),
(549, 'admin url vistied 49.36.237.235', '2021-11-11 21:30:08'),
(550, 'admin url vistied 49.36.237.235', '2021-11-11 21:30:11'),
(551, 'admin url vistied 49.36.237.235', '2021-11-11 21:30:13'),
(552, 'login form submit vistied 49.36.237.235', '2021-11-11 21:30:13'),
(553, 'opt page vistied 49.36.237.235', '2021-11-11 21:30:13'),
(554, 'opt page vistied 49.36.237.235', '2021-11-11 21:30:17'),
(555, 'opt submit 49.36.237.235', '2021-11-11 21:30:17'),
(556, 'login success vistied 49.36.237.235', '2021-11-11 21:30:17'),
(557, 'users page visited49.36.237.235', '2021-11-11 21:48:07'),
(558, 'admin url vistied 49.36.237.235', '2021-11-11 22:00:00'),
(559, 'admin url vistied 49.36.237.235', '2021-11-12 01:20:00'),
(560, 'admin url vistied 49.36.237.235', '2021-11-12 01:40:00'),
(561, 'admin url vistied 49.36.237.235', '2021-11-12 02:00:00'),
(562, 'admin url vistied 49.36.237.235', '2021-11-12 02:19:31'),
(563, 'admin url vistied 49.36.237.235', '2021-11-12 03:05:00'),
(564, 'admin url vistied 49.36.237.223', '2021-11-13 00:20:53'),
(565, 'admin url vistied 49.36.237.223', '2021-11-13 01:22:27'),
(566, 'admin url vistied 49.36.237.223', '2021-11-13 01:23:45'),
(567, 'admin url vistied 49.36.237.223', '2021-11-13 01:23:56'),
(568, 'admin url vistied 49.36.237.223', '2021-11-13 01:24:00'),
(569, 'admin url vistied 49.36.237.223', '2021-11-13 01:24:02'),
(570, 'login form submit vistied 49.36.237.223', '2021-11-13 01:24:02'),
(571, 'opt page vistied 49.36.237.223', '2021-11-13 01:24:02'),
(572, 'admin url vistied 49.36.237.223', '2021-11-13 01:24:05'),
(573, 'admin url vistied 49.36.237.223', '2021-11-13 01:24:06'),
(574, 'admin url vistied 49.36.237.223', '2021-11-13 04:56:28'),
(575, 'admin url vistied 49.36.237.235', '2021-11-14 00:10:13'),
(576, 'admin url vistied 49.36.237.235', '2021-11-14 04:21:57'),
(577, 'admin url vistied 49.36.237.187', '2021-11-16 01:53:21'),
(578, 'admin url vistied 49.36.237.135', '2021-11-18 02:55:34'),
(579, 'admin url vistied 49.36.238.88', '2021-11-23 00:35:02'),
(580, 'admin url vistied 49.36.236.202', '2021-11-23 22:16:47'),
(581, 'admin url vistied 49.36.238.28', '2021-11-24 21:17:04'),
(582, 'admin url vistied 49.36.238.136', '2021-11-25 22:06:17'),
(583, 'admin url vistied 49.36.238.136', '2021-11-26 03:34:51'),
(584, 'admin url vistied 49.36.238.0', '2021-11-26 20:48:43'),
(585, 'admin url vistied 49.36.238.0', '2021-11-26 21:16:53'),
(586, 'admin url vistied 49.36.238.0', '2021-11-26 21:51:55'),
(587, 'admin url vistied 49.36.238.0', '2021-11-26 23:09:11'),
(588, 'admin url vistied 49.36.238.0', '2021-11-27 01:58:08'),
(589, 'admin url vistied 49.36.236.242', '2021-11-28 20:48:11'),
(590, 'admin url vistied 49.36.236.242', '2021-11-28 20:52:01'),
(591, 'admin url vistied 49.36.236.242', '2021-11-28 20:52:52'),
(592, 'admin url vistied 49.36.236.242', '2021-11-28 20:56:26'),
(593, 'admin url vistied 49.36.236.242', '2021-11-28 20:57:58'),
(594, 'admin url vistied 49.36.236.242', '2021-11-28 20:58:30'),
(595, 'admin url vistied 49.36.236.242', '2021-11-28 20:58:47'),
(596, 'admin url vistied 49.36.236.242', '2021-11-28 20:58:56'),
(597, 'admin url vistied 49.36.236.242', '2021-11-28 20:59:04'),
(598, 'admin url vistied 49.36.236.242', '2021-11-28 21:02:07'),
(599, 'admin url vistied 49.36.236.242', '2021-11-28 21:02:21'),
(600, 'admin url vistied 49.36.236.242', '2021-11-28 21:02:37'),
(601, 'admin url vistied 49.36.236.242', '2021-11-28 21:04:59'),
(602, 'admin url vistied 49.36.236.242', '2021-11-28 21:06:34'),
(603, 'admin url vistied 49.36.236.242', '2021-11-28 21:06:49'),
(604, 'admin url vistied 49.36.236.242', '2021-11-28 21:07:16'),
(605, 'admin url vistied 49.36.236.242', '2021-11-28 21:07:35'),
(606, 'admin url vistied 49.36.236.242', '2021-11-28 21:10:30'),
(607, 'admin url vistied 49.36.236.242', '2021-11-28 22:40:25'),
(608, 'admin url vistied 49.36.236.242', '2021-11-28 22:46:45'),
(609, 'admin url vistied 49.36.236.242', '2021-11-28 23:07:57'),
(610, 'admin url vistied 49.36.238.88', '2021-11-30 23:14:00'),
(611, 'admin url vistied 49.36.238.88', '2021-11-30 23:16:51'),
(612, 'admin url vistied 49.36.238.88', '2021-11-30 23:20:18'),
(613, 'admin url vistied 49.36.238.88', '2021-11-30 23:20:47'),
(614, 'admin url vistied 49.36.238.88', '2021-11-30 23:21:51'),
(615, 'admin url vistied 49.36.238.88', '2021-11-30 23:30:41'),
(616, 'admin url vistied 49.36.238.88', '2021-12-01 02:09:00'),
(617, 'admin url vistied 49.36.238.88', '2021-12-01 03:57:13'),
(618, 'admin url vistied 49.36.236.94', '2021-12-01 20:42:25'),
(619, 'admin url vistied 49.36.236.94', '2021-12-02 02:55:29'),
(620, 'admin url vistied 49.36.236.94', '2021-12-02 02:55:36'),
(621, 'admin url vistied 1.39.192.39', '2021-12-02 03:20:28'),
(622, 'admin url vistied 1.39.192.39', '2021-12-02 03:21:13'),
(623, 'admin url vistied 1.39.192.39', '2021-12-02 03:21:53'),
(624, 'admin url vistied 49.36.236.94', '2021-12-02 04:14:37'),
(625, 'admin url vistied 49.36.238.164', '2021-12-03 22:20:54'),
(626, 'admin url vistied 49.36.238.164', '2021-12-06 02:42:02'),
(627, 'admin url vistied 49.36.238.224', '2021-12-06 22:06:28'),
(628, 'admin url vistied 49.36.238.224', '2021-12-07 03:01:57'),
(629, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:03'),
(630, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:08'),
(631, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:09'),
(632, 'login form submit vistied 49.36.238.224', '2021-12-07 03:02:09'),
(633, 'opt page vistied 49.36.238.224', '2021-12-07 03:02:09'),
(634, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:11'),
(635, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:12'),
(636, 'admin url vistied 49.36.238.224', '2021-12-07 03:02:21'),
(637, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:14'),
(638, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:17'),
(639, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:19'),
(640, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:20'),
(641, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:25'),
(642, 'admin url vistied 49.36.236.6', '2021-12-08 23:17:30'),
(643, 'admin url vistied 49.36.238.136', '2021-12-14 02:16:22'),
(644, 'admin url vistied 2.56.59.180', '2021-12-16 19:14:58'),
(645, 'admin url vistied 2.56.59.180', '2021-12-16 19:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `losses`
--

CREATE TABLE `losses` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `loss_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `msg` text NOT NULL,
  `title` text NOT NULL,
  `status` enum('No','Yes') NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `amount` float NOT NULL,
  `percent` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `operators`
--

CREATE TABLE `operators` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `api_id` int(11) DEFAULT NULL,
  `commission` decimal(5,2) NOT NULL DEFAULT '0.00',
  `user_commission` decimal(10,2) NOT NULL DEFAULT '0.00',
  `special_api_id` int(11) NOT NULL,
  `min_amount` int(11) NOT NULL DEFAULT '0',
  `max_amount` int(11) NOT NULL DEFAULT '0',
  `up_down` enum('Up','Down') NOT NULL DEFAULT 'Up',
  `status` int(11) NOT NULL DEFAULT '1',
  `online_status` enum('Online','Offline') NOT NULL DEFAULT 'Online',
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operators`
--

INSERT INTO `operators` (`id`, `name`, `type`, `api_id`, `commission`, `user_commission`, `special_api_id`, `min_amount`, `max_amount`, `up_down`, `status`, `online_status`, `logo`) VALUES
(1, 'AIRTEL', 'Prepaid', 1, 1.90, 2.00, 4, 0, 0, 'Up', 1, 'Online', 'airtal-logo.png'),
(2, 'BSNL TOPUP', 'Prepaid', 2, 3.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'bsnl-logo.png'),
(3, 'Bsnl Special', 'Prepaid', 1, 3.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'bsnl-logo.png'),
(4, 'Idea', 'Prepaid', 1, 2.50, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'idae.png'),
(5, 'Vodafone', 'Prepaid', 2, 2.50, 5.00, 0, 0, 0, 'Up', 1, 'Offline', 'vo-logo.png'),
(6, 'Jio', 'Prepaid', 1, 2.50, 0.00, 0, 0, 0, 'Down', 1, 'Offline', 'jio-logo.png'),
(8, 'MTNL DL TOPUP', 'Prepaid', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'mnl.png'),
(37, 'DISH TV', 'DTH', 1, 250.00, 0.00, 2, 0, 0, 'Up', 1, 'Online', 'dishtv.png'),
(38, 'TATASKY DTH TV', 'DTH', 1, 2.50, 0.00, 2, 0, 0, 'Up', 1, 'Online', 'tata.png'),
(40, 'VIDEOCON DTH TV', 'DTH', 1, 2.50, 0.00, 2, 0, 0, 'Up', 1, 'Online', 'd2h.png'),
(41, 'SUN TV', 'DTH', 1, 3.25, 0.00, 1, 0, 0, 'Up', 1, 'Online', 'sun.png'),
(42, 'AIRTEL DIGITAL DTH TV', 'DTH', 1, 2.50, 0.00, 1, 0, 0, 'Up', 1, 'Online', 'airtaltv.png'),
(43, 'MTNL Dl SPECIAL', 'Prepaid', 1, 0.10, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'mnl.png'),
(44, 'Vodafone Postpaid', 'Postpaid', 1, 0.10, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'vo-logo.png'),
(45, 'Airtel Postpaid', 'Postpaid', 1, 0.10, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'airtal-logo.png'),
(46, 'Bsnl Postpaid', 'Postpaid', 1, 0.10, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'bsnl-logo.png'),
(47, 'Idea Postpaid', 'Postpaid', 1, 0.10, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'idae.png'),
(63, 'Ajmer Vidyut Vitran Nigam - RAJASTHAN', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(64, 'APDCL - ASSAM', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(65, 'BESCOM - BENGALURU', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(66, 'BEST Undertaking - MUMBAI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(67, 'BSES Rajdhani - DELHI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(68, 'BSES Yamuna - DELHI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(69, 'CESC - WEST BENGAL', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(70, 'CSPDCL - CHHATTISGARH', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(71, 'DHBVN - HARYANA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(72, 'DNHPDCL - DADRA & NAGAR HAVELI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(73, 'India Power - BIHAR', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(74, 'Jaipur Vidyut Vitran Nigam - RAJASTHAN', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(75, 'Jamshedpur Utilities & Services (JUSCO)', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(76, 'Jodhpur Vidyut Vitran Nigam - RAJASTHAN', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(77, 'Madhya Kshetra Vitaran - MADHYA PRADESH', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(78, 'MSEDC - MAHARASHTRA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(79, 'Noida Power - NOIDA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(81, 'Paschim Kshetra Vitaran - MADHYA PRADESH', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(82, 'Reliance Energy - MUMBAI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(83, 'Southern Power - ANDHRA PRADESH', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(84, 'Southern Power - TELANGANA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(85, 'Tata Power - DELHI', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 0, 'Online', 'electric.png'),
(86, 'Torrent Power', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(87, 'TSECL - TRIPURA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(88, 'Adani Gas - Gujrat', 'Gas', 1, 2.20, 2.20, 0, 0, 0, 'Up', 1, 'Offline', 'gas.png'),
(89, 'Gujarat Gas', 'Gas', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'gas.png'),
(90, 'Indraprastha Gas', 'Gas', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'gas.png'),
(91, 'Mahanagar Gas', 'Gas', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'gas.png'),
(94, 'Adani Gas - Haryana', 'Gas', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Offline', 'gas.png'),
(96, 'ICICI Prudential Life Insurance', 'Insurence', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'cicic.png'),
(98, 'Tata AIA Life Insurance', 'Insurence', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'tatalife.png'),
(115, 'AIRTEL Landline', 'Landline', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'ladline.png'),
(116, 'BSNL Landline', 'Landline', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'ladline.png'),
(117, 'TATA DOCOMO CDMA LANDLINE', 'Landline', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'ladline.png'),
(118, 'MTNL DELHI Landline', 'Landline', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'ladline.png'),
(119, 'Urban Improvement Trust(UIT)- Bhiwadi', 'Water', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'water.png'),
(120, 'Municipal Corporation of Gurugram', 'Water', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'water.png'),
(121, 'Delhi Jal Board', 'Water', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'water.png'),
(122, 'Uttarakhand Jal Sansthan', 'Water', 1, 0.00, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'water.png'),
(123, 'Apepdcl - Andhra Pradesh', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(124, 'Apspdcl - Andhra Pradesh', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(125, 'BESL - Bharatpur', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(126, 'BKESL - Bikaner', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(127, 'Daman and Diu Electricity', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(128, 'DGVCL - Gujrat', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(129, 'Gescom - Karnataka', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(130, 'India Power - West Bengal', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(131, 'Kota Electricity Distribution - Rajasthan', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(132, '\r\nMepdcl - Meghalaya', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(133, '\r\nMgvcl - Gujarat', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(134, '\r\nMuzaffarpur Vidyut Vitran', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(135, '\r\nNbpdcl - Bihar', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(136, '\r\nNesco - Odisha', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(137, '\r\nPgvcl - Gujarat', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(138, '\r\nSbpdcl - Bihar', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(139, '\r\nSndl Power - Nagpur', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(140, '\r\nSouthco - Odisha', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(141, '\r\nTata Power - Mumbai', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(142, '\r\nTneb- Tamil Nadu', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(143, '\r\nTata Power - Ajmer', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(144, '\r\nUgvcl - Gujarat', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(145, '\r\nUpcl - Uttarakhand', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(146, '\r\nUppcl (Rural) - Uttar Pradesh', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(147, '\r\nUppcl (Urban) - Uttar Pradesh', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(148, '\r\nWesco - Odisha', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(149, '\r\nAPDCL (Non-RAPDR) - ASSAM', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(150, '\r\nJBVNL - JHARKHAND', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(151, '\r\nCESCOM - KARNATAKA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(152, '\r\nHESCOM - KARNATAKA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(153, '\r\nHimachal Pradesh State Electricity Board', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(154, '\r\nPSPCL - PUNJAB', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(155, '\r\nUHBVN - HARYANA', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(156, '\r\nBharatpur Electricity Service Limited - Rajasthan', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(157, '\r\nWBSEDCL - WEST BENGAL', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(158, 'Kerala State Electricity Board Ltd. (KSEB)', 'Electricity', 1, 0.20, 0.00, 0, 0, 0, 'Up', 1, 'Online', 'electric.png'),
(159, 'Jio Live (Low Margin)', 'Prepaid', 1, 5.00, 3.00, 0, 0, 0, 'Down', 1, 'Offline', 'jiotv.png');

-- --------------------------------------------------------

--
-- Table structure for table `operator_codes`
--

CREATE TABLE `operator_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `operator_id` int(11) NOT NULL,
  `api_commission` double NOT NULL,
  `api_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operator_codes`
--

INSERT INTO `operator_codes` (`id`, `code`, `operator_id`, `api_commission`, `api_id`) VALUES
(1, '1', 1, 0, 1),
(2, '2', 2, 0, 1),
(3, '3', 3, 0, 1),
(4, '4', 4, 0, 1),
(5, '5', 5, 0, 1),
(6, '6', 6, 0, 1),
(7, '8', 8, 0, 1),
(8, '10', 10, 0, 1),
(9, '11', 11, 0, 1),
(10, '12', 12, 0, 1),
(11, '37', 37, 0, 1),
(12, '38', 38, 0, 1),
(13, '39', 39, 0, 1),
(14, '40', 40, 0, 1),
(15, '41', 41, 0, 1),
(16, '42', 42, 0, 1),
(17, '43', 43, 0, 1),
(18, '44', 44, 0, 1),
(19, '45', 45, 0, 1),
(20, '46', 46, 0, 1),
(21, '47', 47, 0, 1),
(22, '49', 49, 0, 1),
(23, '50', 50, 0, 1),
(24, '63', 63, 0, 1),
(25, '64', 64, 0, 1),
(26, '65', 65, 0, 1),
(27, '66', 66, 0, 1),
(28, '67', 67, 0, 1),
(29, '68', 68, 0, 1),
(30, '69', 69, 0, 1),
(31, '70', 70, 0, 1),
(32, '71', 71, 0, 1),
(33, '72', 72, 0, 1),
(34, '73', 73, 0, 1),
(35, '74', 74, 0, 1),
(36, '75', 75, 0, 1),
(37, '76', 76, 0, 1),
(38, '77', 77, 0, 1),
(39, '78', 78, 0, 1),
(40, '79', 79, 0, 1),
(41, '81', 81, 0, 1),
(42, '82', 82, 0, 1),
(43, '83', 83, 0, 1),
(44, '84', 84, 0, 1),
(45, '85', 85, 0, 1),
(46, '86', 86, 0, 1),
(47, '87', 87, 0, 1),
(48, '88', 88, 0, 1),
(49, '89', 89, 0, 1),
(50, '90', 90, 0, 1),
(51, '91', 91, 0, 1),
(52, '94', 94, 0, 1),
(53, '96', 96, 0, 1),
(54, '98', 98, 0, 1),
(55, '115', 115, 0, 1),
(56, '116', 116, 0, 1),
(57, '117', 117, 0, 1),
(58, '118', 118, 0, 1),
(59, '119', 119, 0, 1),
(60, '120', 120, 0, 1),
(61, '121', 121, 0, 1),
(62, '122', 122, 0, 1),
(63, '123', 123, 0, 1),
(64, '124', 124, 0, 1),
(65, '125', 125, 0, 1),
(66, '126', 126, 0, 1),
(67, '127', 127, 0, 1),
(68, '128', 128, 0, 1),
(69, '129', 129, 0, 1),
(70, '130', 130, 0, 1),
(71, '131', 131, 0, 1),
(72, '132', 132, 0, 1),
(73, '133', 133, 0, 1),
(74, '134', 134, 0, 1),
(75, '135', 135, 0, 1),
(76, '136', 136, 0, 1),
(77, '137', 137, 0, 1),
(78, '138', 138, 0, 1),
(79, '139', 139, 0, 1),
(80, '140', 140, 0, 1),
(81, '141', 141, 0, 1),
(82, '142', 142, 0, 1),
(83, '143', 143, 0, 1),
(84, '144', 144, 0, 1),
(85, '145', 145, 0, 1),
(86, '146', 146, 0, 1),
(87, '147', 147, 0, 1),
(88, '148', 148, 0, 1),
(89, '149', 149, 0, 1),
(90, '150', 150, 0, 1),
(91, '151', 151, 0, 1),
(92, '152', 152, 0, 1),
(93, '153', 153, 0, 1),
(94, '154', 154, 0, 1),
(95, '155', 155, 0, 1),
(96, '156', 156, 0, 1),
(97, '157', 157, 0, 1),
(98, '158', 158, 5, 1),
(99, '162', 159, 0, 1),
(100, '1', 1, 0, 2),
(101, '4', 2, 0, 2),
(102, '2', 3, 0, 2),
(103, '3', 4, 0, 2),
(104, '6', 5, 0, 2),
(105, '5', 6, 0, 2),
(106, '42', 7, 0, 2),
(107, '37', 9, 0, 2),
(108, '41', 11, 0, 2),
(109, '38', 12, 0, 2),
(110, '46', 13, 0, 2),
(111, '45', 14, 0, 2),
(112, '47', 15, 0, 2),
(113, '44', 16, 0, 2),
(114, '40', 20, 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `frenchise_id` int(11) DEFAULT NULL,
  `order_id` int(11) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `total_bv` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `address1` varchar(255) NOT NULL,
  `address2` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `status` enum('Pending','Rejected','Approved') NOT NULL DEFAULT 'Pending',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `otps`
--

CREATE TABLE `otps` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `otp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `payment_modes`
--

CREATE TABLE `payment_modes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_modes`
--

INSERT INTO `payment_modes` (`id`, `name`) VALUES
(1, 'IMPS'),
(2, 'NEFT'),
(3, 'RTGS'),
(4, 'PayTM'),
(5, 'Google Pay'),
(6, 'Phone Pay'),
(7, 'Same Bank');

-- --------------------------------------------------------

--
-- Table structure for table `payment_request`
--

CREATE TABLE `payment_request` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `payment_mode` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `comment` varchar(255) NOT NULL DEFAULT '',
  `amount` float NOT NULL DEFAULT '0',
  `utr_number` varchar(255) NOT NULL,
  `status` enum('Waiting','Approved','Rejected') NOT NULL DEFAULT 'Waiting',
  `date_time` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paytm_transactions`
--

CREATE TABLE `paytm_transactions` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT 'PENDING',
  `amount` double NOT NULL,
  `payment_amount` float DEFAULT NULL,
  `extra_amount` double NOT NULL DEFAULT '0',
  `payment_currency` varchar(50) DEFAULT NULL,
  `txn_id` varchar(255) DEFAULT NULL,
  `response_code` text,
  `response_msg` varchar(256) DEFAULT NULL,
  `gateway_name` varchar(255) DEFAULT NULL,
  `bank_txn_id` varchar(256) DEFAULT NULL,
  `bank_name` text,
  `mode` varchar(255) NOT NULL DEFAULT '',
  `request_time` datetime NOT NULL,
  `date_time` datetime DEFAULT NULL,
  `chec` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_category_name` varchar(255) DEFAULT NULL,
  `product_sub_category_name` varchar(255) DEFAULT NULL,
  `product_mrp` varchar(255) DEFAULT NULL,
  `product_dp` varchar(255) DEFAULT NULL,
  `product_bv` varchar(255) DEFAULT NULL,
  `product_stock` int(11) DEFAULT NULL,
  `product_full_desc` longtext,
  `product_short_desc` longtext,
  `product_image` varchar(255) DEFAULT NULL,
  `product_gallery_image1` varchar(255) DEFAULT NULL,
  `product_gallery_image2` varchar(255) DEFAULT NULL,
  `product_gallery_image3` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

CREATE TABLE `product_stock` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `total_quantity` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL,
  `updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `rank_business`
--

CREATE TABLE `rank_business` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `business` float NOT NULL,
  `name` varchar(255) NOT NULL,
  `bonus` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rank_business`
--

INSERT INTO `rank_business` (`id`, `level`, `business`, `name`, `bonus`) VALUES
(1, 1, 6000, '', '12'),
(2, 2, 14000, '', '35'),
(3, 3, 21000, '', '65'),
(4, 4, 30000, '', '100'),
(5, 5, 70000, '', '250'),
(6, 6, 150000, '', '700'),
(7, 7, 190000, '', '1000'),
(8, 8, 260000, '', '1500'),
(9, 9, 650000, '', '3500'),
(10, 10, 1600000, '', '10000');

-- --------------------------------------------------------

--
-- Table structure for table `recharges`
--

CREATE TABLE `recharges` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `status` enum('SUBMITTED','PENDING','SUCCESS','FAILED','REFUNDED') NOT NULL,
  `std_code` int(11) DEFAULT NULL,
  `ac_number` varchar(20) DEFAULT NULL,
  `operator_id` int(11) NOT NULL,
  `opcode` varchar(255) NOT NULL,
  `circle_id` int(11) NOT NULL,
  `circle_code` varchar(50) DEFAULT NULL,
  `api_id` int(11) NOT NULL,
  `amount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `ramount` decimal(10,3) NOT NULL DEFAULT '0.000',
  `cashback` decimal(10,3) NOT NULL DEFAULT '0.000',
  `order_id` varchar(100) NOT NULL,
  `recharge_type` enum('Prepaid','Postpaid','DTH','Datacard','Electricity','Gas','Insurence','Landline','Water') NOT NULL,
  `api_order_id` varchar(255) DEFAULT NULL,
  `operator_ref` varchar(255) NOT NULL DEFAULT '',
  `request_time` bigint(20) NOT NULL,
  `response_time` bigint(20) DEFAULT NULL,
  `credit_used` double DEFAULT NULL,
  `balance` double DEFAULT NULL,
  `resposnse_message` varchar(255) DEFAULT NULL,
  `response` text,
  `subdivision` varchar(255) NOT NULL DEFAULT '',
  `callback` text,
  `ip` varchar(100) DEFAULT NULL,
  `callback_ip` varchar(50) DEFAULT NULL,
  `recharge_from` enum('Web','App') NOT NULL DEFAULT 'App'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recharge_cashback`
--

CREATE TABLE `recharge_cashback` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `recharge_amount` float NOT NULL,
  `cashback_amount` float DEFAULT NULL,
  `status` enum('Pending','Success','Failed') NOT NULL DEFAULT 'Pending',
  `operator_id` int(11) NOT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recharge_request`
--

CREATE TABLE `recharge_request` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `request_time` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `refer_earnings`
--

CREATE TABLE `refer_earnings` (
  `id` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `user_order_id` int(11) NOT NULL,
  `sponser_id` varchar(255) NOT NULL,
  `business` decimal(15,2) NOT NULL DEFAULT '0.00',
  `amount_rec` decimal(10,3) NOT NULL DEFAULT '0.000',
  `level` int(11) NOT NULL,
  `percent` float NOT NULL,
  `status` enum('Hold','Clear','Laps') NOT NULL DEFAULT 'Hold',
  `date_time` varchar(255) DEFAULT NULL,
  `updated` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `telegram` varchar(255) NOT NULL,
  `ppt` varchar(255) NOT NULL,
  `day_trade` float NOT NULL DEFAULT '1',
  `fix_trade` float NOT NULL DEFAULT '1',
  `speed_trade` decimal(10,2) NOT NULL,
  `logo` varchar(255) DEFAULT ' ',
  `recharge_status` enum('On','Off') NOT NULL DEFAULT 'On'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `message`, `telegram`, `ppt`, `day_trade`, `fix_trade`, `speed_trade`, `logo`, `recharge_status`) VALUES
(1, 'test test test test test test test', 'https://www.youtube.com/watch?v=_4Cbc997Iyw', 'https://www.youtube.com/watch?v=_4Cbc997Iyw', 1.74, 3.15, 0.00, '1636627481JGD3D.png', 'On');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL,
  `state_code` int(11) NOT NULL,
  `state_region` varchar(255) NOT NULL,
  `state_type` varchar(255) NOT NULL,
  `state_gov_code` varchar(255) NOT NULL,
  `state_gst` int(11) NOT NULL,
  `is_blocked` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_name`, `state_code`, `state_region`, `state_type`, `state_gov_code`, `state_gst`, `is_blocked`) VALUES
(1, 'Andaman and Nicobar', 32, 'East', 'Union Territories', 'AN', 35, 0),
(2, 'Andhra Pradesh', 5, 'South', 'States', 'AP', 37, 0),
(3, 'Arunachal Pradesh', 24, 'North East', 'States', 'AR', 12, 0),
(4, 'Assam', 19, 'North East', 'States', 'AS', 18, 0),
(5, 'Bihar', 17, 'East', 'States', 'BR', 10, 0),
(6, 'Chandigarh', 2, 'North', 'Union Territories', 'CH', 4, 0),
(7, 'Chhattisgarh', 9, 'North', 'States', 'CT', 22, 0),
(8, 'Dadra and Nagar Haveli', 33, 'West', 'Union Territories', 'DN', 26, 0),
(9, 'Daman and Diu', 34, 'West', 'Union Territories', 'DD', 25, 0),
(10, 'Delhi', 1, 'North', 'Union Territories', 'DL', 7, 0),
(11, 'Goa', 23, 'West', 'States', 'GA', 30, 0),
(12, 'Gujarat', 8, 'West', 'States', 'GJ', 24, 0),
(13, 'Haryana', 16, 'North', 'States', 'HR', 6, 0),
(14, 'Himachal Pradesh', 21, 'North', 'States', 'HP', 2, 0),
(15, 'Jammu and Kashmir', 22, 'North', 'States', 'JK', 1, 0),
(16, 'Jharkhand', 20, 'East', 'States', 'JH', 20, 0),
(17, 'Karnataka', 7, 'South', 'States', 'KA', 29, 0),
(18, 'Kerala', 14, 'South', 'States', 'KL', 32, 0),
(19, 'Lakshadweep', 35, 'South', 'Union Territories', 'LD', 31, 0),
(20, 'Madhya Pradesh', 10, 'North', 'States', 'MP', 23, 0),
(21, 'Maharashtra', 4, 'West', 'States', 'MH', 27, 0),
(22, 'Manipur', 30, 'North East', 'States', 'MN', 14, 0),
(23, 'Meghalaya', 29, 'North East', 'States', 'ML', 17, 0),
(24, 'Mizoram', 28, 'North East', 'States', 'MZ', 15, 0),
(25, 'Nagaland', 26, 'North East', 'States', 'NL', 13, 0),
(26, 'Odisha', 18, 'East', 'States', 'OR', 21, 0),
(27, 'Puducherry', 31, 'South', 'Union Territories', 'PY', 34, 0),
(28, 'Punjab', 15, 'North', 'States', 'PB', 3, 0),
(29, 'Rajasthan', 13, 'North', 'States', 'RJ', 8, 0),
(30, 'Sikkim', 25, 'North East', 'States', 'SK', 11, 0),
(31, 'Tamil Nadu', 6, 'South', 'States', 'TN', 33, 0),
(32, 'Telangana', 36, 'South', 'States', 'TG', 36, 0),
(33, 'Tripura', 27, 'North East', 'States', 'TR', 16, 0),
(34, 'Uttar Pradesh', 11, 'North', 'States', 'UP', 9, 0),
(35, 'Uttarakhand', 12, 'North', 'States', 'UT', 5, 0),
(36, 'West Bengal', 3, 'East', 'States', 'WB', 19, 0);

-- --------------------------------------------------------

--
-- Table structure for table `stock_record`
--

CREATE TABLE `stock_record` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `remainning` varchar(255) DEFAULT NULL,
  `order_stock` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `cat_name` varchar(255) DEFAULT NULL,
  `sub_category_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `travel_fund`
--

CREATE TABLE `travel_fund` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `created` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sec_code` varchar(255) DEFAULT NULL,
  `sponser_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `earnings` decimal(10,2) NOT NULL DEFAULT '0.00',
  `funds` decimal(10,2) NOT NULL DEFAULT '0.00',
  `active_direct` int(11) NOT NULL DEFAULT '0',
  `total_direct` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  `performance_rank` int(11) NOT NULL DEFAULT '0',
  `earned` decimal(15,2) NOT NULL DEFAULT '0.00',
  `self_business` decimal(10,2) NOT NULL DEFAULT '0.00',
  `team_business` decimal(10,2) NOT NULL DEFAULT '0.00',
  `level_value` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) NOT NULL DEFAULT '',
  `ac_holder` varchar(255) DEFAULT NULL,
  `ac_number` varchar(255) DEFAULT NULL,
  `ifsc_code` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `fcm_token` varchar(255) NOT NULL DEFAULT '',
  `status` enum('Pending','Active','Suspended','Inactive') CHARACTER SET latin1 COLLATE latin1_german2_ci NOT NULL DEFAULT 'Pending',
  `date_time` datetime NOT NULL,
  `date` date NOT NULL,
  `activation_date_time` varchar(255) DEFAULT '',
  `noti_count` int(11) NOT NULL DEFAULT '0',
  `country` int(11) NOT NULL DEFAULT '0',
  `level1_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `level2_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `level3_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `level4_status` enum('Yes','No') NOT NULL DEFAULT 'No',
  `level1` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level2` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level3` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level4` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level5` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level6` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level7` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level8` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level9` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level10` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level11` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level12` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level13` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level14` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level15` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level16` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level17` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level18` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level19` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level20` decimal(20,2) NOT NULL DEFAULT '0.00',
  `level21` decimal(20,2) NOT NULL DEFAULT '0.00',
  `with_status` enum('Yes','No') NOT NULL DEFAULT 'Yes'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `sec_code`, `sponser_id`, `token`, `name`, `mobile`, `email`, `earnings`, `funds`, `active_direct`, `total_direct`, `rank`, `performance_rank`, `earned`, `self_business`, `team_business`, `level_value`, `device_id`, `ac_holder`, `ac_number`, `ifsc_code`, `bank_name`, `fcm_token`, `status`, `date_time`, `date`, `activation_date_time`, `noti_count`, `country`, `level1_status`, `level2_status`, `level3_status`, `level4_status`, `level1`, `level2`, `level3`, `level4`, `level5`, `level6`, `level7`, `level8`, `level9`, `level10`, `level11`, `level12`, `level13`, `level14`, `level15`, `level16`, `level17`, `level18`, `level19`, `level20`, `level21`, `with_status`) VALUES
(22, 'ASPRAL', '7c4a8d09ca3762af61e59520943dc26494f8941b', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'ADD', '112AVHN25I2PE3Z26QI4ZSCY8V5HY4', 'admin', '1234567890', 'admin@gmail.com', 0.00, 0.00, 0, 0, 0, 0, 0.00, 0.00, 0.00, NULL, '77fce8305634bf9a', NULL, NULL, NULL, NULL, '', 'Active', '2021-10-07 10:18:57', '2021-10-07', '2021-10-07 10:18:57', 0, 99, 'No', 'No', 'No', 'No', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `wallet`
--

CREATE TABLE `wallet` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `remaning` double NOT NULL,
  `amount` decimal(10,3) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `type` enum('Cr','Dr') NOT NULL,
  `wallet` enum('Main','Fund','Level','Coin') NOT NULL DEFAULT 'Main',
  `date_time` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activation_history`
--
ALTER TABLE `activation_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `admin_add`
--
ALTER TABLE `admin_add`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_banks`
--
ALTER TABLE `admin_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_noti`
--
ALTER TABLE `admin_noti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apis`
--
ALTER TABLE `apis`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `buy_product`
--
ALTER TABLE `buy_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_fund`
--
ALTER TABLE `car_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_fund_report`
--
ALTER TABLE `car_fund_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `circles`
--
ALTER TABLE `circles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `circle_codes`
--
ALTER TABLE `circle_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_harder_income`
--
ALTER TABLE `company_harder_income`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downline`
--
ALTER TABLE `downline`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sponser_id` (`sponser_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `frenchise_product_stock`
--
ALTER TABLE `frenchise_product_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frenchise_stock_record`
--
ALTER TABLE `frenchise_stock_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frenchise_users`
--
ALTER TABLE `frenchise_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level_incomes`
--
ALTER TABLE `level_incomes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_activity`
--
ALTER TABLE `login_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `operator_codes`
--
ALTER TABLE `operator_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_modes`
--
ALTER TABLE `payment_modes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_request`
--
ALTER TABLE `payment_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date_time` (`date_time`);

--
-- Indexes for table `paytm_transactions`
--
ALTER TABLE `paytm_transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `request_time` (`request_time`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recharges`
--
ALTER TABLE `recharges`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`),
  ADD KEY `number` (`number`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `response_time` (`response_time`);

--
-- Indexes for table `recharge_cashback`
--
ALTER TABLE `recharge_cashback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `date_time` (`date_time`);

--
-- Indexes for table `recharge_request`
--
ALTER TABLE `recharge_request`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `request_time` (`request_time`);

--
-- Indexes for table `refer_earnings`
--
ALTER TABLE `refer_earnings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_record`
--
ALTER TABLE `stock_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `travel_fund`
--
ALTER TABLE `travel_fund`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indexes for table `wallet`
--
ALTER TABLE `wallet`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activation_history`
--
ALTER TABLE `activation_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_add`
--
ALTER TABLE `admin_add`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_banks`
--
ALTER TABLE `admin_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_noti`
--
ALTER TABLE `admin_noti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `apis`
--
ALTER TABLE `apis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `buy_product`
--
ALTER TABLE `buy_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_fund`
--
ALTER TABLE `car_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `car_fund_report`
--
ALTER TABLE `car_fund_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `circles`
--
ALTER TABLE `circles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `circle_codes`
--
ALTER TABLE `circle_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `company_harder_income`
--
ALTER TABLE `company_harder_income`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `downline`
--
ALTER TABLE `downline`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frenchise_product_stock`
--
ALTER TABLE `frenchise_product_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frenchise_stock_record`
--
ALTER TABLE `frenchise_stock_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `frenchise_users`
--
ALTER TABLE `frenchise_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

--
-- AUTO_INCREMENT for table `level_incomes`
--
ALTER TABLE `level_incomes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `login_activity`
--
ALTER TABLE `login_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=646;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `operators`
--
ALTER TABLE `operators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `operator_codes`
--
ALTER TABLE `operator_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_modes`
--
ALTER TABLE `payment_modes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_request`
--
ALTER TABLE `payment_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paytm_transactions`
--
ALTER TABLE `paytm_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_stock`
--
ALTER TABLE `product_stock`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recharges`
--
ALTER TABLE `recharges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recharge_cashback`
--
ALTER TABLE `recharge_cashback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recharge_request`
--
ALTER TABLE `recharge_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refer_earnings`
--
ALTER TABLE `refer_earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `stock_record`
--
ALTER TABLE `stock_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `travel_fund`
--
ALTER TABLE `travel_fund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=651;

--
-- AUTO_INCREMENT for table `wallet`
--
ALTER TABLE `wallet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
