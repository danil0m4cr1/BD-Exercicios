DROP DATABASE IF EXISTS SistemaAcademico;
CREATE DATABASE SistemaAcademico;
USE SistemaAcademico;

CREATE TABLE Curso (
	CodCurso CHAR(3) NOT NULL,
    Nome VARCHAR(20),
    Mensalidade NUMERIC(10,2),
		PRIMARY KEY (CodCurso)
);

CREATE TABLE Aluno (
	RA CHAR(9) NOT NULL,
    RG CHAR(9) NOT NULL,
    Nome VARCHAR(30),
    CodCurso CHAR (3),
		PRIMARY KEY (RA),
		FOREIGN KEY (CodCurso) REFERENCES Curso (CodCurso)
);

CREATE TABLE Disciplina (
	CodDisc CHAR (5) NOT NULL,
    Nome CHAR(30),
    CodCurso CHAR (3),
    NroCreditos CHAR(4),
		PRIMARY KEY (CodDisc),
		FOREIGN KEY (CodCurso) REFERENCES Curso (CodCurso)
);

CREATE TABLE Boletim (
	RA CHAR(9) NOT NULL,
    CodDisc CHAR(4) NOT NULL,
    Nota DECIMAL(10,2),
		PRIMARY KEY (RA, CodDisc),
		FOREIGN KEY (RA) REFERENCES Aluno (RA),
		FOREIGN KEY (CodDisc) REFERENCES Disciplina (CodDisc)
);

INSERT INTO Curso VALUES ('AS', 'ANALISE E DESEN SIS', 1000);
INSERT INTO Curso VALUES ('CC', 'CIENCIA DA COMPUT', 950);
INSERT INTO Curso VALUES ('SI', 'SISTEMAS DE INFOR', 800);

INSERT INTO Aluno VALUES ('123', '12343', 'BIANCA MARIA PEDROSA', 'AS');
INSERT INTO Aluno VALUES ('212', '21234', 'TATIANE CITTON', 'AS');
INSERT INTO Aluno VALUES ('221', '22145', 'ALEXANDRE PEDROSA', 'CC');
INSERT INTO Aluno VALUES ('231', '23144', 'ALEXANDRE MONTEIRO', 'CC');
INSERT INTO Aluno VALUES ('321', '32111', 'MARCIA RIBEIRO', 'CC');
INSERT INTO Aluno VALUES ('661', '66123', 'JUSSARA MARANDOLA', 'SI');
INSERT INTO Aluno VALUES ('765', '76512', 'WALTER RODRIGUES', 'SI');
 
INSERT INTO Disciplina VALUES ('BD', 'BANCO DE DADOS', 'CC', 4);
INSERT INTO Disciplina VALUES ('BDA', 'BANCO DE DADOS AVANCADOS', 'CC', 6);
INSERT INTO Disciplina VALUES ('BDOO', 'BANCO DE DADOS O OBJETOS', 'SI', 4);
INSERT INTO Disciplina VALUES ('BDS', 'SISTEMAS DE BANCO DE DADOS', 'AS', 4);
INSERT INTO Disciplina VALUES ('DBD', 'DESENVOLVIMENTO BANCO DE DADOS', 'SI', 6);
INSERT INTO Disciplina VALUES ('IBD', 'INTRODUCAO A BANCO DE DADOS', 'AS', 2);
 
INSERT INTO Boletim VALUES ('123', 'BDS', 10);
INSERT INTO Boletim VALUES ('212', 'IBD', 7.5);
INSERT INTO Boletim VALUES ('231', 'BD', 7.5);
INSERT INTO Boletim VALUES ('231', 'BDA', 9.6);
INSERT INTO Boletim VALUES ('661', 'DBD', 8);
INSERT INTO Boletim VALUES ('765', 'DBD', 6);

SELECT Nome, COUNT(*) FROM Disciplina GROUP BY Nome;
SELECT Nome, COUNT(*) FROM Aluno GROUP BY Nome;
SELECT Nome FROM Curso;