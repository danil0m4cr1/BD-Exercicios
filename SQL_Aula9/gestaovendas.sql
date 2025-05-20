DROP DATABASE IF EXISTS GestaoVendas;
CREATE DATABASE GestaoVendas;

USE GestaoVendas;

CREATE TABLE Cliente (
    cliente_id INT PRIMARY KEY,
    nome VARCHAR(100),
    cpf CHAR(11),
    email VARCHAR(100),
    telefone VARCHAR(15)
);

CREATE TABLE Produto (
    produto_id INT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    estoque INT
);

CREATE TABLE Vendedor (
    vendedor_id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    salario DECIMAL(10, 2)
);

CREATE TABLE Venda (
    venda_id INT PRIMARY KEY,
    cliente_id INT,
    vendedor_id INT,
    data_venda DATE,
    total DECIMAL(10 , 2 ),
    FOREIGN KEY (cliente_id)
        REFERENCES Cliente (cliente_id),
    FOREIGN KEY (vendedor_id)
        REFERENCES Vendedor (vendedor_id)
);

CREATE TABLE ItemVenda (
    item_id INT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10 , 2 ),
    FOREIGN KEY (venda_id)
        REFERENCES Venda (venda_id),
    FOREIGN KEY (produto_id)
        REFERENCES Produto (produto_id)
);

INSERT INTO Cliente VALUES ('123', 'BIANCA MARIA PEDROSA', '12345678901', 'biancamariapedrosa@gmail.com', '123456789');
INSERT INTO Cliente VALUES ('124', 'JOÃO CARLOS DA SILVA', '98765432100', 'joaocarlos@gmail.com', '987654321');
INSERT INTO Cliente VALUES ('125', 'MARIA FERNANDA ALMEIDA', '11122233344', 'mariafernanda.almeida@gmail.com', '111222333');
INSERT INTO Cliente VALUES ('126', 'LUCAS HENRIQUE MOURA', '55566677788', 'lucasmoura@hotmail.com', '555666777');
INSERT INTO Cliente VALUES ('127', 'ANA BEATRIZ OLIVEIRA', '99988877766', 'ana.oliveira@gmail.com', '999888777');
INSERT INTO Cliente VALUES ('128', 'CARLOS EDUARDO RAMOS', '44455566677', 'carlosramos@yahoo.com', '444555666');
INSERT INTO Cliente VALUES ('129', 'FERNANDA COSTA LIMA', '33322211100', 'fernandacosta@hotmail.com', '333222111');
INSERT INTO Cliente VALUES ('130', 'RAFAEL DOS SANTOS', '77788899900', 'rafael.santos@gmail.com', '777888999');
INSERT INTO Cliente VALUES ('002', 'PRISCILA ANDRADE REIS', '88877766655', 'priscila.reis@gmail.com', '888777666');
INSERT INTO Cliente VALUES ('132', 'DIEGO MORAES SOUZA', '22233344455', 'diegosouza@hotmail.com', '222333444');
 
INSERT INTO Produto VALUES (1, 'Notebook Dell Inspiron 15', 3499.99, 25);
INSERT INTO Produto VALUES (2, 'Smartphone Samsung Galaxy S21', 2599.90, 40);
INSERT INTO Produto VALUES (3, 'Monitor LG 24"', 799.90, 30);
INSERT INTO Produto VALUES (4, 'Teclado Mecânico Redragon', 299.99, 50);
INSERT INTO Produto VALUES (5, 'Mouse Logitech MX Master 3', 399.90, 45);
INSERT INTO Produto VALUES (6, 'HD Externo 1TB Seagate', 349.90, 20);
INSERT INTO Produto VALUES (7, 'Impressora HP DeskJet 3776', 449.99, 15);
INSERT INTO Produto VALUES (8, 'Cadeira Gamer ThunderX3', 99.90, 10);
INSERT INTO Produto VALUES (9, 'Fone de Ouvido JBL Tune 510BT', 99.00, 35);
INSERT INTO Produto VALUES (10, 'Webcam Logitech C920', 499.90, 18);
 
INSERT INTO Vendedor VALUES (1, 'Lucas Almeida', 'lucas.almeida@empresa.com', 2900.00);
INSERT INTO Vendedor VALUES (2, 'Marina Costa', 'marina.costa@empresa.com', 3000.00);
INSERT INTO Vendedor VALUES (3, 'Carlos Mendes', 'carlos.mendes@empresa.com', 2000.00);
INSERT INTO Vendedor VALUES (4, 'Amanda Rocha', 'amanda.rocha@empresa.com', 1400.00);
INSERT INTO Vendedor VALUES (5, 'Juliana Freitas', 'juliana.freitas@empresa.com', 2500.00);
INSERT INTO Vendedor VALUES (6, 'Thiago Nunes', 'thiago.nunes@empresa.com', 3100.00);
INSERT INTO Vendedor VALUES (7, 'Fernanda Lima', 'fernanda.lima@empresa.com', 3400.00);
INSERT INTO Vendedor VALUES (8, 'Eduardo Silveira', 'eduardo.silveira@empresa.com', 3000.00);
INSERT INTO Vendedor VALUES (9, 'Patrícia Andrade', 'patricia.andrade@empresa.com', 3200.00);
INSERT INTO Vendedor VALUES (10, 'Rodrigo Pires', 'rodrigo.pires@empresa.com', 3150.00);
 
INSERT INTO Venda VALUES (1, 124, 1, '2023-04-01', 799.90);
INSERT INTO Venda VALUES (2, 125, 3, '2022-04-02', 2599.90);
INSERT INTO Venda VALUES (3, 126, 2, '2024-04-03', 3499.99);
INSERT INTO Venda VALUES (4, 127, 4, '2024-04-04', 229.90);
INSERT INTO Venda VALUES (5, 128, 5, '2024-04-05', 1299.00);
INSERT INTO Venda VALUES (6, 129, 6, '2023-04-06', 449.99);
INSERT INTO Venda VALUES (7, 130, 7, '2022-04-07', 399.90);
INSERT INTO Venda VALUES (8, 002, 8, '2023-04-08', 499.90);
INSERT INTO Venda VALUES (9, 132, 9, '2025-04-09', 299.99);
INSERT INTO Venda VALUES (10, 124, 10, '2024-04-10', 229.90);
 
INSERT INTO ItemVenda VALUES (1, 1, 3, 1, 799.90);
INSERT INTO ItemVenda VALUES (2, 2, 2, 1, 2599.90);
INSERT INTO ItemVenda VALUES (3, 3, 1, 1, 3499.99);
INSERT INTO ItemVenda VALUES (4, 4, 9, 1, 229.90);
INSERT INTO ItemVenda VALUES (5, 5, 8, 1, 1299.00);
INSERT INTO ItemVenda VALUES (6, 6, 7, 1, 449.99);
INSERT INTO ItemVenda VALUES (7, 7, 5, 1, 399.90);
INSERT INTO ItemVenda VALUES (8, 8, 10, 1, 499.90);
INSERT INTO ItemVenda VALUES (9, 9, 4, 1, 299.99);
INSERT INTO ItemVenda VALUES (10, 10, 9, 1, 229.90);

/*1)*/ SELECT * FROM Cliente; 
/*2)*/ SELECT nome FROM Produto;
/*3)*/ SELECT * FROM Produto WHERE preco > 100;
/*4)*/ SELECT nome FROM Cliente;
/*5)*/ SELECT nome FROM Cliente UNION SELECT nome FROM Produto;
/*6)*/ SELECT nome, COUNT(*) FROM Cliente GROUP BY nome;
/*7)*/ SELECT nome, COUNT(*) FROM Produto GROUP BY nome;
/*8)*/ SELECT venda_id, COUNT(*) FROM Venda WHERE data_venda LIKE '2024%' GROUP BY venda_id;
/*9)*/ SELECT total, COUNT(*) FROM Venda GROUP BY total;
/*10)*/ SELECT SUM(total) FROM Venda WHERE vendedor_id = 5;
/*11)*/ SELECT * FROM Venda WHERE cliente_id = 124;
/*12)*/ SELECT SUM(total) FROM Venda;
/*13)*/ SELECT nome, COUNT(*) FROM Vendedor WHERE salario > 3000 GROUP BY nome;
/*14)*/ SELECT nome, COUNT(*) FROM Produto WHERE preco > 100 GROUP BY nome;
/*15)*/ SELECT SUM(total) FROM Venda WHERE cliente_id = 002;