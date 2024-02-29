-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Feb 29. 16:35
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `babanaplo`
--
CREATE DATABASE IF NOT EXISTS `babanaplo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `babanaplo`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `esemenyek`
--

CREATE TABLE `esemenyek` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Megnevezes` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `Elsoalkalom` tinyint(1) NOT NULL,
  `Kep` longblob DEFAULT NULL,
  `Tortenet` longtext COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `novekedes`
--

CREATE TABLE `novekedes` (
  `Id` int(32) NOT NULL,
  `BabaId` int(16) NOT NULL,
  `Suly` float DEFAULT NULL,
  `Magassag` float DEFAULT NULL,
  `Kep` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szuletes`
--

CREATE TABLE `szuletes` (
  `BabaId` int(64) NOT NULL,
  `FelhasznaloId` int(64) NOT NULL,
  `Nev` varchar(32) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Idopont` datetime NOT NULL,
  `Hely` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Suly` int(4) NOT NULL,
  `Hossz` double NOT NULL,
  `Hajszin` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Szemszin` varchar(64) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Vercsoport` varchar(10) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Csillagjegy` varchar(32) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Szuletestort` longtext COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `Babafoto` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `esemenyek`
--
ALTER TABLE `esemenyek`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`),
  ADD KEY `MegnevezesId` (`Megnevezes`);

--
-- A tábla indexei `novekedes`
--
ALTER TABLE `novekedes`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `szuletes`
--
ALTER TABLE `szuletes`
  ADD PRIMARY KEY (`BabaId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `esemenyek`
--
ALTER TABLE `esemenyek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `novekedes`
--
ALTER TABLE `novekedes`
  MODIFY `Id` int(32) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szuletes`
--
ALTER TABLE `szuletes`
  MODIFY `BabaId` int(64) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `esemenyek`
--
ALTER TABLE `esemenyek`
  ADD CONSTRAINT `esemenyek_ibfk_2` FOREIGN KEY (`BabaId`) REFERENCES `szuletes` (`BabaId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `novekedes`
--
ALTER TABLE `novekedes`
  ADD CONSTRAINT `novekedes_ibfk_1` FOREIGN KEY (`BabaId`) REFERENCES `szuletes` (`BabaId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
