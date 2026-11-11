-- ============================================================
-- PROJETO: IMPÉRIO LESTE
-- BANCO DE DADOS: SQLITE (MYCOMPILER)
-- ============================================================

PRAGMA foreign_keys = ON;

-- ============================================================
-- 1. EXCLUIR TABELAS ANTIGAS
-- ============================================================

DROP TABLE IF EXISTS item_venda;
DROP TABLE IF EXISTS venda;
DROP TABLE IF EXISTS usuario_autorizado;
DROP TABLE IF EXISTS pizza_concorrente;
DROP TABLE IF EXISTS item_receita;
DROP TABLE IF EXISTS custo_fixo;
DROP TABLE IF EXISTS concorrente;
DROP TABLE IF EXISTS ingrediente;
DROP TABLE IF EXISTS produto;
DROP TABLE IF EXISTS margem_lucro;
DROP TABLE IF EXISTS cliente;

-- ============================================================
-- 2. CRIAÇÃO DAS TABELAS
-- ============================================================

CREATE TABLE margem_lucro (
    id_margem INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao VARCHAR(120) NOT NULL,
    percentual DECIMAL(6,2) NOT NULL CHECK (percentual > 0),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO')),
    CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);

CREATE TABLE produto (
    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(120) NOT NULL UNIQUE,
    descricao VARCHAR(255),
    categoria VARCHAR(50) NOT NULL DEFAULT 'Pizza',
    preco_venda DECIMAL(10,2) NOT NULL CHECK (preco_venda > 0),
    id_margem INTEGER,
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO')),
    FOREIGN KEY (id_margem)
        REFERENCES margem_lucro(id_margem)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE ingrediente (
    id_ingrediente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    unidade_medida VARCHAR(20) NOT NULL,
    custo_unitario DECIMAL(10,2) NOT NULL
        CHECK (custo_unitario > 0),
    fornecedor VARCHAR(120),
    data_atualizacao DATE NOT NULL,
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO'))
);

CREATE TABLE item_receita (
    id_item_receita INTEGER PRIMARY KEY AUTOINCREMENT,
    id_produto INTEGER NOT NULL,
    id_ingrediente INTEGER NOT NULL,
    quantidade DECIMAL(10,3) NOT NULL
        CHECK (quantidade > 0),
    UNIQUE (id_produto, id_ingrediente),
    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_ingrediente)
        REFERENCES ingrediente(id_ingrediente)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE custo_fixo (
    id_custo_fixo INTEGER PRIMARY KEY AUTOINCREMENT,
    descricao VARCHAR(120) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL
        CHECK (valor_mensal >= 0),
    data_inicio DATE NOT NULL,
    data_fim DATE,
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO')),
    CHECK (data_fim IS NULL OR data_fim >= data_inicio)
);

CREATE TABLE concorrente (
    id_concorrente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(120) NOT NULL UNIQUE,
    contato VARCHAR(100),
    endereco VARCHAR(200),
    observacoes VARCHAR(255)
);

CREATE TABLE pizza_concorrente (
    id_pizza_concorrente INTEGER PRIMARY KEY AUTOINCREMENT,
    id_produto INTEGER NOT NULL,
    id_concorrente INTEGER NOT NULL,
    nome_pizza_concorrente VARCHAR(120) NOT NULL,
    descricao VARCHAR(255),
    preco_praticado DECIMAL(10,2) NOT NULL
        CHECK (preco_praticado > 0),
    data_coleta DATE NOT NULL,
    fonte VARCHAR(255) NOT NULL,
    observacao VARCHAR(255),
    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_concorrente)
        REFERENCES concorrente(id_concorrente)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(120) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    cep VARCHAR(9),
    telefone VARCHAR(20),
    whatsapp VARCHAR(20),
    email VARCHAR(120) UNIQUE,
    endereco VARCHAR(200),
    data_cadastro DATE NOT NULL,
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO'))
);

CREATE TABLE venda (
    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    data_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao VARCHAR(255),
    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON UPDATE CASCADE ON DELETE SET NULL
);

CREATE TABLE item_venda (
    id_item_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venda INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL CHECK (quantidade > 0),
    preco_unitario DECIMAL(10,2) NOT NULL
        CHECK (preco_unitario > 0),
    FOREIGN KEY (id_venda)
        REFERENCES venda(id_venda)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE usuario_autorizado (
    id_usuario INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(120) NOT NULL,
    login VARCHAR(80) NOT NULL UNIQUE,
    autorizado_precificacao INTEGER NOT NULL DEFAULT 0
        CHECK (autorizado_precificacao IN (0, 1)),
    status TEXT NOT NULL DEFAULT 'ATIVO'
        CHECK (status IN ('ATIVO', 'INATIVO'))
);

-- ============================================================
-- 3. INSERÇÃO DE DADOS FICTÍCIOS
-- ============================================================

INSERT INTO margem_lucro
(descricao, percentual, data_inicio, data_fim, status)
VALUES
('Margem padrão', 40.00, '2026-01-01', NULL, 'ATIVO'),
('Margem antiga', 25.00, '2025-01-01', '2025-12-31', 'INATIVO');

INSERT INTO produto
(nome, descricao, categoria, preco_venda, id_margem, status)
VALUES
('Pizza de Calabresa', 'Pizza tradicional de calabresa', 'Pizza', 39.90, 1, 'ATIVO'),
('Pizza de Muçarela', 'Pizza tradicional de muçarela', 'Pizza', 35.90, 1, 'ATIVO'),
('Pizza Especial', 'Pizza especial da casa', 'Pizza', 49.90, 1, 'ATIVO'),
('Pizza Descontinuada', 'Produto fora do cardápio', 'Pizza', 29.90, 2, 'INATIVO');

INSERT INTO ingrediente
(nome, unidade_medida, custo_unitario, fornecedor, data_atualizacao, status)
VALUES
('Massa de pizza', 'unidade', 4.50, 'Fornecedor Alfa', '2026-10-01', 'ATIVO'),
('Molho de tomate', 'kg', 8.00, 'Fornecedor Beta', '2026-10-01', 'ATIVO'),
('Muçarela', 'kg', 32.00, 'Fornecedor Gama', '2026-10-01', 'ATIVO'),
('Calabresa', 'kg', 24.00, 'Fornecedor Delta', '2026-10-01', 'ATIVO'),
('Orégano', 'kg', 40.00, 'Fornecedor Épsilon', '2026-10-01', 'ATIVO'),
('Ingrediente descontinuado', 'kg', 10.00, 'Fornecedor Zeta', '2026-10-01', 'INATIVO');

INSERT INTO item_receita
(id_produto, id_ingrediente, quantidade)
VALUES
(1,1,1.000),
(1,2,0.150),
(1,4,0.200),
(1,5,0.003),
(2,1,1.000),
(2,2,0.150),
(2,3,0.250),
(2,5,0.003),
(3,1,1.000),
(3,2,0.180),
(3,3,0.200),
(3,4,0.150);

INSERT INTO custo_fixo
(descricao, valor_mensal, data_inicio, data_fim, status)
VALUES
('Aluguel', 2500.00, '2026-01-01', NULL, 'ATIVO'),
('Salários', 4000.00, '2026-01-01', NULL, 'ATIVO'),
('Energia e água', 900.00, '2026-01-01', NULL, 'ATIVO'),
('Manutenção encerrada', 250.00, '2025-01-01', '2025-12-31', 'INATIVO');

INSERT INTO concorrente
(nome, contato, endereco, observacoes)
VALUES
('Pizzaria Sabor da Vila', 'Contato fictício', 'Endereço fictício, São Paulo', 'Registro acadêmico fictício'),
('Pizzaria Forno Leste', 'Contato fictício', 'Endereço fictício, São Paulo', 'Registro acadêmico fictício');

INSERT INTO pizza_concorrente
(id_produto, id_concorrente, nome_pizza_concorrente, descricao, preco_praticado, data_coleta, fonte, observacao)
VALUES
(1, 1, 'Calabresa', 'Pizza comparável de calabresa', 42.90, '2026-10-10', 'Cardápio fictício para teste', 'Preço fictício'),
(1, 2, 'Calabresa tradicional', 'Pizza comparável de calabresa', 38.90, '2026-10-12', 'Cardápio fictício para teste', 'Preço fictício'),
(2, 1, 'Muçarela', 'Pizza comparável de muçarela', 36.90, '2026-10-10', 'Cardápio fictício para teste', 'Preço fictício'),
(3, 2, 'Especial da casa', 'Pizza comparável especial', 52.90, '2026-10-12', 'Cardápio fictício para teste', 'Preço fictício');

INSERT INTO cliente
(nome, telefone, email, endereco, data_cadastro, status)
VALUES
('Ana Souza', '11990000001', 'ana.teste@example.com', 'Rua fictícia A, São Paulo', '2026-01-10', 'ATIVO'),
('Bruno Lima', '11990000002', 'bruno.teste@example.com', 'Rua fictícia B, São Paulo', '2026-02-15', 'ATIVO');

-- ============================================================
-- 4. VENDAS
-- ============================================================

INSERT INTO venda
(id_cliente, data_venda, observacao)
VALUES
(1, '2026-10-15 19:30:00', 'Pedido de teste da cliente Ana'),
(2, '2026-10-16 20:15:00', 'Pedido de teste do cliente Bruno'),
(1, '2026-10-17 18:45:00', 'Segundo pedido da cliente Ana');

INSERT INTO item_venda
(id_venda, id_produto, quantidade, preco_unitario)
VALUES
(1, 1, 2, 39.90),
(1, 2, 1, 35.90),
(2, 3, 1, 49.90),
(2, 1, 1, 39.90),
(3, 2, 2, 35.90);

-- ============================================================
-- 5. USUÁRIOS AUTORIZADOS
-- ============================================================

INSERT INTO usuario_autorizado
(nome, login, autorizado_precificacao, status)
VALUES
('Administrador', 'admin', 1, 'ATIVO'),
('Gerente', 'gerente', 1, 'ATIVO'),
('Atendente', 'atendente', 0, 'ATIVO'),
('Usuário inativo', 'usuario_inativo', 0, 'INATIVO');

-- ============================================================
-- 6. CONSULTAS PARA CONFERÊNCIA
-- ============================================================

SELECT * FROM margem_lucro;
SELECT * FROM produto;
SELECT * FROM ingrediente;
SELECT * FROM item_receita;
SELECT * FROM custo_fixo;
SELECT * FROM concorrente;
SELECT * FROM pizza_concorrente;
SELECT * FROM cliente;
SELECT * FROM venda;
SELECT * FROM item_venda;
SELECT * FROM usuario_autorizado;

-- ============================================================
-- 7. CONFERÊNCIA DA QUANTIDADE DE REGISTROS
-- ============================================================

SELECT 'margem_lucro' AS tabela, COUNT(*) AS total FROM margem_lucro
UNION ALL
SELECT 'produto', COUNT(*) FROM produto
UNION ALL
SELECT 'ingrediente', COUNT(*) FROM ingrediente
UNION ALL
SELECT 'item_receita', COUNT(*) FROM item_receita
UNION ALL
SELECT 'custo_fixo', COUNT(*) FROM custo_fixo
UNION ALL
SELECT 'concorrente', COUNT(*) FROM concorrente
UNION ALL
SELECT 'pizza_concorrente', COUNT(*) FROM pizza_concorrente
UNION ALL
SELECT 'cliente', COUNT(*) FROM cliente
UNION ALL
SELECT 'venda', COUNT(*) FROM venda
UNION ALL
SELECT 'item_venda', COUNT(*) FROM item_venda
UNION ALL
SELECT 'usuario_autorizado', COUNT(*) FROM usuario_autorizado;

-- ============================================================
-- FIM DO PROJETO IMPÉRIO LESTE
-- ============================================================
