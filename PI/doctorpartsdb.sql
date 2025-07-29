-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 29/07/2025 às 02:40
-- Versão do servidor: 11.8.2-MariaDB
-- Versão do PHP: 8.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `doctorpartsdb`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `id_carrinho` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT 1,
  `data_adicionado` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nome`) VALUES
(1, 'Diversos'),
(2, 'Óleos e lubrificantes'),
(3, 'Pneus'),
(4, 'Roupas');

-- --------------------------------------------------------

--
-- Estrutura para tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `id_endereco` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `rua` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `padrao` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `enderecos`
--

INSERT INTO `enderecos` (`id_endereco`, `id_usuario`, `numero`, `cep`, `rua`, `bairro`, `cidade`, `estado`, `complemento`, `padrao`) VALUES
(1, NULL, 'Casa de 10 andares', '99711102', 'Rua Paulo Pedro Zimmer', 'Zimmer', 'Erechim', 'RS', NULL, 0),
(2, NULL, 'Casa de 10 andares', '99702022', 'Rua Léo Neuls', 'Espírito Santo', 'Erechim', 'RS', NULL, 0),
(3, NULL, 'Casa de 10 andares', '99702022', 'Rua Paulo Pedro Zimmer', 'Zimmer', 'Erechim', 'RS', NULL, 0),
(4, NULL, NULL, '99702022', 'Rua Paulo Pedro Zimmer', 'Zimmer', 'Erechim', 'RS', NULL, 0),
(5, 14, '60', '99702022', 'Rua Paulo Pedro Zimmer', 'Zimmer', 'Erechim', 'RS', NULL, 0),
(6, 14, '60', '99760-000', 'Rua Léo Neuls', 'Centro', 'Itatiba do Sul', 'RS', NULL, 0),
(7, 14, '50', '99700-010', 'Praça da Bandeira', 'Centro', 'Erechim', 'RS', 'JAfaris', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_pedido`
--

CREATE TABLE `itens_pedido` (
  `id_itens_pedido` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pagamentos`
--

CREATE TABLE `pagamentos` (
  `id_pagamento` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `metodo_pagamento` enum('cartao','boleto','pix','paypal') DEFAULT NULL,
  `valor_pago` decimal(10,2) DEFAULT NULL,
  `data_pagamento` datetime DEFAULT NULL,
  `status` enum('pendente','aprovado','rejeitado') DEFAULT 'pendente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT current_timestamp(),
  `status` enum('pendente','pago','enviado','entregue','cancelado') DEFAULT 'pendente',
  `total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id_produto` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `estoque` int(11) DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL,
  `data_criacao` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id_produto`, `id_categoria`, `nome`, `descricao`, `preco`, `estoque`, `image_url`, `data_criacao`) VALUES
(1, 1, 'Bauleto', 'Bauleto preto', 29.00, 10, '../../assets/images/bauletoBraz5Adventure56LPreto.png', '2025-07-27 20:33:46'),
(2, 1, 'Capacete', 'Capacete HJC', 39.00, 10, '../../assets/images/capaceteHJC.jpg', '2025-07-27 20:45:53'),
(3, 1, 'Escapamento', 'Escapamento GSX', 49.00, 10, '../../assets/images/escapeGSX-R1000.jpg', '2025-07-27 20:45:53'),
(4, 1, 'Espelho', 'Espelho Risoma Triangular', 59.00, 10, '../../assets/images/espelhoRisomaTriangular.png', '2025-07-27 20:45:53'),
(5, 1, 'Guidão', 'Guidão Renthal', 69.00, 10, '../../assets/images/guidaoRenthal.jpg', '2025-07-27 20:45:53'),
(6, 1, 'Jaqueta', 'Jaqueta Alpine Star', 79.00, 10, '../../assets/images/jaquetaAlpineStar.png', '2025-07-27 20:45:53');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contato` varchar(20) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `data_criacao` datetime DEFAULT current_timestamp(),
  `cpf` varchar(21) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nome`, `email`, `contato`, `senha`, `data_criacao`, `cpf`) VALUES
(1, 'Bernardo', 'bernardo@gmail.com', '(54) 99224-1835', 'beleza', '2025-07-03 19:52:49', NULL),
(2, 'Bernardo', 'bernardo@gmail.com', '(54) 99224-1835', '$2y$12$9Ha6znRhAbBjhh8SPbvjbOdpMbGFWhoAZ4zm.75RbB7fRkMVZu496', '2025-07-03 20:12:36', NULL),
(3, 'Bernardo', 'lucas@gmail.com', '(51) 35135-5135', '$2y$12$YZffQ7POLKQJt5Q/tsAD2uhegEHuRc1BAcamXkSScRVEqtUVmn6qO', '2025-07-03 20:42:34', NULL),
(4, 'Enzzo Viadinho', 'enzzo@gmail.com', '(55) 46565-6445', '$2y$12$xEL.EGyWCQLf4rjMYMBNPOVJZOBAHAfmBawtU8Q7Yheyd8R6/eCE2', '2025-07-03 21:27:40', NULL),
(5, 'lucas2', 'lucas2@gmail.com', '(99) 99999-9999', '$2y$12$S99RRNpc1qN86aP8jDgEXuKajXsQczcjtbE5To83LH3xhvsRwK1zG', '2025-07-08 19:17:48', NULL),
(6, 'bernardo', 'bernardo2@gmail.com', '(54) 99224-1835', '$2y$12$a9C1JlcXOS9ODQ2N2ANSvuJF0wFTmmAxmxAshcEg8iJbMTs8mtdlG', '2025-07-21 19:20:13', NULL),
(7, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$zq8HD8u0spUhNmt.YK8uYO84X3i3sFU2G7/Mt91pNwYWT0gtiC792', '2025-07-21 19:44:57', NULL),
(8, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$WYSYPiaWkkTB0ZNDckRsDeuo7q3OtwIInUpAAIK5yGCrg1yTPAibq', '2025-07-21 19:45:02', NULL),
(9, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$Z5s6wmypfjYXctmx2kibxumtxRIst5KmyqeHUOuzzjkwLm1dFo9La', '2025-07-21 19:45:33', NULL),
(10, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$fw52LdTz2u6P7XB8gbj23.gLifpi8uIXKV9ZiFy9hrUlMQP3y3I/u', '2025-07-21 19:47:27', NULL),
(11, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$YcYDRa7JRHDZQcQHjcMqyOJRw2aEyTPrk3GyKoIS2ewTXCdihHbti', '2025-07-21 19:47:37', NULL),
(12, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$raIhml1pYeiEoAvbXH1ZPOCUNmWDx7uw0rBxCURex87zwLiUgiqNS', '2025-07-21 19:49:29', NULL),
(13, 'wilian', 'wilian@gmail.com', '(99) 99999-9999', '$2y$12$VJvv76NMT6bo4RRtZDzzUu2Wd.JzSWl9099epr8u07aRhb/LkSUHG', '2025-07-21 19:49:47', '999.999.999-99'),
(14, 'Bolsonaro', 'bolsonaro@gmail.com', '(21) 31231-2312', '$2y$12$rqNpEwrdhCFuBaBQYirqcu4VHcnjo4MDoj5atzFAHILfm3TkNCV6O', '2025-07-21 19:53:41', '232.131.231-23');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD PRIMARY KEY (`id_carrinho`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Índices de tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD PRIMARY KEY (`id_itens_pedido`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Índices de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD PRIMARY KEY (`id_pagamento`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Índices de tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id_produto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `carrinho`
--
ALTER TABLE `carrinho`
  MODIFY `id_carrinho` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `itens_pedido`
--
ALTER TABLE `itens_pedido`
  MODIFY `id_itens_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pagamentos`
--
ALTER TABLE `pagamentos`
  MODIFY `id_pagamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Restrições para tabelas `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `enderecos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `itens_pedido`
--
ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `itens_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `itens_pedido_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `produtos` (`id_produto`);

--
-- Restrições para tabelas `pagamentos`
--
ALTER TABLE `pagamentos`
  ADD CONSTRAINT `pagamentos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`);

--
-- Restrições para tabelas `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Restrições para tabelas `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `produtos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
