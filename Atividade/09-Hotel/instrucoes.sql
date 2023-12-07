CREATE TABLE tb_hospede (
    hospede_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    documento TEXT,
    telefone TEXT
);

CREATE TABLE tb_quarto (
    quarto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    preco_diaria REAL NOT NULL,
    status TEXT NOT NULL
);

CREATE TABLE tb_reserva (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hospede_id INTEGER,
    quarto_id INTEGER,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (hospede_id) REFERENCES tb_hospede(hospede_id),
    FOREIGN KEY (quarto_id) REFERENCES tb_quarto(quarto_id)
);

-----------------------------------------------------------------

INSERT INTO tb_hospede (nome, documento, telefone) VALUES
    ('Maria Silva', '123456789', '555-1234'),
    ('José Oliveira', '987654321', '555-5678'),
    ('Ana Pereira', '234567890', '555-9012'),
    ('Carlos Santos', '876543210', '555-3456'),
    ('Lúcia Lima', '345678901', '555-7890'),
    ('Roberto Costa', '109876543', '555-2345'),
    ('Patrícia Martins', '987654321', '555-6789'),
    ('Fernando Oliveira', '123456789', '555-0123'),
    ('Mariana Souza', '234567890', '555-4567'),
    ('Ricardo Pereira', '345678901', '555-8901');

INSERT INTO tb_quarto (tipo, preco_diaria, status) VALUES
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'disponível'),
    ('Suíte', 200.00, 'ocupado'),
    ('Simples', 110.00, 'manutenção'),
    ('Duplo', 160.00, 'disponível'),
    ('Suíte', 220.00, 'disponível'),
    ('Simples', 120.00, 'disponível'),
    ('Duplo', 170.00, 'manutenção'),
    ('Suíte', 240.00, 'disponível'),
    ('Simples', 130.00, 'ocupado');

INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida) VALUES
    (1, 2, '2023-05-01', '2023-05-05'),
    (2, 3, '2023-06-10', '2023-06-15'),
    (3, 1, '2023-07-20', '2023-07-25'),
    (4, 4, '2023-08-05', '2023-08-10'),
    (5, 5, '2023-09-15', '2023-09-20'),
    (6, 6, '2023-10-01', '2023-10-05'),
    (7, 7, '2023-11-10', '2023-11-15'),
    (8, 8, '2023-12-20', '2023-12-25'),
    (9, 9, '2024-01-05', '2024-01-10'),
    (10, 10, '2024-02-15', '2024-02-20');

--------------------------------------------------------------------------------

*CONSULTAS

SELECT * FROM tb_hospede WHERE hospede_id = 8;

SELECT nome, documento, telefone FROM tb_hospede WHERE hospede_id = 8;

SELECT * FROM tb_quarto WHERE quarto_id = 7;

SELECT * FROM tb_quarto WHERE preco_diaria > 100;

SELECT * FROM tb_quarto WHERE status = 'disponível';

-------------------------------------------------------------------------------------

*CONSULTAS INNER JOIN

SELECT
    tb_reserva.reserva_id,
    tb_reserva.data_entrada,
    tb_reserva.data_saida,
    tb_hospede.nome,
    tb_hospede.documento,
    tb_quarto.tipo,
    tb_quarto.preco_diaria,
    tb_quarto.status
FROM
    tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id;

SELECT
    tb_reserva.reserva_id,
    tb_reserva.data_entrada,
    tb_reserva.data_saida,
    tb_hospede.nome,
    tb_hospede.documento,
    tb_quarto.tipo,
    tb_quarto.preco_diaria,
    tb_quarto.status
FROM
    tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id
WHERE
    tb_quarto.status = 'ocupado';

--------------------------------------------------------------------------------------------------------------------------

UPDATE tb_hospede
	SET telefone = '9999999'
	WHERE hospede_id = 8;

UPDATE tb_hospede
	SET documento = '2329197890'
	WHERE hospede_id = 5;

UPDATE tb_hospede
	SET documento = '2399191990'
	WHERE hospede_id = 2;

UPDATE tb_hospede
	SET telefone = '615815616'
	WHERE hospede_id = 6; 

UPDATE tb_hospede
	SET telefone = '998390502'
	WHERE hospede_id = 5;

UPDATE tb_quarto
	SET status = 'ocupado'
	WHERE quarto_id = 6;

UPDATE tb_quarto
	SET preco_diaria = '160.0'
	WHERE quarto_id = 4;

UPDATE tb_quarto
	SET tipo = 'Duplo'
	WHERE quarto_id = 1;

UPDATE tb_quarto
	SET preco_diaria = '220.0'
	WHERE quarto_id = 6;

UPDATE tb_quarto
	SET status = 'manutenção'
	WHERE quarto_id = 8;


DELETE FROM tb_reserva WHERE reserva_id = 5;

DELETE FROM tb_reserva WHERE reserva_id = 8;

DELETE FROM tb_reserva WHERE reserva_id = 7;

DELETE FROM tb_reserva WHERE reserva_id = 3;

DELETE FROM tb_reserva WHERE reserva_id = 2;

