-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2023 at 10:21 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `agence`
--

CREATE TABLE `agence` (
  `Code_Ag` int(11) NOT NULL,
  `Nom_Ag` varchar(30) NOT NULL,
  `Adresse_Ag` varchar(50) DEFAULT NULL,
  `Tel_Ag` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie_ch`
--

CREATE TABLE `categorie_ch` (
  `code_cat` int(11) NOT NULL,
  `Description_cat` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chambre`
--

CREATE TABLE `chambre` (
  `numero_ch` int(11) NOT NULL,
  `tel_ch` varchar(10) DEFAULT NULL,
  `code_Hotel` int(11) DEFAULT NULL,
  `code_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classe_hot`
--

CREATE TABLE `classe_hot` (
  `Code_classe` int(11) NOT NULL,
  `Nbr_etoile` int(11) NOT NULL,
  `caracteristiques` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Code_Client` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `code_postale` varchar(10) DEFAULT NULL,
  `Tel_Client` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `code_ville` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consommations`
--

CREATE TABLE `consommations` (
  `N_Consommation` int(11) NOT NULL,
  `Date_consommation` date DEFAULT NULL,
  `Heure_Consommation` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `code_Hotel` int(11) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `adresse` varchar(50) DEFAULT NULL,
  `CPH` varchar(15) DEFAULT NULL,
  `Telehone_Hot` varchar(10) DEFAULT NULL,
  `code_classe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pays`
--

CREATE TABLE `pays` (
  `code_Pays` int(11) NOT NULL,
  `Nom_Pays` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prestations`
--

CREATE TABLE `prestations` (
  `CodePrest` int(11) NOT NULL,
  `Designation_Pres` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `réservation`
--

CREATE TABLE `réservation` (
  `N_Reservation` int(11) NOT NULL,
  `DateDébut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `DatePayeArrhes` date DEFAULT NULL,
  `MontantArrhes` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tarif_chambre`
--

CREATE TABLE `tarif_chambre` (
  `Code_classe` int(11) DEFAULT NULL,
  `code_cat` int(11) DEFAULT NULL,
  `Prix` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type_reservation`
--

CREATE TABLE `type_reservation` (
  `Code_TyeRes` int(11) NOT NULL,
  `description_TypeRes` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

CREATE TABLE `ville` (
  `code_ville` int(11) NOT NULL,
  `nom_ville` varchar(20) NOT NULL,
  `code_Postal` varchar(20) DEFAULT NULL,
  `code_Pays` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agence`
--
ALTER TABLE `agence`
  ADD PRIMARY KEY (`Code_Ag`);

--
-- Indexes for table `categorie_ch`
--
ALTER TABLE `categorie_ch`
  ADD PRIMARY KEY (`code_cat`);

--
-- Indexes for table `chambre`
--
ALTER TABLE `chambre`
  ADD PRIMARY KEY (`numero_ch`),
  ADD KEY `code_Hotel` (`code_Hotel`),
  ADD KEY `code_categorie` (`code_categorie`);

--
-- Indexes for table `classe_hot`
--
ALTER TABLE `classe_hot`
  ADD PRIMARY KEY (`Code_classe`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Code_Client`),
  ADD KEY `code_ville` (`code_ville`);

--
-- Indexes for table `consommations`
--
ALTER TABLE `consommations`
  ADD PRIMARY KEY (`N_Consommation`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`code_Hotel`),
  ADD KEY `code_classe` (`code_classe`);

--
-- Indexes for table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`code_Pays`);

--
-- Indexes for table `prestations`
--
ALTER TABLE `prestations`
  ADD PRIMARY KEY (`CodePrest`);

--
-- Indexes for table `réservation`
--
ALTER TABLE `réservation`
  ADD PRIMARY KEY (`N_Reservation`);

--
-- Indexes for table `tarif_chambre`
--
ALTER TABLE `tarif_chambre`
  ADD KEY `Code_classe` (`Code_classe`),
  ADD KEY `code_cat` (`code_cat`);

--
-- Indexes for table `type_reservation`
--
ALTER TABLE `type_reservation`
  ADD PRIMARY KEY (`Code_TyeRes`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`code_ville`),
  ADD KEY `code_Pays` (`code_Pays`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chambre`
--
ALTER TABLE `chambre`
  ADD CONSTRAINT `chambre_ibfk_1` FOREIGN KEY (`code_Hotel`) REFERENCES `hotels` (`code_Hotel`),
  ADD CONSTRAINT `chambre_ibfk_2` FOREIGN KEY (`code_categorie`) REFERENCES `categorie_ch` (`code_cat`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`code_ville`) REFERENCES `ville` (`code_ville`);

--
-- Constraints for table `hotels`
--
ALTER TABLE `hotels`
  ADD CONSTRAINT `hotels_ibfk_1` FOREIGN KEY (`code_classe`) REFERENCES `classe_hot` (`Code_classe`);

--
-- Constraints for table `tarif_chambre`
--
ALTER TABLE `tarif_chambre`
  ADD CONSTRAINT `tarif_chambre_ibfk_1` FOREIGN KEY (`Code_classe`) REFERENCES `classe_hot` (`Code_classe`),
  ADD CONSTRAINT `tarif_chambre_ibfk_2` FOREIGN KEY (`code_cat`) REFERENCES `categorie_ch` (`code_cat`);

--
-- Constraints for table `ville`
--
ALTER TABLE `ville`
  ADD CONSTRAINT `ville_ibfk_1` FOREIGN KEY (`code_Pays`) REFERENCES `pays` (`code_Pays`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
