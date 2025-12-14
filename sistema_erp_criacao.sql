CREATE DATABASE erp;

CREATE TABLE empresa (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    inscricao_estadual VARCHAR(30) NOT NULL,
    inscricao_municipal VARCHAR(30) NOT NULL,
    matriz_filial CHAR(1) NOT NULL,
    data_cadastro DATE NOT NULL,
    empresa_id INT(10) NOT NULL,

    CONSTRAINT fk_empresa_id
        FOREIGN KEY empresa_id(id) REFERENCES empresa(id)
);

CREATE TABLE convenio (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    desconto DOUBLE(11,2) NOT NULL,
    data_vencimento DATE NOT NULL,
    id_empresa INT(10) NOT NULL,

    CONSTRAINT fk_id_empresa
        FOREIGN KEY id_empresa(id) REFERENCES empresa(id)
);

CREATE TABLE setor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text,
    empresa_id INT NOT NULL,

    CONSTRAINT fk_empresa_id_setor
        FOREIGN KEY empresa_id(id) references empresa(id)
);

CREATE TABLE nivel_formacao (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text
);

CREATE TABLE cargo (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL,
    salario DOUBLE(11,2) NOT NULL
);

CREATE TABLE log_cargo (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    salario_antigo DOUBLE NOT NULL,
    salario_novo DOUBLE NOT NULL,
    data_alteracao TIMESTAMP NOT NULL,
    cargo_id INT NOT NULL,

    CONSTRAINT fk_cargo_id
        FOREIGN KEY cargo_id(id) REFERENCES cargo(id)
);

CREATE TABLE tipo_colaborador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text
);

CREATE TABLE colaborador (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    data_nascimento DATE NOT NULL,
    tipo_sanguineo VARCHAR(5) NOT NULL,
    foto_34 VARCHAR(255) NOT NULL,
    excluido CHAR(1) NOT NULL,
    data_cadastro DATE NOT NULL,
    nivel_formacao_id INT(10) NOT NULL,
    tipo_colaborador_id INT(10) NOT NULL,
    cargo_id INT(10) NOT NULL,
    id_setor INT(10) NOT NULL,

    CONSTRAINT fk_nivel_formacao_id
        FOREIGN KEY nivel_formacao_id(id) REFERENCES nivel_formacao(id),
    CONSTRAINT fk_tipo_colaborador_id
        FOREIGN KEY tipo_colaborador_id(id) REFERENCES tipo_colaborador(id),
    CONSTRAINT fk_cargo_id
        FOREIGN KEY cargo_id(id) REFERENCES cargo(id),
    CONSTRAINT fk_id_setor
        FOREIGN KEY id_setor(id) REFERENCES setor(id)
);

CREATE TABLE tipo_relacionamento (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text
);

CREATE TABLE colaborador_relacionamento (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100), -- Precisa dessa ?
    tipo_relacionamento_id INT(10) NOT NULL,
    colaborador_id INT(10) NOT NULL,

    CONSTRAINT fk_tipo_relacionamento_id
        FOREIGN KEY tipo_relacionamento_id(id) REFERENCES tipo_relacionamento(id),
    CONSTRAINT fk_colaborador_id
        FOREIGN KEY colaborador_id(id) REFERENCES colaborador(id)
);

CREATE TABLE papel (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text
);

CREATE TABLE usuario (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text,
    papel_id INT NOT NULL,
    colaborador_id INT NOT NULL,

    CONSTRAINT fk_papel_id
        FOREIGN KEY papel_id(id) REFERENCES papel(id),
    CONSTRAINT fk_colaborador_id
        FOREIGN KEY colaborador_id(id) REFERENCES colaborador(id)
);

CREATE TABLE situacao_for_cli (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE cliente (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    orgao_rg VARCHAR(10) NOT NULL,
    inscricao_estadual VARCHAR(30) NOT NULL, -- Precisa? Ou ela virá da tabela empresa?
    inscricao_municipal VARCHAR(30) NOT NULL,
    desde DATE not null,
    tipo_pessoa CHAR(1) NOT NULL ,
    excluido CHAR(1) NOT NULL,
    data_cadastro DATE,
    situacao_for_cli_id INT(10) NOT NULL,
    id_empresa INT(10) NOT NULL,

    CONSTRAINT fk_situacao_for_cli_id
        FOREIGN KEY situacao_for_cli_id(id) REFERENCES situacao_for_cli(id),
    CONSTRAINT fk_id_empresa_cliente
        FOREIGN KEY id_empresa(id) REFERENCES empresa(id)
);

CREATE TABLE tipo_fornecedor (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE fornecedor (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(150) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    rg VARCHAR(20) NOT NULL,
    orgao_rg VARCHAR(10) NOT NULL,
    inscricao_estadual VARCHAR(30) NOT NULL, -- Precisa? Ou ela virá da tabela empresa?
    inscricao_municipal VARCHAR(30) NOT NULL,
    desde DATE not null,
    tipo_pessoa CHAR(1) NOT NULL ,
    excluido CHAR(1) NOT NULL,
    data_cadastro DATE,
    situacao_for_cli_id INT(10) NOT NULL,
    id_empresa INT(10) NOT NULL,
    tipo_fornecedor_id INT(10) NOT NULL,

    CONSTRAINT fk_situacao_for_cli_id_fornecedor
        FOREIGN KEY situacao_for_cli_id(id) REFERENCES situacao_for_cli(id),
    CONSTRAINT fk_id_empresa_fornecedor
        FOREIGN KEY id_empresa(id) REFERENCES empresa(id),
    CONSTRAINT fk_tipo_fornecedor_id
        FOREIGN KEY tipo_fornecedor_id(id) REFERENCES tipo_fornecedor(id)
);

CREATE TABLE cidade (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo_ibge INT(10) NOT NULL,
    nome2 VARCHAR(100)
);

CREATE TABLE banco (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL
);

CREATE TABLE cep (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    cep VARCHAR(8) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    logradouro VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade_id INT(10) NOT NULL,

    CONSTRAINT fk_cidade_id
        FOREIGN KEY cidade_id(id) REFERENCES cidade(id)
);

-- Tabela associativa entre cep e banco
CREATE TABLE agencia_banco (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    codigo INT(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(10) NOT NULL,
    gerente VARCHAR(30) NOT NULL,
    contato VARCHAR(30),
    obs TEXT,
    cep_id INT(10) NOT NULL,
    banco_id INT(10) NOT NULL,

    CONSTRAINT fk_cep_id
        FOREIGN KEY cep_id(id) REFERENCES cep(id),
    CONSTRAINT fk_banco_id
        FOREIGN KEY banco_id(id) REFERENCES banco(id)
);


CREATE TABLE tipo_endereco (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT
);

CREATE TABLE endereco (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero INT(10) NOT NULL,
    complemento VARCHAR(100) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    dono CHAR(1) NOT NULL,
    empresa_id INT(10) NOT NULL,
    colaborador_id INT(10) NOT NULL,
    fornecedor_id INT(10) NOT NULL,
    cliente_id INT(10) NOT NULL,
    tipo_endereco_id INT(10) NOT NULL,
    cep_id INT(10) NOT NULL,

    CONSTRAINT fk_empresa_id_endereco
        FOREIGN KEY empresa_id(id) references empresa(id),
    CONSTRAINT fk_colaborador_id
        FOREIGN KEY colaborador_id(id) references colaborador(id),
    CONSTRAINT fk_fornecedor_id_endereco
        FOREIGN KEY fornecedor_id(id) REFERENCES fornecedor(id),
    CONSTRAINT fk_cliente_id
        FOREIGN KEY cliente_id(id) REFERENCES cliente(id),
    CONSTRAINT fk_tipo_endereco_id
        FOREIGN KEY tipo_endereco_id(id) REFERENCES tipo_endereco(id),
    CONSTRAINT fk_cep_id
        FOREIGN KEY cep_id(id) REFERENCES cep(id)
);
