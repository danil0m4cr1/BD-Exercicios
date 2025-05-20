/* Criação do banco de dados */
DROP DATABASE IF EXISTS sistemafabrica;

CREATE DATABASE sistemafabrica;

USE sistemafabrica;

/* Criação das tabelas */
CREATE TABLE Fornecedores (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100),
	Contato VARCHAR(100)
);

CREATE TABLE Clientes (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Nome VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE Estoque (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Produto VARCHAR(100),
	Quantidade INT,
	ID_Fornecedor INT,
	FOREIGN KEY (ID_Fornecedor) 
		REFERENCES Fornecedores(ID)
);

CREATE TABLE Pedidos (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Produto VARCHAR(100),
	Quantidade INT,
	ID_Cliente INT,
	Status VARCHAR(50) DEFAULT 'Pendente',
	DataPedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (ID_Cliente) 
		REFERENCES Clientes(ID)
);

CREATE TABLE Historico_Pedidos (
	ID INT PRIMARY KEY AUTO_INCREMENT,
	Produto VARCHAR(100),
	Quantidade INT,
	ID_Cliente INT,
	Status VARCHAR(50),
	DataPedido TIMESTAMP,
	FOREIGN KEY (ID_Cliente) 
		REFERENCES Clientes(ID)
);

/* VIEW de rastreio de fornecedores */
CREATE VIEW vw_rastrear_fornecedores AS
SELECT f.Nome, e.Produto, e.Quantidade
FROM Fornecedores f
JOIN Estoque e ON e.ID_FORNECEDOR = f.ID;

/* PROCEDURE de inserção de clientes */
DELIMITER $$
CREATE PROCEDURE InserirCliente (
	IN p_Nome VARCHAR(50),
    IN p_Email VARCHAR(50)
)
BEGIN
	INSERT INTO Clientes (Nome, Email) 
    VALUES (p_Nome, p_Email);
END $$
DELIMITER ;

/* PROCEDURE de registro de histórico de pedido */
DELIMITER $$
CREATE PROCEDURE sp_historico_pedido (
    IN p_ID_Pedido INT
)
BEGIN
    DECLARE v_Produto VARCHAR(100);
    DECLARE v_Quantidade INT;
    DECLARE v_ID_Cliente INT;
    DECLARE v_Status VARCHAR(50);
    DECLARE v_DataPedido TIMESTAMP;

	/* Pega os dados do pedido atual */
    SELECT Produto, Quantidade, ID_Cliente, Status, DataPedido
    INTO v_Produto, v_Quantidade, v_ID_Cliente, v_Status, v_DataPedido
    FROM Pedidos
    WHERE ID = p_ID_Pedido;

    /* Insere no histórico */
    INSERT INTO Historico_Pedidos (Produto, Quantidade, ID_Cliente, Status, DataPedido)
    VALUES (v_Produto, v_Quantidade, v_ID_Cliente, v_Status, v_DataPedido);
END $$
DELIMITER ;

/* Inserindo informações */
INSERT INTO Fornecedores (Nome, Contato) VALUES
('Tech Distribuidora Ltda', 'contato@techdistribuidora.com.br'),
('Global Eletrônicos', 'vendas@globaleletronicos.com'),
('ABC Importações', 'abc@importacoes.com');

INSERT INTO Clientes (Nome, Email) VALUES
('Carlos Silva', 'carlos.silva@email.com'),
('Fernanda Oliveira', 'fernanda.oliveira@email.com'),
('João Pereira', 'joao.pereira@email.com');

INSERT INTO Estoque (Produto, Quantidade, ID_Fornecedor) VALUES
('Mouse Óptico USB', 150, 1),
('Teclado Mecânico RGB', 80, 2),
('Monitor LED 24"', 40, 3),
('HD Externo 1TB', 60, 1);

INSERT INTO Pedidos (Produto, Quantidade, ID_Cliente, Status) VALUES
('Mouse Óptico USB', 2, 1, 'Pendente'),
('Teclado Mecânico RGB', 1, 2, 'Enviado'),
('Monitor LED 24"', 1, 3, 'Pendente');

/* Exemplo de funcionamento da VIEW de rastreio de fornecedores */
SELECT * FROM vw_rastrear_fornecedores;

/* Exemplo de funcionamento da PROCEDURE de inserção de clientes */
CALL InserirCliente('Danilo Macri da Silva', 'teste@gmail.com');
SELECT * FROM Clientes;

/* Exemplo de funcionamento da PROCEDURE de registro de histórico de pedidos */
CALL sp_historico_pedido(2);
SELECT * FROM Historico_Pedidos;
