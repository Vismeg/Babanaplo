-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Dec 30. 14:58
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

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
-- Tábla szerkezet ehhez a táblához `alvas`
--

CREATE TABLE `alvas` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Datum` date NOT NULL,
  `Leiras` varchar(2048) NOT NULL,
  `AlvasKep` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `egeszseg`
--

CREATE TABLE `egeszseg` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Orvosnev` varchar(256) NOT NULL,
  `EgeszsegDatum` date DEFAULT NULL,
  `EgeszsegTort` varchar(2048) NOT NULL,
  `elsofog` date DEFAULT NULL,
  `elsoKiesettFog` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `egeszseg`
--

INSERT INTO `egeszseg` (`Id`, `BabaId`, `Orvosnev`, `EgeszsegDatum`, `EgeszsegTort`, `elsofog`, `elsoKiesettFog`) VALUES
(1, 0, '', NULL, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elsolepes`
--

CREATE TABLE `elsolepes` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `ElsolepesDatum` date DEFAULT NULL,
  `ElsolepesTort` varchar(2048) NOT NULL,
  `ElsolepesKep` longblob NOT NULL,
  `elsoKuszas` date DEFAULT NULL,
  `elsoFelules` date DEFAULT NULL,
  `elsoMaszas` date DEFAULT NULL,
  `elsoAllas` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elsorajz`
--

CREATE TABLE `elsorajz` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `ElsorajzKep` longblob NOT NULL,
  `ElsorajzDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `elsoszavak`
--

CREATE TABLE `elsoszavak` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `ElsoszavakTort` varchar(2048) NOT NULL,
  `Elsoszavak` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `etkezesek`
--

CREATE TABLE `etkezesek` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `KedvencEteleim` varchar(2048) NOT NULL,
  `EtkezesKep` longblob NOT NULL,
  `HozzataplalasKezdete` date DEFAULT NULL,
  `utalomEtel` varchar(2048) DEFAULT NULL,
  `anyatejVege` date DEFAULT NULL,
  `tapszerVege` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `magassagmeres`
--

CREATE TABLE `magassagmeres` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Magassag` int(3) NOT NULL,
  `MagassagDatum` date DEFAULT NULL,
  `MagassagKep` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `merfoldkovek`
--

CREATE TABLE `merfoldkovek` (
  `Id` int(11) NOT NULL,
  `Esemenykep` longblob NOT NULL,
  `EsemenyNev` varchar(256) DEFAULT NULL,
  `EsemenyDatum` date DEFAULT NULL,
  `EsemenyTort` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sulymeres`
--

CREATE TABLE `sulymeres` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Suly` int(3) NOT NULL,
  `SulyDatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szuletes`
--

CREATE TABLE `szuletes` (
  `Id` int(11) NOT NULL,
  `Nev` varchar(256) NOT NULL,
  `Datum` datetime DEFAULT NULL,
  `Hely` varchar(256) NOT NULL,
  `Suly` int(3) NOT NULL,
  `Hossz` int(2) NOT NULL,
  `Hajszin` varchar(64) NOT NULL,
  `Szemszin` varchar(64) NOT NULL,
  `Vercsoport` varchar(2) NOT NULL,
  `Csillagjegy` varchar(64) NOT NULL,
  `Szuletestort` varchar(2048) NOT NULL,
  `Babafoto` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szuletesnapok`
--

CREATE TABLE `szuletesnapok` (
  `Id` int(11) NOT NULL,
  `BabaId` int(11) NOT NULL,
  `SzuletesnapDatum` date DEFAULT NULL,
  `SzuletesnapTort` varchar(2048) NOT NULL,
  `SzuletesnapiKep` longblob NOT NULL,
  `SzuletesnapAjandekKep` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `unnepek`
--

CREATE TABLE `unnepek` (
  `Id` int(11) NOT NULL,
  `Unnepikep` longblob NOT NULL,
  `BabaId` int(11) NOT NULL,
  `Ajandekok` varchar(2048) NOT NULL,
  `Unneptort` varchar(2048) NOT NULL,
  `UnnepDatum` date DEFAULT NULL,
  `UnnepNeve` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `alvas`
--
ALTER TABLE `alvas`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `egeszseg`
--
ALTER TABLE `egeszseg`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `elsolepes`
--
ALTER TABLE `elsolepes`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `elsorajz`
--
ALTER TABLE `elsorajz`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `elsoszavak`
--
ALTER TABLE `elsoszavak`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `etkezesek`
--
ALTER TABLE `etkezesek`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `magassagmeres`
--
ALTER TABLE `magassagmeres`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `merfoldkovek`
--
ALTER TABLE `merfoldkovek`
  ADD UNIQUE KEY `Id` (`Id`);

--
-- A tábla indexei `sulymeres`
--
ALTER TABLE `sulymeres`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `szuletes`
--
ALTER TABLE `szuletes`
  ADD UNIQUE KEY `Id` (`Id`);

--
-- A tábla indexei `szuletesnapok`
--
ALTER TABLE `szuletesnapok`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A tábla indexei `unnepek`
--
ALTER TABLE `unnepek`
  ADD UNIQUE KEY `Id` (`Id`),
  ADD UNIQUE KEY `BabaId` (`BabaId`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `alvas`
--
ALTER TABLE `alvas`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `egeszseg`
--
ALTER TABLE `egeszseg`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `elsolepes`
--
ALTER TABLE `elsolepes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `elsorajz`
--
ALTER TABLE `elsorajz`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `elsoszavak`
--
ALTER TABLE `elsoszavak`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `etkezesek`
--
ALTER TABLE `etkezesek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `magassagmeres`
--
ALTER TABLE `magassagmeres`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `merfoldkovek`
--
ALTER TABLE `merfoldkovek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `sulymeres`
--
ALTER TABLE `sulymeres`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szuletes`
--
ALTER TABLE `szuletes`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `szuletesnapok`
--
ALTER TABLE `szuletesnapok`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `unnepek`
--
ALTER TABLE `unnepek`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
