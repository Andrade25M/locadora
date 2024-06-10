CREATE DATABASE IF NOT EXISTS locadora;

USE locadora;

CREATE TABLE Veiculos (
    codigo_veiculo INT PRIMARY KEY,
    modelo VARCHAR(100),
    cor VARCHAR(50),
    placa VARCHAR(10) UNIQUE,
    diaria DECIMAL(10, 2)
);

CREATE TABLE Clientes (
    cpf VARCHAR(15) PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE
);

CREATE TABLE Locacoes (
    codigo_locacao INT PRIMARY KEY,
    codigo_veiculo INT,
    cpf VARCHAR(15),
    dias INT,
    total DECIMAL(10, 2),
    FOREIGN KEY (codigo_veiculo) REFERENCES Veiculos(codigo_veiculo),
    FOREIGN KEY (cpf) REFERENCES Clientes(cpf)
);

INSERT INTO Veiculos (codigo_veiculo, modelo, cor, placa, diaria) VALUES
(101, 'Fusca', 'Preto', 'WER-3456', 30.00),
(102, 'Variante', 'Rosa', 'FDS-8384', 60.00),
(103, 'Comodoro', 'Preto', 'CVB-9933', 20.00),
(104, 'Deloriam', 'Azul', 'FGH-2256', 80.00),
(105, 'Brasília', 'Amarela', 'DDI-3948', 45.00);

INSERT INTO Clientes (cpf, nome, data_nascimento) VALUES
('123.456.789-01', 'Ariano Suassuna', '1022-05-21'),
('543.765.987-23', 'Grace Hopper', '2002-04-29'),
('987.654.231-90', 'Richard Feynman', '2001-10-12'),
('432.765.678-67', 'Edgar Poe', '1998-12-14'),
('927.384.284-44', 'Gordon Freeman', '1984-11-26');

INSERT INTO Locacoes (codigo_locacao, codigo_veiculo, cpf, dias, total) VALUES
(1, 101, '123.456.789-01', 3, 90.00),
(2, 102, '543.765.987-23', 7, 420.00),
(3, 103, '987.654.231-90', 1, 20.00),
(4, 104, '432.765.678-67', 3, 240.00),
(5, 105, '927.384.284-44', 7, 315.00);

CREATE VIEW DetalhesLocacoes AS
SELECT L.codigo_locacao, V.modelo AS veiculo, V.cor, V.placa, V.diaria, C.nome AS cliente, C.cpf, C.data_nascimento, L.dias, L.total
FROM Locacoes L
INNER JOIN Veiculos V ON L.codigo_veiculo = V.codigo_veiculo
INNER JOIN Clientes C ON L.cpf = C.cpf;

SELECT * FROM locadora.detalheslocacoes;
