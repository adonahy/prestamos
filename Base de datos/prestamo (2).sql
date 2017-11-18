-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-11-2017 a las 03:10:59
-- Versión del servidor: 10.1.25-MariaDB
-- Versión de PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prestamo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bancos`
--

CREATE TABLE `bancos` (
  `fecha_creacion` varchar(12) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `cuenta` varchar(80) NOT NULL,
  `moneda` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `bancos`
--

INSERT INTO `bancos` (`fecha_creacion`, `nombre`, `cuenta`, `moneda`) VALUES
('08/08/2016', '', '', 'Dolares'),
('12/05/2016', 'Banco UPA', '12345789', 'Quetzales'),
('01/02/2017', 'Local', '78388101', 'Quetzales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogacion`
--

CREATE TABLE `catalogacion` (
  `id_cat` int(11) NOT NULL,
  `catalogacion` varchar(10) NOT NULL,
  `max` int(11) NOT NULL,
  `fecha_creacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `catalogacion`
--

INSERT INTO `catalogacion` (`id_cat`, `catalogacion`, `max`, `fecha_creacion`) VALUES
(1, 'A', 5000, '12/11/2017'),
(2, 'B', 3000, '12/11/2017'),
(3, 'C', 2000, '17/11/2017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `fecha` varchar(12) NOT NULL,
  `nombres` varchar(90) NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `cat` int(10) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `dpi` varchar(14) NOT NULL,
  `direccion` varchar(300) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `credito` decimal(10,2) NOT NULL,
  `nombre_fiador` varchar(50) NOT NULL,
  `apellido_fiador` varchar(50) NOT NULL,
  `dpi_fiador` varchar(50) NOT NULL,
  `direccion_fiador` varchar(150) NOT NULL,
  `telefono_fiador` varchar(15) NOT NULL,
  `id_cobrador` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`fecha`, `nombres`, `apellidos`, `cat`, `codigo`, `dpi`, `direccion`, `tel`, `credito`, `nombre_fiador`, `apellido_fiador`, `dpi_fiador`, `direccion_fiador`, `telefono_fiador`, `id_cobrador`) VALUES
('13/11/2017', 'Agustin', 'Benito Perez', 2, '2', '1573856985051', '1ra avenida 6-70 zona 3 palin escuintla', '78388103', '0.00', 'Veronica Elizabeth', 'Chavez Peralta', '1573569860511', '2av. 5-35 zona 3 Barrio san Antonio Palin Escuintla', '50231145283', 1),
('10/11/2017', 'selvin Adonahy', 'Benito Chavez', 1, '1', '1573963630511', '2av. 5-35 zona 3 Barrio san Antonio Palin Escuintla', '31145283', '0.00', 'Zoila Esperanza', 'Tubac Lopez ', '157396370511', '2av. 5-35 zona 3 Barrio san Antonio Palin Escuintla', '31145283', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cobradores`
--

CREATE TABLE `cobradores` (
  `id_cobrador` int(11) NOT NULL,
  `nombres` varchar(90) NOT NULL,
  `apellidos` varchar(90) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `rol` int(11) NOT NULL,
  `fecha_creacion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cobradores`
--

INSERT INTO `cobradores` (`id_cobrador`, `nombres`, `apellidos`, `direccion`, `usuario`, `telefono`, `rol`, `fecha_creacion`) VALUES
(1, 'Selvin Adonahy', 'Benito Chavez', '2av. 5-35 zona 3 Barrio san Antonio Palin Escuintla', 'Selvin', '31145283', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `creditos`
--

CREATE TABLE `creditos` (
  `id_credito` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `porcentaje` varchar(20) NOT NULL,
  `pagos` int(11) NOT NULL,
  `fecha_creacion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `creditos`
--

INSERT INTO `creditos` (`id_credito`, `tipo`, `porcentaje`, `pagos`, `fecha_creacion`) VALUES
(1, 'Diario', '25', 24, '09/11/2017'),
(2, 'Dos Quincenas', '30', 2, '09/11/2017'),
(3, 'Tres Quincenas', '45', 3, '09/11/2017'),
(4, 'Mensual', '45', 1, '11/11/2017');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc`
--

CREATE TABLE `cxc` (
  `id_control` int(11) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `no_docto` varchar(20) NOT NULL,
  `tipo_prestamo` varchar(10) NOT NULL,
  `cliente` varchar(150) NOT NULL,
  `id_vendedor` varchar(15) NOT NULL,
  `clasif` varchar(10) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cxc`
--

INSERT INTO `cxc` (`id_control`, `fecha`, `no_docto`, `tipo_prestamo`, `cliente`, `id_vendedor`, `clasif`, `descripcion`, `total`, `saldo`, `estatus`) VALUES
(1, '17/11/2017', '', '1', '1', '1', 'A', 'Prueba1', '5000.00', '5000.00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc_abonos`
--

CREATE TABLE `cxc_abonos` (
  `id` double NOT NULL,
  `control` double NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `banco` varchar(150) NOT NULL,
  `cuenta` varchar(20) NOT NULL,
  `no_doc` varchar(50) NOT NULL,
  `forma_pago` varchar(15) NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `estatus_comision` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cxc_abonos`
--

INSERT INTO `cxc_abonos` (`id`, `control`, `cantidad`, `banco`, `cuenta`, `no_doc`, `forma_pago`, `fecha`, `estatus_comision`) VALUES
(1, 1, '150.00', 'BAM', '19191919191', '1234654', 'Deposito', '08/26/2016', 0),
(2, 4, '300.00', 'BAM', '19191919191', '1225454', 'Cheque', '08/26/2016', 0),
(3, 4, '1000.00', '', '', '12312', 'Cheque', '08/26/2016', 0),
(4, 1, '150.00', 'BAM', '19191919191', '1212121', 'Cheque', '08/26/2016', 0),
(5, 5, '2500.00', 'BAM', '19191919191', '2555', 'Cheque', '08/27/2016', 0),
(6, 5, '2500.00', 'BAM', '19191919191', '653235', 'Cheque', '08/27/2016', 0),
(7, 8, '600.00', 'BAM', '19191919191', '236585', 'TransacciÃ³n', '08/30/2016', 0),
(8, 8, '100.00', '', '', '258669', 'Cheque', '08/30/2016', 0),
(9, 9, '250.00', 'BAM', '19191919191', '11111', 'TransacciÃ³n', '09/01/2016', 1),
(10, 9, '200.00', 'BAM', '19191919191', '222222', 'Cheque', '09/01/2016', 1),
(11, 11, '0.00', 'BAM', '19191919191', 'aaa', 'TransacciÃ³n', '11/14/2016', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc_cabecera`
--

CREATE TABLE `cxc_cabecera` (
  `id_cxc` double NOT NULL,
  `id_cliente` double NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `saldo` decimal(10,2) NOT NULL,
  `no_recibo` varchar(30) NOT NULL,
  `no_deposito` varchar(30) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `cuenta` varchar(30) NOT NULL,
  `serie` varchar(3) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  `tipo_docto` varchar(30) NOT NULL,
  `estatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cxc_cabecera`
--

INSERT INTO `cxc_cabecera` (`id_cxc`, `id_cliente`, `fecha`, `saldo`, `no_recibo`, `no_deposito`, `banco`, `cuenta`, `serie`, `descripcion`, `observaciones`, `tipo_docto`, `estatus`) VALUES
(1, 2, '08/08/2016', '995.00', '8', '', '', '', '', '', 'Pedido - 8', '', 0),
(2, 3, '08/08/2016', '2000.00', '9', '', '', '', '', '', 'Pedido - 9', '', 0),
(3, 3, '08/09/2016', '0.00', '6', '', '', '', '', '', 'Pedido - 6', '', 0),
(4, 0, '08/09/2016', '0.00', '10', '', '', '', '', '', 'Pedido - 10', '', 0),
(5, 4, '08/09/2016', '0.00', '11', '', '', '', '', '', 'Pedido - 11', '', 0),
(6, 4, '08/09/2016', '1246.40', '12', '', '', '', '', '', 'Pedido - 12', '', 0),
(7, 4, '08/10/2016', '230.00', '14', '', '', '', '', '', 'Pedido - 14', '', 1),
(8, 0, '08/10/2016', '0.00', '7', '', '', '', '', '', 'Pedido - 7', '', 0),
(9, 0, '08/10/2016', '0.00', '13', '', '', '', '', '', 'Pedido - 13', '', 0),
(10, 5, '08/10/2016', '491.30', '15', '', '', '', '', 'Esto es una prueba', 'Pedido - 15', '', 0),
(11, 0, '08/12/2016', '0.00', '16', '', '', '', '', '', 'Pedido - 16', '', 0),
(12, 0, '08/19/2016', '0.00', '17', '', '', '', '', '', 'Pedido - 17', '', 0),
(13, 0, '08/19/2016', '300.00', '23', '', '', '', '', '', 'Pedido - 23', '', 0),
(14, 8, '08/19/2016', '0.00', '24', '', '', '', '', '', 'Pedido - 24', '', 0),
(15, 0, '08/19/2016', '60.00', '18', '', '', '', '', '', 'Pedido - 18', '', 0),
(16, 7, '08/19/2016', '0.00', '25', '', '', '', '', '', 'Pedido - 25', '', 0),
(17, 7, '08/19/2016', '238.00', '26', '', '', '', '', '', 'Pedido - 26', '', 0),
(18, 7, '08/19/2016', '370.00', '27', '', '', '', '', '', 'Pedido - 27', '', 0),
(22, 7, '08/24/2016', '0.00', '29', '', '', '', '', '', 'Pedido - 29', '', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cxc_detalle`
--

CREATE TABLE `cxc_detalle` (
  `id_cxc_detalle` double NOT NULL,
  `id_cxc` double NOT NULL,
  `no_docto` varchar(20) NOT NULL,
  `serie` varchar(3) NOT NULL,
  `v_abono` decimal(10,2) NOT NULL,
  `f_pago` varchar(15) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `cuenta` varchar(50) NOT NULL,
  `fecha` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cxc_detalle`
--

INSERT INTO `cxc_detalle` (`id_cxc_detalle`, `id_cxc`, `no_docto`, `serie`, `v_abono`, `f_pago`, `banco`, `cuenta`, `fecha`) VALUES
(1, 18, 'A-56586', '', '570.00', 'Transaccio', 'BAM-19191919191', '', '08/21/2016'),
(7, 16, '1546877', 'A', '50.00', 'Efectivo', 'BAM', '19191919191', '08/24/2016'),
(10, 16, '1234864', 'A', '10.00', 'Transaccion', 'BAM', '19191919191', '08/24/2016'),
(11, 1, '156456', 'A', '110.00', 'Transaccion', 'BAM', '19191919191', '08/24/2016'),
(13, 22, '121545', 'A', '900.00', 'Deposito', 'BAM', '19191919191', '08/25/2016'),
(14, 22, '12254', 'A', '11000.00', 'Efectivo', 'BAM', '19191919191', '08/25/2016'),
(15, 18, '1524545', 'B', '200.00', 'Transaccion', 'Banco Ficohsa', '54146229', '08/25/2016'),
(16, 14, '214587', 'A', '250.00', 'Transaccion', '', '', '08/25/2016'),
(17, 2, '2576548', 'A', '2000.00', 'Efectivo', 'Banco Ficohsa', '54146229', '08/25/2016'),
(18, 14, '425312', 'REC', '240.00', 'Efectivo', 'BAM', '19191919191', '08/25/2016'),
(19, 14, '254684', 'B', '10.00', 'Transaccion', 'Banco Ficohsa', '54146229', '08/25/2016'),
(20, 0, '121212', 'C', '0.00', 'Efectivo', 'BAM', '19191919191', '08/25/2016');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_cuenta`
--

CREATE TABLE `estados_cuenta` (
  `id` double NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `no_docto` varchar(30) NOT NULL,
  `concepto` varchar(300) NOT NULL,
  `credito` varchar(30) NOT NULL,
  `debito` varchar(30) NOT NULL,
  `saldo` varchar(30) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `cuenta` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estados_cuenta`
--

INSERT INTO `estados_cuenta` (`id`, `fecha`, `no_docto`, `concepto`, `credito`, `debito`, `saldo`, `banco`, `cuenta`) VALUES
(2, '06/30/2016', 'A - 43434', 'pago a proveedor: ', '0', '1000', '-1000', '', ''),
(3, '06/30/2016', ' - 9541H4', 'pago a proveedor: Omnitursa', '0', '2000', '-2000', 'Banco Industrial', '074008407-4'),
(4, '06/30/2016', ' - 9541H4', 'pago a proveedor: Omnitursa', '0', '2791.25', '-4791.25', 'Banco Industrial', '074008407-4'),
(5, '07/29/2016', 'PEDIDO - 2', 'pago a proveedor: Omnitursa', '0', '1500', '-2500', '', ''),
(6, '07/29/2016', '3 - 3', 'pago a proveedor: Omnitursa', '0', '3', '-4794.25', 'Banco Industrial', '074008407-4'),
(7, '08/08/2016', 'PEDIDO - 8', 'pago a proveedor: Omnitursa', '0', '10', '-2510', '', ''),
(8, '08/08/2016', 'PEDIDO - 8', 'pago a proveedor: Omnitursa', '0', '100', '-4894.25', 'Banco Industrial', '074008407-4'),
(9, '08/08/2016', 'PEDIDO - 9', 'pago a proveedor: Omnitursa', '0', '16', '-2526', '', ''),
(10, '08/09/2016', 'PEDIDO - 12', 'pago a proveedor: Omnitursa', '0', '100', '-2626', '', ''),
(11, '08/09/2016', 'PEDIDO - 12', 'pago a proveedor: TACA', '0', '100', '-2726', '', ''),
(12, '08/10/2016', 'PEDIDO - 15', 'pago a proveedor: Tarjeta BAM-1020304050', '0', '20', '-2746', '', ''),
(13, '08/10/2016', ' - P2D5H1', 'pago a proveedor: ', '0', '3000', '-5746', '', ''),
(14, '08/10/2016', ' - P2D5H1', 'pago a proveedor: ', '0', '500', '-6246', '', ''),
(15, '08/10/2016', 'PEDIDO - 3', 'pago a proveedor: TACA', '0', '200', '-200', 'BAM', '19191919191'),
(16, '08/21/2016', '', 'pago a proveedor: ', '0', '', '-6246', '', ''),
(17, '08/24/2016', '123456', 'pago de pedido: Pedido - 25', '50', '0', '-150', 'BAM', '19191919191'),
(18, '08/24/2016', '1234567', 'pago de pedido: Pedido - 25', '50', '0', '-100', 'BAM', '19191919191'),
(19, '08/24/2016', '12345678', 'pago de pedido: Pedido - 25', '50', '0', '-50', 'BAM', '19191919191'),
(20, '08/24/2016', 'A-1546877', 'pago de pedido: Pedido - 25', '50', '0', '0', 'BAM', '19191919191'),
(21, '08/24/2016', 'B-12346', 'pago de pedido: Pedido - 25', '10', '0', '10', 'BAM', '19191919191'),
(22, '08/24/2016', 'A-124587', 'pago de pedido: Pedido - 25', '10', '0', '20', 'BAM', '19191919191'),
(23, '08/24/2016', 'A-1234864', 'pago de pedido: Pedido - 25', '10', '0', '30', 'BAM', '19191919191'),
(24, '08/24/2016', 'A-156456', 'pago de pedido: Pedido - 8', '110', '0', '140', 'BAM', '19191919191'),
(25, '08/24/2016', 'RECIBO-15487231', 'pago de pedido: Pedido - ', '800', '0', '800', 'Banco Ficohsa', '54146229'),
(26, '08/25/2016', 'A-121545', 'pago de pedido: Pedido - 29', '900', '0', '1040', 'BAM', '19191919191'),
(27, '08/25/2016', 'A-12254', 'pago de pedido: Pedido - 29', '11000', '0', '12040', 'BAM', '19191919191'),
(28, '08/25/2016', 'B-1524545', 'pago de pedido: Pedido - 27', '200', '0', '1000', 'Banco Ficohsa', '54146229'),
(29, '08/25/2016', 'A-214587', 'pago de pedido: Pedido - 24', '250', '0', '-5996', '', ''),
(30, '08/25/2016', 'A-2576548', 'pago de pedido: Pedido - 9', '2000', '0', '3000', 'Banco Ficohsa', '54146229'),
(31, '08/25/2016', 'RECIBO-425312', 'pago de pedido: Pedido - 24', '240', '0', '12280', 'BAM', '19191919191'),
(32, '08/25/2016', 'B-254684', 'pago de pedido: Pedido - 24', '10', '0', '3010', 'Banco Ficohsa', '54146229'),
(33, '08/25/2016', 'C-121212', 'pago de pedido: Pedido - ', '0', '0', '12280', 'BAM', '19191919191'),
(34, '08/26/2016', 'A - 1111111', 'pago de cuenta por cobrar: A - 1111111', '0', '150', '12430', 'BAM', '19191919191'),
(35, '08/26/2016', ' - Pedido - 31', 'pago de cuenta por cobrar:  - Pedido - 31', '0', '300', '12730', 'BAM', '19191919191'),
(36, '08/26/2016', ' - Pedido - 31', 'pago de cuenta por cobrar:  - Pedido - 31', '0', '1000', '-4996', '', ''),
(37, '08/26/2016', 'A - 1111111', 'pago de cuenta por cobrar: A - 1111111', '0', '150', '12880', 'BAM', '19191919191'),
(38, '08/26/2016', 'C - 15415154', 'pago a proveedor: TACA', '0', '250', '-5246', '', ''),
(39, '08/27/2016', 'A - 222222', 'pago de cuenta por cobrar: A - 222222', '0', '2500', '15380', 'BAM', '19191919191'),
(40, '08/27/2016', 'A - 222222', 'pago de cuenta por cobrar: A - 222222', '2500', '0', '17880', 'BAM', '19191919191'),
(41, '08/28/2016', 'Restaurante Chivas', 'pago gastos adicionales: gasto por almuerzo', '0', '', '2760', 'Banco Ficohsa', '54146229'),
(42, '08/28/2016', 'gastos por gasolina', 'pago gastos adicionales: Llenado de gasolina ', '0', '200', '2560', 'Banco Ficohsa', '54146229'),
(43, '08/28/2016', 'prueba', 'pago gastos adicionales: esto es una prueba', '0', '150', '2410', 'Banco Ficohsa', '54146229'),
(44, '08/28/2016', 'otra prueba', 'pago gastos adicionales: prueba', '0', '100', '2310', 'Banco Ficohsa', '54146229'),
(45, '08/28/2016', 'otra prueba 2', 'pago gastos adicionales: otra prueba para eso', '0', '100', '17780', 'BAM', '19191919191'),
(46, '08/29/2016', 'Campero', 'pago gastos adicionales: desayuno con inversores', '0', '250', '17530', 'BAM', '19191919191'),
(47, '08/30/2016', 'PEDIDO - 34', 'pago a proveedor: TACA', '0', '200', '17330', 'BAM', '19191919191'),
(48, '08/30/2016', 'PEDIDO - 34', 'pago a proveedor: TACA', '0', '200', '17130', 'BAM', '19191919191'),
(49, '08/30/2016', ' - Pedido - 34', 'pago de cuenta por cobrar:  - Pedido - 34', '600', '0', '17730', 'BAM', '19191919191'),
(50, '08/30/2016', ' - Pedido - 34', 'pago de cuenta por cobrar:  - Pedido - 34', '100', '0', '-5146', '', ''),
(51, '09/01/2016', 'Pedido - 35', 'pago de cuenta por cobrar: Pedido - 35', '250', '0', '17980', 'BAM', '19191919191'),
(52, '09/01/2016', 'Pedido - 35', 'pago de cuenta por cobrar: Pedido - 35', '200', '0', '18180', 'BAM', '19191919191'),
(53, '11/14/2016', 'Pedido - 38', 'pago de cuenta por cobrar: Pedido - 38', '0', '0', '18180', 'BAM', '19191919191'),
(54, '31/12/2016', 'inicial', 'Saldo Inicial', '200', '0', '200', 'Banco UPA', '12345789'),
(55, '31/12/2016', '', 'pago de alumno: 1', '125', '0', '325', 'Banco UPA', '12345789'),
(56, '31/12/2016', 'Claro', 'pago gastos adicionales: Internet y telefono', '0', '435', '-110', 'Banco UPA', '12345789'),
(57, '31/12/2016', '2457', 'pago de alumno: 3', '125', '0', '15', 'Banco UPA', '12345789'),
(58, '31/12/2016', '2563', 'pago de alumno: 3', '100', '0', '115', 'Banco UPA', '12345789'),
(59, '31/12/2016', 'Vidrieria', 'pago gastos adicionales: Vidrina', '0', '700', '-585', 'Banco UPA', '12345789'),
(60, '02/01/2017', '', 'INICIAL', '0', '', '0', 'Local', '78388101'),
(61, '02/01/2017', '7437', 'pago de alumno: 8', '100', '0', '100', 'Local', '78388101'),
(62, '02/01/2017', '7438', 'pago de alumno: 8', '100', '0', '200', 'Local', '78388101'),
(63, '03/01/2017', '7439', 'pago de alumno: 3', '100', '0', '300', 'Local', '78388101'),
(64, '04/01/2017', '7441', 'pago de alumno: 13', '100', '0', '400', 'Local', '78388101'),
(65, '04/01/2017', '7441', 'pago de alumno: 13', '100', '0', '500', 'Local', '78388101'),
(66, '04/01/2017', '7441', 'pago de alumno: 13', '100', '0', '600', 'Local', '78388101'),
(67, '04/01/2017', '7441', 'pago de alumno: 13', '100', '0', '700', 'Local', '78388101'),
(68, '06/01/2017', '1222', 'pago de alumno: 4', '100', '0', '800', 'Local', '78388101'),
(69, '06/01/2017', '1223', 'pago de alumno: 5', '125', '0', '925', 'Local', '78388101'),
(70, '06/01/2017', '1224', 'pago de alumno: 6', '125', '0', '1050', 'Local', '78388101'),
(71, '06/01/2017', '7434', 'pago de alumno: 7', '125', '0', '1175', 'Local', '78388101'),
(72, '06/01/2017', '7431', 'pago de alumno: 9', '125', '0', '-5021', '', ''),
(73, '06/01/2017', '7433', 'pago de alumno: 9', '100', '0', '1275', 'Local', '78388101'),
(74, '06/01/2017', '7436', 'pago de alumno: 10', '100', '0', '1375', 'Local', '78388101'),
(75, '06/01/2017', '7442', 'pago de alumno: 14', '125', '0', '1500', 'Local', '78388101'),
(76, '06/01/2017', '7443', 'pago de alumno: 14', '100', '0', '1600', 'Local', '78388101'),
(77, '06/01/2017', '7444', 'pago de alumno: 15', '125', '0', '1725', 'Local', '78388101'),
(78, '10/01/2017', '7454', 'pago de alumno: 11', '100', '0', '1825', 'Local', '78388101'),
(79, '10/01/2017', '7453', 'pago de alumno: 18', '100', '0', '1925', 'Local', '78388101'),
(80, '10/01/2017', '7452', 'pago de alumno: 16', '100', '0', '2025', 'Local', '78388101'),
(81, '10/01/2017', '7451', 'pago de alumno: 17', '100', '0', '2125', 'Local', '78388101'),
(82, '10/01/2017', '7449', 'pago de alumno: 4', '100', '0', '2225', 'Local', '78388101'),
(83, '10/01/2017', '7450', 'pago de alumno: 21', '125', '0', '2350', 'Local', '78388101'),
(84, '14/01/2017', 'Guatemala', 'pago gastos adicionales: Compra telefono', '0', '1200', '1150', 'Local', '78388101'),
(85, '14/01/2017', 'Guatemala', 'pago gastos adicionales: Gastos varios ida a guatemala', '0', '200', '950', 'Local', '78388101'),
(86, '16/01/2017', '7467', 'pago de alumno: 1', '100', '0', '1050', 'Local', '78388101'),
(87, '16/01/2017', '7468', 'pago de alumno: 1', '100', '0', '1150', 'Local', '78388101'),
(88, '17/01/2017', '7455', 'pago de alumno: 22', '100', '0', '1250', 'Local', '78388101'),
(89, '18/01/2017', '7469', 'pago de alumno: 26', '100', '0', '1350', 'Local', '78388101'),
(90, '18/01/2017', '7471', 'pago de alumno: 26', '100', '0', '1450', 'Local', '78388101'),
(91, '22/01/2017', 'BAnrural', 'pago gastos adicionales: Pago tarjeta de credito', '0', '500', '950', 'Local', '78388101'),
(92, '22/01/2017', 'Palin', 'pago gastos adicionales: Local', '0', '1500', '-550', 'Local', '78388101'),
(93, '01/02/2017', '123456', 'pago de alumno: 31', '125', '0', '-425', 'Local', '78388101');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id_horarios` int(11) NOT NULL,
  `hora` varchar(20) NOT NULL,
  `plan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id_horarios`, `hora`, `plan`) VALUES
(1, '8:00 a 9:00 AM', 'Diario'),
(2, '9:00 a 10:00 AM', 'Diario'),
(3, '10:00 a 11:00 AM', 'Diario'),
(4, '11:00 a 12:00 PM', 'Diario'),
(5, '2:00 a 3:00 PM', 'Diario'),
(6, '3:00 a 4:00 PM', 'Diario'),
(7, '4:00 a 5:00 PM', 'Diario'),
(8, '5:00 a 6:00 PM', 'Diario'),
(9, '6:00 a 7:00 PM', 'Diario'),
(10, '7:00 a 8:00 PM', 'Diario'),
(11, '8:00 a 9:00 PM', 'DIario'),
(12, '8:00 a 12:00 PM', 'Fin de Semana'),
(13, '2:00 a 6:00 PM', 'Fin de Semana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_bancos`
--

CREATE TABLE `ingreso_bancos` (
  `id` double NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `banco` varchar(50) NOT NULL,
  `cuenta` varchar(50) NOT NULL,
  `cliente_afectado` varchar(30) NOT NULL,
  `no_deposito` varchar(50) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `razon` varchar(40) NOT NULL,
  `observaciones` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex_pt`
--

CREATE TABLE `kardex_pt` (
  `id_kardex` double NOT NULL,
  `fecha` varchar(12) NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `observaciones` varchar(150) NOT NULL,
  `debe` decimal(10,2) NOT NULL,
  `haber` decimal(10,2) NOT NULL,
  `saldo` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` double NOT NULL,
  `fecha` varchar(11) NOT NULL,
  `usuario` varchar(40) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `tabla` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `fecha`, `usuario`, `descripcion`, `tabla`) VALUES
(37, '06/30/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(38, '06/30/2016', 'admin', 'Agrego el banco: Banco Ficohsa con la cuenta:  \"234234\"', 'bancos'),
(39, '06/30/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(40, '06/30/2016', 'admin', 'Elimino el banco: Banco Ficohsa cuenta: \"234234\"', 'bancos'),
(41, '06/30/2016', 'admin', 'Agrego el banco: Banco Industrial con la cuenta:  \"074008407-4\"', 'bancos'),
(42, '06/30/2016', 'admin', 'Agrego un nuevo proveedor:  \"Omnitursa\"', 'proveedores'),
(43, '06/30/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(44, '06/30/2016', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(45, '06/30/2016', 'admin', 'Elimino al cliente:  \"allan\"', 'clientes'),
(46, '06/30/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(47, '06/30/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(48, '06/30/2016', 'admin', 'Creo un nuevo usuario \"rafael.pozuelos@snt.com.gt\"', 'users'),
(49, '06/30/2016', 'admin', 'Ingreso un nuevo vendedor:  \"Rafael Pozuelos\"', 'vendedores'),
(50, '06/30/2016', 'admin', 'Se elimino el usuario \"rafael.pozuelos@snt.com.gt\"', 'users'),
(51, '06/30/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(52, '06/30/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(53, '07/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(54, '07/29/2016', 'admin', 'Ingreso el pedido:  \"1\"', 'pedidos_cabecera'),
(55, '07/29/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"1\"', 'pedidos_cabecera'),
(56, '07/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(57, '07/29/2016', 'admin', 'Ingreso el pedido:  \"2\"', 'pedidos_cabecera'),
(58, '07/29/2016', 'admin', 'Edito el pedido:  \"2\"', 'pedidos_cabecera'),
(59, '07/29/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"2\"', 'pedidos_cabecera'),
(60, '07/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(61, '07/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(62, '07/29/2016', 'admin', 'Agrego el banco: Banco Inmobiliario con la cuenta:  \"45435435345345\"', 'bancos'),
(63, '07/29/2016', 'admin', 'Agrego el banco: BAM con la cuenta:  \"54146229\"', 'bancos'),
(64, '07/29/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(65, '07/29/2016', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(66, '07/29/2016', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(67, '07/29/2016', 'admin', 'Agrego un nuevo proveedor:  \"AVIANCA\"', 'proveedores'),
(68, '07/29/2016', 'admin', 'Agrego un nuevo proveedor:  \"TACA\"', 'proveedores'),
(69, '07/29/2016', 'Usuario Registrado', 'Agrego un nuevo proveedor:  \"TACA\"', 'proveedores'),
(70, '07/29/2016', 'admin', 'Ingreso un nuevo vendedor:  \"JUCA\"', 'vendedores'),
(71, '07/29/2016', 'admin', 'Ingreso el pedido:  \"3\"', 'pedidos_cabecera'),
(72, '07/29/2016', 'admin', 'Ingreso el pedido:  \"4\"', 'pedidos_cabecera'),
(73, '07/29/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"4\"', 'pedidos_cabecera'),
(74, '07/29/2016', 'admin', 'Edito el pedido:  \"3\"', 'pedidos_cabecera'),
(75, '07/29/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"3\"', 'pedidos_cabecera'),
(76, '07/29/2016', 'admin', 'Ingreso el pedido:  \"5\"', 'pedidos_cabecera'),
(77, '07/29/2016', 'admin', 'Edito el pedido:  \"5\"', 'pedidos_cabecera'),
(78, '07/29/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"5\"', 'pedidos_cabecera'),
(79, '08/01/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(80, '08/01/2016', 'admin', 'Ingreso el pedido:  \"6\"', 'pedidos_cabecera'),
(81, '08/02/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(82, '08/02/2016', 'admin', 'Ingreso el pedido:  \"7\"', 'pedidos_cabecera'),
(83, '08/02/2016', 'admin', 'Edito el pedido:  \"7\"', 'pedidos_cabecera'),
(84, '08/08/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(85, '08/08/2016', 'admin', 'Ingreso el pedido:  \"8\"', 'pedidos_cabecera'),
(86, '08/08/2016', 'admin', 'Edito el pedido:  \"8\"', 'pedidos_cabecera'),
(87, '08/08/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"8\"', 'pedidos_cabecera'),
(88, '08/08/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(89, '08/08/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(90, '08/08/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(91, '08/08/2016', 'admin', 'Agrego el banco:  con la cuenta:  \"\"', 'bancos'),
(92, '08/08/2016', 'admin', 'Ingreso el pedido:  \"9\"', 'pedidos_cabecera'),
(93, '08/08/2016', 'admin', 'Edito el pedido:  \"9\"', 'pedidos_cabecera'),
(94, '08/08/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"9\"', 'pedidos_cabecera'),
(95, '08/09/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(96, '08/09/2016', 'admin', 'Ingreso el pedido:  \"10\"', 'pedidos_cabecera'),
(97, '08/09/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"6\"', 'pedidos_cabecera'),
(98, '08/09/2016', 'admin', 'Elimino el banco: BAM cuenta: \"54146229\"', 'bancos'),
(99, '08/09/2016', 'admin', 'Elimino el banco: Banco Industrial cuenta: \"074008407-4\"', 'bancos'),
(100, '08/09/2016', 'admin', 'Elimino el banco: Banco Inmobiliario cuenta: \"45435435345345\"', 'bancos'),
(101, '08/09/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(102, '08/09/2016', 'admin', 'Ingreso el pedido:  \"11\"', 'pedidos_cabecera'),
(103, '08/09/2016', 'admin', 'Edito el pedido:  \"11\"', 'pedidos_cabecera'),
(104, '08/09/2016', 'admin', 'Edito el pedido:  \"11\"', 'pedidos_cabecera'),
(105, '08/09/2016', 'admin', 'Elimino el pedido:  \"10\"', 'pedidos_cabecera'),
(106, '08/09/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"11\"', 'pedidos_cabecera'),
(107, '08/09/2016', 'admin', 'Ingreso el pedido:  \"12\"', 'pedidos_cabecera'),
(108, '08/09/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"12\"', 'pedidos_cabecera'),
(109, '08/10/2016', 'admin', 'Ingreso el pedido:  \"13\"', 'pedidos_cabecera'),
(110, '08/10/2016', 'admin', 'Ingreso el pedido:  \"14\"', 'pedidos_cabecera'),
(111, '08/10/2016', 'admin', 'Edito el pedido:  \"14\"', 'pedidos_cabecera'),
(112, '08/10/2016', 'admin', 'Edito el pedido:  \"14\"', 'pedidos_cabecera'),
(113, '08/10/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(114, '08/10/2016', 'admin', 'Edito el pedido:  \"14\"', 'pedidos_cabecera'),
(115, '08/10/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"14\"', 'pedidos_cabecera'),
(116, '08/10/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(117, '08/10/2016', 'admin', 'Agrego un nuevo proveedor:  \"Tarjeta BAM-1020304050\"', 'proveedores'),
(118, '08/10/2016', 'admin', 'Agrego un nuevo proveedor:  \"Tarjeta BI-203040503020\"', 'proveedores'),
(119, '08/10/2016', 'Usuario Registrado', 'Agrego un nuevo proveedor:  \"Tarjeta BAM-1020304050\"', 'proveedores'),
(120, '08/10/2016', 'admin', 'Elimino un proveedor:  \"Omnitursa\"', 'proveedores'),
(121, '08/10/2016', 'admin', 'Elimino al cliente:  \"Allan Javier\"', 'clientes'),
(122, '08/10/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(123, '08/10/2016', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(124, '08/10/2016', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(125, '08/10/2016', 'admin', 'Ingreso el pedido:  \"15\"', 'pedidos_cabecera'),
(126, '08/10/2016', 'admin', 'Elimino el pedido:  \"7\"', 'pedidos_cabecera'),
(127, '08/10/2016', 'admin', 'Elimino el pedido:  \"13\"', 'pedidos_cabecera'),
(128, '08/10/2016', 'admin', 'Edito el pedido:  \"15\"', 'pedidos_cabecera'),
(129, '08/10/2016', 'admin', 'Edito el pedido:  \"15\"', 'pedidos_cabecera'),
(130, '08/10/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"15\"', 'pedidos_cabecera'),
(131, '08/10/2016', 'admin', 'Agrego el banco: BAM con la cuenta:  \"19191919191\"', 'bancos'),
(132, '08/10/2016', 'admin', 'Agrego el banco: Banco Ficohsa con la cuenta:  \"54146229\"', 'bancos'),
(133, '08/10/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(134, '08/10/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(135, '08/11/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(136, '08/11/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(137, '08/11/2016', 'admin', 'Ingreso el pedido:  \"16\"', 'pedidos_cabecera'),
(138, '08/12/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(139, '08/12/2016', 'admin', 'Creo un nuevo usuario \"lex\"', 'users'),
(140, '08/12/2016', 'admin', 'Creo un nuevo usuario \"javier\"', 'users'),
(141, '08/12/2016', 'admin', 'Ingreso un nuevo vendedor:  \"Javier Lopez\"', 'vendedores'),
(142, '08/12/2016', 'admin', 'Ingreso un nuevo vendedor:  \"Alexander Jauregui\"', 'vendedores'),
(143, '08/12/2016', 'javier', 'Ingreso al sistema el usuario:  \"javier\"', 'ingreso_sistema'),
(144, '08/12/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(145, '08/12/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(146, '08/12/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(147, '08/12/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"16\"', 'pedidos_cabecera'),
(148, '08/12/2016', 'lex', 'Ingreso al sistema el usuario:  \"lex\"', 'ingreso_sistema'),
(149, '08/12/2016', 'lex', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(150, '08/12/2016', 'javier', 'Ingreso al sistema el usuario:  \"javier\"', 'ingreso_sistema'),
(151, '08/12/2016', 'javier', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(152, '08/12/2016', 'lex', 'Ingreso al sistema el usuario:  \"lex\"', 'ingreso_sistema'),
(153, '08/12/2016', 'lex', 'Creo un nuevo usuario \"sarahi\"', 'users'),
(154, '08/12/2016', 'sarahi', 'Ingreso al sistema el usuario:  \"sarahi\"', 'ingreso_sistema'),
(155, '08/16/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(156, '08/16/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(157, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(158, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(159, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(160, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(161, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(162, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(163, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(164, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(165, '08/18/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(166, '08/19/2016', 'admin', 'Ingreso el pedido:  \"\"', 'pedidos_cabecera'),
(167, '08/19/2016', 'admin', 'Ingreso el pedido:  \"18\"', 'pedidos_cabecera'),
(168, '08/19/2016', 'admin', 'Ingreso el pedido:  \"18\"', 'pedidos_cabecera'),
(169, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(170, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(171, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(172, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(173, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(174, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(175, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(176, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(177, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(178, '08/19/2016', 'admin', 'Ingreso el pedido:  \"19\"', 'pedidos_cabecera'),
(179, '08/19/2016', 'alexander', 'Ingreso al sistema el usuario:  \"alexander\"', 'ingreso_sistema'),
(180, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(181, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(182, '08/19/2016', 'admin', 'Ingreso el pedido:  \"20\"', 'pedidos_cabecera'),
(183, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(184, '08/19/2016', 'admin', 'Ingreso el pedido:  \"21\"', 'pedidos_cabecera'),
(185, '08/19/2016', 'admin', 'Ingreso el pedido:  \"21\"', 'pedidos_cabecera'),
(186, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(187, '08/19/2016', 'admin', 'Ingreso el pedido:  \"22\"', 'pedidos_cabecera'),
(188, '08/19/2016', 'admin', 'Ingreso el pedido:  \"22\"', 'pedidos_cabecera'),
(189, '08/19/2016', 'admin', 'Ingreso el pedido:  \"22\"', 'pedidos_cabecera'),
(190, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(191, '08/19/2016', 'admin', 'Ingreso el pedido:  \"23\"', 'pedidos_cabecera'),
(192, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"17\"', 'pedidos_cabecera'),
(193, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"23\"', 'pedidos_cabecera'),
(194, '08/19/2016', 'admin', 'Ingreso el pedido:  \"24\"', 'pedidos_cabecera'),
(195, '08/19/2016', 'admin', 'Edito el pedido:  \"24\"', 'pedidos_cabecera'),
(196, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"24\"', 'pedidos_cabecera'),
(197, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"18\"', 'pedidos_cabecera'),
(198, '08/19/2016', 'admin', 'Ingreso el pedido:  \"25\"', 'pedidos_cabecera'),
(199, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"25\"', 'pedidos_cabecera'),
(200, '08/19/2016', 'admin', 'Ingreso el pedido:  \"26\"', 'pedidos_cabecera'),
(201, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"26\"', 'pedidos_cabecera'),
(202, '08/19/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(203, '08/19/2016', 'admin', 'Ingreso el pedido:  \"27\"', 'pedidos_cabecera'),
(204, '08/19/2016', 'admin', 'Edito el pedido:  \"27\"', 'pedidos_cabecera'),
(205, '08/19/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"27\"', 'pedidos_cabecera'),
(206, '08/20/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(207, '08/20/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(208, '08/21/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(209, '08/21/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(210, '08/21/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(211, '08/23/2016', 'admin', 'Ingreso el pedido:  \"28\"', 'pedidos_cabecera'),
(212, '08/23/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"28\"', 'pedidos_cabecera'),
(213, '08/24/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(214, '08/24/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(215, '08/24/2016', 'admin', 'Ingreso el pedido:  \"29\"', 'pedidos_cabecera'),
(216, '08/24/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"29\"', 'pedidos_cabecera'),
(217, '08/24/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"29\"', 'pedidos_cabecera'),
(218, '08/24/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"29\"', 'pedidos_cabecera'),
(219, '08/24/2016', 'admin', 'Ingreso el pedido:  \"29\"', 'pedidos_cabecera'),
(220, '08/24/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"29\"', 'pedidos_cabecera'),
(221, '08/26/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(222, '08/26/2016', 'admin', 'Ingreso el pedido:  \"30\"', 'pedidos_cabecera'),
(223, '08/26/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"30\"', 'pedidos_cabecera'),
(224, '08/26/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"30\"', 'pedidos_cabecera'),
(225, '08/26/2016', 'admin', 'Ingreso el pedido:  \"31\"', 'pedidos_cabecera'),
(226, '08/26/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"31\"', 'pedidos_cabecera'),
(227, '08/26/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(228, '08/26/2016', 'alexander', 'Ingreso al sistema el usuario:  \"alexander\"', 'ingreso_sistema'),
(229, '08/26/2016', 'javier', 'Ingreso al sistema el usuario:  \"javier\"', 'ingreso_sistema'),
(230, '08/26/2016', 'javier', 'Ingreso el pedido:  \"32\"', 'pedidos_cabecera'),
(231, '08/27/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(232, '08/27/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(233, '08/27/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(234, '08/27/2016', 'admin', 'Elimino comision:  \"1\"', 'comision'),
(235, '08/27/2016', 'admin', 'Elimino comision:  \"3\"', 'comision'),
(236, '08/27/2016', 'admin', 'Elimino comision:  \"2\"', 'comision'),
(237, '08/27/2016', 'admin', 'Elimino comision:  \"4\"', 'comision'),
(238, '08/27/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"32\"', 'pedidos_cabecera'),
(239, '08/27/2016', 'admin', 'Elimino comision:  \"7\"', 'comision'),
(240, '08/27/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(241, '08/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(242, '08/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(243, '08/29/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(244, '08/30/2016', 'admin', 'Ingreso el pedido:  \"33\"', 'pedidos_cabecera'),
(245, '08/30/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"33\"', 'pedidos_cabecera'),
(246, '08/30/2016', 'admin', 'Ingreso el pedido:  \"34\"', 'pedidos_cabecera'),
(247, '08/30/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"34\"', 'pedidos_cabecera'),
(248, '08/30/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(249, '08/31/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(250, '09/01/2016', 'admin', 'Ingreso el pedido:  \"35\"', 'pedidos_cabecera'),
(251, '09/01/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"35\"', 'pedidos_cabecera'),
(252, '09/01/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(253, '09/02/2016', 'admin', 'Elimino comision:  \"6\"', 'comision'),
(254, '09/02/2016', 'admin', 'Elimino comision:  \"5\"', 'comision'),
(255, '09/02/2016', 'admin', 'Elimino comision:  \"11\"', 'comision'),
(256, '09/02/2016', 'admin', 'Elimino comision:  \"11\"', 'comision'),
(257, '09/02/2016', 'admin', 'Elimino comision:  \"12\"', 'comision'),
(258, '09/02/2016', 'admin', 'Elimino comision:  \"12\"', 'comision'),
(259, '09/02/2016', 'admin', 'Elimino comision:  \"13\"', 'comision'),
(260, '09/02/2016', 'admin', 'Elimino comision:  \"8\"', 'comision'),
(261, '09/02/2016', 'admin', 'Elimino comision:  \"14\"', 'comision'),
(262, '09/02/2016', 'admin', 'Elimino comision:  \"14\"', 'comision'),
(263, '09/02/2016', 'admin', 'Elimino comision:  \"14\"', 'comision'),
(264, '09/02/2016', 'admin', 'Elimino comision:  \"10\"', 'comision'),
(265, '09/02/2016', 'admin', 'Elimino comision:  \"16\"', 'comision'),
(266, '09/07/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(267, '09/07/2016', 'admin', 'Ingreso el pedido:  \"36\"', 'pedidos_cabecera'),
(268, '09/07/2016', 'admin', 'Ingreso el pedido:  \"37\"', 'pedidos_cabecera'),
(269, '11/14/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(270, '11/14/2016', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(271, '11/14/2016', 'admin', 'Ingreso el pedido:  \"38\"', 'pedidos_cabecera'),
(272, '11/14/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"38\"', 'pedidos_cabecera'),
(273, '11/14/2016', 'admin', 'Elimino el Pedido Final:  \"38\"', 'pedidos_cabecera, pedido_secundaria, CXC'),
(274, '11/14/2016', 'admin', 'Cambio el estatus de pedido a pedido final:  \"38\"', 'pedidos_cabecera'),
(275, '03/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(276, '04/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(277, '04/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(278, '04/01/2017', 'admin', 'Elimino los permisos de:  \" \"', 'permissions'),
(279, '04/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(280, '04/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(281, '04/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(282, '04/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(283, '04/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(284, '04/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(285, '05/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(286, '05/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(287, '06/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(288, '09/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(289, '09/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(290, '09/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(291, '09/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(292, '09/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(293, '09/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(294, '09/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(295, '09/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(296, '10/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(297, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(298, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(299, '10/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(300, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(301, '10/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(302, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(303, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(304, '10/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(305, '12/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(306, '13/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(307, '13/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(308, '16/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(309, '16/01/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(310, '16/01/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(311, '17/01/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(312, '18/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(313, '18/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(314, '18/01/2017', 'admin', 'Se editaron los permisos del usuario:  \"jason\"', 'permissions'),
(315, '18/01/2017', 'jason', 'Ingreso al sistema el usuario:  \"jason\"', 'ingreso_sistema'),
(316, '18/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(317, '18/01/2017', 'admin', 'Se editaron los permisos del usuario:  \"jason\"', 'permissions'),
(318, '18/01/2017', 'jason', 'Ingreso al sistema el usuario:  \"jason\"', 'ingreso_sistema'),
(319, '18/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(320, '18/01/2017', 'admin', 'Elimino alumno:  \"26\"', 'alumno'),
(321, '18/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(322, '18/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(323, '18/01/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(324, '19/01/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(325, '21/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(326, '21/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(327, '22/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(328, '22/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(329, '25/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(330, '25/01/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(331, '26/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(332, '28/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(333, '28/01/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(334, '01/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(335, '01/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(336, '01/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(337, '01/02/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(338, '01/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(339, '02/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(340, '11/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(341, '11/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(342, '11/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(343, '18/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(344, '18/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(345, '26/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(346, '26/02/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(347, '26/02/2017', 'admin', 'ACTUALIZO alumno a la base de dato:  \"\"', 'alumno'),
(348, '26/02/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(349, '15/06/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(350, '15/06/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(351, '15/06/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(352, '03/07/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(353, '07/03/2017', 'admin', 'Creo un nuevo usuario \"mariles\"', 'users'),
(354, '03/07/2017', 'mariles', 'Ingreso al sistema el usuario:  \"mariles\"', 'ingreso_sistema'),
(355, '03/07/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(356, '03/07/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"mariles\"', 'permissions'),
(357, '03/07/2017', 'mariles', 'Ingreso al sistema el usuario:  \"mariles\"', 'ingreso_sistema'),
(358, '03/07/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(359, '03/07/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(360, '04/07/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(361, '05/08/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(362, '05/08/2017', 'admin', 'Ingreso un nuevo alumno a la base de dato:  \"\"', 'alumno'),
(363, '18/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(364, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(365, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(366, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(367, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(368, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(369, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(370, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(371, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(372, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(373, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(374, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(375, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(376, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(377, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(378, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(379, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(380, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(381, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(382, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(383, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(384, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(385, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(386, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(387, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(388, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(389, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(390, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(391, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(392, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(393, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(394, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(395, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(396, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(397, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(398, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(399, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(400, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(401, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(402, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(403, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(404, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(405, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(406, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(407, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(408, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(409, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(410, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(411, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(412, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(413, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(414, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(415, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(416, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(417, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(418, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(419, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(420, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(421, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(422, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(423, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(424, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(425, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(426, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(427, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(428, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(429, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(430, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(431, '20/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(432, '20/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(433, '20/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(434, '20/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(435, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(436, '19/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(437, '21/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(438, '22/10/2017', 'ADMIN', 'Ingreso al sistema el usuario:  \"ADMIN\"', 'ingreso_sistema'),
(439, '23/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(440, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(441, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(442, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(443, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(444, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(445, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(446, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(447, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(448, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(449, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(450, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(451, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(452, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(453, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(454, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(455, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(456, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(457, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(458, '26/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(459, '31/10/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(460, '01/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(461, '01/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(462, '01/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(463, '02/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(464, '03/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(465, '03/11/2017', 'Admin', 'Creo un nuevo usuario \"Adonahy\"', 'users'),
(466, '03/11/2017', 'Adonahy', 'Ingreso al sistema el usuario:  \"Adonahy\"', 'ingreso_sistema'),
(467, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(468, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(469, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(470, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(471, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(472, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(473, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(474, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(475, '03/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Adonahy\"', 'permissions'),
(476, '03/11/2017', 'Adonahy', 'Ingreso al sistema el usuario:  \"Adonahy\"', 'ingreso_sistema'),
(477, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(478, '03/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Adonahy\"', 'permissions'),
(479, '03/11/2017', 'adonahy', 'Ingreso al sistema el usuario:  \"adonahy\"', 'ingreso_sistema'),
(480, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(481, '03/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Adonahy\"', 'permissions'),
(482, '03/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Adonahy\"', 'permissions'),
(483, '03/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Adonahy\"', 'permissions'),
(484, '03/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(485, '03/11/2017', 'Admin', 'Creo un nuevo usuario \"karen\"', 'users'),
(486, '03/11/2017', 'karen', 'Ingreso al sistema el usuario:  \"karen\"', 'ingreso_sistema'),
(487, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(488, '03/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"karen\"', 'permissions'),
(489, '03/11/2017', 'karen', 'Ingreso al sistema el usuario:  \"karen\"', 'ingreso_sistema'),
(490, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(491, '03/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"karen\"', 'permissions'),
(492, '03/11/2017', 'karen', 'Ingreso al sistema el usuario:  \"karen\"', 'ingreso_sistema'),
(493, '03/11/2017', 'karen', 'Ingreso al sistema el usuario:  \"karen\"', 'ingreso_sistema'),
(494, '03/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(495, '11/03/2017', 'admin', 'Se elimino el usuario \"Adonahy\"', 'users'),
(496, '11/03/2017', 'admin', 'Se elimino el usuario \"otto\"', 'users'),
(497, '07/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(498, '07/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(499, '08/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(500, '09/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(501, '09/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(502, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(503, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(504, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(505, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(506, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(507, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(508, '09/11/2017', 'admin', 'Elimino al cliente:  \"Mensual\"', 'clientes'),
(509, '09/11/2017', 'admin', 'Elimino al cliente:  \"Mensual\"', 'clientes'),
(510, '09/11/2017', 'admin', 'Elimino al cliente:  \"Mensual\"', 'clientes'),
(511, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(512, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(513, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(514, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(515, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(516, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(517, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(518, '09/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(519, '11/09/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(520, '09/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(521, '10/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(522, '11/10/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(523, '11/10/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(524, '10/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(525, '10/11/2017', 'admin', 'Elimino al cliente:  \"Selvin Adonahy\"', 'clientes'),
(526, '11/10/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(527, '10/11/2017', 'admin', 'Elimino al cliente:  \"Selvin Adonahy\"', 'clientes'),
(528, '11/10/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(529, '10/11/2017', 'admin', 'Elimino al cliente:  \"Selvin Adonahy\"', 'clientes'),
(530, '11/10/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(531, '10/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(532, '11/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(533, '11/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(534, '11/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(535, '11/11/2017', 'admin', 'Elimino al cliente:  \"Mensual\"', 'clientes'),
(536, '11/11/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(537, '11/11/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(538, '11/11/2017', 'admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(539, '11/11/2017', 'admin', 'Elimino al cliente:  \"Kevin Alexander\"', 'clientes'),
(540, '12/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(541, '11/12/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(542, '11/12/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(543, '11/12/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(544, '11/12/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(545, '11/12/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(546, '12/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(547, '12/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(548, '13/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(549, '13/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(550, '11/13/2017', 'Admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(551, '14/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(552, '14/11/2017', 'admin', 'Creo un nuevo usuario \"Selvin\"', 'users'),
(553, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Array\"', 'permissions'),
(554, '14/11/2017', 'admin', 'Elimino los permisos de:  \" \"', 'permissions'),
(555, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Array\"', 'permissions'),
(556, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Array\"', 'permissions'),
(557, '14/11/2017', 'admin', 'Elimino los permisos de:  \" \"', 'permissions'),
(558, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"\"', 'permissions'),
(559, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Selvin\"', 'permissions'),
(560, '14/11/2017', 'admin', 'Se cambiaron los permisos del usuario:  \"Selvin\"', 'permissions'),
(561, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(562, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(563, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(564, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(565, '15/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(566, '15/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Selvin\"', 'permissions'),
(567, '15/11/2017', 'admin', 'Se editaron los permisos del usuario:  \"Selvin\"', 'permissions'),
(568, '15/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(569, '15/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(570, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(571, '15/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(572, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(573, '15/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(574, '15/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(575, '16/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(576, '16/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(577, '16/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(578, '16/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(579, '16/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(580, '16/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(581, '16/11/2017', 'Admin', 'Ingreso al sistema el usuario:  \"Admin\"', 'ingreso_sistema'),
(582, '17/11/2017', 'Admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(583, '17/11/2017', 'Admin', 'Actualizo el cliente:  \"\"', 'clientes'),
(584, '17/11/2017', 'selvin', 'Ingreso al sistema el usuario:  \"selvin\"', 'ingreso_sistema'),
(585, '17/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(586, '17/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(587, '17/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(588, '17/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(589, '11/17/2017', 'admin', 'Se elimino el usuario \"Selvin\"', 'users'),
(590, '17/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(591, '11/17/2017', 'admin', 'Se elimino el usuario \"mariles\"', 'users'),
(592, '11/17/2017', 'admin', 'Se elimino el usuario \"Selvin\"', 'users'),
(593, '17/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(594, '17/11/2017', 'admin', 'Ingreso al sistema el usuario:  \"admin\"', 'ingreso_sistema'),
(595, '11/17/2017', 'admin', 'Ingreso un nuevo cliente a la base de dato:  \"\"', 'clientes'),
(596, '17/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(597, '17/11/2017', 'Selvin', 'Ingreso al sistema el usuario:  \"Selvin\"', 'ingreso_sistema'),
(598, '11/17/2017', 'admin', 'Se elimino el usuario \"Selvin\"', 'users');
INSERT INTO `logs` (`id`, `fecha`, `usuario`, `descripcion`, `tabla`) VALUES
(599, '11/17/2017', 'admin', 'Se elimino el usuario \"mariles\"', 'users');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nombre_programa`
--

CREATE TABLE `nombre_programa` (
  `id_name` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `nombre_programa`
--

INSERT INTO `nombre_programa` (`id_name`, `nombre`) VALUES
(1, 'SERVI CREDITOS R H');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permissions`
--

CREATE TABLE `permissions` (
  `user` varchar(60) NOT NULL,
  `finanzas` int(11) NOT NULL,
  `finanzas_cxc` int(11) NOT NULL,
  `finanzas_clientes` int(11) NOT NULL,
  `administracion` int(11) NOT NULL,
  `admin_c_u` int(11) NOT NULL,
  `admin_e_u` int(11) NOT NULL,
  `admin_ar` int(11) NOT NULL,
  `admin_bancos` int(11) NOT NULL,
  `admin_reportes` int(11) NOT NULL,
  `admin_tipo_creditos` int(11) NOT NULL,
  `admin_app` int(11) NOT NULL,
  `cobrador_app` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permissions`
--

INSERT INTO `permissions` (`user`, `finanzas`, `finanzas_cxc`, `finanzas_clientes`, `administracion`, `admin_c_u`, `admin_e_u`, `admin_ar`, `admin_bancos`, `admin_reportes`, `admin_tipo_creditos`, `admin_app`, `cobrador_app`) VALUES
('', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),
('admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0),
('jason', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
('karen', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user` varchar(60) NOT NULL,
  `pass` varchar(60) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `date` varchar(14) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user`, `pass`, `nombre`, `apellidos`, `direccion`, `telefono`, `date`, `status`) VALUES
('admin', 'admin2016!', '', '', '', '', '06/02/2016', 0),
('alexander', '145', '', '', '', '', '06/30/2016', 0),
('jason', 'academia12', '', '', '', '', '12/05/2016', 0),
('karen', '12345', '', '', '', '', '03/11/2017', 0),
('lex', '123', '', '', '', '', '08/12/2016', 0),
('mariles', '123456', '', '', '', '', '07/03/2017', 1),
('Selvin', 'Itzy2409', 'Selvin Adonahy', 'Benito Chavez', '2av. 5-35 zona 3 Barrio san Antonio Palin Escuintla', '31145283', '14/11/2017', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogacion`
--
ALTER TABLE `catalogacion`
  ADD PRIMARY KEY (`id_cat`,`catalogacion`) USING BTREE;

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dpi`,`codigo`) USING BTREE;

--
-- Indices de la tabla `cobradores`
--
ALTER TABLE `cobradores`
  ADD PRIMARY KEY (`id_cobrador`,`usuario`) USING BTREE;

--
-- Indices de la tabla `creditos`
--
ALTER TABLE `creditos`
  ADD PRIMARY KEY (`id_credito`);

--
-- Indices de la tabla `cxc`
--
ALTER TABLE `cxc`
  ADD PRIMARY KEY (`id_control`);

--
-- Indices de la tabla `estados_cuenta`
--
ALTER TABLE `estados_cuenta`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id_horarios`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nombre_programa`
--
ALTER TABLE `nombre_programa`
  ADD PRIMARY KEY (`id_name`);

--
-- Indices de la tabla `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user`),
  ADD KEY `pass` (`pass`),
  ADD KEY `date` (`date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogacion`
--
ALTER TABLE `catalogacion`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `creditos`
--
ALTER TABLE `creditos`
  MODIFY `id_credito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `estados_cuenta`
--
ALTER TABLE `estados_cuenta`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id_horarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=600;
--
-- AUTO_INCREMENT de la tabla `nombre_programa`
--
ALTER TABLE `nombre_programa`
  MODIFY `id_name` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
