-- ====================================================================
-- CRIAÇÃO E POPULAÇÃO DO BANCO DE DADOS ACADEMIA REDFIT
-- ====================================================================

-- 1) banco de dados 
DROP DATABASE IF EXISTS academia_redfit;

-- 2) Cria o banco de dados
CREATE DATABASE IF NOT EXISTS academia_redfit;
USE academia_redfit;

-- ====================================================================
-- 3) CRIAÇÃO DAS TABELAS
-- ====================================================================

-- Tabela de CLIENTES
-- Contém informações pessoais e de contato
CREATE TABLE IF NOT EXISTS clientes (
cliente_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
sexo CHAR(1) NOT NULL,
endereco VARCHAR(255),
telefone VARCHAR(20),
email VARCHAR(100) UNIQUE,
data_matricula DATE NOT NULL
);

-- Tabela de ATIVIDADES
-- Contém os tipos de atividades que a academia oferece
CREATE TABLE IF NOT EXISTS atividades (
atividade_id INT AUTO_INCREMENT PRIMARY KEY,
nome_atividade VARCHAR(100) NOT NULL,
tipo_atividade VARCHAR(50)
);

-- Tabela de PLANOS
-- Contém os planos de mensalidade disponíveis
CREATE TABLE IF NOT EXISTS planos (
plano_id INT AUTO_INCREMENT PRIMARY KEY,
nome_plano VARCHAR(100) NOT NULL,
preco_plano DECIMAL(10,2) NOT NULL
);

-- Tabela de NUTRICIONISTAS
-- Informações sobre os profissionais de nutrição
CREATE TABLE IF NOT EXISTS nutricionistas (
nutri_id INT AUTO_INCREMENT PRIMARY KEY,
nome_nutricionista VARCHAR(100) NOT NULL
);

-- Tabela de PGC (Peso, Gordura, Circunferência)
-- Registro das avaliações físicas
CREATE TABLE IF NOT EXISTS pgc (
pgc_id INT AUTO_INCREMENT PRIMARY KEY,
primeiro_pgc DATE,
ultimo_pgc DATE
);

-- Tabela de ESTADO
-- Estado do cliente na academia (ativo, inativo, etc.)
CREATE TABLE IF NOT EXISTS estado (
estado_id INT AUTO_INCREMENT PRIMARY KEY,
estado VARCHAR(50) NOT NULL
);

-- ====================================================================
-- 4) TABELAS DE RELACIONAMENTO
-- ====================================================================

-- Relacionamento: Cliente ASSINA um Plano
CREATE TABLE IF NOT EXISTS cliente_plano (
cliente_id INT NOT NULL,
plano_id INT NOT NULL,
PRIMARY KEY (cliente_id, plano_id),
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
);

-- Relacionamento: Cliente PRATICA Atividades
CREATE TABLE IF NOT EXISTS cliente_atividade (
cliente_id INT NOT NULL,
atividade_id INT NOT NULL,
PRIMARY KEY (cliente_id, atividade_id),
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (atividade_id) REFERENCES atividades(atividade_id)
);

-- Relacionamento: Cliente TEM Nutricionista
CREATE TABLE IF NOT EXISTS cliente_nutricionista (
cliente_id INT NOT NULL,
nutri_id INT NOT NULL,
PRIMARY KEY (cliente_id, nutri_id),
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (nutri_id) REFERENCES nutricionistas(nutri_id)
);

-- Relacionamento: Cliente AVALIA PGC
CREATE TABLE IF NOT EXISTS cliente_pgc (
cliente_id INT NOT NULL,
pgc_id INT NOT NULL,
PRIMARY KEY (cliente_id, pgc_id),
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (pgc_id) REFERENCES pgc(pgc_id)
);

-- Relacionamento: Cliente POSSUI Estado
CREATE TABLE IF NOT EXISTS cliente_estado (
cliente_id INT NOT NULL,
estado_id INT NOT NULL,
PRIMARY KEY (cliente_id, estado_id),
FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
FOREIGN KEY (estado_id) REFERENCES estado(estado_id)
);

-- ====================================================================
-- 5) INSERÇÃO DOS DADOS
-- ====================================================================

-- Inserção de dados de clientes
INSERT INTO clientes (nome, idade, sexo, endereco, telefone, email, data_matricula) VALUES
('Ana Silva', 28, 'F', 'Rua A, 100', '(11) 98765-4321', 'ana.silva@email.com', '2023-01-15'),
('Bruno Costa', 35, 'M', 'Av. B, 200', '(21) 91234-5678', 'bruno.costa@email.com', '2022-05-10'),
('Carla Oliveira', 22, 'F', 'Travessa C, 300', '(31) 99876-5432', 'carla.o@email.com', '2024-03-20'),
('Daniel Santos', 41, 'M', 'Rua D, 400', '(11) 97777-8888', 'daniel.s@email.com', '2023-11-01'),
('Mariana Souza', 29, 'F', 'Av. E, 500', '(21) 96666-7777', 'mariana.s@email.com', '2023-08-05'),
('Gustavo Lima', 50, 'M', 'Rua F, 600', '(31) 95555-6666', 'gustavo.l@email.com', '2022-01-22'),
('Sofia Pereira', 19, 'F', 'Av. G, 700', '(11) 94444-5555', 'sofia.p@email.com', '2024-02-14'),
('Pedro Almeida', 33, 'M', 'Rua H, 800', '(21) 93333-4444', 'pedro.a@email.com', '2023-07-10'),
('Julia Mendes', 27, 'F', 'Av. I, 900', '(31) 92222-3333', 'julia.m@email.com', '2024-01-01'),
('Lucas Fernandes', 48, 'M', 'Rua J, 1000', '(11) 91111-2222', 'lucas.f@email.com', '2022-10-18');

-- Inserção de dados de atividades
INSERT INTO atividades (nome_atividade, tipo_atividade) VALUES
('Musculação', 'Força'),
('Crossfit', 'Força'),
('Yoga', 'Flexibilidade'),
('Zumba', 'Cardio'),
('Pilates', 'Flexibilidade');

-- Inserção de dados de planos (com nomes de planos)
INSERT INTO planos (nome_plano, preco_plano) VALUES
('Plano Básico', 80.00),
('Plano Premium', 120.00),
('Plano VIP', 180.00);

-- Inserção de dados de nutricionistas
INSERT INTO nutricionistas (nome_nutricionista) VALUES
('João Farias'),
('Maria Souza'),
('Ana Clara');

-- Inserção de dados de PGC
INSERT INTO pgc (primeiro_pgc, ultimo_pgc) VALUES
('2023-01-15', '2024-06-10'),
('2022-05-10', '2024-05-01'),
('2024-03-20', '2024-06-15');

-- Inserção de dados de estado
INSERT INTO estado (estado) VALUES
('Ativo'),
('Inativo'),
('Suspenso');

-- Relacionamento de clientes com planos
INSERT INTO cliente_plano (cliente_id, plano_id) VALUES
(1, 2), -- Ana: Premium
(2, 3), -- Bruno: VIP
(3, 1), -- Carla: Básico
(4, 1), -- Daniel: Básico
(5, 2), -- Mariana: Premium
(6, 3), -- Gustavo: VIP
(7, 1), -- Sofia: Básico
(8, 2), -- Pedro: Premium
(9, 3), -- Julia: VIP
(10, 1); -- Lucas: Básico

-- Relacionamento de clientes com atividades
INSERT INTO cliente_atividade (cliente_id, atividade_id) VALUES
(1, 1), -- Ana: Musculação
(1, 3), -- Ana: Yoga
(2, 2), -- Bruno: Crossfit
(3, 1), -- Carla: Musculação
(4, 2), -- Daniel: Crossfit
(5, 3), -- Mariana: Yoga
(6, 1), -- Gustavo: Musculação
(6, 4), -- Gustavo: Zumba
(7, 5), -- Sofia: Pilates
(8, 2), -- Pedro: Crossfit
(9, 4), -- Julia: Zumba
(10, 1); -- Lucas: Musculação

-- Relacionamento de clientes com nutricionistas
INSERT INTO cliente_nutricionista (cliente_id, nutri_id) VALUES
(1, 1), -- Ana: João
(3, 1), -- Carla: João
(5, 2), -- Mariana: Maria
(7, 3); -- Sofia: Ana Clara

-- Relacionamento de clientes com PGC
INSERT INTO cliente_pgc (cliente_id, pgc_id) VALUES
(1, 1), -- Ana
(2, 2), -- Bruno
(3, 3); -- Carla

-- Relacionamento de clientes com estado
INSERT INTO cliente_estado (cliente_id, estado_id) VALUES
(1, 1), -- Ana: Ativo
(2, 1), -- Bruno: Ativo
(3, 1), -- Carla: Ativo
(4, 2), -- Daniel: Inativo
(5, 1), -- Mariana: Ativo
(6, 1), -- Gustavo: Ativo
(7, 1), -- Sofia: Ativo
(8, 3), -- Pedro: Suspenso
(9, 1), -- Julia: Ativo
(10, 2); -- Lucas: Inativo

-- ====================================================================
-- 6) CONSULTAS DE EXEMPLO
-- ====================================================================

-- 1) Qual o nome do cliente, o plano que ele assina e o preço desse plano?
SELECT
c.nome AS nome_cliente,
p.nome_plano,
p.preco_plano
FROM
clientes c
JOIN
cliente_plano cp ON c.cliente_id = cp.cliente_id
JOIN
planos p ON cp.plano_id = p.plano_id;

-- 2) Quais atividades o cliente 'Ana Silva' pratica?
SELECT
a.nome_atividade
FROM
clientes c
JOIN
cliente_atividade ca ON c.cliente_id = ca.cliente_id
JOIN
atividades a ON ca.atividade_id = a.atividade_id
WHERE
c.nome = 'Ana Silva';

-- 3) Quantos clientes estão em cada estado?
SELECT
e.estado,
COUNT(ce.cliente_id) AS total_clientes
FROM
estado e
JOIN
cliente_estado ce ON e.estado_id = ce.estado_id
GROUP BY
e.estado;

-- 4) Detalhes completos do cliente: nome, plano, atividades e se tem nutricionista
SELECT
c.nome AS nome_cliente,
p.nome_plano,
GROUP_CONCAT(DISTINCT a.nome_atividade SEPARATOR ', ') AS atividades,
CASE
WHEN cn.nutri_id IS NOT NULL THEN 'Sim'
ELSE 'Não'
END AS possui_nutricionista,
e.estado
FROM
clientes c
LEFT JOIN
cliente_plano cp ON c.cliente_id = cp.cliente_id
LEFT JOIN
planos p ON cp.plano_id = p.plano_id
LEFT JOIN
cliente_atividade ca ON c.cliente_id = ca.cliente_id
LEFT JOIN
atividades a ON ca.atividade_id = a.atividade_id
LEFT JOIN
cliente_nutricionista cn ON c.cliente_id = cn.cliente_id
LEFT JOIN
nutricionistas n ON cn.nutri_id = n.nutri_id
LEFT JOIN
cliente_estado ce ON c.cliente_id = ce.cliente_id
LEFT JOIN
estado e ON ce.estado_id = e.estado_id
GROUP BY
c.cliente_id, c.nome, p.nome_plano, e.estado;