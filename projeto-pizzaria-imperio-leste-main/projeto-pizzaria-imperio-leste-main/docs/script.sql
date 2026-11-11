DROP DATABASE IF EXISTS imperio_leste;
CREATE DATABASE imperio_leste
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE imperio_leste;

-- ============================================================
-- 1. TABELAS
-- ============================================================

CREATE TABLE margem_lucro (
    id_margem INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(120) NOT NULL,
    percentual DECIMAL(6,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NULL,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT chk_margem_percentual CHECK (percentual > 0),
    CONSTRAINT chk_margem_periodo CHECK (data_fim IS NULL OR data_fim >= data_inicio)
) ENGINE=InnoDB;

CREATE TABLE produto (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    categoria VARCHAR(50) NOT NULL DEFAULT 'Pizza',
    preco_venda DECIMAL(10,2) NOT NULL,
    id_margem INT NULL,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT chk_produto_preco CHECK (preco_venda > 0),
    CONSTRAINT fk_produto_margem FOREIGN KEY (id_margem)
      REFERENCES margem_lucro(id_margem)
      ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE ingrediente (
    id_ingrediente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    unidade_medida VARCHAR(20) NOT NULL,
    custo_unitario DECIMAL(10,2) NOT NULL,
    fornecedor VARCHAR(120),
    data_atualizacao DATE NOT NULL,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT chk_ingrediente_custo CHECK (custo_unitario > 0)
) ENGINE=InnoDB;

CREATE TABLE item_receita (
    id_item_receita INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_ingrediente INT NOT NULL,
    quantidade DECIMAL(10,3) NOT NULL,
    CONSTRAINT uq_receita UNIQUE (id_produto, id_ingrediente),
    CONSTRAINT chk_receita_quantidade CHECK (quantidade > 0),
    CONSTRAINT fk_receita_produto FOREIGN KEY (id_produto)
      REFERENCES produto(id_produto)
      ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_receita_ingrediente FOREIGN KEY (id_ingrediente)
      REFERENCES ingrediente(id_ingrediente)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE custo_fixo (
    id_custo_fixo INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(120) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NULL,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO',
    CONSTRAINT chk_custo_valor CHECK (valor_mensal >= 0),
    CONSTRAINT chk_custo_periodo CHECK (data_fim IS NULL OR data_fim >= data_inicio)
) ENGINE=InnoDB;

CREATE TABLE concorrente (
    id_concorrente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE,
    contato VARCHAR(100),
    endereco VARCHAR(200),
    observacoes VARCHAR(255)
) ENGINE=InnoDB;

CREATE TABLE pizza_concorrente (
    id_pizza_concorrente INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    id_concorrente INT NOT NULL,
    nome_pizza_concorrente VARCHAR(120) NOT NULL,
    descricao VARCHAR(255),
    preco_praticado DECIMAL(10,2) NOT NULL,
    data_coleta DATE NOT NULL,
    fonte VARCHAR(255) NOT NULL,
    observacao VARCHAR(255),
    CONSTRAINT chk_preco_concorrente CHECK (preco_praticado > 0),
    CONSTRAINT fk_pc_produto FOREIGN KEY (id_produto)
      REFERENCES produto(id_produto)
      ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_pc_concorrente FOREIGN KEY (id_concorrente)
      REFERENCES concorrente(id_concorrente)
      ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB;

-- As entidades abaixo aparecem no DER mais recente enviado pelo grupo.
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    cep VARCHAR(9),
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    endereco VARCHAR(200),
    data_cadastro DATE NOT NULL,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO'
) ENGINE=InnoDB;

CREATE TABLE venda (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NULL,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao VARCHAR(255),

    CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente)
      REFERENCES cliente(id_cliente)
      ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE item_venda (
    id_item_venda INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_item_venda_qtd CHECK (quantidade > 0),
    CONSTRAINT chk_item_venda_preco CHECK (preco_unitario > 0),
    CONSTRAINT fk_iv_venda FOREIGN KEY (id_venda)
      REFERENCES venda(id_venda)
      ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_iv_produto FOREIGN KEY (id_produto)
      REFERENCES produto(id_produto)
      ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE=InnoDB;

CREATE TABLE usuario_autorizado (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    login VARCHAR(80) NOT NULL UNIQUE,
    autorizado_precificacao BOOLEAN NOT NULL DEFAULT FALSE,
    status ENUM('ATIVO','INATIVO') NOT NULL DEFAULT 'ATIVO'
) ENGINE=InnoDB;


-- ============================================================
-- 2. DADOS DE TESTE EXTRAÍDOS DO BANCO SQLITE DO PROJETO
-- Recria o banco MySQL e carrega os registros presentes no banco.db.
-- Execute em ambiente de teste: o comando inicial apaga o banco anterior.
-- ============================================================

-- Dados: margem_lucro (2 registros)
INSERT INTO margem_lucro (id_margem, descricao, percentual, data_inicio, data_fim, status) VALUES
  (1, 'Margem padrão', 40, '2026-01-01', NULL, 'ATIVO'),
  (2, 'Margem antiga', 25, '2025-01-01', '2025-12-31', 'INATIVO');

-- Dados: produto (5 registros)
INSERT INTO produto (id_produto, nome, descricao, categoria, preco_venda, id_margem, status) VALUES
  (1, 'Pizza de Carne', 'Pizza tradicional de calabresa', 'Pizza', 39.9, 1, 'ATIVO'),
  (2, 'Pizza de Muçarela', 'Pizza tradicional de muçarela', 'Pizza', 35.9, 1, 'ATIVO'),
  (3, 'Pizza Especial', 'Pizza especial da casa', 'Pizza', 49.9, 1, 'ATIVO'),
  (4, 'Pizza Descontinuada', 'Produto fora do cardápio', 'Pizza', 29.9, 2, 'INATIVO'),
  (5, 'Pizza Teste', 'Pizza de teste do sistema', 'Tradicional', 35, 1, 'ATIVO');

-- Dados: ingrediente (7 registros)
INSERT INTO ingrediente (id_ingrediente, nome, unidade_medida, custo_unitario, fornecedor, data_atualizacao, status) VALUES
  (1, 'Massa ', 'KG', 4.5, 'Fornecedor Alfa', '2026-10-01', 'INATIVO'),
  (2, 'Molho de tomate', 'kg', 8, 'Fornecedor Beta', '2026-10-01', 'INATIVO'),
  (3, 'Muçarela', 'kg', 32, 'Fornecedor Gama', '2026-10-01', 'INATIVO'),
  (4, 'Calabresa', 'kg', 24, 'Fornecedor Delta', '2026-10-01', 'INATIVO'),
  (5, 'Orégano', 'kg', 40, 'Fornecedor Épsilon', '2026-10-01', 'INATIVO'),
  (6, 'Ingrediente descontinuado', 'kg', 10, 'Fornecedor Zeta', '2026-10-01', 'INATIVO'),
  (7, 'Queijo Teste', 'KG', 35.9, 'Teste', '2026-11-06', 'INATIVO');

-- Dados: item_receita (12 registros)
INSERT INTO item_receita (id_item_receita, id_produto, id_ingrediente, quantidade) VALUES
  (1, 1, 1, 1),
  (2, 1, 2, 0.15),
  (3, 1, 4, 0.2),
  (4, 1, 5, 0.003),
  (5, 2, 1, 1),
  (6, 2, 2, 0.15),
  (7, 2, 3, 0.25),
  (8, 2, 5, 0.003),
  (9, 3, 1, 1),
  (10, 3, 2, 0.18),
  (11, 3, 3, 0.2),
  (12, 3, 4, 0.15);

-- Dados: custo_fixo (4 registros)
INSERT INTO custo_fixo (id_custo_fixo, descricao, valor_mensal, data_inicio, data_fim, status) VALUES
  (1, 'Aluguel', 2500, '2026-01-01', NULL, 'ATIVO'),
  (2, 'Salários', 4000, '2026-01-01', NULL, 'ATIVO'),
  (3, 'Energia e água', 900, '2026-01-01', NULL, 'ATIVO'),
  (4, 'Manutenção encerrada', 250, '2025-01-01', '2025-12-31', 'INATIVO');

-- Dados: concorrente (2 registros)
INSERT INTO concorrente (id_concorrente, nome, contato, endereco, observacoes) VALUES
  (1, 'Pizzaria Sabor da Vila', 'Contato fictício', 'Endereço fictício, São Paulo', 'Registro acadêmico fictício'),
  (2, 'Pizzaria Forno Leste', 'Contato fictício', 'Endereço fictício, São Paulo', 'Registro acadêmico fictício');

-- Dados: pizza_concorrente (4 registros)
INSERT INTO pizza_concorrente (id_pizza_concorrente, id_produto, id_concorrente, nome_pizza_concorrente, descricao, preco_praticado, data_coleta, fonte, observacao) VALUES
  (1, 1, 1, 'Calabresa', 'Pizza comparável de calabresa', 42.9, '2026-10-10', 'Cardápio fictício para teste', 'Preço fictício'),
  (2, 1, 2, 'Calabresa tradicional', 'Pizza comparável de calabresa', 38.9, '2026-10-12', 'Cardápio fictício para teste', 'Preço fictício'),
  (3, 2, 1, 'Muçarela', 'Pizza comparável de muçarela', 36.9, '2026-10-10', 'Cardápio fictício para teste', 'Preço fictício'),
  (4, 3, 2, 'Especial da casa', 'Pizza comparável especial', 52.9, '2026-10-12', 'Cardápio fictício para teste', 'Preço fictício');

-- Dados: cliente (3 registros)
INSERT INTO cliente (id_cliente, nome, cpf, cep, telefone, whatsapp, email, endereco, data_cadastro, status) VALUES
  (1, 'Ana Souza', NULL, NULL, '11990000001', NULL, 'ana.teste@example.com', 'Rua fictícia A, São Paulo', '2026-01-10', 'ATIVO'),
  (2, 'Bruno Lima', NULL, NULL, '11990000002', NULL, 'bruno.teste@example.com', 'Rua fictícia B, São Paulo', '2026-02-15', 'ATIVO'),
  (3, 'Math', '111222333-05', '0367000', '11 99999-9999', '11 99999-9999', 'matheus@gmaio', 'avanida 2', '2026-11-06', 'ATIVO');

-- Dados: venda (6 registros)
INSERT INTO venda (id_venda, id_cliente, data_venda, observacao) VALUES
  (1, 1, '2026-10-15 19:30:00', 'Pedido de teste da cliente Ana'),
  (2, 2, '2026-10-16 20:15:00', 'Pedido de teste do cliente Bruno'),
  (3, 1, '2026-10-17 18:45:00', 'Segundo pedido da cliente Ana'),
  (4, 3, '2026-11-07 00:01:34', 'ggg'),
  (5, 2, '2026-11-07 00:03:03', 'jj'),
  (6, 1, '2026-11-07 00:05:12', 'È maluca');

-- Dados: item_venda (12 registros)
INSERT INTO item_venda (id_item_venda, id_venda, id_produto, quantidade, preco_unitario) VALUES
  (1, 1, 1, 2, 39.9),
  (2, 1, 2, 1, 35.9),
  (3, 2, 3, 1, 49.9),
  (4, 2, 1, 1, 39.9),
  (5, 3, 2, 2, 35.9),
  (6, 5, 3, 1, 49.9),
  (7, 5, 5, 1, 35),
  (8, 5, 5, 1, 35),
  (9, 5, 5, 1, 35),
  (10, 5, 3, 1, 49.9),
  (11, 5, 5, 1, 35),
  (12, 6, 3, 2, 49.9);

-- Dados: usuario_autorizado (4 registros)
INSERT INTO usuario_autorizado (id_usuario, nome, login, autorizado_precificacao, status) VALUES
  (1, 'Administrador', 'admin', 1, 'ATIVO'),
  (2, 'Gerente', 'gerente', 1, 'ATIVO'),
  (3, 'Atendente', 'atendente', 0, 'ATIVO'),
  (4, 'Usuário inativo', 'usuario_inativo', 0, 'INATIVO');

-- ============================================================
-- 3. CONSULTAS DE CONFERÊNCIA
-- ============================================================
SELECT 'margem_lucro' AS tabela, COUNT(*) AS total FROM margem_lucro
UNION ALL SELECT 'produto', COUNT(*) FROM produto
UNION ALL SELECT 'ingrediente', COUNT(*) FROM ingrediente
UNION ALL SELECT 'item_receita', COUNT(*) FROM item_receita
UNION ALL SELECT 'custo_fixo', COUNT(*) FROM custo_fixo
UNION ALL SELECT 'concorrente', COUNT(*) FROM concorrente
UNION ALL SELECT 'pizza_concorrente', COUNT(*) FROM pizza_concorrente
UNION ALL SELECT 'cliente', COUNT(*) FROM cliente
UNION ALL SELECT 'venda', COUNT(*) FROM venda
UNION ALL SELECT 'item_venda', COUNT(*) FROM item_venda
UNION ALL SELECT 'usuario_autorizado', COUNT(*) FROM usuario_autorizado;
