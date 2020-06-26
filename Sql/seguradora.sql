-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 13-Mar-2020 às 19:42
-- Versão do servidor: 10.1.32-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `seguradora`
--
CREATE DATABASE IF NOT EXISTS `seguradora` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `seguradora`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrosassegurados`
--

CREATE TABLE `carrosassegurados` (
  `codCarro` int(11) NOT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `chassi` varchar(25) DEFAULT NULL,
  `cor` varchar(50) DEFAULT NULL,
  `porte` varchar(20) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `ano` int(11) DEFAULT NULL,
  `codCli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `carrosassegurados`
--

INSERT INTO `carrosassegurados` (`codCarro`, `modelo`, `marca`, `chassi`, `cor`, `porte`, `placa`, `ano`, `codCli`) VALUES
(1, 'Jooj', 'Honda', '546516541', 'rosa', 'grandao', 'ete999', 2015, 1),
(2, 'Maxc', 'Toyota', '14845', 'verde', 'pituco', 'ISO-814', 2019, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `codCli` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `telefone` varchar(150) DEFAULT NULL,
  `rg` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(150) DEFAULT NULL,
  `num` varchar(150) DEFAULT NULL,
  `logradouro` varchar(150) DEFAULT NULL,
  `compl` varchar(150) DEFAULT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `cep` varchar(150) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`codCli`, `nome`, `telefone`, `rg`, `email`, `dataNascimento`, `cpf`, `num`, `logradouro`, `compl`, `bairro`, `cidade`, `cep`, `uf`) VALUES
(1, 'Vector Hey', '11-5656-8845', '54954215454', 'heyii@gmail.com', '2019-05-13', '21545356405', '15', 'Rua', 'Apto 8', 'Vila Suina', 'Riba City', '789456123', 'SP'),
(2, 'Velocidade', '11-8451-6515', '549542157984', 'loook@gmail.com', '2010-12-05', '21540546405', '17', 'Rua', 'Apto 15', 'Vina', 'Maua City', '7895522213', 'MG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `ocorrencia`
--

CREATE TABLE `ocorrencia` (
  `codOco` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `sinistro` varchar(150) DEFAULT NULL,
  `motivo` varchar(150) DEFAULT NULL,
  `codCarro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carrosassegurados`
--
ALTER TABLE `carrosassegurados`
  ADD PRIMARY KEY (`codCarro`),
  ADD KEY `codCli` (`codCli`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`codCli`),
  ADD UNIQUE KEY `rg` (`rg`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Indexes for table `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD PRIMARY KEY (`codOco`),
  ADD KEY `codCarro` (`codCarro`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carrosassegurados`
--
ALTER TABLE `carrosassegurados`
  MODIFY `codCarro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `codCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ocorrencia`
--
ALTER TABLE `ocorrencia`
  MODIFY `codOco` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `carrosassegurados`
--
ALTER TABLE `carrosassegurados`
  ADD CONSTRAINT `carrosassegurados_ibfk_1` FOREIGN KEY (`codCli`) REFERENCES `cliente` (`codCli`);

--
-- Limitadores para a tabela `ocorrencia`
--
ALTER TABLE `ocorrencia`
  ADD CONSTRAINT `ocorrencia_ibfk_1` FOREIGN KEY (`codCarro`) REFERENCES `carrosassegurados` (`codCarro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
