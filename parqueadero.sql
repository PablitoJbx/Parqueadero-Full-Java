-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-11-2024 a las 02:24:29
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `parqueadero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vehiculo`
--

CREATE TABLE `vehiculo` (
  `id` int(11) NOT NULL,
  `placa` varchar(50) NOT NULL,
  `propietario` varchar(50) NOT NULL,
  `tipoVehiculo` varchar(50) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT current_timestamp(),
  `fechasalida` timestamp NULL DEFAULT current_timestamp(),
  `pago` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `vehiculo`
--

INSERT INTO `vehiculo` (`id`, `placa`, `propietario`, `tipoVehiculo`, `fecharegistro`, `fechasalida`, `pago`) VALUES
(1, 'GRP007', 'Jared Bautista', 'Automovil', '2024-11-25 14:49:11', '2024-11-25 14:49:36', 0),
(2, 'RDP780', 'CLAUDIA SIERRA', 'Automovil', '2024-11-25 15:16:24', '2024-11-25 15:17:02', 0),
(3, 'BSD37E', 'Cristian Davila', 'Motocicleta', '2024-11-25 15:20:18', '2024-11-26 00:57:36', 9000),
(4, 'URB320', 'MEL GINDO', 'Automovil', '2024-11-25 20:29:04', '2024-11-26 00:48:42', 0),
(6, 'AAA324', 'ANGEL', 'Automovil', '2024-11-26 01:17:42', '2024-11-26 01:18:43', 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `vehiculo`
--
ALTER TABLE `vehiculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
