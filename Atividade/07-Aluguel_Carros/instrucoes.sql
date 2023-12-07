--criando tabelas--
CREATE TABLE "tb_cliente"(
"cliente_id" INTEGER,
"Nome" TEXT NOT NULL,
"CNH" TEXT ,
"Telefone" TEXT,
PRIMARY KEY ("cliente_id" AUTOINCREMENT)
);

CREATE TABLE "tb_veiculo"(
"veiculo_id" INTEGER,
"Modelo" TEXT NOT NULL,
"Ano" TEXT NOT NULL,
"Placa" TEXT NOT NULL,
"Disponibilidade" NOT NULL,
PRIMARY KEY ("veiculo_id" AUTOINCREMENT)
);

CREATE TABLE "tb_aluguel"(
"aluguel_id" INTEGER ,
"cliente_id" INTEGER NOT NULL,
"veiculo_id" INTEGER NOT NULL,
"data_inicio" TEXT NOT NULL,
"data_fim" TEXT NOT NULL,
PRIMARY KEY ("aluguel_id" AUTOINCREMENT),
FOREIGN KEY ("cliente_id") REFERENCES tb_cliente ("cliente_id"),
FOREIGN KEY ("veiculo_id") REFERENCES tb_veiculo ("veiculo_id")
);

--Inserção de Dados

INSERT INTO "tb_cliente" (Nome, CNH, Telefone) VALUES
('João Silva', '12345678901', '12345-6789'),
('Maria Oliveira', '12345678902', '12345-6790'),
('Paulo Ricardo', '12345678903', '12345-6791'),
('Amanda Vieira', '12345678904', '12345-6792'),
('Gabriel Baptista', '12345678905', '12345-6793'),
('Carlos de Almeida', '12345678906', '12345-6794'),
('Samantha Alves', '12345678907', '12345-6795'),
('Suellen Souza', '12345678908', '12345-6796'),
('Emilly Pereira', '12345678909', '12345-6797'),
('Isabelly Cardoso', '12345678910', '12345-6798');

INSERT INTO "tb_veiculo" (Modelo, Ano, Placa, Disponibilidade)
VALUES
('Fiat Uno', '2015', 'ABC-1234', 'Disponivel'),
('Volkswagen Gol', '2018', 'DEF-5678' ,'Disponivel'),
('Ford Ka', '2019', 'DEF-5678', 'alugado'),
('Chevrolet Onix', '2020', 'ABC-1234' ,'Disponivel'),
('Honda Civic', '2017', 'MNO-7890', 'alugado'),
('Toyota Corolla', '2021', ' PQR-1234', 'Disponivel'),
(' Hyundai HB20', '2022', 'STU-5678' ,'Disponivel'),
('Renault Sandero', '2016', 'VWX-9012' ,'alugado');

INSERT INTO "tb_aluguel" (cliente_id, veiculo_id, data_inicio, data_fim)
VALUES
('1', '2', '2023-08-01', '2023-09-30'),
('2' ,'4', '2023-05-01', '2023-05-02'),
('3' ,'6' ,'2023-04-01', '2023-06-02'),
('4' ,'8', '2023-07-01', '2023-09-13'),
('5', '7', '2023-08-01', '2023-09-02'),
('6' ,'2' ,'2023-08-01', '2023-09-18'),
('7' ,'5' ,'2023-08-01', '2023-09-02'),
('8' ,'3', '2023-09-01', '2023-10-08'),
('9' ,'7' ,'2023-08-01' ,'2023-10-02'),
('10', '1', '2023-10-01' ,'2023-12-02');

--Consultar Dados: Questão 5

SELECT * FROM tb_cliente WHERE Telefone = "12345-6796";	
SELECT * FROM tb_cliente WHERE CNH = "12345678904";	
SELECT Nome, CNH FROM tb_cliente;	

--Consultar Dados: Questão 6

SELECT * FROM tb_veiculo WHERE Ano = "2020";	
SELECT * FROM tb_veiculo WHERE veiculo_id = "7";	
SELECT * FROM tb_veiculo WHERE Disponibilidade= "alugado";	

--INNER JOIN: Questão 7

SELECT
	tb_cliente.Nome,
	tb_cliente.CNH,
	tb_veiculo.Modelo,
	tb_veiculo.Placa,
	tb_veiculo.Disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_fim,
	tb_aluguel.data_inicio
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id

--INNER JOIN: Questão 8

SELECT
	tb_cliente.Nome,
	tb_cliente.CNH,
	tb_veiculo.Modelo,
	tb_veiculo.Placa,
	tb_veiculo.Disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_fim,
	tb_aluguel.data_inicio
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
	
	WHERE 
	tb_veiculo.Disponibilidade = "Disponivel";


--INNER JOIN: Questão 9

SELECT
	tb_cliente.Nome,
	tb_cliente.CNH,
	tb_veiculo.Modelo,
	tb_veiculo.Placa,
	tb_veiculo.Disponibilidade,
	tb_aluguel.aluguel_id,
	tb_aluguel.data_fim,
	tb_aluguel.data_inicio
FROM
	tb_aluguel
INNER JOIN
	tb_cliente ON tb_cliente.cliente_id = tb_aluguel.cliente_id
INNER JOIN
	tb_veiculo ON tb_veiculo.veiculo_id = tb_aluguel.veiculo_id
	
	WHERE 
	tb_veiculo.Disponibilidade = "alugado";

--Fazendo alterações: Questão 10

UPDATE tb_cliente
SET Telefone = "12345-6722"
WHERE cliente_id = 1;

UPDATE tb_cliente
SET Nome = "Maria dos Anjos"
WHERE cliente_id = 2;

UPDATE tb_cliente
SET Telefone = "19945-6722"
WHERE cliente_id = 3;

UPDATE tb_cliente
SET CNH = "987654321"
WHERE cliente_id = 4;

UPDATE tb_cliente
SET Nome = "Paulo Seixas"
WHERE cliente_id = 5;

--Fazendo alterações: Questão 11

UPDATE tb_veiculo
SET Ano = "2025"
WHERE veiculo_id = 1;

UPDATE tb_veiculo
SET Disponibilidade = "alugado"
WHERE veiculo_id = 2;

UPDATE tb_veiculo
SET Disponibilidade = "alugado"
WHERE veiculo_id = 3;

UPDATE tb_veiculo
SET Ano = "2018"
WHERE veiculo_id = 4;

UPDATE tb_veiculo
SET Placa = "HNZ-581"
WHERE veiculo_id = 5;

--Fazendo alterações: Questão 12

DELETE FROM tb_aluguel WHERE aluguel_id = 1;

DELETE FROM tb_aluguel WHERE aluguel_id = 5;

DELETE FROM tb_aluguel WHERE aluguel_id = 4;

DELETE FROM tb_aluguel WHERE aluguel_id = 9;

DELETE FROM tb_aluguel WHERE aluguel_id = 3;


