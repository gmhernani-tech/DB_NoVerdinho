-- ==========================================================
-- 1. CRIAÇÃO DAS TABELAS
-- ==========================================================

-- Tabela: usuarios
CREATE TABLE usuarios (
    id INT IDENTITY(1,1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpfcnpj VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(45) NOT NULL,
    regime_trabalho VARCHAR(3) DEFAULT 'CLT' CHECK (regime_trabalho IN ('CLT', 'PJ')),
    salario_bruto DECIMAL(10,2) DEFAULT 0.00,
    salario_liquido DECIMAL(10,2) DEFAULT 0.00,
    PRIMARY KEY (id),
    CONSTRAINT UQ_usuarios_email UNIQUE (email)
);

-- Tabela: mercados
CREATE TABLE mercados (
    id INT IDENTITY(1,1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (id)
);

-- Tabela: produtos
CREATE TABLE produtos (
    id INT IDENTITY(1,1) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (id)
);

-- Tabela: compras
CREATE TABLE compras (
    id INT IDENTITY(1,1) NOT NULL,
    usuario_id INT NULL,
    mercado_id INT NULL,
    data_compra DATE NOT NULL,
    valor_total DECIMAL(10,2) DEFAULT 0.00,
    descricao VARCHAR(255) NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_compras_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    CONSTRAINT FK_compras_mercados FOREIGN KEY (mercado_id) REFERENCES mercados (id)
);

-- Tabela: compra_itens
CREATE TABLE compra_itens (
    id INT IDENTITY(1,1) NOT NULL,
    compra_id INT NULL,
    produto_id INT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10,2) NOT NULL,
    mercado_id INT NOT NULL,
    usuario_id INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_compra_itens_compras FOREIGN KEY (compra_id) REFERENCES compras (id) ON DELETE CASCADE,
    CONSTRAINT FK_compra_itens_produtos FOREIGN KEY (produto_id) REFERENCES produtos (id)
);

-- Tabela: descontos_perfil
CREATE TABLE descontos_perfil (
    id INT IDENTITY(1,1) NOT NULL,
    usuario_id INT NULL,
    nome_desconto VARCHAR(50) NULL,
    porcentagem DECIMAL(5,2) NULL,
    valor_calculado DECIMAL(10,2) NULL,
    PRIMARY KEY (id),
    CONSTRAINT FK_descontos_perfil_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE CASCADE
);

-- Tabela: gastos
CREATE TABLE gastos (
    id INT IDENTITY(1,1) NOT NULL,
    usuario_id INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_gasto DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id),
    CONSTRAINT FK_gastos_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
);

-- Tabela: logs_erro
CREATE TABLE logs_erro (
    id INT IDENTITY(1,1) NOT NULL,
    usuario_id INT NULL,
    origem VARCHAR(255) NOT NULL,
    mensagem VARCHAR(MAX) NOT NULL,
    stack_trace VARCHAR(MAX) NULL,
    data_erro DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (id),
    CONSTRAINT FK_logs_erro_usuarios FOREIGN KEY (usuario_id) REFERENCES usuarios (id) ON DELETE SET NULL
);

-- ==========================================================
-- 2. INSERÇÃO DE DADOS (INSERTS)
-- ==========================================================

-- Permitir inserção manual de IDs nas tabelas com IDENTITY
SET IDENTITY_INSERT usuarios ON;
INSERT INTO usuarios (id, nome, cpfcnpj, email, senha, regime_trabalho, salario_bruto, salario_liquido) VALUES 
(1, 'Gui', '15614651651615', 'gui@teste.com', '1234', 'CLT', 5500.00, 4401.61),
(2, 'Guilherme Teste', '16826594212', 'teste@teste.com.br', 'Aapp@1900', 'CLT', 15000.00, 9612.08);
SET IDENTITY_INSERT usuarios OFF;

SET IDENTITY_INSERT mercados ON;
INSERT INTO mercados (id, nome, usuario_id) VALUES 
(1, 'testew', 1),
(2, 'Pague Mais', 1);
SET IDENTITY_INSERT mercados OFF;

SET IDENTITY_INSERT produtos ON;
INSERT INTO produtos (id, nome, usuario_id) VALUES 
(1, 'Feijão', 1),
(2, 'Arroz', 1),
(3, 'Picanha', 1);
SET IDENTITY_INSERT produtos OFF;

SET IDENTITY_INSERT compras ON;
INSERT INTO compras (id, usuario_id, mercado_id, data_compra, valor_total, descricao) VALUES 
(2, 1, 1, '2026-04-28', 500.00, 'Compra Mês');
SET IDENTITY_INSERT compras OFF;

SET IDENTITY_INSERT compra_itens ON;
INSERT INTO compra_itens (id, compra_id, produto_id, quantidade, valor_unitario, mercado_id, usuario_id) VALUES 
(1, 2, 2, 1, 500.00, 1, 1);
SET IDENTITY_INSERT compra_itens OFF;

SET IDENTITY_INSERT descontos_perfil ON;
INSERT INTO descontos_perfil (id, usuario_id, nome_desconto, porcentagem, valor_calculado) VALUES 
(25, 2, 'INSS (Previdência)', 6.06, 908.85),
(26, 2, 'IRRF (Imposto de Renda)', 19.86, 2979.07),
(27, 2, 'teste', 10.00, 1500.00),
(28, 1, 'INSS (Previdência)', 10.71, 588.82),
(29, 1, 'IRRF (Imposto de Renda)', 8.26, 454.57),
(30, 1, 'teste 2', 1.00, 55.00);
SET IDENTITY_INSERT descontos_perfil OFF;

SET IDENTITY_INSERT gastos ON;
INSERT INTO gastos (id, usuario_id, descricao, categoria, valor, data_gasto) VALUES 
(2, 1, 'Produtos Ilícitos', 'Fixo', 500.00, '2026-04-28 22:46:17'),
(3, 2, 'Produtos Ilícitos', 'Fixo', 2500.00, '2026-05-06 20:28:11');
SET IDENTITY_INSERT gastos OFF;

SET IDENTITY_INSERT logs_erro ON;
INSERT INTO logs_erro (id, usuario_id, origem, mensagem, stack_trace, data_erro) VALUES 
(1, NULL, 'HomeController >> CalculoCLTePJ', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-04-28 20:38:31'),
(2, NULL, 'HomeController >> CalculoCLTePJ', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-04-28 20:50:58'),
(3, NULL, 'HomeController >> CalculoCLTePJ', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-04-28 20:51:50'),
(4, NULL, 'HomeController >> CalculoCLTePJ', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-04-28 20:55:52'),
(5, NULL, 'HomeController >> CalculoCLTePJ', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-04-28 20:58:37'),
(6, 1, 'HomeController >> CalculoCLTePJ', 'Unknown column ''nome'' in ''field list''', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 21:07:43'),
(7, 1, 'HomeController >> CalculoCLTePJ', 'Unknown column ''nome'' in ''field list''', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 21:09:02'),
(8, 1, 'HomeController >> CalculoCLTePJ', 'Unknown column ''descricao'' in ''field list''', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 21:11:37'),
(9, 1, 'HomeController >> CalculoCLTePJ', 'Unknown column ''descricao'' in ''field list''', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 21:11:41'),
(10, 1, 'Erro no Index Dashboard', 'The column name ''id'' does not exist in the result set.', '   at MySqlConnector.Core.ResultSet.GetOrdinal()', '2026-04-28 21:46:54'),
(11, 1, 'Erro no Index Dashboard', 'The column name ''id'' does not exist in the result set.', '   at MySqlConnector.Core.ResultSet.GetOrdinal()', '2026-04-28 21:48:20'),
(12, 1, 'Erro ao Excluir Gasto', '''System.Text.Json.JsonElement'' does not contain a definition for ''id''', '   at CallSite.Target()', '2026-04-28 21:49:12'),
(13, 1, 'Erro ao salvar compra', 'Unknown column ''produto'' in ''field list''', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 22:43:57'),
(14, 1, 'Erro no Dashboard', 'Expression #3 of SELECT list is not in GROUP BY clause...', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 23:10:59'),
(15, 1, 'Erro no Dashboard', 'Expression #3 of SELECT list is not in GROUP BY clause...', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 23:12:16'),
(16, 1, 'Erro no Dashboard', 'Expression #3 of SELECT list is not in GROUP BY clause...', '   at MySqlConnector.Core.ServerSession.ReceiveReplyAsync()', '2026-04-28 23:13:08'),
(17, NULL, 'HomeController >> ValidarLogin', 'Connection must be Open; current state is Connecting', '   at MySqlConnector.MySqlConnection.get_Session()', '2026-05-06 20:37:28');
SET IDENTITY_INSERT logs_erro OFF;