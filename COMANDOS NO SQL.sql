--Criação de Tabelas Básicas:
--Crie uma tabela chamada clientes com as seguintes colunas: id (inteiro, chave primária, auto-incremento),
--nome (texto, não nulo), email (texto, único) e data_cadastro (data).

CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE,
    data_cadastro DATE
);
--Modificação de Tabela:
--Altere a tabela clientes para adicionar uma coluna telefone (texto) e uma coluna data_nascimento (data).

ALTER TABLE clientes
ADD COLUMN telefone TEXT,
ADD COLUMN data_nascimento DATE;

--Renomear Coluna:
--Renomeie a coluna telefone da tabela clientes para celular.

ALTER TABLE clientes
RENAME COLUMN telefone TO celular;

--Excluir Coluna:
--Exclua a coluna data_nascimento da tabela clientes.

ALTER TABLE clientes
DROP COLUMN data_nascimento;

--Criação de Tabela com Chave Estrangeira:
--Crie uma tabela chamada pedidos com as seguintes colunas: id (inteiro, chave primária, auto-incremento),
--cliente_id (inteiro, chave estrangeira que referencia a tabela clientes), data_pedido (data) e total (decimal).

CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    data_pedido DATE,
    total DECIMAL
);

--Alteração de Tipo de Coluna:
--Altere o tipo de dado da coluna total na tabela pedidos de decimal para numeric(10, 2).

ALTER TABLE pedidos
ALTER COLUMN total TYPE NUMERIC(10, 2);

--Exclusão de Tabela:
--Exclua a tabela pedidos.

DROP TABLE pedidos;

--Criação de Tabela com Restrições:
--Crie uma tabela chamada produtos com as seguintes colunas: id (inteiro, chave primária, auto-incremento), nome (texto, não nulo), 
--preco (decimal, maior que zero), e estoque (inteiro, maior ou igual a zero). Adicione uma restrição para que o nome seja único.

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    preco DECIMAL CHECK (preco > 0),
    estoque INTEGER CHECK (estoque >= 0)
);

--Adicionar Restrições:
--Na tabela produtos, adicione uma restrição para que o valor do estoque seja maior ou igual a zero.

ALTER TABLE produtos
ADD CONSTRAINT chk_estoque CHECK (estoque >= 0);

--Criar e Excluir Tabela:
--Crie uma tabela chamada categorias com as colunas id (inteiro, chave primária, auto-incremento) e nome 
--(texto, não nulo, único). Em seguida, exclua a tabela.

CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);

DROP TABLE categorias;
 ------------------------------------------------------------------------------------
--1. Inserção de Dados (INSERT)
--Exercício 1: Crie uma tabela chamada alunos com as colunas id, nome, idade e curso. Insira cinco registros nesta tabela.

 CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INTEGER NOT NULL,
    curso TEXT NOT NULL
);

INSERT INTO alunos (nome, idade, curso) VALUES
('Andressa', 26, 'Letras'),
('Nicolas', 29, 'Desenvolvedor'),
('Micheli', 35, 'Matematica'),
('Brenda', 25, 'Dados'),
('Gustavo', 27, 'Engenharia');

--Exercício 2: Insira na tabela alunos um novo registro com o nome “João”, idade 20, e curso “Engenharia”.

INSERT INTO alunos (nome, idade, curso) VALUES
('João', 20, 'Engenharia');

--Exercício 3: Insira múltiplos registros de uma vez na tabela alunos, adicionando três novos alunos de diferentes cursos.

INSERT INTO alunos (nome, idade, curso) VALUES
('Jandre', 25 ,'Programador'),
('Jorge', 30 ,'Dentista'),
('Talita', 40 ,'Analista');

--2. Atualização de Dados (UPDATE)
--Exercício 4: Atualize a idade do aluno chamado “João” para 21 anos.

UPDATE alunos
SET idade = 21
WHERE nome = 'João';

--Exercício 5: Mude o curso de todos os alunos que estão cursando “Engenharia” para “Engenharia de Software”.

UPDATE alunos
SET curso = 'Engenharia de Software'
WHERE curso = 'Engenharia';

--Exercício 6: Aumente a idade de todos os alunos em 1 ano.

UPDATE alunos
SET idade = idade + 1;
-----------------------------------------------------------
--3. Deleção de Dados (DELETE)
--Exercício 7: Delete o aluno com id igual a 3 da tabela alunos.

DELETE FROM alunos
WHERE id = 3;

--Exercício 8: Delete todos os alunos que têm menos de 18 anos.

DELETE FROM alunos 
WHERE idade < 18;

--Exercício 9: Delete todos os registros da tabela alunos (sem excluir a tabela).

DELETE FROM alunos;
