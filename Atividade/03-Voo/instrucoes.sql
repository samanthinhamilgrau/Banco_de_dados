--CRIANDO TABELAS:

CREATE TABLE "tb_passageiro" (
    "CPF" INTEGER,
    "Nome" TEXT NOT NULL,
    "DataNascimento" TEXT NOT NULL,
    "Telefone1" TEXT,
    "Telefone2" TEXT,
    "Rua" TEXT,
    "Numero" TEXT,
    "CEP" TEXT,
    "Complemento" TEXT,
    "Bairro" TEXT,
	"Cidade" TEXT,
    "Estado" TEXT,
	
	PRIMARY KEY ("CPF" AUTOINCREMENT)
);

CREATE TABLE "tb_rota" (
    "cod_rota" INTEGER,
	"Origem" TEXT NOT NULL,
    "Destino" TEXT NOT NULL,
	
	PRIMARY KEY ("cod_rota" AUTOINCREMENT)
);

CREATE TABLE tb_voo (
    "numero_voo" INTEGER,
    "CodigoRota" INTEGER,
    "DataPartida" TEXT,
    "DataChegada" TEXT,
    "Aviao" TEXT,
	
	PRIMARY KEY("numero_voo" AUTOINCREMENT)
    FOREIGN KEY (CodigoRota) REFERENCES tb_rota (CodigoRota)
	
);

CREATE TABLE "tb_reserva" (
    "reserva_id" INTEGER,
    "CPFPassageiro" INTEGER,
    "NumeroVoo" INTEGER,
    "NumeroAssento" INTEGER,
	
	PRIMARY KEY("reserva_id" AUTOINCREMENT)
    FOREIGN KEY (CPFPassageiro) REFERENCES tb_passageiro (CPF),
    FOREIGN KEY (NumeroVoo) REFERENCES tb_voo (NumeroVoo)
);

--INSERINDO REGISTRO

INSERT INTO tb_passageiro (CPF, Nome, DataNascimento, Telefone1, Rua, Numero, CEP, Bairro, Cidade, Estado)
VALUES
    ('12345678901', 'João Silva', '1990-05-15', '123-456-7890', 'Rua A', 123, '12345-678', 'Bairro A', 'Cidade A', 'SP'),
    ('23456789012', 'Maria Santos', '1985-03-20', '987-654-3210', 'Rua B', 456, '54321-876', 'Bairro B', 'Cidade B', 'RJ'),
    ('34567890123', 'Pedro Oliveira', '1995-12-10', '555-555-5555', 'Rua C', 789, '98765-432', 'Bairro C', 'Cidade C', 'MG'),
    ('45678901234', 'Ana Pereira', '1980-09-05', '111-222-3333', 'Rua D', 101, '87654-321', 'Bairro D', 'Cidade D', 'RS'),
    ('56789012345', 'Lucas Santos', '2000-02-25', '333-444-5555', 'Rua E', 222, '76543-210', 'Bairro E', 'Cidade E', 'SC'),
    ('67890123456', 'Mariana Silva', '1992-07-30', '444-555-6666', 'Rua F', 303, '65432-109', 'Bairro F', 'Cidade F', 'BA'),
    ('78901234567', 'Carlos Pereira', '1987-11-18', '666-777-8888', 'Rua G', 505, '54321-098', 'Bairro G', 'Cidade G', 'PE'),
    ('89012345678', 'Isabela Santos', '1998-04-12', '777-888-9999', 'Rua H', 606, '43210-987', 'Bairro H', 'Cidade H', 'CE'),
    ('90123456789', 'Gabriel Oliveira', '1993-08-08', '888-999-0000', 'Rua I', 707, '32109-876', 'Bairro I', 'Cidade I', 'PA'),
    ('01234567890', 'Amanda Pereira', '2002-01-02', '999-000-1111', 'Rua J', 909, '21098-765', 'Bairro J', 'Cidade J', 'GO');

