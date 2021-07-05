-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2021 a las 09:32:41
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cul d'ampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id_client` int(8) NOT NULL,
  `nom_client` varchar(80) NOT NULL,
  `cp` int(8) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `correu_electronic` varchar(100) NOT NULL,
  `data_registre` date NOT NULL DEFAULT current_timestamp(),
  `Recomenat` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id_client`, `nom_client`, `cp`, `telefon`, `correu_electronic`, `data_registre`, `Recomenat`) VALUES
(1, 'Maria', 8742, '999999999', 'maria@gmail.com', '2021-06-30', 'jordi');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` int(8) NOT NULL,
  `nom_empleat` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleat`
--

INSERT INTO `empleat` (`id_empleat`, `nom_empleat`) VALUES
(0, 'Jordi'),
(1, 'Mariona');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(8) NOT NULL,
  `nom_proveidor` varchar(80) NOT NULL,
  `carrer` varchar(80) NOT NULL,
  `numero` int(8) NOT NULL,
  `porta` varchar(10) NOT NULL,
  `ciutat` varchar(80) NOT NULL,
  `codi_postal` int(5) NOT NULL,
  `pais` varchar(80) NOT NULL,
  `telefon` int(20) NOT NULL,
  `fax` int(20) NOT NULL,
  `nif` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `nom_proveidor`, `carrer`, `numero`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`, `nif`) VALUES
(1, 'Glass', 'inventat', 11, '1', 'Barcelona', 8080, 'espanya', 999999999, 546564654, '1234564789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(8) NOT NULL,
  `proveidor_id` int(8) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `graduacio` decimal(10,2) NOT NULL,
  `tipus_muntura` enum('metàl·lica','pasta','flotant','') NOT NULL,
  `color_montura` varchar(80) NOT NULL,
  `color_vindre_1` varchar(80) NOT NULL,
  `color_vindre_2` varchar(80) NOT NULL,
  `preu` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `proveidor_id`, `marca`, `graduacio`, `tipus_muntura`, `color_montura`, `color_vindre_1`, `color_vindre_2`, `preu`) VALUES
(1, 1, 'Sher', '0.50', 'flotant', 'blau', 'blau clar', 'blau fosc', '122.54'),
(3, 1, 'lock', '1.12', 'metàl·lica', 'vermell', 'verd', 'blau', '152.89');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventes`
--

CREATE TABLE `ventes` (
  `id_venta` int(8) NOT NULL,
  `empleat_id` int(8) NOT NULL,
  `ullera_id` int(8) NOT NULL,
  `client_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventes`
--

INSERT INTO `ventes` (`id_venta`, `empleat_id`, `ullera_id`, `client_id`) VALUES
(1, 1, 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `nif` (`nif`),
  ADD UNIQUE KEY `nom_proveidor` (`nom_proveidor`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`),
  ADD KEY `proveidor_id_2` (`proveidor_id`);

--
-- Indices de la tabla `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `empleat_id` (`empleat_id`),
  ADD KEY `ullera_id` (`ullera_id`),
  ADD KEY `client_id` (`client_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ulleres` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`);

--
-- Filtros para la tabla `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_ibfk_1` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id_empleat`),
  ADD CONSTRAINT `ventes_ibfk_2` FOREIGN KEY (`ullera_id`) REFERENCES `ulleres` (`id_ulleres`),
  ADD CONSTRAINT `ventes_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
