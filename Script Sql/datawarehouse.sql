-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-10-2023 a las 05:32:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `datawarehouse`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dim_clientes`
--

CREATE TABLE `dim_clientes` (
  `Idcliente` int(11) NOT NULL,
  `nombre` varchar(11) NOT NULL,
  `distrito` varchar(255) NOT NULL,
  `satisfaccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Estructura de tabla para la tabla `dim_productos`
--

CREATE TABLE `dim_productos` (
  `Idproducto` int(100) NOT NULL,
  `Producto` tinytext DEFAULT NULL,
  `Costo_Compra` double DEFAULT NULL,
  `Ingreso Almacen` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `dim_tiempos` (
  `idtiempo` int(11) NOT NULL,
  `fecha` tinytext DEFAULT NULL,
  `anio` int(100) DEFAULT NULL,
  `semestre` varchar(12) DEFAULT NULL,
  `trimestre` int(100) DEFAULT NULL,
  `bimestre` varchar(12) DEFAULT NULL,
  `mes` int(100) DEFAULT NULL,
  `v_mes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `dim_vendedores` (
  `Idvendedor` int(100) NOT NULL,
  `Vendedor` tinytext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hechos_ventas`
--

CREATE TABLE `hechos_ventas` (
  `id` int(11) NOT NULL,
  `idproducto` int(100) NOT NULL,
  `idvendedor` int(100) NOT NULL,
  `idcliente` int(100) NOT NULL,
  `idtiempo` int(100) NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `Monto` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Indices de la tabla `dim_clientes`
--
ALTER TABLE `dim_clientes`
  ADD PRIMARY KEY (`Idcliente`);

--
-- Indices de la tabla `dim_productos`
--
ALTER TABLE `dim_productos`
  ADD PRIMARY KEY (`Idproducto`);

--
-- Indices de la tabla `dim_tiempos`
--
ALTER TABLE `dim_tiempos`
  ADD PRIMARY KEY (`idtiempo`);

--
-- Indices de la tabla `dim_vendedores`
--
ALTER TABLE `dim_vendedores`
  ADD PRIMARY KEY (`Idvendedor`);

--
-- Indices de la tabla `hechos_ventas`
--
ALTER TABLE `hechos_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dim_client` (`idcliente`),
  ADD KEY `dim_tiemp` (`idtiempo`),
  ADD KEY `dim_product` (`idproducto`),
  ADD KEY `dim_vendedor` (`idvendedor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `dim_clientes`
--
ALTER TABLE `dim_clientes`
  MODIFY `Idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `dim_productos`
--
ALTER TABLE `dim_productos`
  MODIFY `Idproducto` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `dim_tiempos`
--
ALTER TABLE `dim_tiempos`
  MODIFY `idtiempo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT de la tabla `dim_vendedores`
--
ALTER TABLE `dim_vendedores`
  MODIFY `Idvendedor` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `hechos_ventas`
--
ALTER TABLE `hechos_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hechos_ventas`
--
ALTER TABLE `hechos_ventas`
  ADD CONSTRAINT `dim_client` FOREIGN KEY (`idcliente`) REFERENCES `dim_clientes` (`Idcliente`),
  ADD CONSTRAINT `dim_product` FOREIGN KEY (`idproducto`) REFERENCES `dim_productos` (`Idproducto`),
  ADD CONSTRAINT `dim_tiemp` FOREIGN KEY (`idtiempo`) REFERENCES `dim_tiempos` (`idtiempo`),
  ADD CONSTRAINT `dim_vendedor` FOREIGN KEY (`idvendedor`) REFERENCES `dim_vendedores` (`Idvendedor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
