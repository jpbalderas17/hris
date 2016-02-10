-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2015 at 03:51 AM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrisdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `archivedemployees`
--

CREATE TABLE `archivedemployees` (
  `id` bigint(20) NOT NULL,
  `ref_id` bigint(20) NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `last_name` varchar(100) NOT NULL DEFAULT '',
  `gender` enum('Male','Female') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT '',
  `nic_num` varchar(100) DEFAULT '',
  `other_id` varchar(100) DEFAULT '',
  `work_email` varchar(100) DEFAULT NULL,
  `joined_date` datetime DEFAULT '0000-00-00 00:00:00',
  `confirmation_date` datetime DEFAULT '0000-00-00 00:00:00',
  `supervisor` bigint(20) DEFAULT NULL,
  `department` bigint(20) DEFAULT NULL,
  `termination_date` datetime DEFAULT '0000-00-00 00:00:00',
  `notes` text,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `in_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `out_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee`, `in_time`, `out_time`, `note`) VALUES
(6, 1, '2015-12-16 08:41:29', '0000-00-00 00:00:00', ''),
(7, 1, '2015-12-21 01:33:02', '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `auditlog`
--

CREATE TABLE `auditlog` (
  `id` bigint(20) NOT NULL,
  `time` datetime DEFAULT '0000-00-00 00:00:00',
  `user` bigint(20) NOT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `type` varchar(100) NOT NULL,
  `employee` varchar(300) DEFAULT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `certifications`
--

CREATE TABLE `certifications` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `certifications`
--

INSERT INTO `certifications` (`id`, `name`, `description`) VALUES
(1, 'Red Hat Certified Architect (RHCA)', 'Red Hat Certified Architect (RHCA)'),
(2, 'GIAC Secure Software Programmer -Java', 'GIAC Secure Software Programmer -Java'),
(3, 'Risk Management Professional (PMI)', 'Risk Management Professional (PMI)'),
(4, 'IT Infrastructure Library (ITIL) Expert Certification', 'IT Infrastructure Library (ITIL) Expert Certification'),
(5, 'Microsoft Certified Architect', 'Microsoft Certified Architect'),
(6, 'Oracle Exadata 11g Certified Implementation Specialist', 'Oracle Exadata 11g Certified Implementation Specialist'),
(7, 'Cisco Certified Design Professional (CCDP)', 'Cisco Certified Design Professional (CCDP)'),
(8, 'Cisco Certified Internetwork Expert (CCIE)', 'Cisco Certified Internetwork Expert (CCIE)'),
(9, 'Cisco Certified Network Associate', 'Cisco Certified Network Associate'),
(10, 'HP/Master Accredited Solutions Expert (MASE)', 'HP/Master Accredited Solutions Expert (MASE)'),
(11, 'HP/Master Accredited Systems Engineer (Master ASE)', 'HP/Master Accredited Systems Engineer (Master ASE)'),
(12, 'Certified Information Security Manager (CISM)', 'Certified Information Security Manager (CISM)'),
(13, 'Certified Information Systems Auditor (CISA)', 'Certified Information Systems Auditor (CISA)'),
(14, 'CyberSecurity Forensic Analyst (CSFA)', 'CyberSecurity Forensic Analyst (CSFA)'),
(15, 'Open Group Certified Architect (OpenCA)', 'Open Group Certified Architect (OpenCA)'),
(16, 'Oracle DBA Administrator Certified Master OCM', 'Oracle DBA Administrator Certified Master OCM'),
(17, 'Project Management Professional', 'Project Management Professional'),
(18, 'Apple Certified Support Professional', 'Apple Certified Support Professional'),
(19, 'Certified Public Accountant (CPA)', 'Certified Public Accountant (CPA)'),
(20, 'Chartered Financial Analyst', 'Chartered Financial Analyst'),
(21, 'Professional in Human Resources (PHR)', 'Professional in Human Resources (PHR)');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text,
  `first_contact_date` date DEFAULT '0000-00-00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `address` text,
  `contact_number` varchar(25) DEFAULT NULL,
  `contact_email` varchar(25) DEFAULT NULL,
  `company_url` varchar(500) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `companyloans`
--

CREATE TABLE `companyloans` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companyloans`
--

INSERT INTO `companyloans` (`id`, `name`, `details`) VALUES
(1, 'Personal loan', 'Personal loans'),
(2, 'Educational loan', 'Educational loan');

-- --------------------------------------------------------

--
-- Table structure for table `companystructures`
--

CREATE TABLE `companystructures` (
  `id` bigint(20) NOT NULL,
  `title` tinytext NOT NULL,
  `description` text NOT NULL,
  `address` text,
  `type` enum('Company','Head Office','Regional Office','Department','Unit','Sub Unit','Other') DEFAULT NULL,
  `country` varchar(2) NOT NULL DEFAULT '0',
  `parent` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `companystructures`
--

INSERT INTO `companystructures` (`id`, `title`, `description`, `address`, `type`, `country`, `parent`) VALUES
(1, 'Spark Global Tech Systems, Inc', 'Lalala', 'Phils. Stock Exchange', 'Company', 'PH', NULL),
(2, 'Head Office', 'US Head office', 'PO Box 001002\nSample Road, Sample Town', 'Head Office', 'US', 1),
(4, 'Sample', 'Sample', '', 'Department', 'PH', 2);

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` bigint(20) NOT NULL,
  `code` char(2) NOT NULL DEFAULT '',
  `namecap` varchar(80) DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `iso3` char(3) DEFAULT NULL,
  `numcode` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `code`, `namecap`, `name`, `iso3`, `numcode`) VALUES
(1, 'AF', 'AFGHANISTAN', 'Afghanistan', 'AFG', 4),
(2, 'AL', 'ALBANIA', 'Albania', 'ALB', 8),
(3, 'DZ', 'ALGERIA', 'Algeria', 'DZA', 12),
(4, 'AS', 'AMERICAN SAMOA', 'American Samoa', 'ASM', 16),
(5, 'AD', 'ANDORRA', 'Andorra', 'AND', 20),
(6, 'AO', 'ANGOLA', 'Angola', 'AGO', 24),
(7, 'AI', 'ANGUILLA', 'Anguilla', 'AIA', 660),
(8, 'AQ', 'ANTARCTICA', 'Antarctica', NULL, NULL),
(9, 'AG', 'ANTIGUA AND BARBUDA', 'Antigua and Barbuda', 'ATG', 28),
(10, 'AR', 'ARGENTINA', 'Argentina', 'ARG', 32),
(11, 'AM', 'ARMENIA', 'Armenia', 'ARM', 51),
(12, 'AW', 'ARUBA', 'Aruba', 'ABW', 533),
(13, 'AU', 'AUSTRALIA', 'Australia', 'AUS', 36),
(14, 'AT', 'AUSTRIA', 'Austria', 'AUT', 40),
(15, 'AZ', 'AZERBAIJAN', 'Azerbaijan', 'AZE', 31),
(16, 'BS', 'BAHAMAS', 'Bahamas', 'BHS', 44),
(17, 'BH', 'BAHRAIN', 'Bahrain', 'BHR', 48),
(18, 'BD', 'BANGLADESH', 'Bangladesh', 'BGD', 50),
(19, 'BB', 'BARBADOS', 'Barbados', 'BRB', 52),
(20, 'BY', 'BELARUS', 'Belarus', 'BLR', 112),
(21, 'BE', 'BELGIUM', 'Belgium', 'BEL', 56),
(22, 'BZ', 'BELIZE', 'Belize', 'BLZ', 84),
(23, 'BJ', 'BENIN', 'Benin', 'BEN', 204),
(24, 'BM', 'BERMUDA', 'Bermuda', 'BMU', 60),
(25, 'BT', 'BHUTAN', 'Bhutan', 'BTN', 64),
(26, 'BO', 'BOLIVIA', 'Bolivia', 'BOL', 68),
(27, 'BA', 'BOSNIA AND HERZEGOVINA', 'Bosnia and Herzegovina', 'BIH', 70),
(28, 'BW', 'BOTSWANA', 'Botswana', 'BWA', 72),
(29, 'BV', 'BOUVET ISLAND', 'Bouvet Island', NULL, NULL),
(30, 'BR', 'BRAZIL', 'Brazil', 'BRA', 76),
(31, 'IO', 'BRITISH INDIAN OCEAN TERRITORY', 'British Indian Ocean Territory', NULL, NULL),
(32, 'BN', 'BRUNEI DARUSSALAM', 'Brunei Darussalam', 'BRN', 96),
(33, 'BG', 'BULGARIA', 'Bulgaria', 'BGR', 100),
(34, 'BF', 'BURKINA FASO', 'Burkina Faso', 'BFA', 854),
(35, 'BI', 'BURUNDI', 'Burundi', 'BDI', 108),
(36, 'KH', 'CAMBODIA', 'Cambodia', 'KHM', 116),
(37, 'CM', 'CAMEROON', 'Cameroon', 'CMR', 120),
(38, 'CA', 'CANADA', 'Canada', 'CAN', 124),
(39, 'CV', 'CAPE VERDE', 'Cape Verde', 'CPV', 132),
(40, 'KY', 'CAYMAN ISLANDS', 'Cayman Islands', 'CYM', 136),
(41, 'CF', 'CENTRAL AFRICAN REPUBLIC', 'Central African Republic', 'CAF', 140),
(42, 'TD', 'CHAD', 'Chad', 'TCD', 148),
(43, 'CL', 'CHILE', 'Chile', 'CHL', 152),
(44, 'CN', 'CHINA', 'China', 'CHN', 156),
(45, 'CX', 'CHRISTMAS ISLAND', 'Christmas Island', NULL, NULL),
(46, 'CC', 'COCOS (KEELING) ISLANDS', 'Cocos (Keeling) Islands', NULL, NULL),
(47, 'CO', 'COLOMBIA', 'Colombia', 'COL', 170),
(48, 'KM', 'COMOROS', 'Comoros', 'COM', 174),
(49, 'CG', 'CONGO', 'Congo', 'COG', 178),
(50, 'CD', 'CONGO, THE DEMOCRATIC REPUBLIC OF THE', 'Congo, the Democratic Republic of the', 'COD', 180),
(51, 'CK', 'COOK ISLANDS', 'Cook Islands', 'COK', 184),
(52, 'CR', 'COSTA RICA', 'Costa Rica', 'CRI', 188),
(53, 'CI', 'COTE D''IVOIRE', 'Cote D''Ivoire', 'CIV', 384),
(54, 'HR', 'CROATIA', 'Croatia', 'HRV', 191),
(55, 'CU', 'CUBA', 'Cuba', 'CUB', 192),
(56, 'CY', 'CYPRUS', 'Cyprus', 'CYP', 196),
(57, 'CZ', 'CZECH REPUBLIC', 'Czech Republic', 'CZE', 203),
(58, 'DK', 'DENMARK', 'Denmark', 'DNK', 208),
(59, 'DJ', 'DJIBOUTI', 'Djibouti', 'DJI', 262),
(60, 'DM', 'DOMINICA', 'Dominica', 'DMA', 212),
(61, 'DO', 'DOMINICAN REPUBLIC', 'Dominican Republic', 'DOM', 214),
(62, 'EC', 'ECUADOR', 'Ecuador', 'ECU', 218),
(63, 'EG', 'EGYPT', 'Egypt', 'EGY', 818),
(64, 'SV', 'EL SALVADOR', 'El Salvador', 'SLV', 222),
(65, 'GQ', 'EQUATORIAL GUINEA', 'Equatorial Guinea', 'GNQ', 226),
(66, 'ER', 'ERITREA', 'Eritrea', 'ERI', 232),
(67, 'EE', 'ESTONIA', 'Estonia', 'EST', 233),
(68, 'ET', 'ETHIOPIA', 'Ethiopia', 'ETH', 231),
(69, 'FK', 'FALKLAND ISLANDS (MALVINAS)', 'Falkland Islands (Malvinas)', 'FLK', 238),
(70, 'FO', 'FAROE ISLANDS', 'Faroe Islands', 'FRO', 234),
(71, 'FJ', 'FIJI', 'Fiji', 'FJI', 242),
(72, 'FI', 'FINLAND', 'Finland', 'FIN', 246),
(73, 'FR', 'FRANCE', 'France', 'FRA', 250),
(74, 'GF', 'FRENCH GUIANA', 'French Guiana', 'GUF', 254),
(75, 'PF', 'FRENCH POLYNESIA', 'French Polynesia', 'PYF', 258),
(76, 'TF', 'FRENCH SOUTHERN TERRITORIES', 'French Southern Territories', NULL, NULL),
(77, 'GA', 'GABON', 'Gabon', 'GAB', 266),
(78, 'GM', 'GAMBIA', 'Gambia', 'GMB', 270),
(79, 'GE', 'GEORGIA', 'Georgia', 'GEO', 268),
(80, 'DE', 'GERMANY', 'Germany', 'DEU', 276),
(81, 'GH', 'GHANA', 'Ghana', 'GHA', 288),
(82, 'GI', 'GIBRALTAR', 'Gibraltar', 'GIB', 292),
(83, 'GR', 'GREECE', 'Greece', 'GRC', 300),
(84, 'GL', 'GREENLAND', 'Greenland', 'GRL', 304),
(85, 'GD', 'GRENADA', 'Grenada', 'GRD', 308),
(86, 'GP', 'GUADELOUPE', 'Guadeloupe', 'GLP', 312),
(87, 'GU', 'GUAM', 'Guam', 'GUM', 316),
(88, 'GT', 'GUATEMALA', 'Guatemala', 'GTM', 320),
(89, 'GN', 'GUINEA', 'Guinea', 'GIN', 324),
(90, 'GW', 'GUINEA-BISSAU', 'Guinea-Bissau', 'GNB', 624),
(91, 'GY', 'GUYANA', 'Guyana', 'GUY', 328),
(92, 'HT', 'HAITI', 'Haiti', 'HTI', 332),
(93, 'HM', 'HEARD ISLAND AND MCDONALD ISLANDS', 'Heard Island and Mcdonald Islands', NULL, NULL),
(94, 'VA', 'HOLY SEE (VATICAN CITY STATE)', 'Holy See (Vatican City State)', 'VAT', 336),
(95, 'HN', 'HONDURAS', 'Honduras', 'HND', 340),
(96, 'HK', 'HONG KONG', 'Hong Kong', 'HKG', 344),
(97, 'HU', 'HUNGARY', 'Hungary', 'HUN', 348),
(98, 'IS', 'ICELAND', 'Iceland', 'ISL', 352),
(99, 'IN', 'INDIA', 'India', 'IND', 356),
(100, 'ID', 'INDONESIA', 'Indonesia', 'IDN', 360),
(101, 'IR', 'IRAN, ISLAMIC REPUBLIC OF', 'Iran, Islamic Republic of', 'IRN', 364),
(102, 'IQ', 'IRAQ', 'Iraq', 'IRQ', 368),
(103, 'IE', 'IRELAND', 'Ireland', 'IRL', 372),
(104, 'IL', 'ISRAEL', 'Israel', 'ISR', 376),
(105, 'IT', 'ITALY', 'Italy', 'ITA', 380),
(106, 'JM', 'JAMAICA', 'Jamaica', 'JAM', 388),
(107, 'JP', 'JAPAN', 'Japan', 'JPN', 392),
(108, 'JO', 'JORDAN', 'Jordan', 'JOR', 400),
(109, 'KZ', 'KAZAKHSTAN', 'Kazakhstan', 'KAZ', 398),
(110, 'KE', 'KENYA', 'Kenya', 'KEN', 404),
(111, 'KI', 'KIRIBATI', 'Kiribati', 'KIR', 296),
(112, 'KP', 'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', 'Korea, Democratic People''s Republic of', 'PRK', 408),
(113, 'KR', 'KOREA, REPUBLIC OF', 'Korea, Republic of', 'KOR', 410),
(114, 'KW', 'KUWAIT', 'Kuwait', 'KWT', 414),
(115, 'KG', 'KYRGYZSTAN', 'Kyrgyzstan', 'KGZ', 417),
(116, 'LA', 'LAO PEOPLE''S DEMOCRATIC REPUBLIC', 'Lao People''s Democratic Republic', 'LAO', 418),
(117, 'LV', 'LATVIA', 'Latvia', 'LVA', 428),
(118, 'LB', 'LEBANON', 'Lebanon', 'LBN', 422),
(119, 'LS', 'LESOTHO', 'Lesotho', 'LSO', 426),
(120, 'LR', 'LIBERIA', 'Liberia', 'LBR', 430),
(121, 'LY', 'LIBYAN ARAB JAMAHIRIYA', 'Libyan Arab Jamahiriya', 'LBY', 434),
(122, 'LI', 'LIECHTENSTEIN', 'Liechtenstein', 'LIE', 438),
(123, 'LT', 'LITHUANIA', 'Lithuania', 'LTU', 440),
(124, 'LU', 'LUXEMBOURG', 'Luxembourg', 'LUX', 442),
(125, 'MO', 'MACAO', 'Macao', 'MAC', 446),
(126, 'MK', 'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', 'Macedonia, the Former Yugoslav Republic of', 'MKD', 807),
(127, 'MG', 'MADAGASCAR', 'Madagascar', 'MDG', 450),
(128, 'MW', 'MALAWI', 'Malawi', 'MWI', 454),
(129, 'MY', 'MALAYSIA', 'Malaysia', 'MYS', 458),
(130, 'MV', 'MALDIVES', 'Maldives', 'MDV', 462),
(131, 'ML', 'MALI', 'Mali', 'MLI', 466),
(132, 'MT', 'MALTA', 'Malta', 'MLT', 470),
(133, 'MH', 'MARSHALL ISLANDS', 'Marshall Islands', 'MHL', 584),
(134, 'MQ', 'MARTINIQUE', 'Martinique', 'MTQ', 474),
(135, 'MR', 'MAURITANIA', 'Mauritania', 'MRT', 478),
(136, 'MU', 'MAURITIUS', 'Mauritius', 'MUS', 480),
(137, 'YT', 'MAYOTTE', 'Mayotte', NULL, NULL),
(138, 'MX', 'MEXICO', 'Mexico', 'MEX', 484),
(139, 'FM', 'MICRONESIA, FEDERATED STATES OF', 'Micronesia, Federated States of', 'FSM', 583),
(140, 'MD', 'MOLDOVA, REPUBLIC OF', 'Moldova, Republic of', 'MDA', 498),
(141, 'MC', 'MONACO', 'Monaco', 'MCO', 492),
(142, 'MN', 'MONGOLIA', 'Mongolia', 'MNG', 496),
(143, 'MS', 'MONTSERRAT', 'Montserrat', 'MSR', 500),
(144, 'MA', 'MOROCCO', 'Morocco', 'MAR', 504),
(145, 'MZ', 'MOZAMBIQUE', 'Mozambique', 'MOZ', 508),
(146, 'MM', 'MYANMAR', 'Myanmar', 'MMR', 104),
(147, 'NA', 'NAMIBIA', 'Namibia', 'NAM', 516),
(148, 'NR', 'NAURU', 'Nauru', 'NRU', 520),
(149, 'NP', 'NEPAL', 'Nepal', 'NPL', 524),
(150, 'NL', 'NETHERLANDS', 'Netherlands', 'NLD', 528),
(151, 'AN', 'NETHERLANDS ANTILLES', 'Netherlands Antilles', 'ANT', 530),
(152, 'NC', 'NEW CALEDONIA', 'New Caledonia', 'NCL', 540),
(153, 'NZ', 'NEW ZEALAND', 'New Zealand', 'NZL', 554),
(154, 'NI', 'NICARAGUA', 'Nicaragua', 'NIC', 558),
(155, 'NE', 'NIGER', 'Niger', 'NER', 562),
(156, 'NG', 'NIGERIA', 'Nigeria', 'NGA', 566),
(157, 'NU', 'NIUE', 'Niue', 'NIU', 570),
(158, 'NF', 'NORFOLK ISLAND', 'Norfolk Island', 'NFK', 574),
(159, 'MP', 'NORTHERN MARIANA ISLANDS', 'Northern Mariana Islands', 'MNP', 580),
(160, 'NO', 'NORWAY', 'Norway', 'NOR', 578),
(161, 'OM', 'OMAN', 'Oman', 'OMN', 512),
(162, 'PK', 'PAKISTAN', 'Pakistan', 'PAK', 586),
(163, 'PW', 'PALAU', 'Palau', 'PLW', 585),
(164, 'PS', 'PALESTINIAN TERRITORY, OCCUPIED', 'Palestinian Territory, Occupied', NULL, NULL),
(165, 'PA', 'PANAMA', 'Panama', 'PAN', 591),
(166, 'PG', 'PAPUA NEW GUINEA', 'Papua New Guinea', 'PNG', 598),
(167, 'PY', 'PARAGUAY', 'Paraguay', 'PRY', 600),
(168, 'PE', 'PERU', 'Peru', 'PER', 604),
(169, 'PH', 'PHILIPPINES', 'Philippines', 'PHL', 608),
(170, 'PN', 'PITCAIRN', 'Pitcairn', 'PCN', 612),
(171, 'PL', 'POLAND', 'Poland', 'POL', 616),
(172, 'PT', 'PORTUGAL', 'Portugal', 'PRT', 620),
(173, 'PR', 'PUERTO RICO', 'Puerto Rico', 'PRI', 630),
(174, 'QA', 'QATAR', 'Qatar', 'QAT', 634),
(175, 'RE', 'REUNION', 'Reunion', 'REU', 638),
(176, 'RO', 'ROMANIA', 'Romania', 'ROM', 642),
(177, 'RU', 'RUSSIAN FEDERATION', 'Russian Federation', 'RUS', 643),
(178, 'RW', 'RWANDA', 'Rwanda', 'RWA', 646),
(179, 'SH', 'SAINT HELENA', 'Saint Helena', 'SHN', 654),
(180, 'KN', 'SAINT KITTS AND NEVIS', 'Saint Kitts and Nevis', 'KNA', 659),
(181, 'LC', 'SAINT LUCIA', 'Saint Lucia', 'LCA', 662),
(182, 'PM', 'SAINT PIERRE AND MIQUELON', 'Saint Pierre and Miquelon', 'SPM', 666),
(183, 'VC', 'SAINT VINCENT AND THE GRENADINES', 'Saint Vincent and the Grenadines', 'VCT', 670),
(184, 'WS', 'SAMOA', 'Samoa', 'WSM', 882),
(185, 'SM', 'SAN MARINO', 'San Marino', 'SMR', 674),
(186, 'ST', 'SAO TOME AND PRINCIPE', 'Sao Tome and Principe', 'STP', 678),
(187, 'SA', 'SAUDI ARABIA', 'Saudi Arabia', 'SAU', 682),
(188, 'SN', 'SENEGAL', 'Senegal', 'SEN', 686),
(189, 'CS', 'SERBIA AND MONTENEGRO', 'Serbia and Montenegro', NULL, NULL),
(190, 'SC', 'SEYCHELLES', 'Seychelles', 'SYC', 690),
(191, 'SL', 'SIERRA LEONE', 'Sierra Leone', 'SLE', 694),
(192, 'SG', 'SINGAPORE', 'Singapore', 'SGP', 702),
(193, 'SK', 'SLOVAKIA', 'Slovakia', 'SVK', 703),
(194, 'SI', 'SLOVENIA', 'Slovenia', 'SVN', 705),
(195, 'SB', 'SOLOMON ISLANDS', 'Solomon Islands', 'SLB', 90),
(196, 'SO', 'SOMALIA', 'Somalia', 'SOM', 706),
(197, 'ZA', 'SOUTH AFRICA', 'South Africa', 'ZAF', 710),
(198, 'GS', 'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', 'South Georgia and the South Sandwich Islands', NULL, NULL),
(199, 'ES', 'SPAIN', 'Spain', 'ESP', 724),
(200, 'LK', 'SRI LANKA', 'Sri Lanka', 'LKA', 144),
(201, 'SD', 'SUDAN', 'Sudan', 'SDN', 736),
(202, 'SR', 'SURINAME', 'Suriname', 'SUR', 740),
(203, 'SJ', 'SVALBARD AND JAN MAYEN', 'Svalbard and Jan Mayen', 'SJM', 744),
(204, 'SZ', 'SWAZILAND', 'Swaziland', 'SWZ', 748),
(205, 'SE', 'SWEDEN', 'Sweden', 'SWE', 752),
(206, 'CH', 'SWITZERLAND', 'Switzerland', 'CHE', 756),
(207, 'SY', 'SYRIAN ARAB REPUBLIC', 'Syrian Arab Republic', 'SYR', 760),
(208, 'TW', 'TAIWAN, PROVINCE OF CHINA', 'Taiwan', 'TWN', 158),
(209, 'TJ', 'TAJIKISTAN', 'Tajikistan', 'TJK', 762),
(210, 'TZ', 'TANZANIA, UNITED REPUBLIC OF', 'Tanzania, United Republic of', 'TZA', 834),
(211, 'TH', 'THAILAND', 'Thailand', 'THA', 764),
(212, 'TL', 'TIMOR-LESTE', 'Timor-Leste', NULL, NULL),
(213, 'TG', 'TOGO', 'Togo', 'TGO', 768),
(214, 'TK', 'TOKELAU', 'Tokelau', 'TKL', 772),
(215, 'TO', 'TONGA', 'Tonga', 'TON', 776),
(216, 'TT', 'TRINIDAD AND TOBAGO', 'Trinidad and Tobago', 'TTO', 780),
(217, 'TN', 'TUNISIA', 'Tunisia', 'TUN', 788),
(218, 'TR', 'TURKEY', 'Turkey', 'TUR', 792),
(219, 'TM', 'TURKMENISTAN', 'Turkmenistan', 'TKM', 795),
(220, 'TC', 'TURKS AND CAICOS ISLANDS', 'Turks and Caicos Islands', 'TCA', 796),
(221, 'TV', 'TUVALU', 'Tuvalu', 'TUV', 798),
(222, 'UG', 'UGANDA', 'Uganda', 'UGA', 800),
(223, 'UA', 'UKRAINE', 'Ukraine', 'UKR', 804),
(224, 'AE', 'UNITED ARAB EMIRATES', 'United Arab Emirates', 'ARE', 784),
(225, 'GB', 'UNITED KINGDOM', 'United Kingdom', 'GBR', 826),
(226, 'US', 'UNITED STATES', 'United States', 'USA', 840),
(227, 'UM', 'UNITED STATES MINOR OUTLYING ISLANDS', 'United States Minor Outlying Islands', NULL, NULL),
(228, 'UY', 'URUGUAY', 'Uruguay', 'URY', 858),
(229, 'UZ', 'UZBEKISTAN', 'Uzbekistan', 'UZB', 860),
(230, 'VU', 'VANUATU', 'Vanuatu', 'VUT', 548),
(231, 'VE', 'VENEZUELA', 'Venezuela', 'VEN', 862),
(232, 'VN', 'VIET NAM', 'Viet Nam', 'VNM', 704),
(233, 'VG', 'VIRGIN ISLANDS, BRITISH', 'Virgin Islands, British', 'VGB', 92),
(234, 'VI', 'VIRGIN ISLANDS, U.S.', 'Virgin Islands, U.s.', 'VIR', 850),
(235, 'WF', 'WALLIS AND FUTUNA', 'Wallis and Futuna', 'WLF', 876),
(236, 'EH', 'WESTERN SAHARA', 'Western Sahara', 'ESH', 732),
(237, 'YE', 'YEMEN', 'Yemen', 'YEM', 887),
(238, 'ZM', 'ZAMBIA', 'Zambia', 'ZMB', 894),
(239, 'ZW', 'ZIMBABWE', 'Zimbabwe', 'ZWE', 716);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) NOT NULL,
  `code` varchar(300) NOT NULL,
  `name` varchar(300) NOT NULL,
  `description` text,
  `coordinator` bigint(20) DEFAULT NULL,
  `trainer` varchar(300) DEFAULT NULL,
  `trainer_info` text,
  `paymentType` enum('Company Sponsored','Paid by Employee') DEFAULT 'Company Sponsored',
  `currency` varchar(3) NOT NULL,
  `cost` decimal(12,2) DEFAULT '0.00',
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `currencytypes`
--

CREATE TABLE `currencytypes` (
  `id` bigint(20) NOT NULL,
  `code` varchar(3) NOT NULL DEFAULT '',
  `name` varchar(70) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `currencytypes`
--

INSERT INTO `currencytypes` (`id`, `code`, `name`) VALUES
(3, 'AED', 'Utd. Arab Emir. Dirham'),
(4, 'AFN', 'Afghanistan Afghani'),
(5, 'ALL', 'Albanian Lek'),
(6, 'ANG', 'NL Antillian Guilder'),
(7, 'AOR', 'Angolan New Kwanza'),
(8, 'ARS', 'Argentine Peso'),
(10, 'AUD', 'Australian Dollar'),
(11, 'AWG', 'Aruban Florin'),
(12, 'BBD', 'Barbados Dollar'),
(13, 'BDT', 'Bangladeshi Taka'),
(15, 'BGL', 'Bulgarian Lev'),
(16, 'BHD', 'Bahraini Dinar'),
(17, 'BIF', 'Burundi Franc'),
(18, 'BMD', 'Bermudian Dollar'),
(19, 'BND', 'Brunei Dollar'),
(20, 'BOB', 'Bolivian Boliviano'),
(21, 'BRL', 'Brazilian Real'),
(22, 'BSD', 'Bahamian Dollar'),
(23, 'BTN', 'Bhutan Ngultrum'),
(24, 'BWP', 'Botswana Pula'),
(25, 'BZD', 'Belize Dollar'),
(26, 'CAD', 'Canadian Dollar'),
(27, 'CHF', 'Swiss Franc'),
(28, 'CLP', 'Chilean Peso'),
(29, 'CNY', 'Chinese Yuan Renminbi'),
(30, 'COP', 'Colombian Peso'),
(31, 'CRC', 'Costa Rican Colon'),
(32, 'CUP', 'Cuban Peso'),
(33, 'CVE', 'Cape Verde Escudo'),
(34, 'CYP', 'Cyprus Pound'),
(37, 'DJF', 'Djibouti Franc'),
(38, 'DKK', 'Danish Krona'),
(39, 'DOP', 'Dominican Peso'),
(40, 'DZD', 'Algerian Dinar'),
(41, 'ECS', 'Ecuador Sucre'),
(42, 'EUR', 'Euro'),
(43, 'EEK', 'Estonian Krona'),
(44, 'EGP', 'Egyptian Pound'),
(46, 'ETB', 'Ethiopian Birr'),
(48, 'FJD', 'Fiji Dollar'),
(49, 'FKP', 'Falkland Islands Pound'),
(51, 'GBP', 'Pound Sterling'),
(52, 'GHC', 'Ghanaian Cedi'),
(53, 'GIP', 'Gibraltar Pound'),
(54, 'GMD', 'Gambian Dalasi'),
(55, 'GNF', 'Guinea Franc'),
(57, 'GTQ', 'Guatemalan Quetzal'),
(58, 'GYD', 'Guyanan Dollar'),
(59, 'HKD', 'Hong Kong Dollar'),
(60, 'HNL', 'Honduran Lempira'),
(61, 'HRK', 'Croatian Kuna'),
(62, 'HTG', 'Haitian Gourde'),
(63, 'HUF', 'Hungarian Forint'),
(64, 'IDR', 'Indonesian Rupiah'),
(66, 'ILS', 'Israeli New Shekel'),
(67, 'INR', 'Indian Rupee'),
(68, 'IQD', 'Iraqi Dinar'),
(69, 'IRR', 'Iranian Rial'),
(70, 'ISK', 'Iceland Krona'),
(72, 'JMD', 'Jamaican Dollar'),
(73, 'JOD', 'Jordanian Dinar'),
(74, 'JPY', 'Japanese Yen'),
(75, 'KES', 'Kenyan Shilling'),
(76, 'KHR', 'Kampuchean Riel'),
(77, 'KMF', 'Comoros Franc'),
(78, 'KPW', 'North Korean Won'),
(79, 'KRW', 'Korean Won'),
(80, 'KWD', 'Kuwaiti Dinar'),
(81, 'KYD', 'Cayman Islands Dollar'),
(82, 'KZT', 'Kazakhstan Tenge'),
(83, 'LAK', 'Lao Kip'),
(84, 'LBP', 'Lebanese Pound'),
(85, 'LKR', 'Sri Lanka Rupee'),
(86, 'LRD', 'Liberian Dollar'),
(87, 'LSL', 'Lesotho Loti'),
(88, 'LTL', 'Lithuanian Litas'),
(90, 'LVL', 'Latvian Lats'),
(91, 'LYD', 'Libyan Dinar'),
(92, 'MAD', 'Moroccan Dirham'),
(93, 'MGF', 'Malagasy Franc'),
(94, 'MMK', 'Myanmar Kyat'),
(95, 'MNT', 'Mongolian Tugrik'),
(96, 'MOP', 'Macau Pataca'),
(97, 'MRO', 'Mauritanian Ouguiya'),
(98, 'MTL', 'Maltese Lira'),
(99, 'MUR', 'Mauritius Rupee'),
(100, 'MVR', 'Maldive Rufiyaa'),
(101, 'MWK', 'Malawi Kwacha'),
(102, 'MXN', 'Mexican New Peso'),
(103, 'MYR', 'Malaysian Ringgit'),
(104, 'MZM', 'Mozambique Metical'),
(105, 'NAD', 'Namibia Dollar'),
(106, 'NGN', 'Nigerian Naira'),
(107, 'NIO', 'Nicaraguan Cordoba Oro'),
(109, 'NOK', 'Norwegian Krona'),
(110, 'NPR', 'Nepalese Rupee'),
(111, 'NZD', 'New Zealand Dollar'),
(112, 'OMR', 'Omani Rial'),
(113, 'PAB', 'Panamanian Balboa'),
(114, 'PEN', 'Peruvian Nuevo Sol'),
(115, 'PGK', 'Papua New Guinea Kina'),
(116, 'PHP', 'Philippine Peso'),
(117, 'PKR', 'Pakistan Rupee'),
(118, 'PLN', 'Polish Zloty'),
(120, 'PYG', 'Paraguay Guarani'),
(121, 'QAR', 'Qatari Rial'),
(122, 'ROL', 'Romanian Leu'),
(123, 'RUB', 'Russian Rouble'),
(125, 'SBD', 'Solomon Islands Dollar'),
(126, 'SCR', 'Seychelles Rupee'),
(127, 'SDD', 'Sudanese Dinar'),
(128, 'SDP', 'Sudanese Pound'),
(129, 'SEK', 'Swedish Krona'),
(130, 'SKK', 'Slovak Koruna'),
(131, 'SGD', 'Singapore Dollar'),
(132, 'SHP', 'St. Helena Pound'),
(135, 'SLL', 'Sierra Leone Leone'),
(136, 'SOS', 'Somali Shilling'),
(137, 'SRD', 'Surinamese Dollar'),
(138, 'STD', 'Sao Tome/Principe Dobra'),
(139, 'SVC', 'El Salvador Colon'),
(140, 'SYP', 'Syrian Pound'),
(141, 'SZL', 'Swaziland Lilangeni'),
(142, 'THB', 'Thai Baht'),
(143, 'TND', 'Tunisian Dinar'),
(144, 'TOP', 'Tongan Pa''anga'),
(145, 'TRL', 'Turkish Lira'),
(146, 'TTD', 'Trinidad/Tobago Dollar'),
(147, 'TWD', 'Taiwan Dollar'),
(148, 'TZS', 'Tanzanian Shilling'),
(149, 'UAH', 'Ukraine Hryvnia'),
(150, 'UGX', 'Uganda Shilling'),
(151, 'USD', 'United States Dollar'),
(152, 'UYP', 'Uruguayan Peso'),
(153, 'VEB', 'Venezuelan Bolivar'),
(154, 'VND', 'Vietnamese Dong'),
(155, 'VUV', 'Vanuatu Vatu'),
(156, 'WST', 'Samoan Tala'),
(158, 'XAF', 'CFA Franc BEAC'),
(159, 'XAG', 'Silver (oz.)'),
(160, 'XAU', 'Gold (oz.)'),
(161, 'XCD', 'Eastern Caribbean Dollars'),
(162, 'XOF', 'CFA Franc BCEAO'),
(163, 'XPD', 'Palladium (oz.)'),
(164, 'XPF', 'CFP Franc'),
(165, 'XPT', 'Platinum (oz.)'),
(166, 'YER', 'Yemeni Riyal'),
(167, 'YUM', 'Yugoslavian Dinar'),
(168, 'ZAR', 'South African Rand'),
(169, 'ZRN', 'New Zaire'),
(170, 'ZWD', 'Zimbabwe Dollar'),
(171, 'CZK', 'Czech Koruna'),
(172, 'MXP', 'Mexican Peso'),
(173, 'SAR', 'Saudi Arabia Riyal'),
(175, 'YUN', 'Yugoslav Dinar'),
(176, 'ZMK', 'Zambian Kwacha'),
(177, 'ARP', 'Argentina Pesos'),
(179, 'XDR', 'IMF Special Drawing Right'),
(180, 'RUR', 'Russia Rubles');

-- --------------------------------------------------------

--
-- Table structure for table `customfields`
--

CREATE TABLE `customfields` (
  `id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `data` text,
  `display` enum('Form','Table and Form','Hidden') DEFAULT 'Form',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customfields`
--

INSERT INTO `customfields` (`id`, `type`, `name`, `data`, `display`, `created`, `updated`) VALUES
(1, 'Employee', 'custom1', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Employee', 'custom2', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Employee', 'custom3', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Employee', 'custom4', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Employee', 'custom5', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Employee', 'custom6', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Employee', 'custom7', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Employee', 'custom8', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Employee', 'custom9', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Employee', 'custom10', '', 'Hidden', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dataentrybackups`
--

CREATE TABLE `dataentrybackups` (
  `id` bigint(20) NOT NULL,
  `tableType` varchar(200) DEFAULT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deductionrules`
--

CREATE TABLE `deductionrules` (
  `id` bigint(20) NOT NULL,
  `apply` enum('Yes','No') DEFAULT 'Yes',
  `application_type` enum('All','Condition - OR','Condition - AND') DEFAULT 'All',
  `deduction` bigint(20) NOT NULL,
  `job_title` bigint(20) DEFAULT NULL,
  `ethnicity` bigint(20) DEFAULT NULL,
  `nationality` bigint(20) DEFAULT NULL,
  `immigration_status` bigint(20) DEFAULT NULL,
  `pay_grade` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contributor` enum('Employee','Employer') DEFAULT NULL,
  `type` enum('Fixed','Percentage') DEFAULT NULL,
  `percentage_type` enum('On Component','On Component Type') DEFAULT NULL,
  `componentType` bigint(20) DEFAULT NULL,
  `component` bigint(20) DEFAULT NULL,
  `rangeAmounts` text,
  `country` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `name`, `details`) VALUES
(1, 'ID Copy', 'Your ID copy'),
(2, 'Degree Ceritficate', 'Degree Ceritficate'),
(3, 'Driving License', 'Driving License');

-- --------------------------------------------------------

--
-- Table structure for table `educations`
--

CREATE TABLE `educations` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `educations`
--

INSERT INTO `educations` (`id`, `name`, `description`) VALUES
(1, 'Bachelors Degree', 'Bachelors Degree'),
(2, 'Diploma', 'Diploma'),
(3, 'Masters Degree', 'Masters Degree'),
(4, 'Doctorate', 'Doctorate');

-- --------------------------------------------------------

--
-- Table structure for table `emergencycontacts`
--

CREATE TABLE `emergencycontacts` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `relationship` varchar(100) DEFAULT NULL,
  `home_phone` varchar(15) DEFAULT NULL,
  `work_phone` varchar(15) DEFAULT NULL,
  `mobile_phone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeecertifications`
--

CREATE TABLE `employeecertifications` (
  `id` bigint(20) NOT NULL,
  `certification_id` bigint(20) DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  `institute` varchar(400) DEFAULT NULL,
  `date_start` date DEFAULT '0000-00-00',
  `date_end` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeecompanyloans`
--

CREATE TABLE `employeecompanyloans` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `loan` bigint(20) DEFAULT NULL,
  `start_date` date NOT NULL,
  `last_installment_date` date NOT NULL,
  `period_months` bigint(20) DEFAULT NULL,
  `currency` bigint(20) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `monthly_installment` decimal(10,2) NOT NULL,
  `status` enum('Approved','Repayment','Paid','Suspended') DEFAULT 'Approved',
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeecompanyloans`
--

INSERT INTO `employeecompanyloans` (`id`, `employee`, `loan`, `start_date`, `last_installment_date`, `period_months`, `currency`, `amount`, `monthly_installment`, `status`, `details`) VALUES
(2, 1, 1, '2015-12-07', '2016-12-07', 12, 116, '12000.00', '1000.00', 'Approved', '');

-- --------------------------------------------------------

--
-- Table structure for table `employeedependents`
--

CREATE TABLE `employeedependents` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `relationship` enum('Child','Spouse','Parent','Other') DEFAULT NULL,
  `dob` date DEFAULT '0000-00-00',
  `id_number` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeedocuments`
--

CREATE TABLE `employeedocuments` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `document` bigint(20) DEFAULT NULL,
  `date_added` date NOT NULL,
  `valid_until` date NOT NULL,
  `status` enum('Active','Inactive','Draft') DEFAULT 'Active',
  `details` text,
  `attachment` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeeducations`
--

CREATE TABLE `employeeeducations` (
  `id` bigint(20) NOT NULL,
  `education_id` bigint(20) DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  `institute` varchar(400) DEFAULT NULL,
  `date_start` date DEFAULT '0000-00-00',
  `date_end` date DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeethnicity`
--

CREATE TABLE `employeeethnicity` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `ethnicity` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeimmigrations`
--

CREATE TABLE `employeeimmigrations` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `document` bigint(20) DEFAULT NULL,
  `documentname` varchar(150) NOT NULL,
  `valid_until` date NOT NULL,
  `status` enum('Active','Inactive','Draft') DEFAULT 'Active',
  `details` text,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeimmigrationstatus`
--

CREATE TABLE `employeeimmigrationstatus` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `status` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeelanguages`
--

CREATE TABLE `employeelanguages` (
  `id` bigint(20) NOT NULL,
  `language_id` bigint(20) DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  `reading` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `speaking` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `writing` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL,
  `understanding` enum('Elementary Proficiency','Limited Working Proficiency','Professional Working Proficiency','Full Professional Proficiency','Native or Bilingual Proficiency') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeleaves`
--

CREATE TABLE `employeeleaves` (
  `id` bigint(20) NOT NULL,
  `leave_type` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `leave_status` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeeleaves`
--

INSERT INTO `employeeleaves` (`id`, `leave_type`, `employee`, `date_start`, `date_end`, `leave_status`) VALUES
(3, 2, 1, '2015-12-17', '2015-12-18', 1),
(4, 1, 1, '2015-12-17', '2015-12-18', 2),
(7, 1, 1, '2012-04-15', '2013-05-07', 2),
(8, 3, 1, '2015-12-29', '2015-12-31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employeeprojects`
--

CREATE TABLE `employeeprojects` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `project` bigint(20) DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `status` enum('Current','Inactive','Completed') DEFAULT 'Current',
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) NOT NULL,
  `employee_id` varchar(50) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL DEFAULT '',
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `nationality` bigint(20) DEFAULT NULL,
  `birthday` datetime DEFAULT '0000-00-00 00:00:00',
  `gender` enum('Male','Female') DEFAULT NULL,
  `marital_status` enum('Married','Single','Divorced','Widowed','Other') DEFAULT NULL,
  `ssn_num` varchar(100) DEFAULT NULL,
  `nic_num` varchar(100) DEFAULT NULL,
  `other_id` varchar(100) DEFAULT NULL,
  `driving_license` varchar(100) DEFAULT NULL,
  `driving_license_exp_date` date DEFAULT '0000-00-00',
  `employment_status` bigint(20) DEFAULT NULL,
  `job_title` bigint(20) DEFAULT NULL,
  `pay_grade` bigint(20) DEFAULT NULL,
  `work_station_id` varchar(100) DEFAULT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(100) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `country` char(2) DEFAULT NULL,
  `province` bigint(20) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `home_phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `work_phone` varchar(50) DEFAULT NULL,
  `work_email` varchar(100) DEFAULT NULL,
  `private_email` varchar(100) DEFAULT NULL,
  `joined_date` datetime DEFAULT '0000-00-00 00:00:00',
  `confirmation_date` datetime DEFAULT '0000-00-00 00:00:00',
  `supervisor` bigint(20) DEFAULT NULL,
  `department` bigint(20) DEFAULT NULL,
  `custom1` varchar(250) DEFAULT NULL,
  `custom2` varchar(250) DEFAULT NULL,
  `custom3` varchar(250) DEFAULT NULL,
  `custom4` varchar(250) DEFAULT NULL,
  `custom5` varchar(250) DEFAULT NULL,
  `custom6` varchar(250) DEFAULT NULL,
  `custom7` varchar(250) DEFAULT NULL,
  `custom8` varchar(250) DEFAULT NULL,
  `custom9` varchar(250) DEFAULT NULL,
  `custom10` varchar(250) DEFAULT NULL,
  `termination_date` datetime DEFAULT '0000-00-00 00:00:00',
  `notes` text,
  `status` enum('Active','Terminated') DEFAULT 'Active',
  `ethnicity` bigint(20) DEFAULT NULL,
  `immigration_status` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `first_name`, `middle_name`, `last_name`, `nationality`, `birthday`, `gender`, `marital_status`, `ssn_num`, `nic_num`, `other_id`, `driving_license`, `driving_license_exp_date`, `employment_status`, `job_title`, `pay_grade`, `work_station_id`, `address1`, `address2`, `city`, `country`, `province`, `postal_code`, `home_phone`, `mobile_phone`, `work_phone`, `work_email`, `private_email`, `joined_date`, `confirmation_date`, `supervisor`, `department`, `custom1`, `custom2`, `custom3`, `custom4`, `custom5`, `custom6`, `custom7`, `custom8`, `custom9`, `custom10`, `termination_date`, `notes`, `status`, `ethnicity`, `immigration_status`) VALUES
(1, 'EMP001', 'Spark', 'Sample', 'Employee', 62, '1984-03-17 00:00:00', 'Male', 'Married', '', '', '', '', NULL, 3, 11, 2, '', '', '', '', 'PH', 37, '', '', '', '', 'sample@sample.com', 'sample@sample.com', '2005-08-03 00:00:00', '0001-01-01 00:00:00', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00 00:00:00', NULL, 'Active', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employeesalary`
--

CREATE TABLE `employeesalary` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `component` bigint(20) NOT NULL,
  `pay_frequency` enum('Hourly','Daily','Bi Weekly','Weekly','Semi Monthly','Monthly') DEFAULT NULL,
  `currency` bigint(20) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeeskills`
--

CREATE TABLE `employeeskills` (
  `id` bigint(20) NOT NULL,
  `skill_id` bigint(20) DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  `details` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeetimeentry`
--

CREATE TABLE `employeetimeentry` (
  `id` bigint(20) NOT NULL,
  `project` bigint(20) DEFAULT NULL,
  `employee` bigint(20) NOT NULL,
  `timesheet` bigint(20) NOT NULL,
  `details` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_start` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_start` varchar(10) NOT NULL,
  `date_end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time_end` varchar(10) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeetimesheets`
--

CREATE TABLE `employeetimesheets` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `status` enum('Approved','Pending','Rejected','Submitted') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employeetimesheets`
--

INSERT INTO `employeetimesheets` (`id`, `employee`, `date_start`, `date_end`, `status`) VALUES
(1, 1, '2015-12-13', '2015-12-19', 'Pending'),
(4, 1, '2015-12-20', '2015-12-26', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `employeetrainingsessions`
--

CREATE TABLE `employeetrainingsessions` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `trainingSession` bigint(20) DEFAULT NULL,
  `feedBack` varchar(1500) DEFAULT NULL,
  `status` enum('Scheduled','Attended','Not-Attended') DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employeetravelrecords`
--

CREATE TABLE `employeetravelrecords` (
  `id` bigint(20) NOT NULL,
  `employee` bigint(20) NOT NULL,
  `type` enum('Local','International') DEFAULT 'Local',
  `purpose` varchar(200) NOT NULL,
  `travel_from` varchar(200) NOT NULL,
  `travel_to` varchar(200) NOT NULL,
  `travel_date` datetime DEFAULT '0000-00-00 00:00:00',
  `return_date` datetime DEFAULT '0000-00-00 00:00:00',
  `details` varchar(500) DEFAULT NULL,
  `attachment1` varchar(100) DEFAULT NULL,
  `attachment2` varchar(100) DEFAULT NULL,
  `attachment3` varchar(100) DEFAULT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employmentstatus`
--

CREATE TABLE `employmentstatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employmentstatus`
--

INSERT INTO `employmentstatus` (`id`, `name`, `description`) VALUES
(1, 'Full Time Contract', 'Full Time Contract'),
(2, 'Full Time Internship', 'Full Time Internship'),
(3, 'Full Time Permanent', 'Full Time Permanent'),
(4, 'Part Time Contract', 'Part Time Contract'),
(5, 'Part Time Internship', 'Part Time Internship'),
(6, 'Part Time Permanent', 'Part Time Permanent');

-- --------------------------------------------------------

--
-- Table structure for table `ethnicity`
--

CREATE TABLE `ethnicity` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `fieldnamemappings`
--

CREATE TABLE `fieldnamemappings` (
  `id` bigint(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `textOrig` varchar(200) DEFAULT NULL,
  `textMapped` varchar(200) DEFAULT NULL,
  `display` enum('Form','Table and Form','Hidden') DEFAULT 'Form',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `fieldnamemappings`
--

INSERT INTO `fieldnamemappings` (`id`, `type`, `name`, `textOrig`, `textMapped`, `display`, `created`, `updated`) VALUES
(1, 'Employee', 'employee_id', 'Employee Number', 'Employee Number', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Employee', 'first_name', 'First Name', 'First Name', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Employee', 'middle_name', 'Middle Name', 'Middle Name', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Employee', 'last_name', 'Last Name', 'Last Name', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Employee', 'nationality', 'Nationality', 'Nationality', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Employee', 'ethnicity', 'Ethnicity', 'Ethnicity', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Employee', 'immigration_status', 'Immigration Status', 'Immigration Status', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Employee', 'birthday', 'Date of Birth', 'Date of Birth', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Employee', 'gender', 'Gender', 'Gender', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Employee', 'marital_status', 'Marital Status', 'Marital Status', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Employee', 'ssn_num', 'SSN/NRIC', 'SSN/NRIC', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Employee', 'nic_num', 'NIC', 'NIC', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Employee', 'other_id', 'Other ID', 'Other ID', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Employee', 'driving_license', 'Driving License No', 'Driving License No', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Employee', 'employment_status', 'Employment Status', 'Employment Status', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Employee', 'job_title', 'Job Title', 'Job Title', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Employee', 'pay_grade', 'Pay Grade', 'Pay Grade', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Employee', 'work_station_id', 'Work Station Id', 'Work Station Id', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Employee', 'address1', 'Address Line 1', 'Address Line 1', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Employee', 'address2', 'Address Line 2', 'Address Line 2', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Employee', 'city', 'City', 'City', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Employee', 'country', 'Country', 'Country', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Employee', 'province', 'Province', 'Province', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Employee', 'postal_code', 'Postal/Zip Code', 'Postal/Zip Code', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Employee', 'home_phone', 'Home Phone', 'Home Phone', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Employee', 'mobile_phone', 'Mobile Phone', 'Mobile Phone', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Employee', 'work_phone', 'Work Phone', 'Work Phone', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Employee', 'work_email', 'Work Email', 'Work Email', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Employee', 'private_email', 'Private Email', 'Private Email', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Employee', 'joined_date', 'Joined Date', 'Joined Date', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Employee', 'confirmation_date', 'Confirmation Date', 'Confirmation Date', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Employee', 'termination_date', 'Termination Date', 'Termination Date', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Employee', 'supervisor', 'Supervisor', 'Supervisor', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Employee', 'department', 'Department', 'Department', 'Table and Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Employee', 'notes', 'Notes', 'Notes', 'Form', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE `files` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `filename` varchar(100) NOT NULL,
  `employee` bigint(20) DEFAULT NULL,
  `file_group` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `name`, `filename`, `employee`, `file_group`) VALUES
(1, 'Report_Employee_Time_Tracking_Report-2015-12-17_02-15-42', 'Report_Employee_Time_Tracking_Report-2015-12-17_02-15-42.csv', NULL, 'Report'),
(2, 'Report_Employee_Time_Tracking_Report-2015-12-17_02-38-01', 'Report_Employee_Time_Tracking_Report-2015-12-17_02-38-01.csv', NULL, 'Report'),
(3, 'Report_Employee_Time_Tracking_Report-2015-12-17_02-38-43', 'Report_Employee_Time_Tracking_Report-2015-12-17_02-38-43.csv', NULL, 'Report'),
(4, 'Report_Employee_Leaves_Report-2015-12-17_02-58-49', 'Report_Employee_Leaves_Report-2015-12-17_02-58-49.csv', NULL, 'Report'),
(5, 'Report_Employee_Leaves_Report-2015-12-17_03-02-58', 'Report_Employee_Leaves_Report-2015-12-17_03-02-58.csv', NULL, 'Report'),
(6, 'Report_Employee_Leaves_Report-2015-12-17_03-06-35', 'Report_Employee_Leaves_Report-2015-12-17_03-06-35.csv', NULL, 'Report'),
(7, 'Report_Employee_Leaves_Report-2015-12-17_03-10-59', 'Report_Employee_Leaves_Report-2015-12-17_03-10-59.csv', NULL, 'Report'),
(8, 'Report_Employee_Leaves_Report-2015-12-17_03-14-54', 'Report_Employee_Leaves_Report-2015-12-17_03-14-54.csv', NULL, 'Report'),
(9, 'Report_Employee_Leaves_Report-2015-12-17_03-20-13', 'Report_Employee_Leaves_Report-2015-12-17_03-20-13.csv', NULL, 'Report'),
(10, 'Report_Employee_Leaves_Report-2015-12-17_03-22-09', 'Report_Employee_Leaves_Report-2015-12-17_03-22-09.csv', NULL, 'Report'),
(11, 'Report_Employee_Leaves_Report-2015-12-17_03-22-33', 'Report_Employee_Leaves_Report-2015-12-17_03-22-33.csv', NULL, 'Report'),
(12, 'Report_Employee_Leaves_Report-2015-12-17_03-23-07', 'Report_Employee_Leaves_Report-2015-12-17_03-23-07.csv', NULL, 'Report'),
(13, 'Report_Employee_Leaves_Report-2015-12-17_03-24-12', 'Report_Employee_Leaves_Report-2015-12-17_03-24-12.csv', NULL, 'Report'),
(14, 'Report_Employee_Leaves_Report-2015-12-17_03-24-19', 'Report_Employee_Leaves_Report-2015-12-17_03-24-19.csv', NULL, 'Report'),
(15, 'Report_Employee_Leaves_Report-2015-12-17_03-25-42', 'Report_Employee_Leaves_Report-2015-12-17_03-25-42.csv', NULL, 'Report'),
(16, 'Report_Employee_Leaves_Report-2015-12-17_03-25-59', 'Report_Employee_Leaves_Report-2015-12-17_03-25-59.csv', NULL, 'Report'),
(17, 'Report_Employee_Leaves_Report-2015-12-17_03-27-23', 'Report_Employee_Leaves_Report-2015-12-17_03-27-23.csv', NULL, 'Report'),
(18, 'Report_Employee_Leaves_Report-2015-12-17_03-28-45', 'Report_Employee_Leaves_Report-2015-12-17_03-28-45.csv', NULL, 'Report'),
(19, 'Report_Employee_Leaves_Report-2015-12-17_03-29-09', 'Report_Employee_Leaves_Report-2015-12-17_03-29-09.csv', NULL, 'Report'),
(20, 'Report_Employee_Leaves_Report-2015-12-17_03-29-45', 'Report_Employee_Leaves_Report-2015-12-17_03-29-45.csv', NULL, 'Report'),
(21, 'Report_Employee_Leaves_Report-2015-12-17_03-46-31', 'Report_Employee_Leaves_Report-2015-12-17_03-46-31.csv', NULL, 'Report'),
(22, 'Report_Employee_Leaves_Report-2015-12-17_03-49-46', 'Report_Employee_Leaves_Report-2015-12-17_03-49-46.csv', NULL, 'Report'),
(23, 'Report_Employee_Leaves_Report-2015-12-17_03-51-06', 'Report_Employee_Leaves_Report-2015-12-17_03-51-06.csv', NULL, 'Report'),
(24, 'Report_Employee_Leaves_Report-2015-12-17_03-55-57', 'Report_Employee_Leaves_Report-2015-12-17_03-55-57.csv', NULL, 'Report'),
(25, 'Report_Employee_Leaves_Report-2015-12-17_03-56-57', 'Report_Employee_Leaves_Report-2015-12-17_03-56-57.csv', NULL, 'Report'),
(26, 'Report_Employee_Leaves_Report-2015-12-17_03-58-12', 'Report_Employee_Leaves_Report-2015-12-17_03-58-12.csv', NULL, 'Report'),
(27, 'Report_Employee_Leaves_Report-2015-12-17_03-59-22', 'Report_Employee_Leaves_Report-2015-12-17_03-59-22.csv', NULL, 'Report'),
(28, 'Report_Employee_Leaves_Report-2015-12-17_04-00-10', 'Report_Employee_Leaves_Report-2015-12-17_04-00-10.csv', NULL, 'Report'),
(29, 'Report_Employee_Leaves_Report-2015-12-17_04-00-34', 'Report_Employee_Leaves_Report-2015-12-17_04-00-34.csv', NULL, 'Report'),
(30, 'Report_Employee_Leaves_Report-2015-12-17_04-01-38', 'Report_Employee_Leaves_Report-2015-12-17_04-01-38.csv', NULL, 'Report'),
(31, 'Report_Employee_Leaves_Report-2015-12-17_04-01-52', 'Report_Employee_Leaves_Report-2015-12-17_04-01-52.csv', NULL, 'Report'),
(32, 'Report_Employee_Leaves_Report-2015-12-17_04-02-04', 'Report_Employee_Leaves_Report-2015-12-17_04-02-04.csv', NULL, 'Report'),
(33, 'Report_Employee_Leaves_Report-2015-12-17_04-02-20', 'Report_Employee_Leaves_Report-2015-12-17_04-02-20.csv', NULL, 'Report'),
(34, 'Report_Employee_Leaves_Report-2015-12-17_04-02-28', 'Report_Employee_Leaves_Report-2015-12-17_04-02-28.csv', NULL, 'Report'),
(35, 'Report_Employee_Leaves_Report-2015-12-17_04-02-56', 'Report_Employee_Leaves_Report-2015-12-17_04-02-56.csv', NULL, 'Report'),
(36, 'Report_Employee_Leaves_Report-2015-12-17_04-04-35', 'Report_Employee_Leaves_Report-2015-12-17_04-04-35.csv', NULL, 'Report'),
(37, 'Report_Employee_Leaves_Report-2015-12-17_04-05-01', 'Report_Employee_Leaves_Report-2015-12-17_04-05-01.csv', NULL, 'Report'),
(38, 'Report_Employee_Leaves_Report-2015-12-17_04-06-55', 'Report_Employee_Leaves_Report-2015-12-17_04-06-55.csv', NULL, 'Report'),
(39, 'Report_Employee_Leaves_Report-2015-12-17_04-08-49', 'Report_Employee_Leaves_Report-2015-12-17_04-08-49.csv', NULL, 'Report'),
(40, 'Report_Employee_Leaves_Report-2015-12-17_04-09-14', 'Report_Employee_Leaves_Report-2015-12-17_04-09-14.csv', NULL, 'Report');

-- --------------------------------------------------------

--
-- Table structure for table `immigrationdocuments`
--

CREATE TABLE `immigrationdocuments` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text,
  `required` enum('Yes','No') DEFAULT 'Yes',
  `alert_on_missing` enum('Yes','No') DEFAULT 'Yes',
  `alert_before_expiry` enum('Yes','No') DEFAULT 'Yes',
  `alert_before_day_number` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `immigrationstatus`
--

CREATE TABLE `immigrationstatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `jobtitles`
--

CREATE TABLE `jobtitles` (
  `id` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `specification` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobtitles`
--

INSERT INTO `jobtitles` (`id`, `code`, `name`, `description`, `specification`) VALUES
(1, 'ITA', 'IT Administrator', 'The work of a software engineer typically includes designing and programming system-level software: operating systems, database systems, embedded systems and so on. They understand how both software a', 'Software Engineer'),
(2, 'ASE', 'Assistant Software Engineer', 'Assistant Software Engineer', 'Assistant Software Engineer'),
(3, 'PM', 'Project Manager', 'Project Manager', 'Project Manager'),
(4, 'QAE', 'QA Engineer', 'Quality Assurance Engineer ', 'Quality Assurance Engineer '),
(5, 'PRM', 'Product Manager', 'Product Manager', 'Product Manager'),
(6, 'AQAE', 'Assistant QA Engineer ', 'Assistant QA Engineer ', 'Assistant QA Engineer '),
(7, 'TPM', 'Technical Project Manager', 'Technical Project Manager', 'Technical Project Manager'),
(8, 'PRS', 'Pre-Sales Executive', 'Pre-Sales Executive', 'Pre-Sales Executive'),
(9, 'ME', 'Marketing Executive', 'Marketing Executive', 'Marketing Executive'),
(11, 'CEO', 'Chief Executive Officer', 'Chief Executive Officer', 'Chief Executive Officer'),
(12, 'DBE', 'Database Engineer', 'Database Engineer', 'Database Engineer'),
(13, 'SA', 'Server Admin', 'Server Admin', 'Server Admin'),
(14, 'SE1', 'Software Engineer 1', 'Sample', 'Sample');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `description`) VALUES
(1, 'English', 'English'),
(2, 'French', 'French'),
(3, 'German', 'German'),
(4, 'Chinese', 'Chinese');

-- --------------------------------------------------------

--
-- Table structure for table `leavestatus`
--

CREATE TABLE `leavestatus` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leavestatus`
--

INSERT INTO `leavestatus` (`id`, `name`) VALUES
(1, 'Approved'),
(2, 'Pending'),
(3, 'Rejected'),
(4, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `leavetypes`
--

CREATE TABLE `leavetypes` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `leavetypes`
--

INSERT INTO `leavetypes` (`id`, `name`) VALUES
(1, 'Annual Leave'),
(2, 'Casual Leave'),
(3, 'Medical Leave'),
(4, 'Xmas Holidays'),
(5, 'Maternity');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) NOT NULL,
  `menu` varchar(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `mod_group` varchar(30) NOT NULL,
  `mod_order` int(11) DEFAULT NULL,
  `status` enum('Enabled','Disabled') DEFAULT 'Enabled',
  `version` varchar(10) DEFAULT '',
  `update_path` varchar(500) DEFAULT '',
  `user_levels` varchar(500) NOT NULL,
  `user_roles` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `menu`, `name`, `label`, `icon`, `mod_group`, `mod_order`, `status`, `version`, `update_path`, `user_levels`, `user_roles`) VALUES
(1, 'Employees', 'attendance', 'Monitor Attendance', 'fa-clock-o', 'admin', 8, 'Enabled', '', 'admin>attendance', '["Admin"]', ''),
(2, 'Admin', 'company_structure', 'Company Structure', 'fa-building-o', 'admin', 2, 'Enabled', '', 'admin>company_structure', '["Admin","Manager"]', ''),
(3, 'Admin', 'dashboard', 'Dashboard', 'fa-desktop', 'admin', 1, 'Enabled', '', 'admin>dashboard', '["Admin"]', ''),
(4, 'Employees', 'employees', 'Employees', 'fa-users', 'admin', 1, 'Enabled', '', 'admin>employees', '["Admin"]', ''),
(5, 'Admin', 'jobs', 'Job Details Setup', 'fa-columns', 'admin', 3, 'Enabled', '', 'admin>jobs', '["Admin"]', ''),
(6, 'Admin', 'loans', 'Company Loans', 'fa-shield', 'admin', 7, 'Enabled', '', 'admin>loans', '["Admin"]', ''),
(7, 'System', 'metadata', 'Manage Metadata', 'fa-sort-alpha-asc', 'admin', 6, 'Enabled', '', 'admin>metadata', '["Admin"]', ''),
(8, 'System', 'modules', 'Manage Modules', 'fa-folder-open', 'admin', 3, 'Enabled', '', 'admin>modules', '["Admin"]', ''),
(9, 'System', 'permissions', 'Manage Permissions', 'fa-unlock', 'admin', 4, 'Enabled', '', 'admin>permissions', '["Admin"]', ''),
(10, 'Admin', 'projects', 'Projects/Client Setup', 'fa-list-alt', 'admin', 5, 'Enabled', '', 'admin>projects', '["Admin","Manager"]', ''),
(11, 'Admin', 'qualifications', 'Qualifications Setup', 'fa-check-square-o', 'admin', 4, 'Enabled', '', 'admin>qualifications', '["Admin","Manager"]', ''),
(12, 'Reports', 'reports', 'Reports', 'fa-file-o', 'admin', 1, 'Enabled', '', 'admin>reports', '["Admin","Manager"]', ''),
(13, 'System', 'settings', 'Settings', 'fa-cogs', 'admin', 1, 'Enabled', '', 'admin>settings', '["Admin"]', ''),
(14, 'System', 'users', 'Users', 'fa-user', 'admin', 2, 'Enabled', '', 'admin>users', '["Admin"]', ''),
(15, 'Time Management', 'attendance', 'Attendance', 'fa-clock-o', 'user', 2, 'Enabled', '', 'modules>attendance', '["Admin","Manager","Employee"]', ''),
(16, 'Personal Information', 'dashboard', 'Dashboard', 'fa-desktop', 'user', 1, 'Enabled', '', 'modules>dashboard', '["Admin","Manager","Employee"]', ''),
(17, 'Personal Information', 'dependents', 'Dependents', 'fa-sliders', 'user', 5, 'Enabled', '', 'modules>dependents', '["Admin","Manager","Employee"]', ''),
(18, 'Personal Information', 'emergency_contact', 'Emergency Contacts', 'fa-phone-square', 'user', 6, 'Enabled', '', 'modules>emergency_contact', '["Admin","Manager","Employee"]', ''),
(19, 'Personal Information', 'employees', 'Basic Information', 'fa-user', 'user', 2, 'Enabled', '', 'modules>employees', '["Admin","Manager","Employee"]', ''),
(20, 'Loans', 'loans', 'Loans', 'fa-shield', 'user', 1, 'Enabled', '', 'modules>loans', '["Admin","Employee","Manager"]', ''),
(21, 'Time Management', 'projects', 'Projects', 'fa-pencil-square', 'user', 1, 'Enabled', '', 'modules>projects', '["Admin","Manager","Employee"]', ''),
(22, 'Personal Information', 'qualifications', 'Qualifications', 'fa-graduation-cap', 'user', 3, 'Enabled', '', 'modules>qualifications', '["Admin","Manager","Employee"]', ''),
(23, 'Personal Information', 'salary', 'Salary', 'fa-calculator', 'user', 4, 'Enabled', '', 'modules>salary', '["Admin","Manager","Employee"]', ''),
(24, 'Subordinates', 'subordinates', 'Subordinates', 'fa-users', 'user', 1, 'Enabled', '', 'modules>subordinates', '["Admin","Manager"]', ''),
(25, 'Time Management', 'time_sheets', 'Time Sheets', 'fa-check-circle-o', 'user', 3, 'Enabled', '', 'modules>time_sheets', '["Admin","Manager","Employee"]', ''),
(26, 'Admin', 'leave', 'Leave', 'fa-calendar-o', 'admin', 8, 'Enabled', '', 'admin>leave', '["Admin"]', ''),
(28, 'Leave', 'leave', 'Leave', 'fa-calendar-o', 'user', 1, 'Enabled', '', 'modules>leave', '["Admin","Manager","Employee"]', '');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`id`, `name`) VALUES
(1, 'Afghan'),
(2, 'Albanian'),
(3, 'Algerian'),
(4, 'American'),
(5, 'Andorran'),
(6, 'Angolan'),
(7, 'Antiguans'),
(8, 'Argentinean'),
(9, 'Armenian'),
(10, 'Australian'),
(11, 'Austrian'),
(12, 'Azerbaijani'),
(13, 'Bahamian'),
(14, 'Bahraini'),
(15, 'Bangladeshi'),
(16, 'Barbadian'),
(17, 'Barbudans'),
(18, 'Batswana'),
(19, 'Belarusian'),
(20, 'Belgian'),
(21, 'Belizean'),
(22, 'Beninese'),
(23, 'Bhutanese'),
(24, 'Bolivian'),
(25, 'Bosnian'),
(26, 'Brazilian'),
(27, 'British'),
(28, 'Bruneian'),
(29, 'Bulgarian'),
(30, 'Burkinabe'),
(31, 'Burmese'),
(32, 'Burundian'),
(33, 'Cambodian'),
(34, 'Cameroonian'),
(35, 'Canadian'),
(36, 'Cape Verdean'),
(37, 'Central African'),
(38, 'Chadian'),
(39, 'Chilean'),
(40, 'Chinese'),
(41, 'Colombian'),
(42, 'Comoran'),
(43, 'Congolese'),
(44, 'Costa Rican'),
(45, 'Croatian'),
(46, 'Cuban'),
(47, 'Cypriot'),
(48, 'Czech'),
(49, 'Danish'),
(50, 'Djibouti'),
(51, 'Dominican'),
(52, 'Dutch'),
(53, 'East Timorese'),
(54, 'Ecuadorean'),
(55, 'Egyptian'),
(56, 'Emirian'),
(57, 'Equatorial Guinean'),
(58, 'Eritrean'),
(59, 'Estonian'),
(60, 'Ethiopian'),
(61, 'Fijian'),
(62, 'Filipino'),
(63, 'Finnish'),
(64, 'French'),
(65, 'Gabonese'),
(66, 'Gambian'),
(67, 'Georgian'),
(68, 'German'),
(69, 'Ghanaian'),
(70, 'Greek'),
(71, 'Grenadian'),
(72, 'Guatemalan'),
(73, 'Guinea-Bissauan'),
(74, 'Guinean'),
(75, 'Guyanese'),
(76, 'Haitian'),
(77, 'Herzegovinian'),
(78, 'Honduran'),
(79, 'Hungarian'),
(80, 'I-Kiribati'),
(81, 'Icelander'),
(82, 'Indian'),
(83, 'Indonesian'),
(84, 'Iranian'),
(85, 'Iraqi'),
(86, 'Irish'),
(87, 'Israeli'),
(88, 'Italian'),
(89, 'Ivorian'),
(90, 'Jamaican'),
(91, 'Japanese'),
(92, 'Jordanian'),
(93, 'Kazakhstani'),
(94, 'Kenyan'),
(95, 'Kittian and Nevisian'),
(96, 'Kuwaiti'),
(97, 'Kyrgyz'),
(98, 'Laotian'),
(99, 'Latvian'),
(100, 'Lebanese'),
(101, 'Liberian'),
(102, 'Libyan'),
(103, 'Liechtensteiner'),
(104, 'Lithuanian'),
(105, 'Luxembourger'),
(106, 'Macedonian'),
(107, 'Malagasy'),
(108, 'Malawian'),
(109, 'Malaysian'),
(110, 'Maldivan'),
(111, 'Malian'),
(112, 'Maltese'),
(113, 'Marshallese'),
(114, 'Mauritanian'),
(115, 'Mauritian'),
(116, 'Mexican'),
(117, 'Micronesian'),
(118, 'Moldovan'),
(119, 'Monacan'),
(120, 'Mongolian'),
(121, 'Moroccan'),
(122, 'Mosotho'),
(123, 'Motswana'),
(124, 'Mozambican'),
(125, 'Namibian'),
(126, 'Nauruan'),
(127, 'Nepalese'),
(128, 'New Zealander'),
(129, 'Nicaraguan'),
(130, 'Nigerian'),
(131, 'Nigerien'),
(132, 'North Korean'),
(133, 'Northern Irish'),
(134, 'Norwegian'),
(135, 'Omani'),
(136, 'Pakistani'),
(137, 'Palauan'),
(138, 'Panamanian'),
(139, 'Papua New Guinean'),
(140, 'Paraguayan'),
(141, 'Peruvian'),
(142, 'Polish'),
(143, 'Portuguese'),
(144, 'Qatari'),
(145, 'Romanian'),
(146, 'Russian'),
(147, 'Rwandan'),
(148, 'Saint Lucian'),
(149, 'Salvadoran'),
(150, 'Samoan'),
(151, 'San Marinese'),
(152, 'Sao Tomean'),
(153, 'Saudi'),
(154, 'Scottish'),
(155, 'Senegalese'),
(156, 'Serbian'),
(157, 'Seychellois'),
(158, 'Sierra Leonean'),
(159, 'Singaporean'),
(160, 'Slovakian'),
(161, 'Slovenian'),
(162, 'Solomon Islander'),
(163, 'Somali'),
(164, 'South African'),
(165, 'South Korean'),
(166, 'Spanish'),
(167, 'Sri Lankan'),
(168, 'Sudanese'),
(169, 'Surinamer'),
(170, 'Swazi'),
(171, 'Swedish'),
(172, 'Swiss'),
(173, 'Syrian'),
(174, 'Taiwanese'),
(175, 'Tajik'),
(176, 'Tanzanian'),
(177, 'Thai'),
(178, 'Togolese'),
(179, 'Tongan'),
(180, 'Trinidadian or Tobagonian'),
(181, 'Tunisian'),
(182, 'Turkish'),
(183, 'Tuvaluan'),
(184, 'Ugandan'),
(185, 'Ukrainian'),
(186, 'Uruguayan'),
(187, 'Uzbekistani'),
(188, 'Venezuelan'),
(189, 'Vietnamese'),
(190, 'Welsh'),
(191, 'Yemenite'),
(192, 'Zambian'),
(193, 'Zimbabwean');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL,
  `time` datetime DEFAULT '0000-00-00 00:00:00',
  `fromUser` bigint(20) DEFAULT NULL,
  `fromEmployee` bigint(20) DEFAULT NULL,
  `toUser` bigint(20) NOT NULL,
  `image` varchar(500) DEFAULT NULL,
  `message` text,
  `action` text,
  `type` varchar(100) DEFAULT NULL,
  `status` enum('Unread','Read') DEFAULT 'Unread'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `paygrades`
--

CREATE TABLE `paygrades` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `currency` varchar(3) NOT NULL,
  `min_salary` decimal(12,2) DEFAULT '0.00',
  `max_salary` decimal(12,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `paygrades`
--

INSERT INTO `paygrades` (`id`, `name`, `currency`, `min_salary`, `max_salary`) VALUES
(1, 'Manager', 'SGD', '5000.00', '15000.00'),
(2, 'Executive', 'SGD', '3500.00', '7000.00'),
(3, 'Assistant ', 'SGD', '2000.00', '4000.00'),
(4, 'Administrator', 'SGD', '2000.00', '6000.00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) NOT NULL,
  `user_level` enum('Admin','Employee','Manager') DEFAULT NULL,
  `module_id` bigint(20) NOT NULL,
  `permission` varchar(200) DEFAULT NULL,
  `meta` varchar(500) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `user_level`, `module_id`, `permission`, `meta`, `value`) VALUES
(1, 'Manager', 2, 'Add Company Structure', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(2, 'Manager', 2, 'Edit Company Structure', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(3, 'Manager', 2, 'Delete Company Structure', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(4, 'Manager', 10, 'Add Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(5, 'Manager', 10, 'Edit Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(6, 'Manager', 10, 'Delete Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(7, 'Manager', 10, 'Add Clients', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(8, 'Manager', 10, 'Edit Clients', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(9, 'Manager', 10, 'Delete Clients', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(10, 'Manager', 11, 'Add Skills', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(11, 'Manager', 11, 'Edit Skills', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(12, 'Manager', 11, 'Delete Skills', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(13, 'Manager', 11, 'Add Education', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(14, 'Manager', 11, 'Edit Education', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(15, 'Manager', 11, 'Delete Education', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(16, 'Manager', 11, 'Add Certifications', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(17, 'Manager', 11, 'Edit Certifications', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(18, 'Manager', 11, 'Delete Certifications', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(19, 'Manager', 11, 'Add Languages', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(20, 'Manager', 11, 'Edit Languages', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(21, 'Manager', 11, 'Delete Languages', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(22, 'Manager', 17, 'Add Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(23, 'Manager', 17, 'Edit Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(24, 'Manager', 17, 'Delete Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(25, 'Employee', 17, 'Add Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(26, 'Employee', 17, 'Edit Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(27, 'Employee', 17, 'Delete Dependents', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(28, 'Manager', 18, 'Add Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(29, 'Manager', 18, 'Edit Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(30, 'Manager', 18, 'Delete Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(31, 'Employee', 18, 'Add Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(32, 'Employee', 18, 'Edit Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(33, 'Employee', 18, 'Delete Emergency Contacts', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(34, 'Manager', 19, 'Edit Employee Number', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(35, 'Manager', 19, 'Edit EPF/CPF Number', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(36, 'Manager', 19, 'Edit Employment Status', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(37, 'Manager', 19, 'Edit Job Title', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(38, 'Manager', 19, 'Edit Pay Grade', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(39, 'Manager', 19, 'Edit Joined Date', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(40, 'Manager', 19, 'Edit Department', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(41, 'Manager', 19, 'Edit Work Email', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(42, 'Manager', 19, 'Edit Country', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(43, 'Manager', 19, 'Upload/Delete Profile Image', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(44, 'Manager', 19, 'Edit Employee Details', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(45, 'Employee', 19, 'Edit Employee Number', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(46, 'Employee', 19, 'Edit EPF/CPF Number', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(47, 'Employee', 19, 'Edit Employment Status', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(48, 'Employee', 19, 'Edit Job Title', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(49, 'Employee', 19, 'Edit Pay Grade', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(50, 'Employee', 19, 'Edit Joined Date', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(51, 'Employee', 19, 'Edit Department', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(52, 'Employee', 19, 'Edit Work Email', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(53, 'Employee', 19, 'Edit Country', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(54, 'Employee', 19, 'Upload/Delete Profile Image', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(55, 'Employee', 19, 'Edit Employee Details', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(56, 'Manager', 21, 'Add Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(57, 'Manager', 21, 'Edit Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(58, 'Manager', 21, 'Delete Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'Yes'),
(59, 'Employee', 21, 'Add Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(60, 'Employee', 21, 'Edit Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(61, 'Employee', 21, 'Delete Projects', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(62, 'Manager', 23, 'Add Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(63, 'Manager', 23, 'Edit Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(64, 'Manager', 23, 'Delete Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(65, 'Employee', 23, 'Add Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(66, 'Employee', 23, 'Edit Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No'),
(67, 'Employee', 23, 'Delete Salary', '["value", {"label":"Value","type":"select","source":[["Yes","Yes"],["No","No"]]}]', 'No');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `client` bigint(20) DEFAULT NULL,
  `details` text,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `province`
--

CREATE TABLE `province` (
  `id` bigint(20) NOT NULL,
  `name` varchar(40) NOT NULL DEFAULT '',
  `code` char(2) NOT NULL DEFAULT '',
  `country` char(2) NOT NULL DEFAULT 'US'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `province`
--

INSERT INTO `province` (`id`, `name`, `code`, `country`) VALUES
(1, 'Alaska', 'AK', 'US'),
(2, 'Alabama', 'AL', 'US'),
(3, 'American Samoa', 'AS', 'US'),
(4, 'Arizona', 'AZ', 'US'),
(5, 'Arkansas', 'AR', 'US'),
(6, 'California', 'CA', 'US'),
(7, 'Colorado', 'CO', 'US'),
(8, 'Connecticut', 'CT', 'US'),
(9, 'Delaware', 'DE', 'US'),
(10, 'District of Columbia', 'DC', 'US'),
(11, 'Federated States of Micronesia', 'FM', 'US'),
(12, 'Florida', 'FL', 'US'),
(13, 'Georgia', 'GA', 'US'),
(14, 'Guam', 'GU', 'US'),
(15, 'Hawaii', 'HI', 'US'),
(16, 'Idaho', 'ID', 'US'),
(17, 'Illinois', 'IL', 'US'),
(18, 'Indiana', 'IN', 'US'),
(19, 'Iowa', 'IA', 'US'),
(20, 'Kansas', 'KS', 'US'),
(21, 'Kentucky', 'KY', 'US'),
(22, 'Louisiana', 'LA', 'US'),
(23, 'Maine', 'ME', 'US'),
(24, 'Marshall Islands', 'MH', 'US'),
(25, 'Maryland', 'MD', 'US'),
(26, 'Massachusetts', 'MA', 'US'),
(27, 'Michigan', 'MI', 'US'),
(28, 'Minnesota', 'MN', 'US'),
(29, 'Mississippi', 'MS', 'US'),
(30, 'Missouri', 'MO', 'US'),
(31, 'Montana', 'MT', 'US'),
(32, 'Nebraska', 'NE', 'US'),
(33, 'Nevada', 'NV', 'US'),
(34, 'New Hampshire', 'NH', 'US'),
(35, 'New Jersey', 'NJ', 'US'),
(36, 'New Mexico', 'NM', 'US'),
(37, 'New York', 'NY', 'US'),
(38, 'North Carolina', 'NC', 'US'),
(39, 'North Dakota', 'ND', 'US'),
(40, 'Northern Mariana Islands', 'MP', 'US'),
(41, 'Ohio', 'OH', 'US'),
(42, 'Oklahoma', 'OK', 'US'),
(43, 'Oregon', 'OR', 'US'),
(44, 'Palau', 'PW', 'US'),
(45, 'Pennsylvania', 'PA', 'US'),
(46, 'Puerto Rico', 'PR', 'US'),
(47, 'Rhode Island', 'RI', 'US'),
(48, 'South Carolina', 'SC', 'US'),
(49, 'South Dakota', 'SD', 'US'),
(50, 'Tennessee', 'TN', 'US'),
(51, 'Texas', 'TX', 'US'),
(52, 'Utah', 'UT', 'US'),
(53, 'Vermont', 'VT', 'US'),
(54, 'Virgin Islands', 'VI', 'US'),
(55, 'Virginia', 'VA', 'US'),
(56, 'Washington', 'WA', 'US'),
(57, 'West Virginia', 'WV', 'US'),
(58, 'Wisconsin', 'WI', 'US'),
(59, 'Wyoming', 'WY', 'US'),
(60, 'Armed Forces Africa', 'AE', 'US'),
(61, 'Armed Forces Americas (except Canada)', 'AA', 'US'),
(62, 'Armed Forces Canada', 'AE', 'US'),
(63, 'Armed Forces Europe', 'AE', 'US'),
(64, 'Armed Forces Middle East', 'AE', 'US'),
(65, 'Armed Forces Pacific', 'AP', 'US');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `details` text,
  `parameters` text,
  `query` text,
  `paramOrder` varchar(500) NOT NULL,
  `type` enum('Query','Class') DEFAULT 'Query'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `name`, `details`, `parameters`, `query`, `paramOrder`, `type`) VALUES
(1, 'Employee Details Report', 'This report list all employee details and you can filter employees by department, employment status or job title', '[\r\n[ "department", {"label":"Department","type":"select2","remote-source":["CompanyStructure","id","title"],"allow-null":true}],\r\n[ "employment_status", {"label":"Employment Status","type":"select2","remote-source":["EmploymentStatus","id","name"],"allow-null":true}],\r\n[ "job_title", {"label":"Job Title","type":"select2","remote-source":["JobTitle","id","name"],"allow-null":true}]\r\n]', 'Select id, employee_id as ''Employee ID'',\r\nconcat(`first_name`,'' '',`middle_name`,'' '', `last_name`) as ''Name'',\r\n(SELECT name from Nationality where id = nationality) as ''Nationality'',\r\nbirthday as ''Birthday'',\r\ngender as ''Gender'',\r\nmarital_status as ''Marital Status'',\r\nssn_num as ''SSN Number'',\r\nnic_num as ''NIC Number'',\r\nother_id as ''Other IDs'',\r\ndriving_license as ''Driving License Number'',\r\n(SELECT name from EmploymentStatus where id = employment_status) as ''Employment Status'',\r\n(SELECT name from JobTitles where id = job_title) as ''Job Title'',\r\n(SELECT name from PayGrades where id = pay_grade) as ''Pay Grade'',\r\nwork_station_id as ''Work Station ID'',\r\naddress1 as ''Address 1'',\r\naddress2 as ''Address 2'',\r\ncity as ''City'',\r\n(SELECT name from Country where code = country) as ''Country'',\r\n(SELECT name from Province where id = province) as ''Province'',\r\npostal_code as ''Postal Code'',\r\nhome_phone as ''Home Phone'',\r\nmobile_phone as ''Mobile Phone'',\r\nwork_phone as ''Work Phone'',\r\nwork_email as ''Work Email'',\r\nprivate_email as ''Private Email'',\r\njoined_date as ''Joined Date'',\r\nconfirmation_date as ''Confirmation Date'',\r\n(SELECT title from CompanyStructures where id = department) as ''Department'',\r\n(SELECT concat(`first_name`,'' '',`middle_name`,'' '', `last_name`,'' [Employee ID:'',`employee_id`,'']'') from Employees e1 where e1.id = e.supervisor) as ''Supervisor'' \r\nFROM Employees e _where_', '["department","employment_status","job_title"]', 'Query'),
(3, 'Employee Time Entry Report', 'This report list all employee time entries by employee, date range and project', '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "project", {"label":"Project","type":"select","allow-null":true,"remote-source":["Project","id","name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeTimesheetReport', '["employee","date_start","date_end","status"]', 'Class'),
(4, 'Employee Attendance Report', 'This report list all employee attendance entries by employee and date range', '[\r\n[ "employee", {"label":"Employee","type":"select2multi","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeAttendanceReport', '["employee","date_start","date_end"]', 'Class'),
(5, 'Employee Time Tracking Report', 'This report list employee working hours and attendance details for each day for a given period ', '[\r\n[ "employee", {"label":"Employee","type":"select2","allow-null":false,"remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeTimeTrackReport', '["employee","date_start","date_end"]', 'Class'),
(6, 'Employee Leaves Report', 'This report list employee leaves for a given period ', '[\r\n[ "employee", {"label":"Employee","type":"select2","allow-null":true,"null-label":"All Employees","remote-source":["Employee","id","first_name+last_name"]}],\r\n[ "leave_type", {"label":"Leave Type","type":"select2","allow-null":true,"null-label":"All Types","remote-source":["Leave","id","name"]}],\r\n[ "leave_status", {"label":"Leave Status","type":"select2","allow-null":true,"null-label":"All Status","remote-source":["LeaveStatus","id","name"]}],\r\n[ "date_start", {"label":"Start Date","type":"date"}],\r\n[ "date_end", {"label":"End Date","type":"date"}]\r\n]', 'EmployeeLeavesReport', '["employee","leave_type","leave_status","date_start","date_end"]', 'Class');

-- --------------------------------------------------------

--
-- Table structure for table `restaccesstokens`
--

CREATE TABLE `restaccesstokens` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `token` varchar(500) DEFAULT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `salarycomponent`
--

CREATE TABLE `salarycomponent` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `componentType` bigint(20) DEFAULT NULL,
  `details` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salarycomponent`
--

INSERT INTO `salarycomponent` (`id`, `name`, `componentType`, `details`) VALUES
(1, 'Basic Salary', 1, ''),
(2, 'Fixed Allowance', 1, ''),
(3, 'Car Allowance', 2, ''),
(4, 'Telephone Allowance', 2, '');

-- --------------------------------------------------------

--
-- Table structure for table `salarycomponenttype`
--

CREATE TABLE `salarycomponenttype` (
  `id` bigint(20) NOT NULL,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `salarycomponenttype`
--

INSERT INTO `salarycomponenttype` (`id`, `code`, `name`) VALUES
(1, 'B001', 'Basic'),
(2, 'B002', 'Allowance');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text,
  `description` text,
  `meta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `description`, `meta`) VALUES
(1, 'Company: Name', 'Spark Global Tech Systems, Inc.', 'Update your company name - For updating company logo copy a file named logo.png to /app/data/ folder', ''),
(2, 'Email: Enable', '1', '0 will disable all outgoing emails from modules. Value 1 will enable outgoing emails', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(3, 'Email: Mode', 'SMTP', 'SMTP, PHP Mailer or Amazon SES. SMTP = send emails using local or a remote smtp server. PHP Mailer = send emails using mail function provided by php. Amazon SES = send emails trough amazon Simple Email Service.', '["value", {"label":"Value","type":"select","source":[["SMTP","SMTP"],["PHP Mailer","PHP Mailer"],["SES","Amazon SES"]]}]'),
(4, 'Email: SMTP Host', 'ssl://smtp.gmail.com', 'SMTP host IP', ''),
(5, 'Email: SMTP Authentication Required', '1', 'Is authentication required by this SMTP server', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(6, 'Email: SMTP User', 'evanjoe.lachica@sparkglobaltech.com', 'SMTP user', ''),
(7, 'Email: SMTP Password', 'Walongfive+1', 'SMTP password', ''),
(8, 'Email: SMTP Port', '465', '25', ''),
(9, 'Email: Amazon Access Key ID', '', 'If email mode is Amazon SNS please provide SNS Key', ''),
(10, 'Email: Amazon Secret Access Key', '', 'If email mode is Amazon SNS please provide SNS Secret', ''),
(11, 'Email: Email From', 'evanjoe.lachica@sparkglobaltech.com', '', ''),
(12, 'System: Do not pass JSON in request', '0', 'Select Yes if you are having trouble loading data for some tables', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(13, 'System: Reset Modules and Permissions', '0', 'Select this to reset module and permission information in Database (If you have done any changes to meta files)', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(14, 'System: Add New Permissions', '0', 'Select this to add new permission changes done to meta.json file of any module', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(15, 'System: Debug Mode', '0', '', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(16, 'Projects: Make All Projects Available to Employees', '1', '', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(17, 'Attendance: Time-sheet Cross Check', '0', 'Only allow users to add an entry to a timesheet only if they have marked atteandance for the selected period', '["value", {"label":"Value","type":"select","source":[["1","Yes"],["0","No"]]}]'),
(18, 'Api: REST Api Enabled', '0', '', '["value", {"label":"Value","type":"select","source":[["0","No"],["1","Yes"]]}]'),
(19, 'Instance : ID', 'ded0041ce52e15079d266ae4ac0cbd29', NULL, NULL),
(20, 'Instance: Key', 'IgLBFzaCblaftBWPiJrlJ6UlsqMjtVMNkmAH2SrVvVlJYo1nTdlhvjf379MCcBw=', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`id`, `name`, `description`) VALUES
(1, 'Programming and Application Development', 'Programming and Application Development'),
(2, 'Project Management', 'Project Management'),
(3, 'Help Desk/Technical Support', 'Help Desk/Technical Support'),
(4, 'Networking', 'Networking'),
(5, 'Databases', 'Databases'),
(6, 'Business Intelligence', 'Business Intelligence'),
(7, 'Cloud Computing', 'Cloud Computing'),
(8, 'Information Security', 'Information Security'),
(9, 'HTML Skills', 'HTML Skills'),
(10, 'Graphic Designing', 'Graphic Designing');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contributor` enum('Employee','Employer') DEFAULT NULL,
  `type` enum('Fixed','Percentage') DEFAULT NULL,
  `percentage_type` enum('On Component','On Component Type') DEFAULT NULL,
  `componentType` bigint(20) DEFAULT NULL,
  `component` bigint(20) DEFAULT NULL,
  `rangeAmounts` text,
  `country` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxrules`
--

CREATE TABLE `taxrules` (
  `id` bigint(20) NOT NULL,
  `apply` enum('Yes','No') DEFAULT 'Yes',
  `application_type` enum('All','Condition - OR','Condition - AND') DEFAULT 'All',
  `tax` bigint(20) NOT NULL,
  `job_title` bigint(20) DEFAULT NULL,
  `ethnicity` bigint(20) DEFAULT NULL,
  `nationality` bigint(20) DEFAULT NULL,
  `immigration_status` bigint(20) DEFAULT NULL,
  `pay_grade` bigint(20) DEFAULT NULL,
  `country` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `trainingsessions`
--

CREATE TABLE `trainingsessions` (
  `id` bigint(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `course` bigint(20) NOT NULL,
  `description` text,
  `scheduled` datetime DEFAULT '0000-00-00 00:00:00',
  `dueDate` datetime DEFAULT '0000-00-00 00:00:00',
  `deliveryMethod` enum('Classroom','Self Study','Online') DEFAULT 'Classroom',
  `deliveryLocation` varchar(500) DEFAULT NULL,
  `status` enum('Pending','Approved','Completed','Cancelled') DEFAULT 'Pending',
  `attendanceType` enum('Sign Up','Assign') DEFAULT 'Sign Up',
  `attachment` varchar(300) DEFAULT NULL,
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  `updated` datetime DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `userroles`
--

CREATE TABLE `userroles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `userroles`
--

INSERT INTO `userroles` (`id`, `name`) VALUES
(2, 'Attendance Manager'),
(1, 'Report Manager');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `employee` bigint(20) DEFAULT NULL,
  `default_module` bigint(20) DEFAULT NULL,
  `user_level` enum('Admin','Employee','Manager','Other') DEFAULT NULL,
  `user_roles` text,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_update` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `employee`, `default_module`, `user_level`, `user_roles`, `last_login`, `last_update`, `created`) VALUES
(1, 'admin', 'sample@sample.com', '21232f297a57a5a743894a0e4a801fc3', 1, NULL, 'Admin', '', '2015-12-20 17:51:53', '2015-12-14 02:58:33', '2015-12-14 02:58:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archivedemployees`
--
ALTER TABLE `archivedemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `in_time` (`in_time`),
  ADD KEY `out_time` (`out_time`),
  ADD KEY `employee_in_time` (`employee`,`in_time`),
  ADD KEY `employee_out_time` (`employee`,`out_time`);

--
-- Indexes for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_AuditLog_Users` (`user`);

--
-- Indexes for table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companyloans`
--
ALTER TABLE `companyloans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companystructures`
--
ALTER TABLE `companystructures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_CompanyStructures_Own` (`parent`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_Courses_Employees` (`coordinator`);

--
-- Indexes for table `currencytypes`
--
ALTER TABLE `currencytypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `CurrencyTypes_code` (`code`);

--
-- Indexes for table `customfields`
--
ALTER TABLE `customfields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dataentrybackups`
--
ALTER TABLE `dataentrybackups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductionrules`
--
ALTER TABLE `deductionrules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_DeductionRules_Deductions` (`deduction`),
  ADD KEY `Fk_DeductionRules_Country` (`country`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_Deductions_Country` (`country`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `educations`
--
ALTER TABLE `educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmergencyContacts_Employee` (`employee`);

--
-- Indexes for table `employeecertifications`
--
ALTER TABLE `employeecertifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee` (`employee`,`certification_id`),
  ADD KEY `Fk_EmployeeCertifications_Certifications` (`certification_id`);

--
-- Indexes for table `employeecompanyloans`
--
ALTER TABLE `employeecompanyloans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeCompanyLoans_CompanyLoans` (`loan`),
  ADD KEY `Fk_EmployeeCompanyLoans_Employee` (`employee`);

--
-- Indexes for table `employeedependents`
--
ALTER TABLE `employeedependents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeDependents_Employee` (`employee`);

--
-- Indexes for table `employeedocuments`
--
ALTER TABLE `employeedocuments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeDocuments_Documents` (`document`),
  ADD KEY `Fk_EmployeeDocuments_Employee` (`employee`);

--
-- Indexes for table `employeeeducations`
--
ALTER TABLE `employeeeducations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeEducations_Educations` (`education_id`),
  ADD KEY `Fk_EmployeeEducations_Employee` (`employee`);

--
-- Indexes for table `employeeethnicity`
--
ALTER TABLE `employeeethnicity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeEthnicity_Employee` (`employee`),
  ADD KEY `Fk_EmployeeEthnicity_Ethnicity` (`ethnicity`);

--
-- Indexes for table `employeeimmigrations`
--
ALTER TABLE `employeeimmigrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeImmigrations_Employee` (`employee`),
  ADD KEY `Fk_EmployeeImmigrations_ImmigrationDocuments` (`document`);

--
-- Indexes for table `employeeimmigrationstatus`
--
ALTER TABLE `employeeimmigrationstatus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeImmigrationStatus_Employee` (`employee`),
  ADD KEY `Fk_EmployeeImmigrationStatus_Type` (`status`);

--
-- Indexes for table `employeelanguages`
--
ALTER TABLE `employeelanguages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee` (`employee`,`language_id`),
  ADD KEY `Fk_EmployeeLanguages_Languages` (`language_id`);

--
-- Indexes for table `employeeleaves`
--
ALTER TABLE `employeeleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_type_id` (`leave_type`),
  ADD KEY `employee_id` (`employee`),
  ADD KEY `leave_status_id` (`leave_status`);

--
-- Indexes for table `employeeprojects`
--
ALTER TABLE `employeeprojects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EmployeeProjectsKey` (`employee`,`project`),
  ADD KEY `Fk_EmployeeProjects_Projects` (`project`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_id` (`employee_id`),
  ADD KEY `Fk_Employee_Nationality` (`nationality`),
  ADD KEY `Fk_Employee_JobTitle` (`job_title`),
  ADD KEY `Fk_Employee_EmploymentStatus` (`employment_status`),
  ADD KEY `Fk_Employee_Country` (`country`),
  ADD KEY `Fk_Employee_Province` (`province`),
  ADD KEY `Fk_Employee_Supervisor` (`supervisor`),
  ADD KEY `Fk_Employee_CompanyStructures` (`department`),
  ADD KEY `Fk_Employee_PayGrades` (`pay_grade`);

--
-- Indexes for table `employeesalary`
--
ALTER TABLE `employeesalary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeSalary_Employee` (`employee`),
  ADD KEY `Fk_EmployeeSalary_Currency` (`currency`);

--
-- Indexes for table `employeeskills`
--
ALTER TABLE `employeeskills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee` (`employee`,`skill_id`),
  ADD KEY `Fk_EmployeeSkills_Skills` (`skill_id`);

--
-- Indexes for table `employeetimeentry`
--
ALTER TABLE `employeetimeentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeTimeEntry_Projects` (`project`),
  ADD KEY `Fk_EmployeeTimeEntry_EmployeeTimeSheets` (`timesheet`),
  ADD KEY `employee_project` (`employee`,`project`),
  ADD KEY `employee_project_date_start` (`employee`,`project`,`date_start`);

--
-- Indexes for table `employeetimesheets`
--
ALTER TABLE `employeetimesheets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `EmployeeTimeSheetsKey` (`employee`,`date_start`,`date_end`),
  ADD KEY `EmployeeTimeSheets_date_end` (`date_end`);

--
-- Indexes for table `employeetrainingsessions`
--
ALTER TABLE `employeetrainingsessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeTrainingSessions_TrainingSessions` (`trainingSession`),
  ADD KEY `Fk_EmployeeTrainingSessions_Employee` (`employee`);

--
-- Indexes for table `employeetravelrecords`
--
ALTER TABLE `employeetravelrecords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_EmployeeTravelRecords_Employee` (`employee`);

--
-- Indexes for table `employmentstatus`
--
ALTER TABLE `employmentstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ethnicity`
--
ALTER TABLE `ethnicity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fieldnamemappings`
--
ALTER TABLE `fieldnamemappings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename` (`filename`);

--
-- Indexes for table `immigrationdocuments`
--
ALTER TABLE `immigrationdocuments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `immigrationstatus`
--
ALTER TABLE `immigrationstatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobtitles`
--
ALTER TABLE `jobtitles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavestatus`
--
ALTER TABLE `leavestatus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leavetypes`
--
ALTER TABLE `leavetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Modules_name_modgroup` (`name`,`mod_group`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toUser_time` (`toUser`,`time`),
  ADD KEY `toUser_status_time` (`toUser`,`status`,`time`);

--
-- Indexes for table `paygrades`
--
ALTER TABLE `paygrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_PayGrades_CurrencyTypes` (`currency`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Module_Permission` (`user_level`,`module_id`,`permission`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_Projects_Client` (`client`);

--
-- Indexes for table `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_Province_Country` (`country`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Reports_Name` (`name`);

--
-- Indexes for table `restaccesstokens`
--
ALTER TABLE `restaccesstokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `userId` (`userId`);

--
-- Indexes for table `salarycomponent`
--
ALTER TABLE `salarycomponent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_SalaryComponent_SalaryComponentType` (`componentType`);

--
-- Indexes for table `salarycomponenttype`
--
ALTER TABLE `salarycomponenttype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_Tax_Country` (`country`);

--
-- Indexes for table `taxrules`
--
ALTER TABLE `taxrules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_TaxRules_Tax` (`tax`),
  ADD KEY `Fk_TaxRules_Country` (`country`);

--
-- Indexes for table `trainingsessions`
--
ALTER TABLE `trainingsessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Fk_TrainingSessions_Courses` (`course`);

--
-- Indexes for table `userroles`
--
ALTER TABLE `userroles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `Fk_User_Employee` (`employee`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archivedemployees`
--
ALTER TABLE `archivedemployees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `auditlog`
--
ALTER TABLE `auditlog`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `companyloans`
--
ALTER TABLE `companyloans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `companystructures`
--
ALTER TABLE `companystructures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;
--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currencytypes`
--
ALTER TABLE `currencytypes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;
--
-- AUTO_INCREMENT for table `customfields`
--
ALTER TABLE `customfields`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `dataentrybackups`
--
ALTER TABLE `dataentrybackups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deductionrules`
--
ALTER TABLE `deductionrules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `educations`
--
ALTER TABLE `educations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeecertifications`
--
ALTER TABLE `employeecertifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeecompanyloans`
--
ALTER TABLE `employeecompanyloans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employeedependents`
--
ALTER TABLE `employeedependents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `employeedocuments`
--
ALTER TABLE `employeedocuments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeeducations`
--
ALTER TABLE `employeeeducations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeethnicity`
--
ALTER TABLE `employeeethnicity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeimmigrations`
--
ALTER TABLE `employeeimmigrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeimmigrationstatus`
--
ALTER TABLE `employeeimmigrationstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeelanguages`
--
ALTER TABLE `employeelanguages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeleaves`
--
ALTER TABLE `employeeleaves`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `employeeprojects`
--
ALTER TABLE `employeeprojects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `employeesalary`
--
ALTER TABLE `employeesalary`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeeskills`
--
ALTER TABLE `employeeskills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeetimeentry`
--
ALTER TABLE `employeetimeentry`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeetimesheets`
--
ALTER TABLE `employeetimesheets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `employeetrainingsessions`
--
ALTER TABLE `employeetrainingsessions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employeetravelrecords`
--
ALTER TABLE `employeetravelrecords`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employmentstatus`
--
ALTER TABLE `employmentstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ethnicity`
--
ALTER TABLE `ethnicity`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fieldnamemappings`
--
ALTER TABLE `fieldnamemappings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `immigrationdocuments`
--
ALTER TABLE `immigrationdocuments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `immigrationstatus`
--
ALTER TABLE `immigrationstatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobtitles`
--
ALTER TABLE `jobtitles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `leavestatus`
--
ALTER TABLE `leavestatus`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `leavetypes`
--
ALTER TABLE `leavetypes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `paygrades`
--
ALTER TABLE `paygrades`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `restaccesstokens`
--
ALTER TABLE `restaccesstokens`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `salarycomponent`
--
ALTER TABLE `salarycomponent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `salarycomponenttype`
--
ALTER TABLE `salarycomponenttype`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tax`
--
ALTER TABLE `tax`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `taxrules`
--
ALTER TABLE `taxrules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `trainingsessions`
--
ALTER TABLE `trainingsessions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `userroles`
--
ALTER TABLE `userroles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `Fk_Attendance_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auditlog`
--
ALTER TABLE `auditlog`
  ADD CONSTRAINT `Fk_AuditLog_Users` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `companystructures`
--
ALTER TABLE `companystructures`
  ADD CONSTRAINT `Fk_CompanyStructures_Own` FOREIGN KEY (`parent`) REFERENCES `companystructures` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `Fk_Courses_Employees` FOREIGN KEY (`coordinator`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `deductionrules`
--
ALTER TABLE `deductionrules`
  ADD CONSTRAINT `Fk_DeductionRules_Country` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_DeductionRules_Deductions` FOREIGN KEY (`deduction`) REFERENCES `deductions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `Fk_Deductions_Country` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `emergencycontacts`
--
ALTER TABLE `emergencycontacts`
  ADD CONSTRAINT `Fk_EmergencyContacts_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeecertifications`
--
ALTER TABLE `employeecertifications`
  ADD CONSTRAINT `Fk_EmployeeCertifications_Certifications` FOREIGN KEY (`certification_id`) REFERENCES `certifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeCertifications_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeecompanyloans`
--
ALTER TABLE `employeecompanyloans`
  ADD CONSTRAINT `Fk_EmployeeCompanyLoans_CompanyLoans` FOREIGN KEY (`loan`) REFERENCES `companyloans` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeCompanyLoans_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeedependents`
--
ALTER TABLE `employeedependents`
  ADD CONSTRAINT `Fk_EmployeeDependents_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeedocuments`
--
ALTER TABLE `employeedocuments`
  ADD CONSTRAINT `Fk_EmployeeDocuments_Documents` FOREIGN KEY (`document`) REFERENCES `documents` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeDocuments_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeeeducations`
--
ALTER TABLE `employeeeducations`
  ADD CONSTRAINT `Fk_EmployeeEducations_Educations` FOREIGN KEY (`education_id`) REFERENCES `educations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeEducations_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeeethnicity`
--
ALTER TABLE `employeeethnicity`
  ADD CONSTRAINT `Fk_EmployeeEthnicity_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeEthnicity_Ethnicity` FOREIGN KEY (`ethnicity`) REFERENCES `ethnicity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeeimmigrations`
--
ALTER TABLE `employeeimmigrations`
  ADD CONSTRAINT `Fk_EmployeeImmigrations_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeImmigrations_ImmigrationDocuments` FOREIGN KEY (`document`) REFERENCES `immigrationdocuments` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employeeimmigrationstatus`
--
ALTER TABLE `employeeimmigrationstatus`
  ADD CONSTRAINT `Fk_EmployeeImmigrationStatus_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeImmigrationStatus_Type` FOREIGN KEY (`status`) REFERENCES `immigrationstatus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeelanguages`
--
ALTER TABLE `employeelanguages`
  ADD CONSTRAINT `Fk_EmployeeLanguages_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeLanguages_Languages` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeeleaves`
--
ALTER TABLE `employeeleaves`
  ADD CONSTRAINT `employeeleaves_ibfk_1` FOREIGN KEY (`leave_type`) REFERENCES `leavetypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employeeleaves_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employeeleaves_ibfk_3` FOREIGN KEY (`leave_status`) REFERENCES `leavestatus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employeeprojects`
--
ALTER TABLE `employeeprojects`
  ADD CONSTRAINT `Fk_EmployeeProjects_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeProjects_Projects` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `Fk_Employee_CompanyStructures` FOREIGN KEY (`department`) REFERENCES `companystructures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_Country` FOREIGN KEY (`country`) REFERENCES `country` (`code`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_EmploymentStatus` FOREIGN KEY (`employment_status`) REFERENCES `employmentstatus` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_JobTitle` FOREIGN KEY (`job_title`) REFERENCES `jobtitles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_Nationality` FOREIGN KEY (`nationality`) REFERENCES `nationality` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_PayGrades` FOREIGN KEY (`pay_grade`) REFERENCES `paygrades` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_Province` FOREIGN KEY (`province`) REFERENCES `province` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_Employee_Supervisor` FOREIGN KEY (`supervisor`) REFERENCES `employees` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employeesalary`
--
ALTER TABLE `employeesalary`
  ADD CONSTRAINT `Fk_EmployeeSalary_Currency` FOREIGN KEY (`currency`) REFERENCES `currencytypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeSalary_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeeskills`
--
ALTER TABLE `employeeskills`
  ADD CONSTRAINT `Fk_EmployeeSkills_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeSkills_Skills` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeetimeentry`
--
ALTER TABLE `employeetimeentry`
  ADD CONSTRAINT `Fk_EmployeeTimeEntry_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeTimeEntry_EmployeeTimeSheets` FOREIGN KEY (`timesheet`) REFERENCES `employeetimesheets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeTimeEntry_Projects` FOREIGN KEY (`project`) REFERENCES `projects` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `employeetimesheets`
--
ALTER TABLE `employeetimesheets`
  ADD CONSTRAINT `Fk_EmployeeTimeSheets_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeetrainingsessions`
--
ALTER TABLE `employeetrainingsessions`
  ADD CONSTRAINT `Fk_EmployeeTrainingSessions_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_EmployeeTrainingSessions_TrainingSessions` FOREIGN KEY (`trainingSession`) REFERENCES `trainingsessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employeetravelrecords`
--
ALTER TABLE `employeetravelrecords`
  ADD CONSTRAINT `Fk_EmployeeTravelRecords_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `Fk_Notifications_Users` FOREIGN KEY (`toUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paygrades`
--
ALTER TABLE `paygrades`
  ADD CONSTRAINT `Fk_PayGrades_CurrencyTypes` FOREIGN KEY (`currency`) REFERENCES `currencytypes` (`code`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `Fk_Projects_Client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `province`
--
ALTER TABLE `province`
  ADD CONSTRAINT `Fk_Province_Country` FOREIGN KEY (`country`) REFERENCES `country` (`code`);

--
-- Constraints for table `salarycomponent`
--
ALTER TABLE `salarycomponent`
  ADD CONSTRAINT `Fk_SalaryComponent_SalaryComponentType` FOREIGN KEY (`componentType`) REFERENCES `salarycomponenttype` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `tax`
--
ALTER TABLE `tax`
  ADD CONSTRAINT `Fk_Tax_Country` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taxrules`
--
ALTER TABLE `taxrules`
  ADD CONSTRAINT `Fk_TaxRules_Country` FOREIGN KEY (`country`) REFERENCES `country` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Fk_TaxRules_Tax` FOREIGN KEY (`tax`) REFERENCES `tax` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `trainingsessions`
--
ALTER TABLE `trainingsessions`
  ADD CONSTRAINT `Fk_TrainingSessions_Courses` FOREIGN KEY (`course`) REFERENCES `courses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `Fk_User_Employee` FOREIGN KEY (`employee`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
