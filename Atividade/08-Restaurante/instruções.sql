--Criando tabelas

CREATE TABLE "tb_produtos"  (
"produto_id" INTEGER,
"Nome" TEXT NOT NULL,
"Tipo" TEXT NOT NULL,
"Preco" REAL NOT NULL,
"Descricao" TEXT NOT NULL,

PRIMARY KEY ("produto_id" AUTOINCREMENT)
);

CREATE TABLE "tb_mesas"(
"mesa_id" INTEGER NOT NULL,
"Numero" INTEGER NOT NULL,
"Capacidade" TEXT NOT NULL,

PRIMARY KEY ("mesa_id" AUTOINCREMENT)
);

CREATE TABLE "tb_cliente"(
"cliente_id" INTEGER,
"Nome" TEXT NOT NULL,
"Telefone" TEXT,
PRIMARY KEY ("cliente_id" AUTOINCREMENT)
);

CREATE TABLE "tb_pedidos"(
"pedido_id" INTEGER,
"Quantidade" INTEGER NOT NULL,
"Total" REAL NOT NULL, 
"produto_id" INTEGER,
"mesa_id" INTEGER NOT NULL,
"cliente_id" INTEGER,

PRIMARY KEY("pedido_id" AUTOINCREMENT),
FOREIGN KEY("produto_id") REFERENCES "tb_produtos" ("produto_id"),
FOREIGN KEY("mesa_id") REFERENCES "tb_mesa" ("mesa_id"),
FOREIGN KEY("cliente_id") REFERENCES "tb_cliente" ("cliente_id")
);

-- INSERÇÃO DE DADOS

INSERT INTO "tb_produtos" (Nome, Tipo, Preco, Descricao)
VALUES

('Bife à Parmegiana' , 'prato principal ',  25.99 , 'Delicioso bife de carne coberto com queijo e molho de tomate.'),
('Coca-Cola'  , 'bebida '         ,   3.49 , 'Refrescante refrigerante de cola.'),
('Sorvete de Chocolate' ,'sobremesa '   ,   7.99 , 'Uma sobremesa indulgente de sorvete de chocolate cremoso.'),
('Salada Caesar'      , 'prato principal' ,  12.99 , 'Uma salada fresca com alface, croutons e molho Caesar.'),
('Suco de Laranja'    , 'bebida '         ,   4.99 , 'Suco natural de laranja fresca.'),
('Cheesecake de Morango' , 'sobremesa '  ,  9.99 , 'Cheesecake com cobertura de morango e base de biscoito.'),
('Espaguete à Bolonhesa' , 'prato principal' , 18.99 , 'Espaguete com molho de carne à bolonhesa.'),
('Água Mineral'       , 'bebida'         ,   2.49 , 'Água mineral natural em uma garrafa.'),
('Mousse de Limão '   , 'sobremesa'       ,   6.99 , 'Mousse leve e cítrica de limão.'),
('Frango Grelhado'    , 'prato principal' ,  22.99 , 'Peito de frango grelhado com temperos especiais.');


INSERT INTO "tb_mesas" (Numero, Capacidade) VALUES
(1, 4),
(2, 2),
(3, 6),
(4, 8),
(5, 4),
(6, 2),
(7, 10),
(8, 6),
(9, 4),
(10, 8);

INSERT INTO "tb_cliente" (Nome, Telefone) VALUES
('João Silva', '123-456-7890'),
('Maria Santos', '987-654-3210'),
('Carlos Pereira', '555-123-4567'),
('Ana Rodrigues', '888-999-7777'),
('Paulo Costa', '111-222-3333'),
('Luiza Souza', '444-555-6666'),
('Fernando Alves', '999-888-5555'),
('Isabela Ferreira', '333-222-1111'),
('Ricardo Lima', '777-666-5555'),
('Juliana Oliveira', '222-333-4444');

INSERT INTO "tb_pedidos" (mesa_id, produto_id, cliente_id, Quantidade, total) VALUES
(1, 1, 1, 2, 51.98),
(1, 2, 2, 3, 10.47),
(2, 3, 3, 1, 7.99),
(2, 4, 4, 1, 12.99),
(3, 5, 5,  2, 9.98),
(3, 6, 6, 1, 9.99),
(4, 7,  7, 1, 18.99),
(4, 8, 8, 4, 9.96),
(5, 9, 9, 2, 4.98),
(5, 10, 10, 1, 22.99);

-- CONSULTA DE DADOS 5 

SELECT * FROM tb_produtos WHERE Tipo = "sobremesa";

SELECT * FROM tb_mesas WHERE Numero = "7";

SELECT Nome, Tipo, Preco FROM tb_produtos

-- CONSULTA DE DADOS 6

SELECT *FROM tb_mesas WHERE Numero = "3";

SELECT *FROM tb_mesas WHERE Capacidade = "6";

-- CONSULTA DE DADOS 7

SELECT
	tb_produtos.Nome, Tipo, Preco,
	tb_mesas.Numero, Capacidade,
	tb_pedidos.pedido_id, Quantidade, total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos on tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas  ON tb_pedidos.mesa_id = tb_mesas.mesa_id

-- CONSULTA DE DADOS 8

SELECT
	tb_produtos.nome, tipo, preco,
	tb_mesas.numero, capacidade,
	tb_pedidos.pedido_id, quantidade, total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos  ON tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas  ON tb_pedidos.mesa_id = tb_mesas.mesa_id
WHERE
	tb_pedidos.total = "12.99"

-- CONSULTA DE DADOS 9

SELECT
	tb_produtos.nome, tipo, preco,
	tb_mesas.numero, capacidade,
	tb_pedidos.pedido_id, quantidade, total
FROM
	tb_pedidos
INNER JOIN
	tb_produtos  ON tb_pedidos.produto_id = tb_produtos.produto_id
INNER JOIN
	tb_mesas  ON tb_pedidos.mesa_id = tb_mesas.mesa_id
WHERE
	tb_pedidos.total > '20.00'

--QUESTAO 10
UPDATE tb_produtos
SET preco = "50,00"
WHERE produto_id = 2;

UPDATE tb_produtos
SET preco = "50,00"
WHERE produto_id = 1;

UPDATE tb_produtos
SET preco = "40,00"
WHERE produto_id = 5;

UPDATE tb_produtos
SET preco = "58,00"
WHERE produto_id = 3;

UPDATE tb_produtos
SET preco = "70,00"
WHERE produto_id = 4;

--QUESTAO 11

UPDATE tb_mesas
SET capacidade = "6"
WHERE mesa_id = 2;

UPDATE tb_mesas
SET capacidade = "9"
WHERE mesa_id = 1;

UPDATE tb_mesas
SET capacidade = "7"
WHERE mesa_id = 3;

UPDATE tb_mesas
SET capacidade = "6"
WHERE mesa_id = 4;

UPDATE tb_mesas
SET capacidade = "3"
WHERE mesa_id = 5;

--QUESTAO 12

DELETE FROM tb_pedidos WHERE quantidade = 1;
DELETE FROM tb_pedidos WHERE quantidade = 2;
DELETE FROM tb_pedidos WHERE quantidade = 3;
DELETE FROM tb_pedidos WHERE quantidade = 4;
DELETE FROM tb_pedidos WHERE quantidade = 5;

--NOVAS INSTRUÇÕES

--BETWEEN
SELECT * FROM tb_mesas WHERE mesa_id BETWEEN 2 AND 5;

--sum
SELECT sum(Preco) FROM tb_produtos;

--COUNT
SELECT count() FROM tb_cliente;

--ORDER BY
SELECT * FROM tb_cliente ORDER BY Nome ASC;


