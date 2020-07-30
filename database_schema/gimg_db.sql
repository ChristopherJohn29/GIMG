-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 28, 2020 at 08:05 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_drs`
--

-- --------------------------------------------------------

--
-- Table structure for table `home_health_care`
--

CREATE TABLE `home_health_care` (
  `hhc_id` int(10) UNSIGNED NOT NULL,
  `hhc_name` varchar(45) DEFAULT NULL,
  `hhc_contact_name` varchar(45) DEFAULT NULL,
  `hhc_phoneNumber` varchar(45) DEFAULT NULL,
  `hhc_faxNumber` varchar(45) DEFAULT NULL,
  `hhc_email` varchar(45) DEFAULT NULL,
  `hhc_address` varchar(255) DEFAULT NULL,
  `hhc_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_health_care`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(10) UNSIGNED NOT NULL,
  `patient_name` varchar(90) DEFAULT NULL,
  `patient_gender` varchar(10) DEFAULT NULL,
  `patient_medicareNum` varchar(45) DEFAULT NULL,
  `patient_dateOfBirth` date DEFAULT NULL,
  `patient_phoneNum` varchar(45) DEFAULT NULL,
  `patient_address` varchar(255) DEFAULT NULL,
  `patient_hhcID` int(10) UNSIGNED DEFAULT NULL,
  `patient_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `patient_caregiver_family` varchar(45) DEFAULT NULL,
  `patient_placeOfService` int(10) UNSIGNED DEFAULT NULL,
  `patient_pharmacy` varchar(255) DEFAULT NULL,
  `patient_pharmacyPhone` varchar(45) DEFAULT NULL,
  `patient_drug_allergy` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_communication_notes`
--

CREATE TABLE `patient_communication_notes` (
  `ptcn_id` int(10) UNSIGNED NOT NULL,
  `ptcn_patientID` int(10) UNSIGNED DEFAULT NULL,
  `ptcn_message` longtext,
  `ptcn_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ptcn_archive` tinyint(1) DEFAULT NULL,
  `ptcn_category` enum('CPO','Medications','DME','Scheduling','Issues','HH Comm','485','Billing','Misc') DEFAULT NULL,
  `ptcn_notesFromUserID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_communication_notes`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_CPO`
--

CREATE TABLE `patient_CPO` (
  `ptcpo_id` int(10) UNSIGNED NOT NULL,
  `ptcpo_patientID` int(10) UNSIGNED DEFAULT NULL,
  `ptcpo_period` varchar(45) DEFAULT NULL,
  `ptcpo_dateSigned` date DEFAULT NULL,
  `ptcpo_firstMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_secondMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_thirdMonthCPO` varchar(45) DEFAULT NULL,
  `ptcpo_dischargeDate` date DEFAULT NULL,
  `ptcpo_dateBilled` date DEFAULT NULL,
  `ptcpo_status` varchar(30) DEFAULT NULL,
  `ptcpo_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ptcpo_archive` tinyint(1) DEFAULT NULL,
  `ptcpo_addedByUserID` int(10) UNSIGNED DEFAULT NULL,
  `ptcpo_dateOfService` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_CPO`
--

-- --------------------------------------------------------

--
-- Table structure for table `patient_transactions`
--

CREATE TABLE `patient_transactions` (
  `pt_id` int(10) UNSIGNED NOT NULL,
  `pt_tovID` int(10) UNSIGNED DEFAULT NULL,
  `pt_patientID` int(10) UNSIGNED DEFAULT NULL,
  `pt_providerID` int(10) UNSIGNED DEFAULT NULL,
  `pt_dateOfService` date DEFAULT NULL,
  `pt_deductible` varchar(10) DEFAULT NULL,
  `pt_service_billed` varchar(10) DEFAULT NULL,
  `pt_aw_ippe_date` date DEFAULT NULL,
  `pt_aw_ippe_code` varchar(10) DEFAULT NULL,
  `pt_performed` tinyint(1) DEFAULT NULL,
  `pt_acp` tinyint(1) DEFAULT NULL,
  `pt_diabetes` tinyint(1) DEFAULT NULL,
  `pt_tobacco` tinyint(1) DEFAULT NULL,
  `pt_tcm` tinyint(1) DEFAULT NULL,
  `pt_others` varchar(45) DEFAULT NULL,
  `pt_icd10_codes` varchar(255) DEFAULT NULL,
  `pt_visitBilled` date DEFAULT NULL,
  `pt_dateRef` date DEFAULT NULL,
  `pt_dateRefEmailed` date DEFAULT NULL,
  `pt_notes` varchar(255) DEFAULT NULL,
  `pt_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `pt_mileage` varchar(45) DEFAULT NULL,
  `pt_aw_billed` date DEFAULT NULL,
  `pt_supervising_mdID` int(10) UNSIGNED DEFAULT NULL,
  `pt_archive` tinyint(1) DEFAULT NULL,
  `pt_status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `patient_transactions`
--

-- --------------------------------------------------------

--
-- Table structure for table `payroll_summary`
--

CREATE TABLE `payroll_summary` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) DEFAULT NULL,
  `from` varchar(20) NOT NULL,
  `to` varchar(20) NOT NULL,
  `mileage` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payroll_summary`
--

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permissions_id` int(10) UNSIGNED NOT NULL,
  `permissions_name` varchar(255) DEFAULT NULL,
  `permissions_module` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permissions_id`, `permissions_name`, `permissions_module`) VALUES
(1, 'add_user', 'UM'),
(2, 'edit_user', 'UM'),
(3, 'view_user', 'UM'),
(4, 'search_user', 'UM'),
(5, 'list_user', 'UM'),
(6, 'add_provider', 'PPM'),
(7, 'edit_provider', 'PPM'),
(8, 'view_provider', 'PPM'),
(9, 'search_provider', 'PPM'),
(10, 'list_provider', 'PPM'),
(11, 'add_hhc', 'HHCPM'),
(12, 'edit_hhc', 'HHCPM'),
(13, 'view_hhc', 'HHCPM'),
(14, 'search_hhc', 'HHCPM'),
(15, 'list_hhc', 'HHCPM'),
(16, 'add_pt', 'PTPM'),
(17, 'edit_pt', 'PTPM'),
(18, 'view_pt', 'PTPM'),
(19, 'search_pt', 'PTPM'),
(20, 'list_pt', 'PTPM'),
(21, 'add_tr', 'PTPM'),
(22, 'edit_tr', 'PTPM'),
(23, 'view_tr', 'PTPM'),
(24, 'list_tr', 'PTPM'),
(25, 'add_cn', 'PTPM'),
(26, 'edit_cn', 'PTPM'),
(27, 'list_cn', 'PTPM'),
(28, 'view_cn', 'PTPM'),
(29, 'add_cpo', 'PTPM'),
(30, 'edit_cpo', 'PTPM'),
(31, 'view_cpo', 'PTPM'),
(32, 'add_prs', 'PRSM'),
(33, 'edit_prs', 'PRSM'),
(34, 'view_prs', 'PRSM'),
(35, 'list_prs', 'PRSM'),
(36, 'search_prs', 'PRSM'),
(37, 'download_prs', 'PRSM'),
(38, 'print_prs', 'PRSM'),
(39, 'generate_pr', 'PRG'),
(40, 'save_pr', 'PRG'),
(41, 'print_pr', 'PRG'),
(42, 'send_pr', 'PRG'),
(43, 'paid_batch_pr', 'PRG'),
(44, 'generate_sbawr', 'SBAWRG'),
(45, 'save_sbawr', 'SBAWRG'),
(46, 'print_sbawr', 'SBAWRG'),
(47, 'generate_sbhvr', 'SBHVRG'),
(48, 'save_sbhvr', 'SBHVRG'),
(49, 'print_sbhvr', 'SBHVRG'),
(50, 'generate_sbfvr', 'SBFVRG'),
(51, 'save_sbfvr', 'SBFVRG'),
(52, 'print_sbfvr', 'SBFVRG'),
(53, 'generate_sbcpor', 'SBCPORG'),
(54, 'save__sbcpor', 'SBCPORG'),
(55, 'print__sbcpor', 'SBCPORG'),
(56, 'delete_user', 'UM'),
(57, 'email_prs', 'PRSM'),
(58, 'print_pt', 'PTPM'),
(59, 'downoad_pt', 'PTPM'),
(60, 'delete_cn', 'PTPM'),
(61, 'edit_account', 'AM'),
(62, 'headcount_pt', 'PTPM'),
(63, 'delete_tr', 'PTPM'),
(64, 'delete_prs', 'PRSM'),
(65, 'delete_cpo', 'PTPM'),
(66, 'mark_service_paid', 'PTPM'),
(67, 'logs', 'UM'),
(68, 'scheduled_holidays', 'SHM'),
(69, 'generate_sbtv', 'SBTVRG');

-- --------------------------------------------------------

--
-- Table structure for table `place_of_service`
--

CREATE TABLE `place_of_service` (
  `pos_id` int(10) UNSIGNED NOT NULL,
  `pos_code` varchar(45) DEFAULT NULL,
  `pos_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `place_of_service`
--

INSERT INTO `place_of_service` (`pos_id`, `pos_code`, `pos_name`) VALUES
(1, 'POS11', 'Office'),
(2, 'POS12', 'Home'),
(3, 'POS13', 'Facility'),
(4, 'POS14', 'Board & Care');

-- --------------------------------------------------------

--
-- Table structure for table `provider`
--

CREATE TABLE `provider` (
  `provider_id` int(10) UNSIGNED NOT NULL,
  `provider_firstname` varchar(45) DEFAULT NULL,
  `provider_lastname` varchar(45) DEFAULT NULL,
  `provider_contactNum` varchar(45) DEFAULT NULL,
  `provider_email` varchar(45) DEFAULT NULL,
  `provider_address` varchar(255) DEFAULT NULL,
  `provider_dateOfBirth` date DEFAULT NULL,
  `provider_languages` varchar(255) DEFAULT NULL,
  `provider_areas` varchar(255) DEFAULT NULL,
  `provider_npi` varchar(45) DEFAULT NULL,
  `provider_dea` varchar(45) DEFAULT NULL,
  `provider_license` varchar(45) DEFAULT NULL,
  `provider_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `provider_rate_initialVisit` varchar(10) DEFAULT NULL,
  `provider_rate_followUpVisit` varchar(10) DEFAULT NULL,
  `provider_rate_aw` varchar(10) DEFAULT NULL,
  `provider_rate_acp` varchar(10) DEFAULT NULL,
  `provider_rate_noShowPT` varchar(10) DEFAULT NULL,
  `provider_rate_mileage` varchar(10) DEFAULT NULL,
  `provider_gender` varchar(10) DEFAULT NULL,
  `provider_rate_initialVisit_TeleHealth` varchar(10) DEFAULT NULL,
  `provider_rate_followUpVisit_TeleHealth` mediumtext,
  `provider_supervising_MD` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider`
--

INSERT INTO `provider` (`provider_id`, `provider_firstname`, `provider_lastname`, `provider_contactNum`, `provider_email`, `provider_address`, `provider_dateOfBirth`, `provider_languages`, `provider_areas`, `provider_npi`, `provider_dea`, `provider_license`, `provider_dateCreated`, `provider_rate_initialVisit`, `provider_rate_followUpVisit`, `provider_rate_aw`, `provider_rate_acp`, `provider_rate_noShowPT`, `provider_rate_mileage`, `provider_gender`, `provider_rate_initialVisit_TeleHealth`, `provider_rate_followUpVisit_TeleHealth`, `provider_supervising_MD`) VALUES
(1, 'ALEXANDRA', 'KIRTCHIK, NP', '510 541 6928', 'kirtchik@yahoo.com', '716 Milford Street, Los Angeles, CA 90042', '1979-06-14', 'Russian, Med Spanish', 'WeHo, San Fernando Valley', '1376093914', 'MK4077435', '95005127', '2018-12-30 01:05:31', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(2, 'ARSINEH', 'ALMASI, NP', '818 324 6448', 'ahakopchakerian@yahoo.com', 'GLOBAL PROVIDER - 1880 Idlewood Rd. Glendale, CA 91202', NULL, 'Armenian, Med Spanish', 'Glendale', '1376856203', '', 'D4004499', '2018-12-30 01:06:30', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(3, 'BRIAN', 'MONTGOMERY, PA', '951 425 8313', 'brianmontgomery315@yahoo.com', 'INACTIVE', '1985-10-15', 'English', 'Orange county and Riverside county', '1093191504', 'MM3603051', 'PA52698', '2018-12-30 01:07:47', '120', '80', '20', '10', '20', '.10', 'Male', '', '', 0),
(4, 'GRACE', 'ADEAGBO, NP', '323 365 8154', 'adebeauty@hotmail.com', '9628 Adoree Street,  Downey, CA 90242', NULL, 'English', 'Glendale, LA, Pasadena', '1992986731', 'MM3603051', '635727', '2018-12-30 01:11:40', '120', '80', '20', '10', '30', '.10', 'Female', '', '', 0),
(5, 'HENRY', 'BARRAZA, PA', '415 830 0374', 'hrbpac1@gmail.com', '269 Melrose Ave., Monrovia, CA 91016', '1975-01-24', 'Spanish', 'Eagle Rock, Glendale, Monrovia', '1417043340', 'MB1153686', '16753', '2018-12-30 01:50:34', '120', '80', '20', '10', '20', '.10', 'Male', '', '', 0),
(6, 'JOSEPH ', 'SILVERSTEIN, PA', '805.732.9712', 'joe.silverstein@yahoo.com', '3668 Legends Drive Simi Valley, CA 93065', NULL, 'English', '', '1063454916', 'MS0958530', 'PA16833', '2018-12-30 18:15:37', '120', '80', '20', '10', '20', '.10', 'Male', '100', '70', 0),
(7, 'KATHERINE', 'CHIN, PA', '626 202 6573', 'katherinejchin@gmail.com', 'INACTIVE - 901 N. Oakmill Ave. Rosemead, CA 91770', '1982-08-29', 'Spanish, Chinese, Portuguese', 'Montebello, Rosemead, West Covina, Downey, ', '1053654640', 'ML3912640', '95004171', '2018-12-30 18:30:39', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(8, 'LILIBETH', 'RAMIREZ, NP', '818 618 9460', 'lilibethramirez@aol.com', '12030 Stone Gate Way,  Northridge, CA 91326', '1959-04-08', 'Tagalog', 'San Fernando Valley', '1497964688', 'MR1354113', '15273', '2018-12-30 18:34:09', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(9, 'KAIXUAN', 'LUO, NP', '209 323 8154', 'kxluo519@yahoo.com', 'GLOBAL PROVIDER - 25572 Crockett Lane Stevenson Ranch, CA 91381', '1971-05-19', 'Chinese', 'Valley', '1396288239', 'ML3912640', '95004171', '2018-12-30 18:37:11', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(10, 'MARIEL', 'BAUTISTA, NP', '909 900 7873', 'mcbpriory@yahoo.com', 'GLOBAL PROVIDER - 800 Route 66, Apt 29 Glendora, CA 91470', NULL, 'Tagalog', 'San Bernardino', '1316475759', 'MB4422678', '95006528', '2018-12-30 19:04:02', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(11, 'RELYNDO', 'SALCEDO, NP', '909 471 6138', 'slovermel@yahoo.com', 'GLOBAL PROVIDER - 6572 Tokay Avenue Fontana CA 92336', NULL, 'Tagalog', 'San Bernardino', '1649580630', '', '', '2018-12-30 19:05:13', '120', '80', '20', '10', '20', '.10', '', '', '', 0),
(12, 'SEAN', 'THEUS, NP', '323 875 9425', 'bzean1@msn.com', '1752 East Avenue J, #172 Lancaster, CA 93535', '1969-05-25', 'Medical Spanish', 'Lancaster, Valley', '1245778620', 'MT4200806', '95008284', '2018-12-30 19:06:47', '120', '80', '20', '10', '20', '.10', '', '', '', 0),
(13, 'SHOHREH', 'NOUROLLAH, PA', '310 497 6666', 'sharonapa@gmail.com', '1741 S. Bedford St. Los Angeles, CA 90035', '1976-02-19', 'Farsi (persian)', 'West LA, Beverly Hills', '1396954079', 'MN4254708', '16960', '2018-12-30 19:09:00', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(14, 'SHYLEE', 'TIAMSON, DNP - C', '310 292 0117', 'shylee_tiamson@yahoo.com', '255 West 5th St., #1105 San Pedro, CA 90731', '1984-02-05', 'Tagalog', 'Beach areas, Long Beach, Carson, San Pedro', '1053779322', 'MT3918589', 'NP95003772', '2018-12-30 19:10:05', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(15, 'TOMAS', 'SMITH, NP', '805 252 5860', 'doc_doy1536@yahoo.com', 'GLOBAL PROVIDER - 1818 Michigan Ave, 609 Los Angeles, CA 90033', NULL, 'Tagalog', 'LA, Glendale, Hollywood, Burbank, Pasadena', '1093123564', '', '23564', '2018-12-30 19:11:19', '120', '80', '20', '10', '20', '.10', '', '', '', 0),
(16, 'VIRGINIA', 'ZAMBROSKI, NP', '714 401 0291', 'virgyzambroski@gmail.com', '28021 Encanto Mission Viejo, CA 92692', '1966-02-10', 'Medical spanish', 'OC area, Mission Viejo, Aliso Viejo, Irvine, Laguna Hills, Laguna Beach, Huntington Beach', '1639653793', '95010021', '471318', '2018-12-30 19:12:27', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(17, 'ZAYDEE', ' MERCADO, NP', '818 770 2183', 'zaydannemercado@gmail.com', ' 29770 Grand Canyon Rd. Santa Clarita, CA 91387', '1989-10-12', 'Tagalog', 'Valley area', '1972014769', 'MM4604636', '9171555', '2018-12-30 19:14:16', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(18, 'JOSE', 'PILPA, MD', '626 497 2652', 'josepilpa44@yahoo.com', '10221 Green St. Temple City, CA 91780', '1900-12-22', 'Tagalog', 'Medical Director', '1760439012', 'AP2942870 (Expiration: March 31, 2022)', 'A41431 (Expiration: Dec 31, 2021)', '2018-12-30 19:15:38', '0', '0', '0', '0', '0', '0', '', '', '', 1),
(19, 'RUBEN', 'FILIAN, PA', '818 632 9694', 'hydrogen181@yahoo.com', 'INACTIVE', NULL, 'Armenian', '', '', '', '', '2019-01-14 19:30:01', '120', '80', '20', '10', '20', '.10', 'Male', '', '', 0),
(20, 'RACHEL', 'SAKAI, NP', '917-587-4942 ', 'rachelsakaiRN@gmail.com', '930 Figueroa Terrace, Apt 646, Los Angeles, CA 90012', NULL, 'medical spanish', 'Pasadena, Glendale, Valley, Hollywood, downtown LA', '', '', '', '2019-01-14 19:31:10', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(21, 'SANTIAGO ', 'CORPUZ, MD', '9092146242', 'sancor89@aol.com', 'INACTIVE', NULL, '', '', '', '', '', '2019-01-14 19:32:39', '120', '80', '20', '10', '20', '.10', 'Male', '', '', 0),
(22, 'JOCELYN', 'CASES, NP', '951 966 8736', 'joshualynann@yahoo.com', 'GLOBAL PROVIDER - 2274 Posada Ct., Corona, CA 92879 ', NULL, '', '', '', '', '', '2019-01-29 18:36:31', '120', '80', '20', '10', '20', '0.10', 'Female', '', '', 0),
(23, 'LINDA', 'MARKARIAN, PA', '818 434 4771', 'want2heal@hotmail.com', '711 E. Verdugo Avenue, Unit 104 Burbank, CA 91501', '1972-11-04', 'Armenian', '', '1477588903', 'MA1139042', '17298', '2019-02-04 22:44:58', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(24, 'PENDING', 'PROVIDER', '000', 'pending@yahoo.com', 'PENDING', NULL, '', '', '', '', '', '2019-02-20 06:04:28', '0', '0', '0', '0', '0', '0', '', '', '', 0),
(25, 'ALICIA', 'GAMBOA, PA', '404 932 7222', 'agamboa5@yahoo.com', '11433 Mountain View Dr., Unit 45 Rancho Cucamonga, CA 91730', '1967-07-29', 'Medical spanish', 'Inland Empire, Riverside, San Bernardino, Rancho Cucamonga, Upland, Fontana, Claremont, Lavern, West Covina, Pasadena', '1083669576', '', '20715', '2019-02-20 23:15:23', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(26, 'NASRIN', 'AHMADI, PA', '323 810 1917', 'ahmadichiropractic@yahoo.com', 'INACTIVE - 25374 Fitzgerald Avenue, Stevenson Ranch, CA 91381', '1963-12-11', 'Farsi', 'Valley area, Santa Clarita, Lancaster, Palmdale, Glendale', '1346677572', 'MA3278175', '51815', '2019-04-04 20:14:00', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(27, 'JENNIFER', 'DOBRINEN, PA', '559 326 4747', 'jenniferdobrinen@yahoo.com', '254 W. Juanita Avenue, Glendora, CA 91740', '1971-05-22', '', 'Farthest East is Ontario. Glendora, West Covina, Chino, Alhambra. Pasadena and Glendale are the farthest West.', '1851739106', 'MD2962834', 'PA23110', '2019-04-09 22:24:59', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(28, 'NINIA', 'CARVAJAL, NP', '6262745411', 'ncarvajalnp@gmail.com', '600 N. Central Avenue, Unit 545 Glendale, CA 91203', '1987-12-16', 'tagalog', 'Valley, Glendale, Pasadena, Burbank', '1326535105', 'MC4775548', '95006625', '2019-04-19 23:19:52', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(29, 'FIDELIA', 'NNACHETAM, NP', 'N/A', 'nnachetamfidelia@yahoo.com', 'GLOBAL PROVIDER - 9140 S. Nobel Way, Inglewood CA 90305', NULL, 'English, Spanish', 'N/A', '1992156962', '', '', '2019-04-26 17:16:19', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(30, 'IJEOMA', 'OGBONNIA, NP', '424 789 1866', 'ij_valerics@yahoo.com', '13400 Doty Avenue, Apt 13 Hawthorne, CA 90250', '1969-06-08', '', 'Los Angeles', '1427582832', 'MO4288230', '95005390', '2019-05-18 00:51:18', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(31, 'EMMA', 'TRTCHOUNIAN, NP', '818 571 2170', 'emmat37@yahoo.com', '8226 Day St. Sunland, CA 91040', '1987-02-19', 'Armenian, Russian, medical Spanish', 'Glendale, Pasadena, North Hollywood, Burbank, Van Nuys, SIlmar', '1669826301', 'MT3891086', '95003873', '2019-06-11 21:10:40', '120', '80', '20', '10', '20', '.10', 'Female', '120', '80', 0),
(32, 'AILEEN', 'QUE, NP', '818 203 9219', 'aileen.que@yahoo.com', '8049 Laurel Canyon Blvd, North Hollywood, CA 91605', '1985-07-05', 'tagalog', 'Valley, West Hollywood', '1255804035', 'MQ5164380', '95010786', '2019-06-14 22:18:17', '120', '80', '20', '10', '20', '.10', 'Female', '120', '80', 0),
(33, 'DAISY', 'BAUTISTA, MD', '213 399 4451', 'holymarymedical@gmail.com', '1930 Wilshire Blvd, Suite 803, Los Angeles, CA 90057', NULL, '', '', '1306856992', 'AB1561213 (expiration: 07/31/2021)', 'A36896 (expiration: 09/30/2020)', '2019-09-05 21:53:21', '0', '0', '0', '0', '0', '0', 'Female', '', '', 1),
(34, 'MANDA', 'ROBINSON, PA', '909 525 8156', 'mandarobi@gmail.com', '14852 Belcourt Dr. Whittier, CA 90604', '1981-07-08', '', '', '1972691384', 'MR2534128', 'PA18522', '2019-10-16 22:58:35', '120', '80', '20', '10', '20', '.10', 'Female', '120', '80', 0),
(35, 'EUN KYUNG', 'PARK, NP', '213 458 0703', 'peunkyung@yahoo.com', '3961 Via Marisol Apt 229 Los Angeles, CA 90042', '1967-01-22', '', '', '1194226936', 'MP4597273', 'NP95007780', '2019-10-16 23:05:25', '120', '80', '20', '10', '20', '.10', 'Female', '120', '80', 0),
(36, 'FRANCESCA', 'MEPHORS,NP', '424 200 3333', 'cmethirs@yahoo.com', 'N/A', NULL, 'ENGLISH', 'EAST LA', '', '', '', '2019-10-19 18:09:05', '120', '80', '20', '10', '20', '.10', 'Female', '', '', 0),
(37, 'AYESHA', 'OGLE, NP', '310 430 0190', 'ogleaye34@gmail.com', '2318 West Avenue, P12 Palmdale, CA 93551', '1967-07-30', '', 'Lancaster, Palmdale', '1578706404', 'MO4325468', 'NP98006530', '2019-11-12 22:21:02', '120', '80', '20', '10', '20', '.10', 'Female', '120', '80', 0);

-- --------------------------------------------------------

--
-- Table structure for table `provider_route_sheet`
--

CREATE TABLE `provider_route_sheet` (
  `prs_id` int(10) UNSIGNED NOT NULL,
  `prs_providerID` int(10) UNSIGNED DEFAULT NULL,
  `prs_dateOfService` date DEFAULT NULL,
  `prs_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `prs_archive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider_route_sheet`
--

-- --------------------------------------------------------

--
-- Table structure for table `provider_route_sheet_list`
--

CREATE TABLE `provider_route_sheet_list` (
  `prsl_id` int(10) UNSIGNED NOT NULL,
  `prsl_prsID` int(10) UNSIGNED DEFAULT NULL,
  `prsl_fromTime` time DEFAULT NULL,
  `prsl_toTime` time DEFAULT NULL,
  `prsl_tovID` int(10) UNSIGNED DEFAULT NULL,
  `prsl_hhcID` int(10) UNSIGNED DEFAULT NULL,
  `prsl_patientID` int(10) UNSIGNED DEFAULT NULL,
  `prsl_notes` varchar(2000) DEFAULT NULL,
  `prsl_patientTransID` int(10) UNSIGNED DEFAULT NULL,
  `prsl_dateRef` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `provider_route_sheet_list`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `roles_id` int(10) UNSIGNED NOT NULL,
  `roles_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`roles_id`, `roles_name`) VALUES
(1, 'Super Administrator'),
(2, 'Administrator'),
(3, 'Normal');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permission`
--

CREATE TABLE `roles_permission` (
  `rp_id` int(10) UNSIGNED NOT NULL,
  `rp_rolesID` int(10) UNSIGNED DEFAULT NULL,
  `rp_permissionsID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_permission`
--

INSERT INTO `roles_permission` (`rp_id`, `rp_rolesID`, `rp_permissionsID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 1, 44),
(45, 1, 45),
(46, 1, 46),
(47, 1, 47),
(48, 1, 48),
(49, 1, 49),
(50, 1, 50),
(51, 1, 51),
(52, 1, 52),
(53, 1, 53),
(54, 1, 54),
(55, 1, 55),
(56, 2, 1),
(57, 2, 2),
(58, 2, 3),
(59, 2, 4),
(60, 2, 5),
(61, 2, 6),
(62, 2, 7),
(63, 2, 8),
(64, 2, 9),
(65, 2, 10),
(66, 2, 11),
(67, 2, 12),
(68, 2, 13),
(69, 2, 14),
(70, 2, 15),
(71, 2, 16),
(72, 2, 17),
(73, 2, 18),
(74, 2, 19),
(75, 2, 20),
(76, 2, 21),
(77, 2, 22),
(78, 2, 23),
(79, 2, 24),
(80, 2, 25),
(81, 2, 26),
(82, 2, 27),
(83, 2, 28),
(84, 2, 29),
(85, 2, 30),
(86, 2, 31),
(87, 2, 32),
(88, 2, 33),
(89, 2, 34),
(90, 2, 35),
(91, 2, 36),
(92, 2, 37),
(93, 2, 38),
(94, 2, 39),
(95, 2, 40),
(96, 2, 41),
(97, 2, 42),
(98, 2, 43),
(99, 2, 44),
(100, 2, 45),
(101, 2, 46),
(102, 2, 47),
(103, 2, 48),
(104, 2, 49),
(105, 2, 50),
(106, 2, 51),
(107, 2, 52),
(108, 2, 53),
(109, 2, 54),
(110, 2, 55),
(111, 3, 16),
(112, 3, 17),
(113, 3, 18),
(114, 3, 19),
(115, 3, 20),
(116, 3, 21),
(117, 3, 22),
(118, 3, 23),
(119, 3, 24),
(120, 3, 25),
(121, 3, 26),
(122, 3, 27),
(123, 3, 28),
(124, 3, 29),
(125, 3, 30),
(126, 3, 31),
(127, 1, 55),
(128, 2, 55),
(129, 1, 56),
(130, 2, 56),
(131, 1, 57),
(132, 2, 57),
(133, 1, 58),
(134, 1, 59),
(135, 2, 58),
(136, 2, 59),
(137, 3, 58),
(138, 3, 59),
(139, 1, 60),
(140, 2, 60),
(141, 3, 60),
(142, 3, 6),
(143, 3, 7),
(144, 3, 8),
(145, 3, 9),
(146, 3, 10),
(147, 3, 32),
(148, 3, 33),
(149, 3, 34),
(150, 3, 35),
(151, 3, 36),
(152, 3, 37),
(153, 3, 38),
(154, 3, 11),
(155, 3, 12),
(156, 3, 13),
(157, 3, 14),
(158, 3, 15),
(159, 2, 61),
(160, 3, 61),
(161, 1, 62),
(162, 2, 62),
(163, 3, 62),
(166, 2, 63),
(167, 2, 64),
(168, 1, 63),
(169, 1, 64),
(170, 1, 65),
(171, 2, 65),
(172, 1, 66),
(173, 2, 66),
(174, 1, 67),
(175, 2, 67),
(176, 1, 68),
(177, 2, 68),
(178, 1, 69),
(179, 2, 69);

-- --------------------------------------------------------

--
-- Table structure for table `scheduled_holidays`
--

CREATE TABLE `scheduled_holidays` (
  `sh_id` int(10) UNSIGNED NOT NULL,
  `sh_description` varchar(255) DEFAULT NULL,
  `sh_date` varchar(45) DEFAULT NULL,
  `sh_archive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scheduled_holidays`
--

INSERT INTO `scheduled_holidays` (`sh_id`, `sh_description`, `sh_date`, `sh_archive`) VALUES
(1, 'New years eve', '2020-12-31', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `type_of_visits`
--

CREATE TABLE `type_of_visits` (
  `tov_id` int(10) UNSIGNED NOT NULL,
  `tov_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type_of_visits`
--

INSERT INTO `type_of_visits` (`tov_id`, `tov_name`) VALUES
(1, ' Initial Visit (Home)'),
(2, ' Initial Visit (Facility)'),
(3, ' Follow-up Visit (Home)'),
(4, ' Follow-up Visit (Facility)'),
(5, ' No Show'),
(6, ' Cancelled'),
(7, ' Initial Visit (TeleHealth)'),
(8, ' Follow-up Visit (TeleHealth)');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_firstname` varchar(45) DEFAULT NULL,
  `user_lastname` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `user_dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_password` varchar(255) DEFAULT NULL,
  `user_roleID` int(10) UNSIGNED DEFAULT NULL,
  `user_sessionID` varchar(255) DEFAULT NULL,
  `user_archive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_firstname`, `user_lastname`, `user_email`, `user_dateCreated`, `user_password`, `user_roleID`, `user_sessionID`, `user_archive`) VALUES
(1, 'Nikkolai', 'Fernandez', 'nikkolaifernandez14@gmail.com', '2018-11-25 00:00:00', '$2y$10$NRfEbjlqjRpXiSZaw.DzW.d5.Zw2I5q8HOODaKPvsfAM3HFmgrOrW', 1, '0ab037b35c2563a34a9ef092a931bb1e41c64ad5', NULL),
(2, 'Jayson', 'Arcayna', 'jayson.arcayna@gmail.com', '2018-11-25 00:00:00', '$2y$10$CVTPVGMFB4QcC4OXyQcYMOsDdxjRQ57E0/nGNrn3P3QVdLS3b0zZq', 1, 'i5kne7sur8pp71ohr4dcso51696nie60', NULL),
(4, 'Serville', 'Soriano', 'info@themobiledrs.com', '2018-12-30 00:43:39', '$2y$10$OcuCGufKIGgKR8/UEVqZt.xh22ad8dodPEnTTgK/Xi6CWETYQ4iaC', 2, '7f57af8eb844bb23da19dd4fd416e7d752827094', NULL),
(5, 'Meri ', 'Papikyan', 'mery.papikyan@yahoo.com', '2018-12-31 01:09:36', '$2y$10$nafE8goG5Z3xNDyOMya.pOkLvCGdKoiNEqeK6eJ9FS/gmkVxJzwye', 2, 'gumekbqgkhcf09mk3krq0kc62qkq5t38', NULL),
(6, 'Evelyn', 'Alquiroz', 'evealquiroz@gmail.com', '2018-12-31 01:11:32', '$2y$10$Zi5/N2SPJpwvDpcLjqRWXOos9KY8ISKtkijhi8VYBXG5Hi3hI1swa', 2, 'tkvpruds6ap9jeqmdsllngfof7c0j3cq', NULL),
(8, 'Michelle', 'Golub', 'michellesgolub@yahoo.com', '2019-01-27 04:05:30', '$2y$10$Tj3buo9AScy6Ha2IMr3sk.qpmBIqbsn/CXKQxHUzckDJK8iaWVoOS', 2, 't44ldiajs5hi16bfctijo2rlgi8ckikt', NULL),
(11, 'Adriana', 'Gurjinyan', 'adrianagurjinyan@gmail.com', '2019-02-12 18:48:25', '$2y$10$X2gAbB5TWV.5ZuvvVJ/m7O5DLkENNunq7yd6F8JwpeRjkUXQHfWEC', 2, '1lbba6k9fujn23068765gt3j42eap623', NULL),
(12, 'Gizelle', 'Magsino', 'gizellemagsino23@yahoo.com', '2019-04-05 22:58:55', '$2y$10$v00ARXke0u6H88ONC6xDsONm01F9b95hHg6VVid3MP0HWQ96Fm1Ge', 2, '71ceaf170pm55cng245b9l23cvcf7qsd', NULL),
(15, 'Zvart', 'Makarosyan', 'zmakarosyan@yahoo.com', '2019-05-01 17:34:50', '$2y$10$tjX9CTzrlRdBhxcdBJDak.ZAHNPkhigqUl4Sk2IBtV3LXHwW33swu', 2, 'n33pas93thsv0d4rheb4lkq5cchclgch', NULL),
(17, 'Emil', 'Golub', 'emil@themobiledrs.com', '2019-06-14 21:12:40', '$2y$10$tU4oZNEx/DGsy2xYxSXL2uan5YwMv7QfaJ4z7QvRK62hzZbu9WzVW', 2, '8seg0buiiu3jslg8dqg9mlf664nhdm1o', NULL),
(19, 'Aileen', 'Quezon', 'quezon_aileen@live.com', '2019-08-23 17:02:54', '$2y$10$3dF203kvGb92FNJ/ahmZwur14TSDMh4Wc..qf3CHfaY4xC1XA7r6m', 2, 'f2othlntqsk6u99vsheqaig1a7i51ioq', NULL),
(22, 'Ello', 'Cachero', 'cachero.ello@gmail.com', '2019-09-16 18:00:37', '$2y$10$jLsqPZilB.j9WfEUa.cNWeZSfu0XZFMj8OE2LQdE/DSbpU83b/8pq', 2, 'crpbr34l3hpt5javjg1koan231k4jf6r', NULL),
(23, 'Jayson', 'Arcayna', 'jayson@arcayna.com', '2019-10-08 16:43:46', '$2y$10$a/eXEctdqi38j0jxPIYTcODr2Horfa5Z45MhOAA4/cd3JmcqLEmHK', 2, 'jkgblidkajdk14bab6mub6k21c7fbr6n', NULL),
(24, 'Patricia', 'De Mesa', 'ohitsmaria04@gmail.com', '2019-10-14 16:50:10', '$2y$10$jbeLQLvWijDhfUIexoKlw.zkBceFoh2y9uv6YqjCePIRU49Te0QM2', 2, '5lfigaf9bksp591m4ki67tevn3i0uknj', NULL),
(25, 'Kamille', 'Soriano', 'cheskakamille@gmail.com', '2019-11-04 20:21:13', '$2y$10$MnBkDBD4KSBu6k4PVoS6kun77w4wl3f0AeSUuICtNyWLAG50CUitq', 2, 'ulljunvkdkt3nes1k84eb06534ei24lr', NULL),
(26, 'Aileen', 'Arias', 'aileenrarias@yahoo.com', '2019-12-13 18:14:32', '$2y$10$4.Au4PGZvjqYEbpTiRXlROtOkX.WRpsxj3YZuBCncn2GWBakMrgIu', 2, 'ccci9mo61pq27j6k4hu3685okl21evcc', NULL),
(27, 'Christopher', 'Ballestero', 'cballestero@ymail.com', '2019-12-18 18:17:59', '$2y$10$KtImBQjSiVv93wgiN5pJeODGaBULXId0huq.57dgV9qm/BjpORw7i', 2, 'ckfhgmm5355naj41dra5um08bntc9v12', NULL),
(28, 'Lilit', 'Arakelyan', 'arakelyan.lilit@yahoo.com', '2020-01-09 17:47:29', '$2y$10$84BNAZBX71Shec30lWn14e1QMKvpPdeSXCm7tob8rKEN6aBCSpRFG', 2, 'nftoa8q9ujjg4eguv41lqr2e6nlt0bhn', NULL),
(29, 'Janelle', 'Alejandro', 'alejandro.janelle08@yahoo.com', '2020-01-13 19:21:04', '$2y$10$jVJO.zF6vo5MxgHu2aNTF.otVREpVWhF6pjanm/i8OWqMyAp7AylG', 2, '659s66h4sfo4jrh0h4jqtt5ad7drn27g', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `user_log_id` int(10) UNSIGNED NOT NULL,
  `user_log_userID` int(10) UNSIGNED DEFAULT NULL,
  `user_log_time` time DEFAULT NULL,
  `user_log_date` date DEFAULT NULL,
  `user_log_description` varchar(255) DEFAULT NULL,
  `user_log_link` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_logs`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `home_health_care`
--
ALTER TABLE `home_health_care`
  ADD PRIMARY KEY (`hhc_id`);
ALTER TABLE `home_health_care` ADD FULLTEXT KEY `hhc_contact_name` (`hhc_contact_name`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD KEY `patient_hhcID_idx` (`patient_hhcID`),
  ADD KEY `patient_placeOfService_idx` (`patient_placeOfService`);

--
-- Indexes for table `patient_communication_notes`
--
ALTER TABLE `patient_communication_notes`
  ADD PRIMARY KEY (`ptcn_id`),
  ADD KEY `ptcn_patientID_idx` (`ptcn_patientID`);

--
-- Indexes for table `patient_CPO`
--
ALTER TABLE `patient_CPO`
  ADD PRIMARY KEY (`ptcpo_id`),
  ADD KEY `ptcpo_patientID_idx` (`ptcpo_patientID`);

--
-- Indexes for table `patient_transactions`
--
ALTER TABLE `patient_transactions`
  ADD PRIMARY KEY (`pt_id`),
  ADD KEY `pt_patientID_idx` (`pt_patientID`),
  ADD KEY `pt_providerID_idx` (`pt_providerID`),
  ADD KEY `pt_tovID_idx` (`pt_tovID`),
  ADD KEY `pt_supervising_mdID` (`pt_supervising_mdID`);

--
-- Indexes for table `payroll_summary`
--
ALTER TABLE `payroll_summary`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permissions_id`);

--
-- Indexes for table `place_of_service`
--
ALTER TABLE `place_of_service`
  ADD PRIMARY KEY (`pos_id`);

--
-- Indexes for table `provider`
--
ALTER TABLE `provider`
  ADD PRIMARY KEY (`provider_id`);

--
-- Indexes for table `provider_route_sheet`
--
ALTER TABLE `provider_route_sheet`
  ADD PRIMARY KEY (`prs_id`),
  ADD KEY `prs_providerID_idx` (`prs_providerID`);

--
-- Indexes for table `provider_route_sheet_list`
--
ALTER TABLE `provider_route_sheet_list`
  ADD PRIMARY KEY (`prsl_id`),
  ADD KEY `prsl_prsID_idx` (`prsl_prsID`),
  ADD KEY `prsl_tovID_idx` (`prsl_tovID`),
  ADD KEY `prsl_hhcID_idx` (`prsl_hhcID`),
  ADD KEY `prsl_patientID_idx` (`prsl_patientID`),
  ADD KEY `prsl_patientTransID` (`prsl_patientTransID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indexes for table `roles_permission`
--
ALTER TABLE `roles_permission`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `rp_rolesID_idx` (`rp_rolesID`),
  ADD KEY `rp_permissionsID_idx` (`rp_permissionsID`);

--
-- Indexes for table `scheduled_holidays`
--
ALTER TABLE `scheduled_holidays`
  ADD PRIMARY KEY (`sh_id`);

--
-- Indexes for table `type_of_visits`
--
ALTER TABLE `type_of_visits`
  ADD PRIMARY KEY (`tov_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `user_roleID_idx` (`user_roleID`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`user_log_id`),
  ADD KEY `user_log_userID_idx` (`user_log_userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `home_health_care`
--
ALTER TABLE `home_health_care`
  MODIFY `hhc_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=312;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5436;

--
-- AUTO_INCREMENT for table `patient_communication_notes`
--
ALTER TABLE `patient_communication_notes`
  MODIFY `ptcn_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4091;

--
-- AUTO_INCREMENT for table `patient_CPO`
--
ALTER TABLE `patient_CPO`
  MODIFY `ptcpo_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6370;

--
-- AUTO_INCREMENT for table `patient_transactions`
--
ALTER TABLE `patient_transactions`
  MODIFY `pt_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8981;

--
-- AUTO_INCREMENT for table `payroll_summary`
--
ALTER TABLE `payroll_summary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permissions_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `place_of_service`
--
ALTER TABLE `place_of_service`
  MODIFY `pos_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `provider`
--
ALTER TABLE `provider`
  MODIFY `provider_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `provider_route_sheet`
--
ALTER TABLE `provider_route_sheet`
  MODIFY `prs_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1232;

--
-- AUTO_INCREMENT for table `provider_route_sheet_list`
--
ALTER TABLE `provider_route_sheet_list`
  MODIFY `prsl_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13947;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `roles_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `roles_permission`
--
ALTER TABLE `roles_permission`
  MODIFY `rp_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- AUTO_INCREMENT for table `scheduled_holidays`
--
ALTER TABLE `scheduled_holidays`
  MODIFY `sh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `type_of_visits`
--
ALTER TABLE `type_of_visits`
  MODIFY `tov_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `user_log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `patient_hhcID` FOREIGN KEY (`patient_hhcID`) REFERENCES `home_health_care` (`hhc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `patient_placeOfService` FOREIGN KEY (`patient_placeOfService`) REFERENCES `place_of_service` (`pos_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_communication_notes`
--
ALTER TABLE `patient_communication_notes`
  ADD CONSTRAINT `ptcn_patientID` FOREIGN KEY (`ptcn_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_CPO`
--
ALTER TABLE `patient_CPO`
  ADD CONSTRAINT `ptcpo_patientID` FOREIGN KEY (`ptcpo_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `patient_transactions`
--
ALTER TABLE `patient_transactions`
  ADD CONSTRAINT `pt_patientID` FOREIGN KEY (`pt_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pt_providerID` FOREIGN KEY (`pt_providerID`) REFERENCES `provider` (`provider_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `pt_supervising_mdID` FOREIGN KEY (`pt_supervising_mdID`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pt_tovID` FOREIGN KEY (`pt_tovID`) REFERENCES `type_of_visits` (`tov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `provider_route_sheet`
--
ALTER TABLE `provider_route_sheet`
  ADD CONSTRAINT `prs_providerID` FOREIGN KEY (`prs_providerID`) REFERENCES `provider` (`provider_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `provider_route_sheet_list`
--
ALTER TABLE `provider_route_sheet_list`
  ADD CONSTRAINT `prsl_hhcID` FOREIGN KEY (`prsl_hhcID`) REFERENCES `home_health_care` (`hhc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prsl_patientID` FOREIGN KEY (`prsl_patientID`) REFERENCES `patient` (`patient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prsl_prsID` FOREIGN KEY (`prsl_prsID`) REFERENCES `provider_route_sheet` (`prs_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prsl_tovID` FOREIGN KEY (`prsl_tovID`) REFERENCES `type_of_visits` (`tov_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `roles_permission`
--
ALTER TABLE `roles_permission`
  ADD CONSTRAINT `rp_permissionsID` FOREIGN KEY (`rp_permissionsID`) REFERENCES `permissions` (`permissions_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `rp_rolesID` FOREIGN KEY (`rp_rolesID`) REFERENCES `roles` (`roles_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_roleID` FOREIGN KEY (`user_roleID`) REFERENCES `roles` (`roles_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD CONSTRAINT `user_log_userID` FOREIGN KEY (`user_log_userID`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
