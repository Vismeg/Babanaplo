-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Jan 04. 18:20
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

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `alkalmak`
--

CREATE TABLE `alkalmak` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Megnevezes` varchar(64) COLLATE utf8_hungarian_ci NOT NULL,
  `Kep` longblob DEFAULT NULL,
  `Tortenet` varchar(4096) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Datum` date NOT NULL,
  `FelviteliDatum` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szuletes`
--

CREATE TABLE `szuletes` (
  `Id` int(11) NOT NULL,
  `Nev` varchar(256) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Datum` date DEFAULT NULL,
  `Ora` int(2) NOT NULL,
  `Perc` int(2) NOT NULL,
  `Hely` varchar(256) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Suly` int(3) NOT NULL,
  `Hossz` int(2) NOT NULL,
  `Hajszin` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Szemszin` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Vercsoport` varchar(2) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Csillagjegy` varchar(64) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Szuletestort` varchar(2048) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `Babafoto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alkalmak`
--
ALTER TABLE `alkalmak`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`),
  ADD UNIQUE KEY `Megnevezes` (`Megnevezes`);

--
-- A tábla indexei `szuletes`
--
ALTER TABLE `szuletes`
  ADD UNIQUE KEY `Id` (`Id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alkalmak`
--
ALTER TABLE `alkalmak`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szuletes`
--
ALTER TABLE `szuletes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
