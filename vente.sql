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
-- Database: `vente`
--

-- --------------------------------------------------------

--
-- Table structure for table `adresse_livraison`
--

CREATE TABLE `adresse_livraison` (
  `code_adresse` int(11) NOT NULL,
  `intitule_adresse` varchar(40) DEFAULT NULL,
  `code_postal` varchar(20) DEFAULT NULL,
  `Id_client` int(11) DEFAULT NULL,
  `code_ville` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catigorie`
--

CREATE TABLE `catigorie` (
  `code_catigorie` int(11) NOT NULL,
  `Nom_catigorie` varchar(30) NOT NULL,
  `Taux_TVA` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `Id_client` int(11) NOT NULL,
  `Nom` varchar(30) NOT NULL,
  `Adresse` varchar(40) DEFAULT NULL,
  `Tel_cl` varchar(10) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `code_ville` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `detail_facture`
--

CREATE TABLE `detail_facture` (
  `ref_Facture` int(11) DEFAULT NULL,
  `reference` int(11) DEFAULT NULL,
  `quantite_facturee` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

CREATE TABLE `facture` (
  `ref_facture` int(11) NOT NULL,
  `date_facture` date DEFAULT NULL,
  `Id_client` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `reference` int(11) NOT NULL,
  `Designation` varchar(30) DEFAULT NULL,
  `Prix_unitaire` float DEFAULT NULL,
  `code_catigorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ville`
--

CREATE TABLE `ville` (
  `code_ville` int(11) NOT NULL,
  `Nom_ville` varchar(30) DEFAULT NULL,
  `Code_postal` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adresse_livraison`
--
ALTER TABLE `adresse_livraison`
  ADD PRIMARY KEY (`code_adresse`),
  ADD KEY `Id_client` (`Id_client`),
  ADD KEY `code_ville` (`code_ville`);

--
-- Indexes for table `catigorie`
--
ALTER TABLE `catigorie`
  ADD PRIMARY KEY (`code_catigorie`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`Id_client`),
  ADD KEY `code_ville` (`code_ville`);

--
-- Indexes for table `detail_facture`
--
ALTER TABLE `detail_facture`
  ADD KEY `ref_Facture` (`ref_Facture`),
  ADD KEY `reference` (`reference`);

--
-- Indexes for table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`ref_facture`),
  ADD KEY `Id_client` (`Id_client`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`reference`),
  ADD KEY `code_catigorie` (`code_catigorie`);

--
-- Indexes for table `ville`
--
ALTER TABLE `ville`
  ADD PRIMARY KEY (`code_ville`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adresse_livraison`
--
ALTER TABLE `adresse_livraison`
  ADD CONSTRAINT `adresse_livraison_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`),
  ADD CONSTRAINT `adresse_livraison_ibfk_2` FOREIGN KEY (`code_ville`) REFERENCES `ville` (`code_ville`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`code_ville`) REFERENCES `ville` (`code_ville`);

--
-- Constraints for table `detail_facture`
--
ALTER TABLE `detail_facture`
  ADD CONSTRAINT `detail_facture_ibfk_1` FOREIGN KEY (`ref_Facture`) REFERENCES `facture` (`ref_facture`),
  ADD CONSTRAINT `detail_facture_ibfk_2` FOREIGN KEY (`reference`) REFERENCES `produit` (`reference`);

--
-- Constraints for table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `facture_ibfk_1` FOREIGN KEY (`Id_client`) REFERENCES `client` (`Id_client`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`code_catigorie`) REFERENCES `catigorie` (`code_catigorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
