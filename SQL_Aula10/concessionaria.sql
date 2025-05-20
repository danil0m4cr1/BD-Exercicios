DROP DATABASE IF EXISTS CarrosBD;

-- CRIAR BASE DE DADOS 
CREATE DATABASE CarrosBD;

-- ACESSAR A BASE DE DADOS QUE SERÁ USADA 
USE CarrosBD;

-- CRIAR TABELAS 
CREATE TABLE carros(
id INT not null,
marca VARCHAR(100),
modelo VARCHAR(100),
ano INT,
valor DECIMAL(10,2),
cor VARCHAR(100),
numero_Vendas INT,
PRIMARY KEY (id)
);

CREATE TABLE proprietario(
id INT not null,
nome VARCHAR(100),
id_carro INT not null,
PRIMARY KEY (id),
FOREIGN KEY (id)
	REFERENCES carros (id)
);

CREATE TABLE historico_preco(
id INT not null auto_increment primary key,
data_modificacao datetime,
id_carro INT not null,
valor_anterior float,
valor_novo float
);

INSERT INTO carros VALUES (
'1',
'Fiat',
'Marea',
'1999',
'15450.00',
'Vermelho',
'50000'
);

INSERT INTO carros VALUES (
'2',
'Fiat',
'Uno',
'1985',
'12500.00',
'Verde',
'100000'
);

INSERT INTO carros VALUES (
'3',
'Ford',
'Escort',
'1978',
'13240.00',
'Azul',
'500000'
);


INSERT INTO carros VALUES (
'4',
'Chevrolet',
'Chevette',
'1980',
'14650.00',
'Preto',
'6500000'
);

INSERT INTO carros VALUES (
'5',
'Fiat',
'Palip',
'2014',
'37650.00',
'Preto',
'620000'
);

INSERT INTO carros VALUES (
'6',
'Chevrolet',
'Meriva',
'2009',
'35650.00',
'Prata',
'240000'
);

INSERT INTO carros VALUES (
'7',
'Ford',
'EcoSport',
'2020',
'75000.00',
'Preto',
'490000'
);

INSERT INTO carros VALUES (
'8',
'Fiat',
'Mobi',
'2022',
'70000.00',
'Vermelho',
'480000'
);

INSERT INTO carros VALUES (
'9',
'Renault',
'Kwid',
'2023',
'72000.00',
'Verde',
'350000'
);

INSERT INTO carros VALUES (
'10',
'Toyota',
'Etios',
'2021',
'69000.00',
'Prata',
'480000'
);

INSERT INTO carros VALUES (
'11',
'Fiat',
'Mobi',
'2024',
'80000.00',
'Preto',
'5000'
);

ALTER TABLE proprietario ADD salario DECIMAL(10,2);

INSERT INTO proprietario VALUES (
'1',
'Jessica',
'1',
'1560.00'
);

INSERT INTO proprietario VALUES (
'2',
'Carol',
'3',
'2235.00'
);

INSERT INTO proprietario VALUES (
'3',
'Caique',
'1',
'3590.00'
);

-- Procedure que lista todos os proprietarios
DELIMITER $$
CREATE PROCEDURE ListaProprietarios()
BEGIN
	SELECT * FROM proprietario;
END $$
DELIMITER ;

-- Função que calcula o salário anual
DELIMITER $$
CREATE FUNCTION CalcularSalario()
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	DECLARE total DECIMAL(10,2);
	SET total = (SELECT SUM(salario) FROM proprietario) * 12;
    RETURN total;
END $$
DELIMITER ;

-- Procedure que insere dados de proprietários
DELIMITER $$
CREATE PROCEDURE InserirProprietarios(
	id INT,
	nome VARCHAR(100),
	id_carro INT,
    salario DECIMAL(10,2)
)
BEGIN
	INSERT INTO proprietario VALUES (
    id,
    nome,
    id_carro,
    salario
    );
END $$
DELIMITER ;

CALL InserirProprietarios(4, "Danilo", 4, 1650.00);
CALL ListaProprietarios();
SELECT CalcularSalario() as CSA;

-- Cria view de uma lista de proprietários
CREATE VIEW vw_proprietarios AS 
SELECT id, nome, id_carro 
FROM proprietario;

-- Cria view de uma lista de salário
CREATE VIEW vw_salario AS
SELECT salario
FROM proprietario;
