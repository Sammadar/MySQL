drop database if exists SuperLojaDb;
create database SuperLojaDb;
use SuperLojaDb;
-- default é um valor padrão que será utilizado no insert, caso não seja informado valor para a coluna
create table marcas(
	id INT primary key auto_increment,
	nome varchar(45) not null,
	cnpj varchar(18) default '00.000.000/0000-00', 
	data_criacao datetime default now()
);
INSERT INTO marcas (nome, cnpj) VALUES ('Hyundai', '10.394.422/0001-20'); # id 1
INSERT INTO marcas (nome) VALUES ('Volkswagen'); # id 2
INSERT INTO marcas (nome, cnpj) VALUES ('Chevrolet', NULL); # id 3

-- AS é um apelido
select 
	ma.id as 'Código', 
	ma.nome as 'Marca',
	ma.cnpj as 'CNPJ',
	ma.data_criacao as 'Data de criação'
	from marcas as ma;

create table carros(
	id int primary key auto_increment,
	modelo varchar(45) not null,
	cor varchar(30) not null,
	descricao varchar(1000),
	
	id_marca int not null,
	
	data_criacao DATETIME default now(),
	
	-- foreign key (<coluna-da-tabela-atual>) references <tabela-pai>(<coluna-pk-da-tabela-pai>)
	foreign key (id_marca) references marcas(id)
);

-- PK -> Primary Key => Chave primária
-- FK -> Foreign Key => Chave estrangeira

-- Uma chave estrangeira serve para relacionar um registro de uma tabela a outra tabela.
-- Obrigatoriamente uma FK tem que estar atrelada a uma PK

insert into carros (id_marca, modelo, cor) values
(2, 'Fusca', 'Azul bebê');

insert into carros (modelo, cor, id_marca) values
('HB20 Sedan', 'Branco', 1);

-- Este insert não funcionará pq a tabela de marcas não contém uma marca com o id 4.
-- insert into carros (modelo, cor, id_marca) values 
-- ('Dolphin', 'Caramelo', 4);

select c.id, c.modelo, c.cor, c.id_marca
from carros as c;

-- nullable => nullo
-- not nullable => não pode ser nulo


select 
	m.nome,
	c.modelo, 
	c.id_marca
from carros as c
inner join marcas as m on(c.id_marca = m.id);
	-- inner join <nome-da-outra-tabela> on 
	-- 				(<apelido-da-tabela>.<coluna-fk-da-tabela> = <apelido-da-outra-tabela>.<coluna-pk-da-outra-tabela);






create table departamentos (
    id int primary key auto_increment,
    nome varchar(45) not null
);

drop table if exists funcionarios;
create table funcionarios(
    id int primary key auto_increment,
    nome varchar(45) not null
);
insert into funcionarios (nome) values ("Judity");
insert into funcionarios (nome) values ("Lucas");

select * from funcionarios;

alter table funcionarios add column cpf varchar(45) default '' not null;

insert into funcionarios (nome, cpf) values ("Fernando", '21923');

insert into funcionarios (nome) values ("Fernanda");
-- update funcionarios set cpf = '213.401.239-10' where id = 1;
-- update funcionarios set cpf = '213.401.239-11' where id = 2;

-- alter table funcionarios modify column cpf varchar(45) not null;







drop database if exists EmpresaDb;
create database EmpresaDb;
use EmpresaDb;

create table departamentos (
    id int primary key auto_increment,
    nome varchar(45) not null
);

create table funcionarios(
    id int primary key auto_increment,
    nome varchar(45) not null,

    id_departamento int,
    foreign key (id_departamento) references departamentos(id)
);
alter table funcionarios add column cpf varchar(45) default '' not null;

create table categorias(
    id int primary key auto_increment,
    nome varchar(45) not null
);

create table atividades(
    id int primary key auto_increment,
    nome varchar(45) not null
);
alter table atividades add column descricao varchar(45);
alter table atividades add column tempo_gasto int not null;
alter table atividades add column id_funcionario int not null;
alter table atividades 
    add constraint fk_funcionarios_atividades 
    foreign key (id_funcionario)
    references funcionarios (id);

alter table atividades add column id_categoria int not null;

alter table atividades
    add constraint fk_categorias_atividades
    foreign key(id_categoria) references categorias(id);



-- Inserindo dados na tabela departamentos
insert into departamentos (nome) values 
('Recursos Humanos'),
('Financeiro'),
('TI'),
('Marketing'),
('Jurídico'),
('Logística'),
('Vendas'),
('Suporte'); -- suporte não tem funcionários

-- Inserindo dados na tabela funcionarios
insert into funcionarios (nome, id_departamento, cpf) values 
('Carlos Silva', 6, '123.456.789-00'), -- sem atividade
('Ana Souza', 2, '234.567.890-01'),
('Lucas Lima', 1, '345.678.901-02'),
('Mariana Alves', 3, '456.789.012-03'),
('Gabriel Costa', 4, '567.890.123-04'),
('Patrícia Rocha', 7, '678.901.234-05'),
('Juliana Martins', 5, '789.012.345-06');-- id 7 

-- Inserindo dados na tabela categorias
insert into categorias (nome) values 
('Administração'), -- 1 (sem atividade)
('Financeiro'), -- 2
('Desenvolvimento'), -- 3
('Marketing Digital'), -- 4
('Jurídico'), -- 5
('Vendas'), -- 6
('Suporte Técnico'), -- 7
('Logística'); -- 8

-- Inserindo dados na tabela atividades
insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Reunião de equipe', 'Reunião semanal para alinhamento', 60, 2, 2);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Análise de orçamento', 'Análise de números financeiros', 120, 2, 3);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Desenvolvimento de sistema', 'Criação de novas funcionalidades', 180, 3, 4);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Campanha publicitária', 'Criação de conteúdo para campanha', 90, 4, 5);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Consultoria jurídica', 'Análise de contratos', 150, 5, 6);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Gestão de equipe', 'Coordenação das equipes de vendas', 110, 6, 7);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Suporte a clientes', 'Atendimento ao cliente via chat', 45, 7, 8);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Logística de entrega', 'Planejamento das entregas de mercadorias', 75, 6, 2);

insert into atividades (nome, descricao, tempo_gasto, id_funcionario, id_categoria) values 
('Treinamento de novos funcionários', 'Treinamento sobre procedimentos internos', 60, 6, 2); -- funcionário sem atividade





-- Consultar os dados do departamento (sem buscar informações de outras tabelas)
select id, nome from departamentos;
-- Consultar os dados do funcionário (sem buscar informações de outras tabelas)
select id, nome, cpf, id_departamento from funcionarios;
-- Consultar os dados da categoria (sem buscar informações de outras tabelas)
select id, nome from categorias;
-- Consultar os dados da atividade (sem buscar informações de outras tabelas)
select id, nome, descricao, tempo_gasto, id_funcionario, id_categoria from atividades;


-- Consultar o nome do funcionário e seu departamento
select
    f.nome as 'Funcionário',
    d.nome as 'Departamento'
    from funcionarios as f
    inner join departamentos as d on(f.id_departamento = d.id);

-- as => alias => apelido
-- Consultar a atividade e sua categoria
select 
    at.nome as 'Atividade',
    cat.nome as 'Categoria'
    from atividades as at
    inner join categorias as cat on (at.id_categoria = cat.id);

-- Consultar a atividade, nome funcionário
select
    ati.nome as 'Atividade',
    fun.nome as 'Funcionário'
    from atividades as ati
    inner join funcionarios as fun on (ati.id_funcionario = fun.id);


-- Consultar a atividades relacionadas aos departamentos
-- Consultar o nome da atividade, nome do funcionário e nome do departamento
select
    atividades.nome AS 'Atividade',
    funcionarios.nome AS 'Funcionário',
    departamentos.nome AS 'Departamento'
    from atividades
    inner join funcionarios on (atividades.id_funcionario = funcionarios.id)
    inner join departamentos on (funcionarios.id_departamento = departamentos.id);


select
    atividades.nome as 'Atividade',
    funcionarios.nome as 'Funcionario',
    departamentos.nome as 'Departamento',
    categorias.nome as 'Categoria'
    from atividades
    inner join categorias on (atividades.id_categoria = categorias.id)
    inner join funcionarios on (atividades.id_funcionario = funcionarios.id)
    inner join departamentos on (funcionarios.id_departamento = departamentos.id);
