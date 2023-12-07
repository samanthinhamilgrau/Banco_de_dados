--criar tabela

CREATE TABLE "tb_jogos" (
	"cod_jogo"	INTEGER,
	"titulo"	TEXT,
	"genero"	TEXT,
	"lancamento" TEXT,
	"cod_plataforma" INTEGER,
	PRIMARY KEY("cod_jogo" AUTOINCREMENT),
	CONSTRAINT "cod_plataforma" FOREIGN KEY("cod_plataforma") REFERENCES "tb_plataforma"("cod_plataforma")
);

CREATE TABLE "tb_plataforma" (
	"cod_plataforma"	INTEGER,
	"nome"	TEXT,
	"fabricante"	TEXT,
	PRIMARY KEY("cod_plataforma" AUTOINCREMENT)
);

-----------------------------------------------------------------------------------

-- Inserir dados na tabela - tb_plataforma

INSERT INTO tb_plataforma (cod_plataforma, nome, fabricante)
VALUES
    ('1', 'PlayStation 5', 'Sony'),
    ('2', 'Xbox Series X', 'Microsoft'),
    ('3', 'Nintendo Switch', 'Nintendo'),
    ('4', 'PlayStation 4', 'Sony'),
    ('5', 'Xbox One', 'Microsoft'),
    ('6', 'Will U', 'Nintendo'),
    ('7', 'PlayStation 3', 'Sony'),
    ('8', 'Xbox 360', 'Microsoft'),
    ('9', 'Nintendo Will', 'Nintendo'),
    ('10', 'PlayStation 2', 'Sony');

-- Inserir dados na tabela - tb_jogos

INSERT INTO tb_jogos (cod_jogo, titulo, genero, lancamento, cod_plataforma)
VALUES
    ('1', 'Demons Souls', 'RPG', '2020-11-12', '1')
    ('2', 'Halo 4', 'FPS', '2012-11-06', '8'),
    ('3', 'Halo Infinite', 'FPS', '2021-12-08', '2'),
    ('4', 'God of War', 'Ação/Aventura', '2020-11-12', '4'),
    ('5', 'Forza Horizon 5', 'Corrida', '2021-11-09', '2'),
    ('6', 'Horizon Zero Dawn', 'RPG', '2017-02-28', '4'),
    ('7', 'Animal Crossing: New Horizons', 'Simulação', '2020-03-20', '3'),
    ('8', 'The Last of Us', 'Ação/Aventura', '2013-06-14', '7'),
    ('9', 'Super Mario 3D World', 'Plataforma', '2013-11-21', '6'),
    ('10', 'Gears of War 4', 'Tiro', '2016-10-11', '5');

-----------------------------------------------------------------------------------

SELECT titulo FROM tb_jogos WHERE cod_plataforma = 1;
SELECT titulo FROM tb_jogos WHERE genero = "FPS";

-----------------------------------------------------------------------------------

SELECT
	tb_plataforma.nome,
	tb_plataforma.fabricante,
	tb_jogos.titulo,
	tb_jogos.lancamento,
	tb_jogos.genero
FROM
	tb_jogos
INNER JOIN
	tb_plataforma ON tb_plataforma.cod_plataforma = tb_jogos.cod_jogo;

-----------------------------------------------------------------------------------

--alterar data de lançamento

UPDATE tb_jogos
SET lancamento = '2022-08-09'
WHERE cod_jogo = 1;

UPDATE tb_jogos
SET lancamento = '2023-05-04'
WHERE cod_jogo = 2;

UPDATE tb_jogos
SET lancamento = '2021-01-01'
WHERE cod_jogo = 3;

UPDATE tb_jogos
SET lancamento = '2020-02-02'
WHERE cod_jogo = 4;

-----------------------------------------------------------------------------------

--deletar os jogos

DELETE FROM tb_jogos WHERE cod_jogo = 1;

DELETE FROM tb_jogos WHERE cod_jogo = 2;

DELETE FROM tb_jogos WHERE cod_jogo = 3;

DELETE FROM tb_jogos WHERE cod_jogo = 4;