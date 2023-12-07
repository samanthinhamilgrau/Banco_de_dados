CREATE TABLE "tb_pneu" (
	"serie_pneu"INTEGER,
	"marca"	TEXT,
	"modelo"	TEXT,
	"dimensoes"	TEXT,
	"quantidade" INTEGER,

	PRIMARY KEY("serie_pneu" AUTOINCREMENT)
);

CREATE TABLE "tb_clientes" (
    "cod_cliente" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT,
    "CPF" INTEGER,
    "telefone" TEXT,
    "rua" TEXT,
    "numero" TEXT,
    "cep" TEXT,
    "complemento" TEXT,
    "bairro" TEXT,
    "cidade" TEXT,
    "estado" TEXT
);

CREATE TABLE "tb_servicos" (
    "cod_servico" INTEGER PRIMARY KEY AUTOINCREMENT,
    "ordem" TEXT,
    "data" TEXT,
    "valor" TEXT,
    "tipo" TEXT,
    "serie_pneu" INTEGER,
    "cod_cliente" TEXT,
	FOREIGN KEY("serie_pneu") REFERENCES "tb_pneu"("serie_pneu"),
	FOREIGN KEY("cod_cliente") REFERENCES "tb_clientes"("cod_cliente")
);

-------------------------------------------------------------------------------

INSERT INTO tb_pneu (marca, modelo, dimensoes, quantidade) 
VALUES
('Michelin', 'Primacy 4', '205/55R16', 100),
('Goodyear', 'Eagle F1', '225/45R17', 75),
('Pirelli', 'P Zero', '245/40R18', 50),
('Continental', 'ContiSportContact 5', '195/65R15', 120),
('Bridgestone', 'Potenza RE71R', '225/50R16', 90),
('Hankook', 'Ventus V12 Evo2', '235/40R18', 60),
('Dunlop', 'Sport Maxx RT', '215/55R17', 80),
('Firestone', 'Firehawk Indy 500', '245/45R20', 40),
('Toyo', 'Proxes 4 Plus', '205/50R17', 110),
('Yokohama', 'ADVAN Neova AD08R', '225/40R18', 70);

INSERT INTO tb_clientes (nome, telefone, rua, numero, complemento, bairro, cidade, estado) VALUES
('João Silva', '123456789', 'Rua A', 123, 'Apto 101', 'Centro', 'Cidade1', 'UF1'),
('Maria Oliveira', '987654321', 'Rua B', 456, 'Casa 2', 'Bairro2', 'Cidade2', 'UF2'),
('Carlos Santos', '111222333', 'Rua C', 789, NULL, 'Bairro3', 'Cidade3', 'UF3'),
('Ana Pereira', '444555666', 'Rua D', 101, 'Sala 3', 'Bairro4', 'Cidade4', 'UF4'),
('Fernanda Souza', '777888999', 'Rua E', 202, NULL, 'Bairro5', 'Cidade5', 'UF5');

UPDATE tb_clientes SET CPF = '123.456.789-09' WHERE nome = 'João Silva';
UPDATE tb_clientes SET CPF = '987.654.321-98' WHERE nome = 'Maria Oliveira';
UPDATE tb_clientes SET CPF = '111.222.333-44' WHERE nome = 'Carlos Santos';
UPDATE tb_clientes SET CPF = '444.555.666-77' WHERE nome = 'Ana Pereira';
UPDATE tb_clientes SET CPF = '777.888.999-00' WHERE nome = 'Fernanda Souza';
UPDATE tb_clientes SET CPF = '555.666.777-88' WHERE nome = 'Laura Lima';
UPDATE tb_clientes SET CPF = '999.000.111-22' WHERE nome = 'Rafael Oliveira';
UPDATE tb_clientes SET CPF = '222.333.444-55' WHERE nome = 'Patricia Martins';
UPDATE tb_clientes SET CPF = '666.777.888-99' WHERE nome = 'Luiz Costa';
UPDATE tb_clientes SET CPF = '333.444.555-66' WHERE nome = 'Camila Pereira';

UPDATE tb_clientes SET cep = '12345-678' WHERE nome = 'João Silva';
UPDATE tb_clientes SET cep = '98765-432' WHERE nome = 'Maria Oliveira';
UPDATE tb_clientes SET cep = '11122-233' WHERE nome = 'Carlos Santos';
UPDATE tb_clientes SET cep = '44455-666' WHERE nome = 'Ana Pereira';
UPDATE tb_clientes SET cep = '77788-999' WHERE nome = 'Fernanda Souza';
UPDATE tb_clientes SET cep = '55566-777' WHERE nome = 'Laura Lima';
UPDATE tb_clientes SET cep = '99900-111' WHERE nome = 'Rafael Oliveira';
UPDATE tb_clientes SET cep = '22233-444' WHERE nome = 'Patricia Martins';
UPDATE tb_clientes SET cep = '66677-888' WHERE nome = 'Luiz Costa';
UPDATE tb_clientes SET cep = '33344-555' WHERE nome = 'Camila Pereira';


INSERT INTO tb_servicos (ordem, data, valor, tipo, serie_pneu, cod_cliente) VALUES
("1°", '2023-01-10', 100.00, 'alinhamento', 1, 1),
("2°", '2023-02-15', 75.50, 'balanceamento', 5, 2),
("3°", '2023-03-20', 200.00, 'troca de pneus', 10, 3),
("4°", '2023-04-25', 50.00, 'alinhamento', 3, 4),
("5°", '2023-05-30', 120.75, 'balanceamento', 7, 5),
("6°", '2023-06-05', 90.00, 'alinhamento', 4, 6),
("7°", '2023-07-10', 60.25, 'balanceamento', 8, 7),
("8°", '2023-08-15', 180.50, 'troca de pneus', 2, 8),
("9°", '2023-09-20', 45.00, 'alinhamento', 6, 9),
("10°", '2023-10-25', 110.00, 'balanceamento', 9, 10);

--------------------------------------------------------------------------------------

* CONSULTAR TODOS OS REGISTROS

	SELECT * FROM tb_clientes;

* CONSULTAR REGISTRO CODIGO DE CLIENTE 7

	SELECT * FROM tb_clientes WHERE cod_cliente = 7;

* CONSULTAR TODOS OS REGISTROS E EXIBIR SOMENTE CAMPOS (RUA, NOME e TELEFONE)
	
	SELECT rua, nome, telefone FROM tb_clientes;

* CONSULTAR REGISTRO CODIGO DE CLIENTE 7 E EXIBIR SOMENTE CAMPOS (CEP, NOME e TELEFONE)

	SELECT cep, nome, telefone FROM tb_clientes WHERE cod_cliente = 7;

* CONSULTAR USUARIO Ana Pereira E EXIBIR SOMENTE CAMPOS (CEP, NOME e TELEFONE)

	SELECT cep, nome, telefone FROM tb_clientes WHERE nome = 'Ana Pereira';

------------------------------------------------------------------------------------------

* ALTERAR TELEFONE DO REGISTRO CODIGO DO CLIENTE 8

	UPDATE tb_clientes
	SET telefone = '9999999'
	WHERE cod_cliente = 8;

* ALTERAR DADOS DO REGISTRO CODIGO DE MATRICULA 6

	UPDATE tb_clientes
	SET telefone = '91234678',
		complemento = 'sala 20'
	WHERE cod_cliente = 8;

---------------------------------------------------------------------------------------------

* DELETAR REGISTRO CODIGO DO 7
	
	DELETE FROM tb_clientes WHERE cod_cliente = 7;

* DELETAR TODOS OS DADOS

	DELETE FROM tb_clientes;

------------------------------------------------------------------------------------------

SELECT
	tb_servicos.data,
	tb_pneu.marca,
	tb_clientes.nome,
	tb_clientes.CPF
FROM
	tb_servicos
INNER JOIN
	tb_clientes ON tb_clientes.cod_cliente = tb_servicos.cod_cliente
INNER JOIN
	tb_pneu ON tb_pneu.serie_pneu = tb_servicos.serie_pneu;