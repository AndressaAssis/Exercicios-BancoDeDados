# Operações com Banco de Dados no PostgreSQL

## Introdução
Este projeto contém uma série de exemplos práticos de criação, alteração e manipulação de tabelas e dados em um banco de dados **PostgreSQL**. Ele abrange desde a criação de tabelas básicas até operações de inserção, atualização e exclusão de dados, além de trabalhar com chaves primárias, estrangeiras e restrições de integridade.

## Índice
- [Criação de Tabelas](#criação-de-tabelas)
- [Modificação de Tabelas](#modificação-de-tabelas)
- [Manipulação de Dados](#manipulação-de-dados)
- [Exclusão de Tabelas](#exclusão-de-tabelas)
- [Consultas e Atualizações](#consultas-e-atualizações)
- [Instalação](#instalação)
- [Como Usar](#como-usar)
- [Exemplos](#exemplos)
- [Contribuidores](#contribuidores)
- [Licença](#licença)

## Criação de Tabelas

### Clientes
Criação de uma tabela chamada **clientes** com as seguintes colunas:
- `id`: Inteiro, chave primária, auto-incremento.
- `nome`: Texto, não nulo.
- `email`: Texto, único.
- `data_cadastro`: Data.

```sql
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT UNIQUE,
    data_cadastro DATE
);
