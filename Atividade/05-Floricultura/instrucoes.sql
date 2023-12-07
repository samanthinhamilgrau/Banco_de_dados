CREATE TABLE "tb_flores" (
	"cod_flor"INTEGER,
	"nome_cientifico"	TEXT,
	"nome_popular"	TEXT,
	"preco"	TEXT,
	"quantidade" INTEGER,
	"cores" TEXT,
	
	PRIMARY KEY("cod_flor" AUTOINCREMENT)
);


CREATE TABLE "tb_pedidos" (
	"cod_pedido"INTEGER,
	"data"	TEXT,
	"valor_total" INTEGER,	

	PRIMARY KEY("cod_pedido" AUTOINCREMENT)
);

CREATE TABLE "tb_clientes" (
    "cod_cliente" INTEGER PRIMARY KEY AUTOINCREMENT,
    "cod_pedido" INTEGER,
    "nome" TEXT,
    "CPF" INTEGER,
    "telefone" TEXT,
    "endereco" INTEGER,

	FOREIGN KEY("cod_pedido") REFERENCES "tb_pedidos"("cod_pedido")
);

-----------------------------------------------------------------------------------------------------------------------

INSERT INTO tb_flores (nome_cientifico, nome_popular, preco, quantidade, cores) VALUES
    ('Rosa spp.', 'Rosa', 15.99, 50, 'Vermelha'),
    ('Tulipa spp.', 'Tulipa', 12.50, 30, 'Vermelha, Amarela, Branca'),
    ('Orquídea phalaenopsis', 'Orquídea', 29.99, 20, 'Rosa, Branca, Roxa'),
    ('Girassol spp.', 'Girassol', 8.75, 40, 'Amarela'),
    ('Lírio spp.', 'Lírio', 18.50, 25, 'Branca, Rosa, Amarela'),
	('Gérbera spp.', 'Gérbera', 14.25, 35, 'Rosa, Laranja, Amarela'),
    ('Cravo spp.', 'Cravo', 11.99, 45, 'Vermelho, Rosa, Branco'),
    ('Margarida spp.', 'Margarida', 9.50, 60, 'Branca'),
    ('Violeta spp.', 'Violeta', 6.75, 55, 'Azul, Roxa, Branca'),
    ('Crissântemo spp.', 'Crissântemo', 17.50, 28, 'Vermelho, Amarelo, Branco');

INSERT INTO tb_pedidos (data, valor_total) VALUES
	('2023-03-15', 150.75),
    ('2023-03-18', 89.99),
    ('2023-03-22', 200.50),
    ('2023-03-25', 120.25),
    ('2023-03-28', 175.00),
	 ('2023-04-02', 110.00),
    ('2023-04-05', 95.75),
    ('2023-04-10', 180.20),
    ('2023-04-15', 135.50),
    ('2023-04-20', 200.75);

INSERT INTO tb_clientes (cod_pedido, nome, CPF, telefone, endereco) VALUES
    (1, 'Ana Silva', '123.456.789-01', '(11) 1234-5678', 'Rua A, 123'),
    (2, 'Carlos Oliveira', '987.654.321-02', '(22) 9876-5432', 'Avenida B, 456'),
    (3,'Mariana Santos', '456.789.012-03', '(33) 4567-8901', 'Rua C, 789'),
    (4,'Rafaela Pereira', '789.012.345-04', '(44) 7890-1234', 'Avenida D, 101'),
    (5,'João Martins', '234.567.890-05', '(55) 2345-6789', 'Rua E, 202'),
    (6,'Fernando Lima', '567.890.123-06', '(66) 5678-9012', 'Avenida F, 303'),
    (7,'Camila Costa', '890.123.456-07', '(77) 8901-2345', 'Rua G, 404'),
    (8,'Lucas Pereira', '345.678.901-08', '(88) 3456-7890', 'Avenida H, 505'),
    (9,'Juliana Santos', '678.901.234-09', '(99) 6789-0123', 'Rua I, 606'),
    (10, 'Pedro Oliveira', '012.345.678-10', '(10) 0123-4567', 'Avenida J, 707');

--------------------------------------------------------------------------------------------------------------------
* CONSULTAR TODOS OS REGISTROS

	SELECT * FROM tb_clientes;

* CONSULTAR REGISTRO CODIGO DE PEDIDO 7

	SELECT * FROM tb_pedidos WHERE cod_pedido = 7;

* CONSULTAR TODOS OS REGISTROS E EXIBIR SOMENTE CAMPOS (NOME, CPF e ENDERECO)
	
	SELECT nome, CPF, endereco FROM tb_clientes;

* CONSULTAR REGISTRO CODIGO DE FLOR 6 E EXIBIR SOMENTE CAMPOS (CORES, NOME_POPULAR e PRECO)

	SELECT cores, nome_popular, preco FROM tb_flores WHERE cod_flor = 6;

* CONSULTAR USUARIO João Martins E EXIBIR SOMENTE CAMPOS (CPF, ENDERECO e TELEFONE)

	SELECT CPF, endereco, telefone FROM tb_clientes WHERE nome = 'João Martins';	

---------------------------------------------------------------------------------------------------------------

* ALTERAR TELEFONE DO REGISTRO CODIGO DE CLIENTE 8

	UPDATE tb_clientes
	SET telefone = '998759'
	WHERE cod_cliente = 8;

* ALTERAR DADOS DO REGISTRO CODIGO DE MATRICULA 6

	UPDATE tb_clientes
	SET telefone = '91234678',
		endereco = 'rua J, 514'
	WHERE cod_cliente = 5;

---------------------------------------------------------------------------------------------------------------

* DELETAR REGISTRO CODIGO DE MATRICULA 7
	
	DELETE FROM tb_clientes WHERE matricula = 7;

* DELETAR TODOS OS DADOS

	DELETE FROM tb_clientes;

----------------------------------------------------------------------------------------------------------------
