-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 21. Apr 2020 um 14:20
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `hotel`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booking_plan`
--

CREATE TABLE `booking_plan` (
  `reservation_id` int(11) NOT NULL,
  `room_number` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `arrival` date DEFAULT NULL,
  `departure` date DEFAULT NULL,
  `nr_guests` int(11) DEFAULT NULL,
  `package_quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cleaning_plan`
--

CREATE TABLE `cleaning_plan` (
  `cleaning_plan_id` int(11) NOT NULL,
  `svnr` int(11) DEFAULT NULL,
  `room_number` int(11) DEFAULT NULL,
  `date_cleaned` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `svnr` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `package_allo_id` int(11) DEFAULT NULL,
  `cleaning_plan_id` int(11) DEFAULT NULL,
  `first_name` varchar(32) DEFAULT NULL,
  `last_name` varchar(32) DEFAULT NULL,
  `street` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `zip_code` varchar(5) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `role` varchar(32) DEFAULT NULL,
  `is_carer` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `hotel_room`
--

CREATE TABLE `hotel_room` (
  `room_number` int(11) NOT NULL,
  `cleaning_plan_id` int(11) DEFAULT NULL,
  `reservation_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `num_of_persons` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `package_plan_id` int(11) DEFAULT NULL,
  `package_allo_id` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `price` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_allocation`
--

CREATE TABLE `package_allocation` (
  `package_allo_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `svnr` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `package_plan`
--

CREATE TABLE `package_plan` (
  `package_plan_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `contained_package` int(11) DEFAULT NULL,
  `is_luxury` tinyint(1) DEFAULT NULL,
  `is_basic` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `schedule`
--

CREATE TABLE `schedule` (
  `schedule_id` int(11) NOT NULL,
  `svnr` int(11) DEFAULT NULL,
  `subject_area_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `designation` varchar(32) DEFAULT NULL,
  `location` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `booking_plan`
--
ALTER TABLE `booking_plan`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indizes für die Tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indizes für die Tabelle `cleaning_plan`
--
ALTER TABLE `cleaning_plan`
  ADD PRIMARY KEY (`cleaning_plan_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`svnr`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `package_allo_id` (`package_allo_id`),
  ADD KEY `cleaning_plan_id` (`cleaning_plan_id`);

--
-- Indizes für die Tabelle `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD PRIMARY KEY (`room_number`),
  ADD KEY `cleaning_plan_id` (`cleaning_plan_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indizes für die Tabelle `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `package_plan_id` (`package_plan_id`),
  ADD KEY `package_allo_id` (`package_allo_id`);

--
-- Indizes für die Tabelle `package_allocation`
--
ALTER TABLE `package_allocation`
  ADD PRIMARY KEY (`package_allo_id`);

--
-- Indizes für die Tabelle `package_plan`
--
ALTER TABLE `package_plan`
  ADD PRIMARY KEY (`package_plan_id`);

--
-- Indizes für die Tabelle `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`schedule_id`);

--
-- Indizes für die Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `booking_plan` (`reservation_id`);

--
-- Constraints der Tabelle `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`package_allo_id`) REFERENCES `package_allocation` (`package_allo_id`),
  ADD CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`cleaning_plan_id`) REFERENCES `cleaning_plan` (`cleaning_plan_id`);

--
-- Constraints der Tabelle `hotel_room`
--
ALTER TABLE `hotel_room`
  ADD CONSTRAINT `hotel_room_ibfk_1` FOREIGN KEY (`cleaning_plan_id`) REFERENCES `cleaning_plan` (`cleaning_plan_id`),
  ADD CONSTRAINT `hotel_room_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `hotel_room_ibfk_3` FOREIGN KEY (`reservation_id`) REFERENCES `booking_plan` (`reservation_id`);

--
-- Constraints der Tabelle `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`package_plan_id`) REFERENCES `package_plan` (`package_plan_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`package_allo_id`) REFERENCES `package_allocation` (`package_allo_id`);

--
-- Constraints der Tabelle `subject_area`
--
ALTER TABLE `subject_area`
  ADD CONSTRAINT `subject_area_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedule` (`schedule_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
