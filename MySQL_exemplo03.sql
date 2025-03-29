drop database if exists supermercado_db;
create database supermercado_db;
use supermercado_db;

create table categorias (
	id int primary key auto_increment,
	nome varchar(75) not null unique
);

insert into categorias (nome) values 
('Mercearia'),
('Padaria'),
('Higiene'),
('Hortifruti'),
('Limpeza'), -- Sem produto
('Bebidas');

select * from categorias;

create table produtos (
	id int primary key auto_increment,
	nome varchar(50) not null unique,
	preco double not null,
	quantidade_estoque int not null,
	
	id_categoria int null,
	foreign key (id_categoria) references categorias(id)
);

select id, nome from categorias;


insert into produtos (nome, preco, quantidade_estoque, id_categoria) values
('Pão Francês', 0.70, 50, 2),
('Bolo de Chocolate', 16.00, 5, 2),
('Toddy', 5.00, 4, 6),
('Coca', 8.00, 200, 6),
('Sabonete Dove', 3.50, 100, 3),
('Uva', 1.50, 20, (select id from categorias where nome = 'Hortifruti')),
('Maçã', 1.20, 75, 4),
('Feijão', 10.55, 33, 1),
('Arroz', 6.50, 17, 1),
('Vinagre', 4.00, 10, 1);

insert into produtos (nome, preco, quantidade_estoque, id_categoria) values
('Chocolate Belga', 150.00, 2, null);

-- select nome, preco, quantidade_estoque, id_categoria from produtos;

-- inner join
-- quantidade de produtos cadastrados
select count(id) from produtos;

-- inner join retornar somente os produtos que contém categorias relacionadas
select 
	categorias.nome  as 'Categorias',
	produtos.nome as 'Produtos'
	from produtos
	inner join categorias on (produtos.id_categoria = categorias.id)
    order by categorias.nome, produtos.nome;
    
 -- left join retornar todos os produtos com ou sem categorias relacionados
 select 
	categorias.nome  as 'Categorias',
	produtos.nome as 'Produtos'
	from produtos
	left join categorias on (produtos.id_categoria = categorias.id)
    order by categorias.nome, produtos.nome;
    
-- right join retornar todos as categorias com ou sem produtos relacioados
 select 
	categorias.nome  as 'Categorias',
	produtos.nome as 'Produtos'
	from produtos
	right join categorias on (produtos.id_categoria = categorias.id)
    order by categorias.nome, produtos.nome;
    
-- Consultar a quantidade de produtos que tenho por categoria
select categorias.nome, count(produtos.nome)
	from produtos
	inner join categorias on (produtos.id_categoria = categorias.id)
	group by produtos.id_categoria;

-- group by agrupa so registros por categoria
-- count contabiliza a quantidade total de produtos daquela categoria agrupada

-- Consultar a quantidade total de estoque que temos por categoria
select categorias.nome, sum(produtos.quantidade_estoque)
from produtos
inner join categorias on (produtos.id_categoria = categorias.id)
group by produtos.id_categoria;

-- Consultar a média de preços por categoria, dos produtos que contém o preço maior que 4
select categorias.nome, avg(produtos.preco) as 'preco'
from produtos
right join categorias on (produtos.id_categoria = categorias.id)
where preco > 4 -- where está filtrando os produtos antes de serem agrupados
group by categorias.id
order by categorias.nome;

-- Consultar a média de precos por categoria, das médias que são superiores a 4
select categorias.nome, avg(produtos.preco) as 'preco'
from produtos
right join categorias on (produtos.id_categoria = categorias.id)
group by categorias.id
having preco > 4 -- having ele filtra os dados depois de terem sido agrupados
order by categorias.nome;

-- Se a tabela já existir, ela é removida
DROP TABLE IF EXISTS pedidos;

-- Criação da tabela "pedidos" com a coluna nome_cliente
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    data_pedido DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Inserts na tabela "pedidos" utilizando nomes dos clientes
INSERT INTO pedidos (nome_cliente, data_pedido, valor) VALUES
('João',  '2023-01-05', 150.00),
('João',  '2023-02-10', 200.00),
('João',  '2022-12-20', 100.00),  -- Pedido anterior a 2023 para testar o WHERE
('João',  '2023-03-15', 250.00),
('João',  '2023-04-22', 300.00),
('João',  '2023-05-30', 180.00),

('Maria', '2023-01-12', 120.00),
('Maria', '2023-03-03', 140.00),
('Maria', '2022-11-28', 160.00),  -- Pedido anterior a 2023

('Pedro', '2023-02-17', 200.00),
('Pedro', '2023-03-19', 210.00),
('Pedro', '2023-04-01', 220.00),
('Pedro', '2023-04-05', 230.00),
('Pedro', '2023-05-10', 240.00),
('Pedro', '2023-06-15', 250.00),
('Pedro', '2023-07-20', 260.00),

('Ana',   '2023-02-08', 300.00),
('Ana',   '2023-03-11', 320.00),
('Ana',   '2022-12-30', 340.00),  -- Pedido anterior a 2023
('Ana',   '2023-04-12', 360.00);

-- select filtrando os registros antes de agrupar
select nome_cliente, sum(valor)
from pedidos
where YEAR(data_pedido) = 2023
group by nome_cliente;

-- select filtrando os registros agrupados por soma maior que 1000
select nome_cliente, sum(valor) as total_pedidos
from pedidos
group by nome_cliente
having total_pedidos > 1000;

-- Apresentar oico estoque quando a quantidade for inferior a 50, muito estoque quando for 50 ou mais
select
	produtos.nome,
	produtos.quantidade_estoque,
	if(produtos.quantidade_estoque < 50, 'Baixo estoque', 'Alto estoque') as 'status'
	from produtos
	order by status;

-- Uma alternativa seria utilizar case
select 
	produtos.nome,
	produtos.quantidade_estoque,
	case
		when produtos.quantidade_estoque > 100 then 'Absurdo de estoque'
		when produtos.quantidade_estoque > 50 then 'Alto estoque'
		else 'Baixo estoque'
	end as status
	from produtos
	order by status;
    
-- filtrar os produtos que tem o preço entre 5 e 11
select * from produtos where preco >= 5 and preco <= 11;
-- alternativa: between
select * from produtos where preco between 5 and 11;    
-- filtrar os produtos que tem o nome 'Toddy' ou 'Chocolate Belga' ou 'Coca'
select * from produtos where nome = 'Toddy' or nome = 'Chocolate Belga' or nome = 'Coca';
-- alternativa: in
select * from produtos where nome in ('Toddy', 'Chocolate Belga', 'Coca')

-- collate: é um conjunto de regras que determina como os dados de texto são comparados e ordenados
-- essas regras definem, por exemplo, se as comparações entre letras devem levar em consideraçãor
-- diferenças entre maisculas e minusculas, acentos e outros aspectos específicos de um idioma.
-- collete: utf8mb4_general_ci, onde 'ci' significa case insensitive (não se importa com maiúsculas ou minúsculas)
-- collete: utf8mb4_bin: realiza comparações onde importa maiusculas ou minusculas
-- como saber o collate de uma tabela 

show create table produtos;

-- como alterar o collate de uma tabela
alter table produtos
convert to character set utf8mb4
collate utf8mb4_general_ci;
    
