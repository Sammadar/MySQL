use SuperBiblioteca;
create view vw_livros_consolidados as
select
categorias.id as 'categoria_id', 
categorias.nome as ' categoria_nome', 
livros.id as 'livros_id',
 livros.nome as 'livro_nome'
 
 from livros
 inner join categorias on (livros.id_categorias = categorias.id);
 
 select * from vw_livros_consolidados;
 