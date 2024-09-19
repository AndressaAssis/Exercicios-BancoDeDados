# 💫 Operações com Banco de Dados no PostgreSQL 💫

## Introdução
Este projeto contém uma série de exemplos práticos de criação, alteração e manipulação de tabelas e dados em um banco de dados **PostgreSQL**. Ele abrange desde a criação de tabelas básicas até operações de inserção, atualização e exclusão de dados, além de trabalhar com chaves primárias, estrangeiras e restrições de integridade.

## Índice 🌀 
- [Criação de Tabelas](#criação-de-tabelas)
- [Modificação de Tabelas](#modificação-de-tabelas)
- [Manipulação de Dados](#manipulação-de-dados)
- [Exclusão de Tabelas](#exclusão-de-tabelas)
- [Consultas e Atualizações](#consultas-e-atualizações)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Licença](#licença)

## Criação de Tabelas

### Clientes
Criação de uma tabela chamada **clientes** com as seguintes colunas:
- `id`: Inteiro, chave primária, auto-incremento.
- `nome`: Texto, não nulo.
- `email`: Texto, único.
- `data_cadastro`: Data.

`CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE,
    data_cadastro DATE
);`

### Pedidos
Criação de uma tabela chamada pedidos com uma chave estrangeira que referencia a tabela clientes.
- `id`: Inteiro, chave primária, auto-incremento.
- `cliente_id`: Inteiro, chave estrangeira.
- `data_pedido`: Data.
- `total`: Decimal.

```sql
CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER REFERENCES clientes(id),
    data_pedido DATE,
    total DECIMAL
);
```

### Produtos
Criação de uma tabela chamada produtos com restrições para validar o valor dos campos.
- `id`: Inteiro, chave primária, auto-incremento.
- `nome`: Texto, não nulo e único.
- `preco`: Decimal, maior que zero.
- `estoque`: Inteiro, maior ou igual a zero.

```sql
CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    preco DECIMAL CHECK (preco > 0),
    estoque INTEGER CHECK (estoque >= 0)
);
```

## Modificação de Tabelas
Adição de Colunas
Adiciona colunas à tabela clientes:
- telefone: `Texto.`
- data_nascimento: `Data`.

```sql
ALTER TABLE clientes
ADD COLUMN telefone TEXT,
ADD COLUMN data_nascimento DATE;
```

## Renomear Coluna
Renomeia a coluna telefone para celular na tabela clientes.

```sql
ALTER TABLE clientes
RENAME COLUMN telefone TO celular;
```

## Excluir Coluna
Exclui a coluna data_nascimento da tabela clientes.

```sql
ALTER TABLE clientes
DROP COLUMN data_nascimento;
```

## Alteração de Tipo de Coluna
Altera o tipo de dado da coluna total na tabela pedidos de decimal para numeric(10, 2).

```sql
ALTER TABLE pedidos
ALTER COLUMN total TYPE NUMERIC(10, 2);
```

## Exclusão de Tabelas
Exclui as tabelas pedidos.

```sql
DROP TABLE pedidos;
```

## Adicionar Restrições:
- Na tabela produtos, adicione uma restrição para que o valor do estoque seja maior ou igual a zero.

```sql
ALTER TABLE produtos
ADD CONSTRAINT chk_estoque CHECK (estoque >= 0);
```
## Criar e Excluir Tabela:
Crie uma tabela chamada categorias com as colunas id (inteiro, chave primária, auto-incremento) e nome (texto, não nulo, único). Em seguida, exclua a tabela.

```sql
CREATE TABLE categorias (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE
);
````
```sql
DROP TABLE categorias;
```
-------------------------------------------------------------------------------------------------------------------------------------------------------
## Manipulação de Dados

### Inserção de Dados (INSERT)
Insere registros na tabela alunos com as colunas id, nome, idade e curso.

```sql
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    idade INTEGER NOT NULL,
    curso TEXT NOT NULL
);
```
```sql
INSERT INTO alunos (nome, idade, curso) VALUES
('Andressa', 26, 'Letras'),
('Nicolas', 29, 'Desenvolvedor'),
('Micheli', 35, 'Matematica'),
('Brenda', 25, 'Dados'),
('Gustavo', 27, 'Engenharia');
```

### Atualização de Dados (UPDATE)
Exemplo de atualização de registros na tabela alunos: Atualiza a idade do aluno chamado "Nicolas" para 21 anos.

```sql
UPDATE alunos
SET idade = 21
WHERE nome = 'Nicolas';
```

Atualiza o curso de todos os alunos de "Engenharia" para "Engenharia de Software".

```sql
UPDATE alunos
SET curso = 'Engenharia de Software'
WHERE curso = 'Engenharia';
```

Aumenta a idade de todos os alunos em 1 ano.

```sql
UPDATE alunos
SET idade = idade + 1;
```

### Deleção de Dados (DELETE)
Exemplo de deleção de registros na tabela alunos: Deleta o aluno com id = 3.

```sql
DELETE FROM alunos
WHERE id = 3;
```

Deleta todos os alunos com menos de 18 anos.

```sql
DELETE FROM alunos 
WHERE idade < 18;
```

Deleta todos os registros da tabela alunos.

```sql
DELETE FROM alunos;
```


## Instalação 📄
- Instale o PostgreSQL no seu ambiente de desenvolvimento.
- Abra o psql ou qualquer ferramenta de gerenciamento de banco de dados PostgreSQL de sua preferência.
- Execute os comandos SQL fornecidos neste repositório.

## Como Usar
- Clone este repositório ou copie os scripts SQL.
- Execute cada comando SQL individualmente no psql ou em sua ferramenta de gerenciamento de banco de dados favorita.
- Modifique os comandos conforme necessário para o seu ambiente.

## Licença 🎉
- Todos os exercícios foram feitos em aula e a fins acadêmico.
