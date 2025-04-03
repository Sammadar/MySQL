drop view if exists vw_livros_autores;

use SuperBiblioteca;

create or replace view vw_livros_comentarios_consolidados as
select 
	livros.nome as 'livro',
	count(livros_comentarios.comentario) 'quantidade_comentarios'

from livros_comentarios
inner join livros on (livros_comentarios.id_livro = livros.id)
group by livros_comentarios.id_livro
order by quantidade_comentarios desc, livro asc;

select * from vw_livros_comentarios_consolidados vlcc;


-- Criar uma view vw_livros_autores (listar nome do livro, quantidade de paginas, nome autor e id do autor)

create or replace view vw_livros_autores as
	select
	livros.nome as 'livros_nome',
	livros.quantidade_paginas as 'quantidade_paginas',
	autores.nome as 'nome da autora',
	autores.id as 'id_autores'
    
    from livros
    inner join autores on (livros.id_autor = autores.id);
select * from vw_livros_autores;


-- Criar uma view vw_livros_categorias (listar nome da categoria, nome do livro, id da categoria e id do livro)

create or replace view vw_livros_categorias as
	select
	categorias.nome as 'nome_categora',
	livros.nome as 'nome_livro',
	categorias.id as 'id_categoria',
	livros.id as 'id_livro'
    
    from livros
    inner join categorias on (livros.id_categoria = categorias.id);
select * from vw_livros_categorias;
    
-- Criar uma view vw_livros_editoras (listar nome da editora, nome do livro, ordenados por nome de editora)
create or replace view vw_livros_editoras as
	select
	editoras.nome as 'nome_editoras', 
	livros.nome as 'nome_livro'

	from livros 
	inner join editoras on (livros.id_editora = editoras.id) order by editoras.nome, livros.nome ASC;
    
select * from vw_livros_editoras;

-- Criar uma view vw_livros_editoras_autores 
-- 					 (listar nome do livro, autor, editora onde a quantidade de páginas for maior que 1000)

create or replace view vw_livros_editoras_autores as
	select
    livros.nome as "nome_livro", 
    autores.nome as "nome_autores", 
    editoras.nome as "nome_editora",
    livros.quantidade_paginas as "quantidade_páginas"
    
    from livros
    inner join editoras on (livros.id_editora = editoras.id)
    inner join autores on (livros.id_autor = autores.id) 
    where quantidade_paginas >= 1000;
    
select * from vw_livros_editoras_autores;

-- Criar uma view vw_livros_fantasia (listar nome do livro, quantidade de paginas, descricao) da categoria 'Fantasia'
create or replace view vw_livros_fantasia as
select
livros.nome as "nome do livro", 
livros.quantidade_paginas as "quantidades de paginas", 
livros.descricao as "descrição", 
categorias.nome as "categorias"

from livros
inner join categorias on (livros.id_categoria = categorias.id);

select * from vw_livros_fantasia where categorias = "fantasia";

-- Criar uma view vw_livros_autor_tolkien (listar nome do livro, nome do autor) filtrar autor 'J.R.R. Tolkien'


-- Criar uma view vw_livros_por_categoria (listar nome da categoria, quantidade livros) group by necessário
-- Criar uma view vw_paginas_por_autor (listar nome do autor, soma da quantidade de páginas) group by necessário
