-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2020 a las 22:05:50
-- Versión del servidor: 10.4.13-MariaDB
-- Versión de PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `poblacion` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `fecha_alta` datetime NOT NULL,
  `id_cliente_recomendado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id_cliente`, `nombre`, `direccion`, `poblacion`, `codigo_postal`, `pais`, `telefono`, `mail`, `fecha_alta`, `id_cliente_recomendado`) VALUES
(1, 'Pepe', 'C/Gran vía, 60, 4º A', 'Barcelona', '08080', 'ES', '608554223', 'pepe@gmail.com', '2020-07-04 00:00:00', NULL),
(2, 'Juan', 'C/Mayor, 10, 3º 1ª', 'Barcelona', '08080', 'ES', '624225336', 'juan@gmail.com', '2020-07-04 00:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id_emplado` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id_emplado`, `nombre`, `contraseña`) VALUES
(1, 'manuel', '123456'),
(2, 'lucia', 'luci55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gafas`
--

CREATE TABLE `gafas` (
  `id_gafa` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `graduacion_izquierdo` varchar(45) DEFAULT NULL,
  `graduacion_derecho` varchar(45) DEFAULT NULL,
  `tipo_montura` varchar(45) DEFAULT NULL,
  `color_montura` varchar(45) DEFAULT NULL,
  `color_izquierdo` varchar(45) DEFAULT NULL,
  `color_derecho` varchar(45) DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `gafas`
--

INSERT INTO `gafas` (`id_gafa`, `id_marca`, `id_cliente`, `id_empleado`, `graduacion_izquierdo`, `graduacion_derecho`, `tipo_montura`, `color_montura`, `color_izquierdo`, `color_derecho`, `precio`) VALUES
(1, 1, 2, 1, '+2.5', '+1.75', 'pasta', 'negro', 'marron', 'marron', '150.00'),
(2, 3, 2, 2, '+2.5', '+1.75', 'pasta', 'azul', 'espejo', 'espejo', '275.00'),
(3, 4, 1, 1, '+0.75', '+1.00', 'metal', 'roja', 'caramelo', 'caramelo', '225.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `id_proveedor`, `nombre`) VALUES
(1, 3, 'CH'),
(2, 3, 'Carrera'),
(3, 2, 'Rayban'),
(4, 1, 'Vogue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `poblacion` varchar(45) DEFAULT NULL,
  `codigo_postal` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `NIF` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre`, `direccion`, `poblacion`, `codigo_postal`, `pais`, `telefono`, `fax`, `NIF`) VALUES
(1, 'Vogue', 'C/Gran vía, 30', 'Madrid', '28080', 'ES', '918451166', '918451166', 'R11133325'),
(2, 'Rayban', 'C/Alemania, 5', 'Bilbao', '48003', 'ES', '942213354', '942213354', 'W11123354'),
(3, 'Distrigafas', 'C/Cid campeador, 10', 'Madrid', '28080', 'ES', '918745566', '918745566', 'y44456455');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `id_cliente_UNIQUE` (`id_cliente`),
  ADD KEY `fk_cliente_cliente1_idx` (`id_cliente_recomendado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_emplado`),
  ADD UNIQUE KEY `id_emplado_UNIQUE` (`id_emplado`);

--
-- Indices de la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD PRIMARY KEY (`id_gafa`),
  ADD UNIQUE KEY `id_gafa_UNIQUE` (`id_gafa`),
  ADD KEY `fk_gafas_marca_idx` (`id_marca`),
  ADD KEY `fk_gafas_cliente1_idx` (`id_cliente`),
  ADD KEY `fk_gafas_empleados1_idx` (`id_empleado`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD UNIQUE KEY `id_marca_UNIQUE` (`id_marca`),
  ADD KEY `fk_marca_proveedores1_idx` (`id_proveedor`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD UNIQUE KEY `id_proveedor_UNIQUE` (`id_proveedor`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_cliente1` FOREIGN KEY (`id_cliente_recomendado`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `gafas`
--
ALTER TABLE `gafas`
  ADD CONSTRAINT `fk_gafas_cliente1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gafas_empleados1` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_emplado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_gafas_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `fk_marca_proveedores1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
