-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.31 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para crud
DROP DATABASE IF EXISTS `crud`;
CREATE DATABASE IF NOT EXISTS `crud` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `crud`;

-- Copiando estrutura para tabela crud.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `idade` int(10) DEFAULT NULL,
  `civil` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Copiando dados para a tabela crud.usuario: 5 rows
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id`, `nome`, `idade`, `civil`, `cpf`, `cidade`, `estado`) VALUES
	(14, 'Marcelo Carvalho', 35, 'Divorciado', '555.999.000.00', 'Belo Horizonte', 'MG'),
	(12, 'Mariana Silva', 58, 'Casado', '255.689.978-61', 'Belo Horizonte', 'MG'),
	(21, 'Mariana Silva', 35, 'Casado', '255.689.978-61', 'Belo Horizonte', 'MG'),
	(27, 'Mariana Silva', 35, 'Solteira', '555.999.000.00', 'Belo Horizonte', 'MG'),
	(26, 'Graziely Lopes', 19, 'Solteira', '222.555.999-77', 'São Paulo', 'SP');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
