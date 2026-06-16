-- Banco: INF102-Empresa
-- Tabelas: cargo, setor, funcionario

DROP TABLE IF EXISTS funcionario CASCADE;
DROP TABLE IF EXISTS cargo CASCADE;
DROP TABLE IF EXISTS setor CASCADE;

CREATE TABLE cargo (
    codcargo  SERIAL PRIMARY KEY,
    nomecargo VARCHAR(100) NOT NULL
);

CREATE TABLE setor (
    codsetor  SERIAL PRIMARY KEY,
    nomesetor VARCHAR(100) NOT NULL
);

CREATE TABLE funcionario (
    matricula     INT PRIMARY KEY,
    nome          VARCHAR(100)   NOT NULL,
    salario       NUMERIC(10, 2),
    data_admissao DATE DEFAULT CURRENT_DATE,
    codcargo      INT REFERENCES cargo(codcargo),
    codsetor      INT REFERENCES setor(codsetor)
);

-- Dados de exemplo
INSERT INTO cargo (nomecargo) VALUES
    ('Analista de Sistemas'),
    ('Gerente'),
    ('Auxiliar');

INSERT INTO setor (nomesetor) VALUES
    ('Tecnologia da Informacao'),
    ('Recursos Humanos'),
    ('Financeiro');

INSERT INTO funcionario (matricula, nome, salario, codcargo, codsetor) VALUES
    (101, 'Ana Souza',    7200.00, 2, 2),
    (102, 'Bruno Lima',   5500.00, 1, 1),
    (103, 'Carla Mendes', 2800.00, 3, 3);