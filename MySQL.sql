-- Apagar o banco de dados 'sistema_proway' se existir esse banco de dados 
DROP DATABASE IF EXISTS sistema_proway;
-- Criar o banco de dados
CREATE DATABASE sistema_proway;

-- Definir o banco de dados que iremos utilizar
USE sistema_proway;

-- Consultar todos os bancos de dados dessa conexão
SHOW SCHEMAS;

-- Criar uma tabela chamada curso
CREATE TABLE curso (
	id INT, -- Coluna do tipo inteiro
    nome VARCHAR(45) -- Coluna do tipo texto que permite armazenar até 45 caracteres
);

-- Consultar os registros da tabela curso
SELECT id, nome FROM curso;

-- Consultar o que a tabela tem
DESCRIBE curso;

-- Null é utilizado para dizer que a coluna permite valor null
-- Not null é utilizado para dizer que a coluna não permite valor null
-- Coluna not null ela é obrigatória, ou seja, vc terá que informar valor no INSERT

-- Alterar o nome da tabela de curso para cursos
ALTER TABLE curso RENAME TO cursos;
-- Consultar os registros da tabela de cursos
SELECT id, nome FROM cursos;

-- Inserir um registro na tabela de cursos preenchendo as colunas de id e nome
INSERT INTO cursos (id, nome) VALUE (1, "Orlando");

-- Consultar os registros 
-- SELECT colunas FROM nome_tabela
SELECT id, nome FROM cursos;

-- Inserir dois registros na tabela de cursos
INSERT INTO cursos (id, nome) VALUE (2, "Python Fundamentos");
INSERT INTO cursos (id, nome) VALUE (3, "MySQL");

SELECT id, nome FROM cursos;

USE sistema_proway;
-- Atualizar na tabela de cursos o nome do 'Orlando' para 'CSS Fundamentos'
UPDATE cursos SET nome = 'CSS Fundamentos';

-- Restabelecer os dados dos registros que tinhamos modificados
UPDATE cursos SET nome = 'CSS Fundamentos' WHERE id = 1;
UPDATE cursos SET nome = 'Python Fundamentos' WHERE id = 2;
UPDATE cursos SET nome = 'MySQL' WHERE id = 3;
-- Consultar os registros da tabela de cursos
SELECT id, nome FROM cursos;


-- Inserir um registro errado
INSERT INTO cursos (id) VALUE (4);
-- Consultando todos os cursos
SELECT id, nome FROM cursos;
-- Consultar todos os cursos que o nome é null
SELECT id, nome FROM cursos WHERE nome IS NULL;
-- Consultar todos os cursos que o nome não é null
SELECT id, nome FROM cursos WHERE nome IS NOT NULL;

-- Apagar o registro errado
DELETE FROM cursos WHERE id = 4;

SELECT id, nome FROM cursos;

-- Adicionar coluna de duracao na tabela de cursos
ALTER TABLE cursos ADD COLUMN duracao TIME;
-- Adicionar coluna de link na tabela de cursos
ALTER TABLE cursos ADD COLUMN link VARCHAR(200);

SELECT id, nome, duracao, link FROM cursos;
-- Definir a duração do curso CSS FUndamentos
UPDATE cursos SET duracao = '20:00' WHERE id = 1;
-- Definir o link do curso CSS Fundamentos
UPDATE cursos SET link = 'https://www.proway.com.br/curso/fundamentos-em-css' WHERE id = 1;

-- Definir a duração, link do curso Python Fundamentos
UPDATE cursos SET 
	duracao = '20:00', 
    link = 'https://www.proway.com.br/curso/python-fundamentos'
    WHERE id = 2;

-- Consultar os cursos que não tem definido o link
SELECT id, nome, link FROM cursos WHERE link IS NULL;

USE sistema_proway;

CREATE TABLE Alunos (Id INT,Nome VARCHAR(50));

INSERT INTO Alunos (Id, Nome) VALUE (1, 'Matheus da Silva');
INSERT INTO Alunos (Id, Nome) VALUE (2, 'Isabela da Silva Souza');

SELECT Id,Nome FROM Alunos;

ALTER TABLE Alunos ADD COLUMN CPF CHAR(14);
UPDATE Alunos SET CPF ='123.456.780-10' WHERE Id = 1;
UPDATE Alunos SET CPF ='123.567.503-10' WHERE Id = 2;

SELECT Id,Nome,CPF FROM Alunos;

ALTER TABLE Alunos ADD COLUMN Nota1 DOUBLE;
UPDATE Alunos SET Nota1 = 7.5 WHERE Id = 1;
UPDATE Alunos SET Nota1 = 4.3 WHERE Id = 2;

ALTER TABLE Alunos ADD COLUMN Nota2 DOUBLE;
UPDATE Alunos SET Nota2 = 8.0 WHERE Id = 1;
UPDATE Alunos SET Nota2 = 1.0  WHERE Id = 2;

ALTER TABLE Alunos ADD COLUMN Nota3 DOUBLE;
UPDATE Alunos SET Nota3 = 9.95 WHERE Id = 1;
UPDATE Alunos SET Nota3 = 0 WHERE Id = 2;

SELECT Id,Nome,CPF,Nota1,Nota2,Nota3 FROM Alunos;

ALTER TABLE Alunos ADD COLUMN Data_nascimento DATE;
INSERT INTO Alunos (Id, Nome,Nota1,Nota2,Nota3,Data_nascimento) VALUE (3, 'Silvana da Souza Sena',6.5,6.1,7.0,'1972-02-28');
INSERT INTO Alunos (Id, Nome,CPF,Nota1,Nota2,Nota3,Data_nascimento) VALUE (4, 'Enzo Matheus','212.319.238-20',7,9,5.5,'2005-06-10');

SELECT Id,Nome,CPF,Nota1,Nota2,Nota3,Data_nascimento FROM Alunos;

USE sistema_proway;
CREATE TABLE Professores (Id INT,Nome VARCHAR(50));

SELECT Id,Nome FROM Professores;
DESCRIBE Professores;

INSERT INTO Professores (Id, Nome) VALUE (1, 'Ana Beatriz Santos');
INSERT INTO Professores (Id, Nome) VALUE (2, 'Ricardo Gomes');

ALTER TABLE Professores ADD COLUMN CPF CHAR(14);
UPDATE Professores SET CPF ='987.654.321-00' WHERE Id = 1;
UPDATE Professores SET CPF ='123.321.123-99' WHERE Id = 2;

ALTER TABLE Professores ADD COLUMN Salario DOUBLE;
UPDATE Professores SET Salario = 4500.75 WHERE Id = 1;
UPDATE Professores SET Salario = 5200.50 WHERE Id = 2;

ALTER TABLE Professores ADD COLUMN Data_admissao DATE;
UPDATE Professores SET Data_admissao = '2015-08-15' WHERE Id = 1;
UPDATE Professores SET Data_admissao = '2018-03-01' WHERE Id = 2;

ALTER TABLE Professores ADD COLUMN Disciplina VARCHAR(50);
UPDATE Professores SET Disciplina = 'Matemática' WHERE Id = 1;
UPDATE Professores SET Disciplina = 'História' WHERE Id = 2;

INSERT INTO Professores (Id, Nome,CPF,Salario,Data_admissao,Disciplina) VALUE (3, 'Fernando Oliveira','321.654.987-11',6100.00,'2020-01-10','Física');
INSERT INTO Professores (Id, Nome,CPF,Salario,Data_admissao,Disciplina) VALUE (4, 'Mariana Ribeiro','159.753.486-22',5800.25,'2019-05-20','Química');

SELECT Id,Nome,CPF,Salario,Data_admissao,Disciplina FROM Professores;

-- Consultar todos os alunos que tem data de nascimento definida
SELECT id, nome, data_nascimento FROM Alunos WHERE data_nascimento IS NOT NULL;

UPDATE Alunos SET data_nascimento = '1943-04-07' WHERE id = 1;
UPDATE Alunos SET data_nascimento = '2000-03-15' WHERE id = 2;

-- Consultar o ano de uma coluna do tipo DATE,DATETIME
SELECT nome, YEAR(data_nascimento) FROM Alunos;
-- Consultar o mês de uma coluna do tipo DATE,DATETIME
SELECT nome, MONTH(data_nascimento) FROM Alunos;
-- Consultar o dia de uma coluna do tipo DATE,DATETIME
SELECT nome, DAY(data_nascimento) FROM Alunos;
-- Consultar a hora HOUR(coluna)
-- Consultar a minuto MINUTE(coluna)
-- Consultar a segundos SECOND(coluna)

SELECT Id,Nome,CPF,Nota1,Nota2,Nota3,Data_nascimento FROM Alunos;

-- Consultar a média dos alunos
SELECT Id AS 'Código', # AS é um apelido para nomes
Nome AS 'Aluno',
(Nota1+Nota2+Nota3) / 3 AS 'Média'
FROM Alunos;

-- Ordenar os registros por nome em ordem crescente
SELECT Id, Nome FROM Alunos ORDER BY nome ASC; #ascendente
-- Ordenar os registros por nome em ordem decrescente
SELECT Id, Nome FROM Alunos ORDER BY nome DESC; #descendente

-- Consultar a quantidade de registros
SELECT COUNT(Id) FROM Alunos;
-- Consultar a menor nota 1
SELECT MIN(Nota1) FROM Alunos;
-- Consultar a maior nota 1
SELECT MAX(Nota1) FROM Alunos;
-- Consultar a soma das notas 1 
SELECT SUM(Nota1) FROM Alunos;
-- Consultar a média das notas 1
SELECT AVG(Nota1) FROM Alunos; # average -- média
-- Adicionar colun dissiplinas
ALTER TABLE Alunos ADD COLUMN dissiplinas varchar(30);
-- Alterar o nome da colinas ' dissiplinas' para 'disciplinas'
ALTER TABLE Alunos RENAME COLUMN dissiplinas TO Disciplinas;
-- Atualizar os dados dos 4 alunos preenchendo a nova coluna
UPDATE Alunos SET Disciplinas = 'Física' WHERE id = 1;
UPDATE Alunos SET Disciplinas = 'Matemática' WHERE id = 2;
UPDATE Alunos SET Disciplinas = 'Português' WHERE id = 3;
UPDATE Alunos SET Disciplinas = 'Física' WHERE id = 4;

-- Inserir 70 alunos novos
INSERT INTO Alunos (Id,Nome,CPF,Nota1,Nota2,Nota3,Data_nascimento, Disciplinas)
VALUES 
(5, 'Ana Clara Pereira', '123.123.456-20', 7.2, 8.4, 9.1, '2001-05-14', 'Língua Estrangeira Moderna'),
(6, 'Lucas Martins', '123.987.654-10', 6.5, 5.9, 7.8, '2003-10-23', 'Arte'),
(7, 'Juliana Costa', '123.876.543-00', 8.5, 9.0, 8.2, '2002-12-11', 'Educação Física'),
(8, 'Gabriel Souza', '123.432.198-40', 7.3, 6.8, 7.9, '2004-03-02', 'Física'),
(9, 'Beatriz Oliveira', '123.789.456-90', 9.1, 9.5, 9.3, '2003-01-29', 'Química'),
(10, 'Pedro Henrique Silva', '123.654.321-30', 6.2, 7.0, 6.5, '2000-08-19', 'Biologia'),
(11, 'Carla Mendes', '123.321.654-80', 7.8, 8.3, 7.7, '2001-11-09', 'Filosofia'),
(12, 'Rafael Lima', '123.876.987-60', 5.0, 6.2, 6.7, '2002-05-13', 'Sociologia'),
(13, 'Maria Fernanda Souza', '123.246.789-10', 7.5, 6.9, 8.0, '2003-07-04', 'Ensino Religioso'),
(14, 'João Pedro Santos', '123.563.249-90', 6.3, 7.2, 6.8, '2004-02-20', 'Língua Portuguesa'),
(15, 'Amanda Ribeiro', '123.654.987-50', 7.9, 8.7, 8.0, '2001-09-17', 'Matemática'),
(16, 'Vinícius Almeida', '123.098.765-20', 8.0, 8.9, 8.5, '2002-04-12', 'História'),
(17, 'Larissa Pereira', '123.321.987-10', 6.8, 6.7, 7.5, '2000-06-08', 'Geografia'),
(18, 'José Carlos Ferreira', '123.498.765-80', 5.4, 6.0, 5.8, '2004-11-03', 'Língua Estrangeira Moderna'),
(19, 'Bruna Silva', '123.567.890-60', 7.0, 7.5, 7.3, '2003-01-02', 'Arte'),
(20, 'Carlos Eduardo Costa', '123.678.123-30', 8.4, 8.6, 9.0, '2001-03-19', 'Educação Física'),
(21, 'Paula Ribeiro', '123.456.789-40', 6.9, 7.3, 7.8, '2002-07-25', 'Física'),
(22, 'Felipe Souza', '123.234.567-10', 8.0, 8.3, 7.5, '2000-12-14', 'Química'),
(23, 'Elisa Almeida', '123.321.654-70', 8.2, 7.8, 8.5, '2004-09-11', 'Biologia'),
(24, 'Rodrigo Santana', '123.543.210-60', 7.1, 7.4, 6.8, '2003-04-09', 'Filosofia'),
(25, 'Mariana Souza', '123.876.543-10', 6.5, 6.2, 7.6, '2000-02-03', 'Sociologia'),
(26, 'Thiago Silva', '123.987.654-30', 8.5, 9.0, 9.2, '2002-08-20', 'Ensino Religioso'),
(27, 'Júlia Costa', '123.234.567-90', 7.0, 7.2, 7.4, '2001-01-25', 'Língua Portuguesa'),
(28, 'André Ferreira', '123.543.876-20', 6.8, 6.5, 7.0, '2004-03-13', 'Matemática'),
(29, 'Lúcia Pereira', '123.765.432-50', 8.1, 8.4, 7.9, '2003-02-12', 'História'),
(30, 'Lucas Alves', '123.654.321-90', 9.0, 9.2, 8.8, '2002-06-17', 'Geografia'),
(31, 'Sofia Almeida', '123.321.654-90', 6.3, 6.9, 7.1, '2004-01-14', 'Língua Estrangeira Moderna'),
(32, 'Ricardo Santos', '123.987.654-70', 5.6, 6.0, 6.4, '2001-11-22', 'Arte'),
(33, 'Isabella Lima', '123.876.321-40', 7.2, 7.6, 7.4, '2000-05-15', 'Educação Física'),
(34, 'Eduardo Souza', '123.123.765-20', 8.3, 8.1, 7.9, '2004-04-22', 'Física'),
(35, 'Rita de Cássia Silva', '123.654.987-60', 6.7, 6.5, 7.2, '2003-09-05', 'Química'),
(36, 'Carlos Eduardo', '123.432.987-80', 8.2, 8.7, 8.5, '2002-02-14', 'Biologia'),
(37, 'Tatiane Costa', '123.567.123-40', 7.9, 8.0, 8.3, '2001-04-07', 'Filosofia'),
(38, 'Gustavo Souza', '123.432.765-10', 6.8, 6.4, 6.9, '2000-12-25', 'Sociologia'),
(39, 'Ricardo Alves', '123.765.432-10', 7.3, 7.5, 7.6, '2003-10-29', 'Ensino Religioso'),
(40, 'Vera Lucia Costa', '123.876.543-40', 8.5, 8.9, 9.0, '2004-11-09', 'Língua Portuguesa'),
(41, 'Marcos André Souza', '123.543.210-90', 6.9, 6.6, 7.1, '2002-09-18', 'Matemática'),
(42, 'José de Lima', '123.876.432-10', 7.1, 7.2, 7.5, '2000-01-14', 'História'),
(43, 'Gabriela Oliveira', '123.987.654-00', 7.8, 7.5, 8.0, '2004-08-21', 'Geografia'),
(44, 'Maria Clara Souza', '123.654.321-20', 8.0, 8.2, 7.9, '2001-07-17', 'Língua Estrangeira Moderna'),
(45, 'Felipe Rocha', '123.321.654-40', 6.4, 6.9, 7.0, '2002-12-09', 'Arte'),
(46, 'Tânia Santos', '123.765.432-40', 6.2, 5.8, 6.5, '2003-05-25', 'Educação Física'),
(47, 'Thiago Oliveira', '123.432.765-40', 7.3, 7.9, 7.5, '2001-08-03', 'Física'),
(48, 'Tatiane Almeida', '123.876.543-20', 8.6, 8.4, 8.1, '2004-07-22', 'Química'),
(49, 'Simone Costa', '123.234.567-40', 6.9, 7.0, 7.4, '2000-03-19', 'Biologia'),
(50, 'Leonardo Ferreira', '123.765.432-60', 8.5, 8.8, 8.2, '2002-11-04', 'Filosofia'),
(51, 'Eliane Pereira', '123.987.654-30', 7.7, 8.0, 8.1, '2003-04-29', 'Sociologia'),
(52, 'Daniel Oliveira', '123.432.876-30', 6.5, 7.3, 7.2, '2001-09-08', 'Ensino Religioso'),
(53, 'Marcela Souza', '123.234.765-60', 7.8, 7.5, 8.3, '2004-10-16', 'Língua Portuguesa'),
(54, 'Rogério Lima', '123.876.543-80', 6.6, 7.1, 6.8, '2002-05-19', 'Matemática'),
(55, 'Natália Costa', '123.654.321-70', 8.0, 7.9, 8.2, '2001-02-27', 'História'),
(56, 'José Augusto Souza', '123.321.654-50', 6.9, 7.0, 7.3, '2003-08-22', 'Geografia'),
(57, 'Aline Rocha', '123.543.210-80', 7.5, 7.7, 8.0, '2004-12-04', 'Língua Estrangeira Moderna'),
(58, 'Mariana Lima', '123.876.432-20', 8.2, 8.1, 7.9, '2000-04-16', 'Arte'),
(59, 'Victor Almeida', '123.432.876-80', 7.3, 7.5, 7.6, '2001-11-25', 'Educação Física'),
(60, 'Amanda Costa', '123.765.432-30', 6.8, 6.9, 7.0, '2004-06-02', 'Física'),
(61, 'Carlos Antônio Ribeiro', '123.987.654-50', 7.6, 7.3, 8.0, '2003-03-14', 'Química'),
(62, 'Andréa Oliveira', '123.432.765-60', 8.4, 8.6, 8.3, '2002-06-20', 'Biologia'),
(63, 'Renato Souza', '123.234.567-50', 6.3, 6.5, 7.0, '2001-07-01', 'Filosofia'),
(64, 'Cláudia Costa', '123.765.432-10', 7.9, 8.2, 7.6, '2000-09-13', 'Sociologia'),
(65, 'Beatriz Lima', '123.432.765-90', 8.5, 8.7, 8.4, '2004-10-01', 'Ensino Religioso'),
(66, 'Cláudio Pereira', '123.654.321-50', 7.4, 7.2, 7.5, '2003-12-05', 'Língua Portuguesa'),
(67, 'Sílvia Almeida', '123.987.654-40', 6.7, 7.3, 7.1, '2001-01-30', 'Matemática'),
(68, 'Fábio Souza', '123.432.765-10', 7.9, 8.1, 8.0, '2002-04-18', 'História'),
(69, 'Elaine Ribeiro', '123.765.432-80', 8.3, 8.5, 8.2, '2003-07-22', 'Geografia'),
(70, 'Joaquim Ferreira', '123.543.210-60', 6.6, 6.9, 7.0, '2004-03-29', 'Língua Estrangeira Moderna');
SELECT Id,Nome, Disciplinas FROM Alunos;
-- Consular os alunos em ordem alfabetica por disciplinas
SELECT Id, Disciplinas,Nome FROM Alunos ORDER BY Disciplinas ASC, Nome ASC;
-- Consultar os alunos da disciplina Física ordenados por nome
SELECT Nome FROM Alunos WHERE Disciplinas = 'Física' ORDER BY Nome ASC;
-- Consultar a quantidade de alunos da disciplina de Física
SELECT COUNT(Nome) FROM Alunos WHERE Disciplinas = 'Física';
-- Consultar o nome e a quantidade de caracteres do nome
SELECT Nome, LENGTH(Nome) FROM Alunos ORDER BY LENGTH(Nome) DESC;
-- Consultar o nome em caixa alta
SELECT UPPER(Nome) FROM ALunos;
-- Consultar o nome em caixa baixa
SELECT LOWER(Nome) FROM Alunos;
-- Consultar o nome e disciplinas concatenadas
SELECT CONCAT(Nome," -> ", Disciplinas) FROM Alunos;
-- Consultar no seguinte formato: Aluno nasceu no dia do mês de ano
SELECT CONCAT( Nome, " nasceu no dia ", DAY(Data_nascimento), " do mês ", MONTH(Data_nascimento), " do ano de ", YEAR(Data_nascimento), "." ) AS 'Mensagem' FROM Alunos;
-- Consultar AND 
-- Consultar OR
-- Consultar nome exato
-- Consultar nome começa com 
-- Consultar nome termina com
-- Consultar nome contém em qualquer parte
-- Consultar a data de nascimento formatada
-- Consultar os alunos limitando a quantidade
-- Consultar os alunos apresentando a primeira página
-- Consultar os alunos apresentando a segunda página