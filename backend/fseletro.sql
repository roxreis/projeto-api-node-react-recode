-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Fev-2021 às 23:16
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fseletro`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `Nome` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `Logradouro` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` int(11) NOT NULL,
  `DDD` int(2) NOT NULL,
  `Telefone` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`id`, `Nome`, `Logradouro`, `Numero`, `DDD`, `Telefone`) VALUES
(1, 'Carlos Augusto', 'Rua 32', 4, 11, 111111111),
(3, 'Rodrigo Reis', 'Rua Y', 35, 11, 222222222),
(5, 'Silvia Santana', 'Rua o', 5, 11, 111111111);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_prod` int(11) NOT NULL,
  `nome_produto` varchar(255) NOT NULL,
  `valor_unitario` float NOT NULL,
  `quantidade` int(10) NOT NULL,
  `valor_total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_cliente`, `id_prod`, `nome_produto`, `valor_unitario`, `quantidade`, `valor_total`) VALUES
(37, 1, 13, 'Relogio Samsung Rosa', 2000, 2, 4000),
(39, 3, 22, 'Notebook Samsung', 8000, 1, 8000),
(43, 1, 13, 'Relogio Samsung Rosa', 2000, 1, 2000);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `categoria` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `preco` float NOT NULL,
  `preco_c_desconto` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`id`, `categoria`, `descricao`, `imagem`, `preco`, `preco_c_desconto`) VALUES
(13, 'Relogios', 'Relogio Samsung Rosa', '/produtos/relogio1.JPG', 2000, 1500),
(14, 'Relogios', 'Relogio Smart Band Preto', '/produtos/relogio2.JPG', 3500, 3000),
(15, 'Relogios', 'Relogio Smart Band Branco', '/produtos/relogio3.JPG', 35000, 3000),
(16, 'Tvs', 'TV TCL', '/produtos/tv1.JPG', 6000, 5500),
(17, 'Tvs', 'TV Samsung', '/produtos/tv2.JPG', 12000, 10750),
(18, 'Tvs', 'TV LG', '/produtos/tv3.JPG', 5000, 4000),
(19, 'Smartphones', 'Smartphone Samsung Rosa', '/produtos/celular1.JPG', 4000, 3000),
(20, 'Smartphones', 'Smartphone Samsung Azul', '/produtos/celular2.JPG', 4000, 3500),
(21, 'Smartphones', 'Smartphone Samsung Grafite', '/produtos/celular3.JPG', 4000, 3500),
(22, 'Notebooks', 'Notebook Asus', '/produtos/note1.JPG', 8000, 7000),
(23, 'Notebooks', 'Notebook Asus', '/produtos/note2.JPG', 7000, 6000),
(24, 'Notebooks', 'Notebook Samsung', '/produtos/note3.JPG', 5000, 4500);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD UNIQUE KEY `id` (`id_pedido`),
  ADD KEY `nome_produto` (`nome_produto`),
  ADD KEY `valor_unitario` (`valor_unitario`),
  ADD KEY `id_cliente` (`id_cliente`) USING BTREE,
  ADD KEY `id_prod` (`id_prod`) USING BTREE;

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `preco` (`preco`),
  ADD KEY `descricao` (`descricao`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `cliente_id_fk` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `nome_produto_fk` FOREIGN KEY (`nome_produto`) REFERENCES `produtos` (`descricao`),
  ADD CONSTRAINT `produto_id_fk` FOREIGN KEY (`id_prod`) REFERENCES `produtos` (`id`),
  ADD CONSTRAINT `valor_unitario_fk` FOREIGN KEY (`valor_unitario`) REFERENCES `produtos` (`preco`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
