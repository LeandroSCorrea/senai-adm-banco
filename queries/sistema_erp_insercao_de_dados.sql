use erp;

INSERT INTO empresa (
    razao_social,
    nome_fantasia,
    cnpj,
    inscricao_estadual,
    inscricao_municipal,
    matriz_filial,
    data_cadastro,
    empresa_id
) VALUES (
    'Tecnologia Soluções S.A.',
    'TechSol',
    '12345678000190',
    'ISENTO',
    '1234567-8',
    'M', -- Matriz
    '2023-01-15',
    NULL -- É a matriz, não tem empresa_id vinculada
);

INSERT INTO empresa (
    razao_social,
    nome_fantasia,
    cnpj,
    inscricao_estadual,
    inscricao_municipal,
    matriz_filial,
    data_cadastro,
    empresa_id
) VALUES (
    'Tecnologia Soluções Filial SP',
    'TechSol SP',
    '12345678000281',
    '987.654.321.111',
    '9876543-2',
    'F', -- Filial
    '2023-05-20',
    1 -- ID da Matriz (TechSol)
);

INSERT INTO empresa (
    razao_social,
    nome_fantasia,
    cnpj,
    inscricao_estadual,
    inscricao_municipal,
    matriz_filial,
    data_cadastro,
    empresa_id
) VALUES (
    'Tecnologia Soluções Filial RJ',
    'TechSol RJ',
    '12345678000372',
    '456.789.012.222',
    '6543210-9',
    'F', -- Filial
    '2024-01-10',
    1 -- ID da Matriz (TechSol)
);

INSERT INTO empresa (
    razao_social,
    nome_fantasia,
    cnpj,
    inscricao_estadual,
    inscricao_municipal,
    matriz_filial,
    data_cadastro,
    empresa_id
) VALUES (
    'Comércio de Alimentos LTDA',
    'FoodMart',
    '98765432000100',
    '321.098.765.333',
    '0001112-3',
    'M', -- Matriz
    '2022-11-01',
    NULL -- É a matriz
);

INSERT INTO empresa (
    razao_social,
    nome_fantasia,
    cnpj,
    inscricao_estadual,
    inscricao_municipal,
    matriz_filial,
    data_cadastro,
    empresa_id
) VALUES (
    'Comércio de Alimentos Filial MG',
    'FoodMart MG',
    '98765432000291',
    '111.222.333.444',
    '0004445-6',
    'F', -- Filial
    '2023-08-25',
    4 -- ID da Matriz (FoodMart)
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2023-01-15 10:30:00',
    'empresa',
    'N/A (Inserção)',
    'razao_social: Tecnologia Soluções S.A.; cnpj: 12345678000190',
    1 -- ID da empresa inserida
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2023-08-01 14:00:00',
    'empresa',
    'nome_fantasia: TechSol SP',
    'nome_fantasia: TechSol Paulista',
    2 -- ID da empresa atualizada
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2024-02-28 09:15:00',
    'empresa',
    'matriz_filial: F; empresa_id: 1',
    'matriz_filial: M; empresa_id: NULL',
    3 -- ID da empresa atualizada
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2022-11-01 17:45:00',
    'empresa',
    'N/A (Inserção)',
    'razao_social: Comércio de Alimentos LTDA; cnpj: 98765432000100',
    4 -- ID da empresa inserida
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2024-05-10 11:55:00',
    'empresa',
    'inscricao_estadual: 111.222.333.444',
    'inscricao_estadual: 555.666.777.888',
    5 -- ID da empresa atualizada
);

INSERT INTO auditoria (
    data_hora,
    tabela,
    antigo,
    novo,
    registro_id
) VALUES (
    '2024-05-10 11:55:00',
    'empresa',
    'inscricao_estadual: 111.222.333.444',
    'inscricao_estadual: 555.666.777.888',
    5 -- ID da empresa atualizada
);

INSERT INTO convenio (
    nome,
    descricao,
    desconto,
    data_vencimento,
    id_empresa
) VALUES (
    'Plano Odontológico Premium',
    'Cobertura completa para tratamentos ortodônticos e estéticos. Válido para todos os funcionários.',
    15.50, -- 15.50% de desconto
    '2025-12-31',
    1
);

INSERT INTO convenio (
    nome,
    descricao,
    desconto,
    data_vencimento,
    id_empresa
) VALUES (
    'Seguro de Vida Corporativo',
    'Seguro de vida com cobertura de R$ 100.000,00 por colaborador em caso de falecimento.',
    10.00, -- 10.00% de desconto
    '2026-06-30',
    4
);

INSERT INTO convenio (
    nome,
    descricao,
    desconto,
    data_vencimento,
    id_empresa
) VALUES (
    'Academia Total Fit',
    'Acesso a todas as unidades da rede Total Fit com 25% de desconto na mensalidade.',
    25.00, -- 25.00% de desconto
    '2024-11-30',
    2
);

INSERT INTO convenio (
    nome,
    descricao,
    desconto,
    data_vencimento,
    id_empresa
) VALUES (
    'Auxílio Refeição Flex',
    'Benefício de cartão refeição/alimentação com taxa de administração subsidiada.',
    5.75, -- 5.75% de desconto
    '2027-01-01',
    3
);

INSERT INTO convenio (
    nome,
    descricao,
    desconto,
    data_vencimento,
    id_empresa
) VALUES (
    'Desconto em Farmácias',
    'Desconto de até 30% em medicamentos e itens de higiene em farmácias credenciadas.',
    30.00, -- 30.00% de desconto
    '2025-08-15',
    5
);

INSERT INTO setor (
    nome,
    descricao,
    empresa_id
) VALUES (
    'Desenvolvimento',
    'Responsável pela criação e manutenção dos sistemas e softwares da empresa.',
    1 -- ID da TechSol Matriz
);

INSERT INTO setor (
    nome,
    descricao,
    empresa_id
) VALUES (
    'Financeiro',
    'Gerencia as finanças, contas a pagar e a receber, e o planejamento orçamentário.',
    1 -- ID da TechSol Matriz
);

INSERT INTO setor (
    nome,
    descricao,
    empresa_id
) VALUES (
    'Logística',
    'Cuida do estoque, armazenamento, transporte e distribuição de produtos alimentícios.',
    4 -- ID da FoodMart Matriz
);

INSERT INTO setor (
    nome,
    descricao,
    empresa_id
) VALUES (
    'Suporte Técnico',
    'Oferece assistência e solução de problemas técnicos para clientes e colaboradores da filial.',
    2 -- ID da TechSol Filial SP
);

INSERT INTO setor (
    nome,
    descricao,
    empresa_id
) VALUES (
    'Vendas',
    'Responsável pela prospecção de clientes e concretização das negociações comerciais.',
    5 -- ID da FoodMart Filial MG
);

INSERT INTO nivel_formacao (
    nome,
    descricao
) VALUES (
    'Fundamental',
    'Abrange os anos iniciais e finais da educação básica obrigatória.'
);

INSERT INTO nivel_formacao (
    nome,
    descricao
) VALUES (
    'Médio',
    'Conclusão da educação básica, preparatório para o ingresso no ensino superior.'
);

INSERT INTO nivel_formacao (
    nome,
    descricao
) VALUES (
    'Graduação',
    'Nível superior que confere o título de Bacharel, Licenciado ou Tecnólogo.'
);

INSERT INTO nivel_formacao (
    nome,
    descricao
) VALUES (
    'Especialização',
    'Pós-graduação com foco na formação profissional, como Especialização ou MBA (Master in Business Administration).'
);

INSERT INTO nivel_formacao (
    nome,
    descricao
) VALUES (
    'Mestrado',
    'Pós-graduação com foco em pesquisa científica e acadêmica, geralmente o primeiro nível do Stricto Sensu.'
);

INSERT INTO cargo (
    nome,
    descricao,
    salario
) VALUES (
    'Analista Pleno',
    'Responsável por analisar, projetar e implementar soluções de software de médio porte.',
    6500.00
);

INSERT INTO cargo (
    nome,
    descricao,
    salario
) VALUES (
    'Gerente Comercial',
    'Lidera a equipe de vendas, define estratégias comerciais e é responsável pelo atingimento de metas.',
    12000.00
);

INSERT INTO cargo (
    nome,
    descricao,
    salario
) VALUES (
    'Assistente Júnior',
    'Presta suporte em atividades administrativas, como organização de documentos e agendamento de reuniões.',
    2100.00
);

INSERT INTO cargo (
    nome,
    descricao,
    salario
) VALUES (
    'Desenvolvedor Sênior',
    'Especialista na criação de interfaces de usuário avançadas e na arquitetura de front-end das aplicações.',
    10500.00
);

INSERT INTO cargo (
    nome,
    descricao,
    salario
) VALUES (
    'Diretor Executivo',
    'Define a visão e estratégia geral da empresa, supervisionando todas as operações e resultados.',
    35000.00
);

INSERT INTO log_cargo (
    salario_antigo,
    salario_novo,
    data_alteracao,
    cargo_id
) VALUES (
    6000.00,
    6500.00,
    '2024-03-10 09:00:00',
    1
);

INSERT INTO log_cargo (
    salario_antigo,
    salario_novo,
    data_alteracao,
    cargo_id
) VALUES (
    11500.00,
    12000.00,
    '2024-01-01 00:00:00',
    2
);

INSERT INTO log_cargo (
    salario_antigo,
    salario_novo,
    data_alteracao,
    cargo_id
) VALUES (
    1800.00,
    2100.00,
    '2023-10-15 14:30:00',
    3
);

INSERT INTO log_cargo (
    salario_antigo,
    salario_novo,
    data_alteracao,
    cargo_id
) VALUES (
    9500.00,
    10500.00,
    '2024-06-20 11:00:00',
    4
);

INSERT INTO log_cargo (
    salario_antigo,
    salario_novo,
    data_alteracao,
    cargo_id
) VALUES (
    12000.00,
    13000.00,
    '2025-01-01 00:00:00',
    2
);

INSERT INTO tipo_colaborador (
    nome,
    descricao
) VALUES (
    'CLT',
    'Colaborador contratado sob o regime da CLT, com jornada de trabalho e benefícios fixos.'
);

INSERT INTO tipo_colaborador (
    nome,
    descricao
) VALUES (
    'Estagiário',
    'Estudante em contrato de estágio, focado em aprendizado prático e com carga horária reduzida.'
);

INSERT INTO tipo_colaborador (
    nome,
    descricao
) VALUES (
    'Terceirizado',
    'Colaborador que presta serviço para a empresa através de um contrato com uma empresa terceirizada (prestadora de serviços).'
);

INSERT INTO tipo_colaborador (
    nome,
    descricao
) VALUES (
    'Jovem Aprendiz',
    'Jovem que combina formação teórica em instituição de ensino e prática profissional na empresa, sob regime especial.'
);

INSERT INTO tipo_colaborador (
    nome,
    descricao
) VALUES (
    'PJ',
    'Profissional autônomo contratado como Pessoa Jurídica para prestar serviços específicos (B2B).'
);

INSERT INTO colaborador (
    nome,
    cpf,
    rg,
    data_nascimento,
    tipo_sanguineo,
    foto_34,
    excluido,
    data_cadastro,
    nivel_formacao_id,
    tipo_colaborador_id,
    cargo_id,
    id_setor
) VALUES (
    'Ana Silva Santos',
    '11122233344',
    'MG-12.345.678',
    '1995-05-20',
    'A+',
    '/fotos/ana_silva.jpg',
    'N', -- Não excluído
    '2023-08-15',
    3, -- Graduação
    1, -- CLT
    1, -- Analista Pleno
    1  -- Desenvolvimento (Empresa 1)
);

INSERT INTO colaborador (
    nome,
    cpf,
    rg,
    data_nascimento,
    tipo_sanguineo,
    foto_34,
    excluido,
    data_cadastro,
    nivel_formacao_id,
    tipo_colaborador_id,
    cargo_id,
    id_setor
) VALUES (
    'Bruno Lima Costa',
    '22233344455',
    'RJ-98.765.432',
    '2002-11-10',
    'O-',
    '/fotos/bruno_costa.jpg',
    'N',
    '2024-01-20',
    2, -- Ensino Médio
    2, -- Estagiário
    3, -- Assistente Júnior
    2  -- Financeiro (Empresa 1)
);

INSERT INTO colaborador (
    nome,
    cpf,
    rg,
    data_nascimento,
    tipo_sanguineo,
    foto_34,
    excluido,
    data_cadastro,
    nivel_formacao_id,
    tipo_colaborador_id,
    cargo_id,
    id_setor
) VALUES (
    'Carla Souza Oliveira',
    '33344455566',
    'SP-45.678.901',
    '1988-03-01',
    'B+',
    '/fotos/carla_oliveira.jpg',
    'N',
    '2023-04-10',
    5, -- Mestrado
    5, -- PJ
    4, -- Desenvolvedor Sênior
    4  -- Suporte Técnico (Empresa 2 - Filial SP)
);

INSERT INTO colaborador (
    nome,
    cpf,
    rg,
    data_nascimento,
    tipo_sanguineo,
    foto_34,
    excluido,
    data_cadastro,
    nivel_formacao_id,
    tipo_colaborador_id,
    cargo_id,
    id_setor
) VALUES (
    'Diego Alves Pereira',
    '44455566677',
    'ES-23.456.789',
    '1975-12-25',
    'A-',
    '/fotos/diego_pereira.jpg',
    'N',
    '2022-11-01',
    4, -- Especialização
    1, -- CLT
    2, -- Gerente Comercial
    3  -- Logística (Empresa 4 - Matriz)
);
-- refazer
INSERT INTO colaborador (
    nome,
    cpf,
    rg,
    data_nascimento,
    tipo_sanguineo,
    foto_34,
    excluido,
    data_cadastro,
    nivel_formacao_id,
    tipo_colaborador_id,
    cargo_id,
    id_setor
) VALUES (
    'Eloá Ribeiro Ferreira',
    '55566677788',
    'MG-01.234.567',
    '2005-07-08',
    'O+',
    '/fotos/eloa_ferreira.jpg',
    'N',
    '2024-05-01',
    2, -- Ensino Médio
    4, -- Jovem Aprendiz
    3, -- Assistente Junior
    5  -- Vendas (Empresa 5 - Filial MG)
);

INSERT INTO tipo_relacionamento (
    nome,
    descricao
) VALUES (
    'Cônjuge',
    'Pessoa legalmente casada ou em união estável com o colaborador.'
);

INSERT INTO tipo_relacionamento (
    nome,
    descricao
) VALUES (
    'Filho(a)',
    'Filho(a) biológico ou adotivo do colaborador, geralmente menor de idade ou estudante.'
);

INSERT INTO tipo_relacionamento (
    nome,
    descricao
) VALUES (
    'Pai/Mãe',
    'Ascendente direto do colaborador, em casos de dependência para fins de plano de saúde ou IR.'
);

INSERT INTO tipo_relacionamento (
    nome,
    descricao
) VALUES (
    'Irmão(ã)',
    'Irmão ou irmã do colaborador, geralmente menor de idade ou incapaz.'
);

INSERT INTO tipo_relacionamento (
    nome,
    descricao
) VALUES (
    'Outros Parentes',
    'Outros parentes listados como dependentes (ex: avós, netos, tutelados).'
);

INSERT INTO colaborador_relacionamento (
    nome,
    tipo_relacionamento_id,
    colaborador_id
) VALUES (
    'Lucas Silva Santos',
    2, -- Filho(a)
    1  -- Ana Silva Santos
);

INSERT INTO colaborador_relacionamento (
    nome,
    tipo_relacionamento_id,
    colaborador_id
) VALUES (
    'Mariana Ribeiro Pereira',
    1, -- Cônjuge
    4  -- Diego Alves Pereira
);

INSERT INTO colaborador_relacionamento (
    nome,
    tipo_relacionamento_id,
    colaborador_id
) VALUES (
    'Sofia Ribeiro Pereira',
    2, -- Filho(a)
    4  -- Diego Alves Pereira
);

INSERT INTO colaborador_relacionamento (
    nome,
    tipo_relacionamento_id,
    colaborador_id
) VALUES (
    'João Carlos de Oliveira',
    3, -- Pai/Mãe
    3  -- Carla Souza Oliveira
);

-- refazer
INSERT INTO colaborador_relacionamento (
    nome,
    tipo_relacionamento_id,
    colaborador_id
) VALUES (
    'Alice Lima Costa',
    4, -- Irmão(ã)
    2  -- Bruno Lima Costa
);

