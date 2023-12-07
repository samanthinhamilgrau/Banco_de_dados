CREATE TABLE "tb_alunos" (
    "cod_aluno" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT,
    "CPF" INTEGER,
	"RG" TEXT,
    "data_de_nascimento" TEXT,
    "rua" TEXT,
    "numero" TEXT,
    "cep" TEXT,
    "complemento" TEXT,
    "bairro" TEXT,
    "cidade" TEXT,
    "estado" TEXT
);

CREATE TABLE "tb_cursos" (
    "cod_curso" INTEGER PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT,
    "carga_horaria" TEXT,
	"professor" TEXT
);

CREATE TABLE "tb_matriculas" (
    "cod_matricula" INTEGER PRIMARY KEY AUTOINCREMENT,
    "cod_aluno" INTEGER,
    "cod_curso" INTEGER,
    "notas" TEXT,
    FOREIGN KEY ("cod_aluno") REFERENCES "tb_alunos" ("cod_aluno"),
    FOREIGN KEY ("cod_curso") REFERENCES "tb_cursos" ("cod_curso")
);

CREATE TABLE "tb_professores" (
    "cod_professor" INTEGER PRIMARY KEY AUTOINCREMENT,
    "cod_curso" INTEGER, 
    "nome" TEXT,
    "especialidade" TEXT,
    "contato" TEXT,
	
	FOREIGN KEY ("cod_curso") REFERENCES "tb_cursos" ("cod_curso")
);

-------------------------------------------------------------------------------

INSERT INTO tb_alunos (nome, cpf, rg, data_de_nascimento, rua, numero, cep, complemento, bairro, cidade, estado) VALUES
('Laura Lima', '55566677788', '5556667', '1995-07-08', 'Rua F', '303', '55566-777', 'Casa 4', 'Bairro6', 'Cidade6', 'UF6'),
('Rafael Oliveira', '99900011122', '9990001', '1987-09-12', 'Rua G', '505', '99900-111', NULL, 'Bairro7', 'Cidade7', 'UF7'),
('Patricia Martins', '22233344455', '2223334', '1983-04-18', 'Rua H', '707', '22233-444', 'Apto 505', 'Bairro8', 'Cidade8', 'UF8'),
('Luiz Costa', '66677788899', '6667778', '1990-06-23', 'Rua I', '909', '66677-888', NULL, 'Bairro9', 'Cidade9', 'UF9'),
('Camila Pereira', '33344455566', '3334445', '1988-11-30', 'Rua J', '111', '33344-555', 'Sala 10', 'Bairro10', 'Cidade10', 'UF10'),
('João Silva', '12345678909', '1234567', '1990-01-15', 'Rua A', '123', '12345-678', 'Apto 101', 'Centro', 'Cidade1', 'UF1'),
('Maria Oliveira', '98765432198', '9876543', '1985-05-20', 'Rua B', '456', '98765-432', 'Casa 2', 'Bairro2', 'Cidade2', 'UF2'),
('Carlos Santos', '11122233344', '1112223', '1978-08-10', 'Rua C', '789', '11122-333', NULL, 'Bairro3', 'Cidade3', 'UF3'),
('Ana Pereira', '44455566677', '4445556', '1992-03-25', 'Rua D', '101', '44455-666', 'Sala 3', 'Bairro4', 'Cidade4', 'UF4'),
('Fernanda Souza', '77788899900', '7778889', '1980-12-01', 'Rua E', '202', '77788-999', NULL, 'Bairro5', 'Cidade5', 'UF5');

INSERT INTO tb_cursos (nome, carga_horaria, professor) VALUES
('Informática', 80, 'joão vitor'),
('Inglês', 60, 'Maria Pula'),
('Administração', 120, 'Antonio');
('Informática', 120, 'Gabriely');
('Inglês', 120, 'Carlos');
('Administração', 120, 'Daniel');
('Informática', 120, 'Vitoria');
('Inglês', 120, 'Fabiana');
('Informática', 120, 'Giovanna');
('Administração', 120, 'Thiago');


INSERT INTO tb_matriculas (cod_aluno, cod_curso, notas) VALUES
(6, 1, 7.5),
(7, 2, 8.9),
(8, 3, 6.5),
(9, 1, 9.0),
(10, 2, 7.2),
(1, 3, 8.0),
(2, 1, 7.8),
(3, 2, 9.5),
(4, 3, 6.0),
(5, 1, 8.3);

INSERT INTO tb_professores (cod_curso, nome, especialidade, contato) VALUES
(1,  'joão vitor', 'Informática', '123456789'),
(2, 'Maria Pula', 'Inglês', '987654321'),
(3,  'Antonio', 'Administração', '111222333'),
(1,  'Gabriely', 'Informática', 'gaby123@gmail.com'),
(2,  'Carlos', 'Inglês', '777888999'),
(3, 'Daniel', 'Administração', '555666777'),
(1,  'Vitoria', 'Informática', '888999000'),
(2,  'Fabiana', 'Inglês', '666777888'),
(3,  'Thiago', 'Administração', 'thiago88@gmail.com'),
(1,  'Giovanna', 'Informática', '222333444');

---------------------------------------------------------------------------------------------------

* CONSULTAR TODOS OS REGISTROS

	SELECT * FROM tb_alunos;

* CONSULTAR REGISTRO CODIGO DE PROFESSOR 7

	SELECT * FROM tb_professores WHERE cod_professor = 7;

* CONSULTAR TODOS OS REGISTROS E EXIBIR SOMENTE CAMPOS (NOME, CARGA HORARIA E PROFESSOR)
	
	SELECT nome, carga_horaria, professor FROM tb_cursos;

* CONSULTAR REGISTRO CODIGO DE ALUNO 3 E EXIBIR SOMENTE CAMPOS (CEP, NOME e TELEFONE)

    SELECT cep, nome, rg FROM tb_alunos WHERE cod_aluno = 3;

* CONSULTAR USUARIO Gabriely E EXIBIR SOMENTE CAMPOS (CEP, NOME e TELEFONE)

	SELECT especialidade, nome, contato FROM tb_professores WHERE nome = 'Gabriely';

----------------------------------------------------------------------------------------------------


* ALTERAR RG DO REGISTRO CODIGO DO ALUNO 6

	UPDATE tb_alunos
	SET RG = '9999999'
	WHERE cod_aluno = 6;

* ALTERAR DADOS DO REGISTRO CODIGO DO ALUNO 10

	UPDATE tb_alunos
	SET CPF = '91234678',
		data_de_nascimento = '1988-11-28'
	WHERE cod_aluno = 10;

---------------------------------------------------------------------------------------------------


* DELETAR REGISTRO CODIGO DO ALUNO 6
	
	DELETE FROM tb_alunos WHERE cod_aluno = 6;

* DELETAR TODOS OS DADOS

	DELETE FROM tb_alunos;

-------------------------------------------------------------------------------------------------
SELECT
    tb_alunos.cep,
    tb_matriculas.notas,
    tb_cursos.carga_horaria,
    tb_professores.contato
FROM
    tb_cursos
INNER JOIN
    tb_matriculas ON tb_cursos.cod_curso = tb_matriculas.cod_curso
INNER JOIN
    tb_alunos ON tb_alunos.cod_aluno = tb_matriculas.cod_aluno
INNER JOIN
    tb_professores ON tb_cursos.cod_curso = tb_professores.cod_curso;
