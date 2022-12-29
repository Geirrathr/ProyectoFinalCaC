-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2022 at 01:16 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proyecto-final-cac`
--

-- --------------------------------------------------------

--
-- Table structure for table `localidades`
--

CREATE TABLE `localidades` (
  `idlocalidad` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `idprovincialocalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `localidades`
--

INSERT INTO `localidades` (`idlocalidad`, `nombre`, `idprovincialocalidad`) VALUES
(1, 'La Matanza', 1),
(2, 'La Plata', 1),
(3, 'Lomas de Zamora', 1),
(4, 'Mar del Plata', 1),
(5, 'Quilmes', 1),
(6, 'Almirante Brown', 1),
(7, 'Córdoba', 2),
(8, 'Río Cuarto', 2),
(9, 'Villa María', 2),
(10, 'Villa Carlos Paz', 2),
(11, 'San Francisco', 2),
(12, 'Alta Gracia', 2),
(13, 'Paraná', 3),
(14, 'Concordia', 3),
(15, 'Gualeguaychú', 3),
(16, 'Concepción del Uruguay', 3),
(17, 'Gualeguay', 3),
(18, 'Villaguay', 3),
(19, 'Guaymallén', 4),
(20, 'Godoy Cruz', 4),
(21, 'Las Heras', 4),
(22, 'San Rafael', 4),
(23, 'Mendoza', 4),
(24, 'Maipú', 4),
(25, 'Neuquén', 5),
(26, 'Cutral Có', 5),
(27, 'Centenario', 5),
(28, 'Plottier', 5),
(29, 'Zapala', 5),
(30, 'San Martín de los Andes', 5),
(31, 'Rosario', 6),
(32, 'Santa Fe', 6),
(33, 'Rafaela', 6),
(34, 'Villa Gobernador Gálvez', 6),
(35, 'Venado Tuerto', 6),
(36, 'Reconquista', 6);

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `idpedido` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `lugarentrega` varchar(80) NOT NULL,
  `localidad` int(11) NOT NULL,
  `provincia` int(11) NOT NULL,
  `codpostal` varchar(9) NOT NULL,
  `formadepago` varchar(1) NOT NULL,
  `tarjtitular` varchar(40) NOT NULL,
  `tarjnumero` varchar(16) NOT NULL,
  `tarjvto` varchar(10) NOT NULL,
  `tarjclave` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `pedidos`
--

INSERT INTO `pedidos` (`idpedido`, `nombre`, `apellido`, `usuario`, `mail`, `lugarentrega`, `localidad`, `provincia`, `codpostal`, `formadepago`, `tarjtitular`, `tarjnumero`, `tarjvto`, `tarjclave`) VALUES
(1, 'Gerardo', 'Boc-Ho', 'Geirrathr', 'gerardo.boc-ho@hotmail.com', 'Luz Vieyra Mendez 797', 13, 3, '3100', 'M', 'Gerardo Boc-Ho', '1234567890123456', '00/00', 123),
(2, 'Marcelo', 'Clivio', 'liebling', '', 'Calle Falsa 123', 10, 2, '1234', 'T', 'Marcelo Clivio', '1234123412341234', '11/11', 321),
(3, 'Serena', 'Vergara', 'LaSiro', '', 'asdasdasd 333', 25, 5, '9876n', 'T', 'Serena Vergara', '1111222233334444', '12/34', 568);

-- --------------------------------------------------------

--
-- Table structure for table `provincias`
--

CREATE TABLE `provincias` (
  `idprovincia` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `provincias`
--

INSERT INTO `provincias` (`idprovincia`, `nombre`) VALUES
(1, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Entre Ríos'),
(4, 'Mendoza'),
(5, 'Neuquén'),
(6, 'Santa Fe');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(20) NOT NULL,
  `nombreyapellido` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `usuario`, `clave`, `nombreyapellido`) VALUES
(1, 'prueba@gmail.com', '909090', 'Gerardo Boc-Ho'),
(2, 'miemail@gmail.com', 'holaholahola', 'Codo a Codo');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`idlocalidad`),
  ADD UNIQUE KEY `LocProvincia` (`idlocalidad`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`idpedido`);

--
-- Indexes for table `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`idprovincia`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `localidades`
--
ALTER TABLE `localidades`
  MODIFY `idlocalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `idpedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `provincias`
--
ALTER TABLE `provincias`
  MODIFY `idprovincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
