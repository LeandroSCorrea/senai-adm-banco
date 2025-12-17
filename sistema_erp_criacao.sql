-- CREATE DATABASE erp;

use erp;

CREATE TABLE empresa (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    razao_social VARCHAR(150) NOT NULL,
    nome_fantasia VARCHAR(150) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    inscricao_estadual VARCHAR(30) NOT NULL,
    inscricao_municipal VARCHAR(30) NOT NULL,
    matriz_filial CHAR(1) NOT NULL,
    data_cadastro DATE NOT NULL,
    empresa_id INT(10),

    CONSTRAINT fk_empresa_id
        FOREIGN KEY (empresa_id) REFERENCES empresa(id)
);

CREATE TABLE auditoria (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    data_hora DATETIME NOT NULL,
    tabela VARCHAR(100) NOT NULL,
    antigo VARCHAR(100) NOT NULL,
    novo VARCHAR(100) NOT NULL,
    registro_id INT(11) NOT NULL,

    CONSTRAINT fk_registro_id_auditoria
        FOREIGN KEY (registro_id) REFERENCES empresa(id)
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
    CONSTRAINT fk_cargo_id_colaborador
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

CREATE TABLE funcao (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    descricao_menu VARCHAR(30) NOT NULL,
    imagem_menu VARCHAR(30) NOT NULL,
    metodo VARCHAR(30)
);

-- Tabela associativa entre papel e funçao
CREATE TABLE papel_funcao (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    pode_consultar CHAR(1),
    pode_inserir CHAR(1),
    pode_alterar CHAR(1),
    pode_excluir CHAR(1),
    funcao_id INT(10) NOT NULL,
    papel_id INT(10) NOT NULL,

    CONSTRAINT fk_funcao_id
        FOREIGN KEY funcao_id(id) REFERENCES funcao(id),
    CONSTRAINT fk_papel_id
        FOREIGN KEY papel_id(id) REFERENCES papel(id)
);

CREATE TABLE usuario (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao text,
    papel_id INT NOT NULL,
    colaborador_id INT NOT NULL,

    CONSTRAINT fk_papel_id_usuario
        FOREIGN KEY papel_id(id) REFERENCES papel(id),
    CONSTRAINT fk_colaborador_id_usuario
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
    inscricao_estadual VARCHAR(30) NOT NULL,
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

-- Tabela associada a produto e fornecedor para a correta aplicação e cálculo de impostos
CREATE TABLE cfop (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    cfop INT(10) NOT NULL,
    descricao TEXT,
    aplicacao TEXT
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
    inscricao_estadual VARCHAR(30) NOT NULL,
    inscricao_municipal VARCHAR(30) NOT NULL,
    desde DATE not null,
    tipo_pessoa CHAR(1) NOT NULL ,
    excluido CHAR(1) NOT NULL,
    data_cadastro DATE,
    situacao_for_cli_id INT(10) NOT NULL,
    id_empresa INT(10) NOT NULL,
    tipo_fornecedor_id INT(10) NOT NULL,
    cfop_id INT(10) NOT NULL,

    CONSTRAINT fk_situacao_for_cli_id_fornecedor
        FOREIGN KEY situacao_for_cli_id(id) REFERENCES situacao_for_cli(id),
    CONSTRAINT fk_id_empresa_fornecedor
        FOREIGN KEY id_empresa(id) REFERENCES empresa(id),
    CONSTRAINT fk_tipo_fornecedor_id
        FOREIGN KEY tipo_fornecedor_id(id) REFERENCES tipo_fornecedor(id),
    CONSTRAINT fk_cfop_id
        FOREIGN KEY cfop_id(id) REFERENCES cfop(id)
);

CREATE TABLE cidade (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo_ibge INT(10) NOT NULL,
    nome2 VARCHAR(100)
);

CREATE TABLE pais (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    codigo INT(10) NOT NULL,
    nome_en VARCHAR(100) NOT NULL,
    nome_ptbr VARCHAR(100) NOT NULL,
    sigla2 CHAR(2) NOT NULL,
    sigla3 CHAR(3) NOT NULL
);

CREATE TABLE indice_economico (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    sigla VARCHAR(50) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    descricao TEXT,
    pais_id INT(10) NOT NULL,

    CONSTRAINT fk_pais_id
        FOREIGN KEY pais_id(id) REFERENCES pais(id)
);

CREATE TABLE estado (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    codigo_ibge INT(10) NOT NULL,
    pais_id INT(10) NOT NULL,
    sigla CHAR(2) NOT NULL,

    CONSTRAINT fk_pais_id_estado
        FOREIGN KEY pais_id(id) REFERENCES pais(id)
);

CREATE TABLE log_cidade (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    codigo_ibge INT(11) NOT NULL,
    data_alteracao TIMESTAMP,
    operacao INT(11) NOT NULL,
    id_cidade INT(11) NOT NULL,
    estado_id INT(11) NOT NULL,

    CONSTRAINT fk_id_cidade
        FOREIGN KEY id_cidade(id) REFERENCES cidade(id),
    CONSTRAINT fk_estado_id
        FOREIGN KEY estado_id(id) REFERENCES estado(id)
);

CREATE TABLE operadora_cartao (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    bandeira VARCHAR(30)
);

CREATE TABLE url (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    site VARCHAR(200) NOT NULL
);

CREATE TABLE banco (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    codigo INT(10) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    url VARCHAR(255) NOT NULL,
    url_id INT(11) NOT NULL,

    CONSTRAINT fk_codigo_banco
        FOREIGN KEY (url_id) REFERENCES url(id)
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
    CONSTRAINT fk_colaborador_id_endereco
        FOREIGN KEY colaborador_id(id) references colaborador(id),
    CONSTRAINT fk_fornecedor_id_endereco
        FOREIGN KEY fornecedor_id(id) REFERENCES fornecedor(id),
    CONSTRAINT fk_cliente_id
        FOREIGN KEY cliente_id(id) REFERENCES cliente(id),
    CONSTRAINT fk_tipo_endereco_id
        FOREIGN KEY tipo_endereco_id(id) REFERENCES tipo_endereco(id),
    CONSTRAINT fk_cep_id_endereco
        FOREIGN KEY cep_id(id) REFERENCES cep(id)
);

CREATE TABLE contato (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    dono CHAR(1) NOT NULL,
    empresa_id INT(10) NOT NULL,
    colaborador_id INT(10) NOT NULL,
    cliente_id INT(10) NOT NULL,
    fornecedor_id INT(10) NOT NULL,
    contato_id INT(10) NOT NULL,

    CONSTRAINT fk_empresa_id_contato
        FOREIGN KEY empresa_id(id) REFERENCES empresa(id),
    CONSTRAINT fk_colaborador_id_contato
        FOREIGN KEY colaborador_id(id) REFERENCES colaborador(id),
    CONSTRAINT fk_cliente_id_contato
        FOREIGN KEY empresa_id(id) REFERENCES empresa(id),
    CONSTRAINT fk_fornecedor_id
        FOREIGN KEY fornecedor_id(id) REFERENCES fornecedor(id)
);

CREATE TABLE tipo_email (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT
);

CREATE TABLE log_tipo_email (
    id INT(11) PRIMARY KEY AUTO_INCREMENT,
    operacao VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    data_exclusao TIMESTAMP NOT NULL,
    id_tabela INT(11) NOT NULL,

    CONSTRAINT fk_id_tabela
        FOREIGN KEY id_tabela(id) REFERENCES tipo_email(id)
);

-- Tabela associativa entre contato e tipo_email
CREATE TABLE contato_email (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    tipo_email_id INT(10) NOT NULL,
    contato_id INT(10) NOT NULL,

    CONSTRAINT fk_tipo_email_id
        FOREIGN KEY tipo_email_id(id) REFERENCES tipo_email(id),
    CONSTRAINT fk_contato_id
        FOREIGN KEY contato_id(id) REFERENCES contato(id)
);

CREATE TABLE tipo_telefone (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT
);

-- Tabela associativa entre contato e tipo_telefone
CREATE TABLE contato_telefone (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(10) NOT NULL,
    tipo_telefone_id INT(10) NOT NULL,
    contato_id INT(10) NOT NULL,

    CONSTRAINT fk_tipo_telefone_id_contato_telefone
        FOREIGN KEY tipo_telefone_id(id) REFERENCES tipo_telefone(id),
    CONSTRAINT fk_contato_id_contato_telefone
        FOREIGN KEY contato_id(id) REFERENCES contato(id)
);

CREATE TABLE grupo_produto(
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome  VARCHAR(20) NOT NULL,
    descricao TEXT
);

CREATE TABLE sub_grupo_produto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    descricao TEXT,
    id_grupo INT(10) NOT NULL,

    CONSTRAINT fk_id_grupo
        FOREIGN KEY id_grupo(id) REFERENCES grupo_produto(id)
);

CREATE TABLE unidade_produto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(10) NOT NULL,
    descricao TEXT NOT NULL
);

CREATE TABLE produto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(30) NOT NULL,
    descricao TEXT NOT NULL,
    descricao_pdv VARCHAR(30) NOT NULL ,
    valor_compra DOUBLE(11,2) NOT NULL,
    valor_venda DOUBLE(11,2) NOT NULL,
    qtd_estoque DOUBLE(11,2) NOT NULL,
    estoque_min DOUBLE(11,2) NOT NULL,
    estoque_max DOUBLE(11,2) NOT NULL,
    excluido CHAR(1) NOT NULL,
    data_cadastro DATE NOT NULL,
    id_sub_grupo INT(10) NOT NULL,
    id_unidade INT(10) NOT NULL,
    gtin CHAR(14) NOT NULL,
    cfop_id INT(10) NOT NULL,

    CONSTRAINT fk_id_sub_grupo_produto
        FOREIGN KEY (id_sub_grupo) REFERENCES sub_grupo_produto(id),
    CONSTRAINT fk_id_unidade_produto
        FOREIGN KEY (id_unidade) REFERENCES unidade_produto(id),
    CONSTRAINT fk_cfop_id_produto
        FOREIGN KEY (cfop_id) REFERENCES cfop(id)
);

-- Tabela associativa entre empre e produto
CREATE TABLE empresa_produto (
    id INT(10) PRIMARY KEY AUTO_INCREMENT,
    empresa_id INT(10) NOT NULL,
    produto_id INT(10) NOT NULL,

    CONSTRAINT fk_empresa_id_empresa_produto
        FOREIGN KEY (empresa_id) REFERENCES empresa(id),
    CONSTRAINT fk_produto_id_empresa_produto
        FOREIGN KEY (produto_id) REFERENCES produto(id)
);