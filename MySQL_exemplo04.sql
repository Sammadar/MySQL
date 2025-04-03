drop database if exists SuperBiblioteca;
create database SuperBiblioteca;
use SuperBiblioteca;

create table categorias (
id int primary key auto_increment,
nome varchar(50) not null
);

create table autores (
id int primary key auto_increment,
nome varchar(50) not null, 
cpf char(14) not null unique
);

create table editoras (
id int primary key auto_increment,
nome varchar(75) not null, 
cnpj char(18) not null unique
);

create table livros(
id int primary key auto_increment,
nome varchar(100) not null, 
id_categoria int not null, 
id_autor int not null,
id_editora int not null,

quantidade_paginas int not null, 
descricao text, 
foreign key (id_categoria) references categorias(id),
foreign key (id_autor) references autores(id),
foreign key (id_editora) references editoras(id)
);

create table livros_comentarios(
id int primary key auto_increment, 
cliente varchar(50) not null, 
avaliacao smallint not null, 
comentario text not null, 
id_livro int not null,
-- FK
foreign key (id_livro) references livros(id)
); 

-- Inserindo categorias
INSERT INTO categorias (nome) VALUES
  ('Romance'),
  ('Ficção Científica'),
  ('Fantasia'),
  ('Mistério'),
  ('Histórico'),
  ('Política');

-- Inserindo autores (os CPFs são fictícios e devem obedecer o formato ###.###.###-##)
INSERT INTO autores (nome, cpf) VALUES
  ('George Orwell', '123.456.789-00'),
  ('J.R.R. Tolkien', '234.567.890-11'),
  ('Machado de Assis', '345.678.901-22'),
  ('J.K. Rowling', '456.789.012-33'),
  ('Agatha Christie', '567.890.123-44'),
  ('Isaac Asimov', '678.901.234-55');

-- Inserindo editoras (os CNPJs são fictícios e devem obedecer o formato ##.###.###/####-##)
INSERT INTO editoras (nome, cnpj) VALUES
  ('Editora Abril', '12.345.678/0001-90'),
  ('Companhia das Letras', '23.456.789/0001-80'),
  ('Penguin Books', '34.567.890/0001-70'),
  ('HarperCollins', '45.678.901/0001-60'),
  ('Bloomsbury', '56.789.012/0001-50');

-- Inserindo livros
-- Obs.: Os IDs referenciam a ordem de inserção nas tabelas acima.
-- Para este exemplo, considere:
-- Categorias: 1-Romance, 2-Ficção Científica, 3-Fantasia, 4-Mistério, 5-Histórico, 6-Política.
-- Autores: 1-George Orwell, 2-J.R.R. Tolkien, 3-Machado de Assis, 4-J.K. Rowling, 5-Agatha Christie, 6-Isaac Asimov.
-- Editoras: 1-Editora Abril, 2-Companhia das Letras, 3-Penguin Books, 4-HarperCollins, 5-Bloomsbury.
INSERT INTO livros (nome, id_categoria, id_autor, id_editora, quantidade_paginas, descricao) VALUES
  ('1984', 2, 1, 3, 328, 'Distopia clássica sobre um regime totalitário.'),
  ('O Senhor dos Anéis', 3, 2, 4, 1216, 'Uma épica aventura de fantasia no mundo da Terra-média.'),
  ('Dom Casmurro', 1, 3, 2, 256, 'Clássico da literatura brasileira, explorando ciúmes e memórias.'),
  ('Harry Potter e a Pedra Filosofal', 3, 4, 5, 223, 'O início das aventuras do jovem bruxo em Hogwarts.'),
  ('Assassinato no Expresso do Oriente', 4, 5, 3, 256, 'Um famoso detetive investiga um assassinato em um trem.'),
  ('Eu, Robô', 2, 6, 1, 224, 'Coleção de contos que exploram a robótica e a ética das máquinas.'),
  ('A Revolução dos Bichos', 6, 1, 1, 112, 'Uma sátira à revolução russa e ao totalitarismo.'),
  ('Memórias Póstumas de Brás Cubas', 1, 3, 2, 209, 'Narrativa inovadora e crítica da sociedade brasileira.'),
  ('O Hobbit', 3, 2, 4, 310, 'Uma aventura encantadora que antecede "O Senhor dos Anéis".'),
  ('O Assassinato de Roger Ackroyd', 4, 5, 5, 272, 'Um enigmático assassinato que desafia a lógica do detetive.'),
  ('Harry Potter e a Câmara Secreta', 3, 4, 5, 251, 'O segundo ano em Hogwarts, com mistérios e perigos.');


-- Avaliações para o livro '1984' (id_livro = 1) – 4 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Ana', 4, 'Visão perturbadora sobre o totalitarismo.', 1),
  ('Bruno', 5, 'Obra que provoca reflexão profunda.', 1),
  ('Carla', 3, 'Interesse crescente, apesar de ser denso.', 1),
  ('Diana', 4, 'Leitura atual e impactante.', 1);

-- Avaliações para o livro 'O Senhor dos Anéis' (id_livro = 2) – 7 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Eduardo', 5, 'Fantasia em sua forma mais épica.', 2),
  ('Fabiana', 5, 'Clássico que atravessa gerações.', 2),
  ('Gabriel', 4, 'Narrativa envolvente e repleta de detalhes.', 2),
  ('Helena', 5, 'Mundo fantástico com uma riqueza única.', 2),
  ('Igor', 4, 'Aventura que transporta para outro universo.', 2),
  ('Juliana', 3, 'Algumas partes lentas, mas imperdível.', 2),
  ('Kevin', 5, 'Obra-prima da literatura de fantasia.', 2);

-- Avaliações para o livro 'Dom Casmurro' (id_livro = 3) – 5 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Larissa', 4, 'Clássico brasileiro com profundidade psicológica.', 3),
  ('Marcos', 3, 'História que exige atenção e interpretação.', 3),
  ('Natália', 4, 'Narrativa ambígua e instigante.', 3),
  ('Otávio', 5, 'Excelente crítica social e literária.', 3),
  ('Paula', 3, 'Leitura que desperta debates intensos.', 3);

-- Avaliações para o livro 'Harry Potter e a Pedra Filosofal' (id_livro = 4) – 3 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Renato', 5, 'Mágico, encantador e inesquecível.', 4),
  ('Sofia', 4, 'Introdução brilhante ao mundo mágico.', 4),
  ('Thiago', 5, 'Fantasia que revolucionou a literatura infantojuvenil.', 4);

-- Avaliações para o livro 'Assassinato no Expresso do Oriente' (id_livro = 5) – 6 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Ursula', 4, 'Suspense e mistério bem dosados.', 5),
  ('Victor', 5, 'Trama envolvente com reviravoltas surpreendentes.', 5),
  ('Wagner', 3, 'Algumas previsibilidades, mas mantém o interesse.', 5),
  ('Ximena', 4, 'Detalhes que prendem a atenção do leitor.', 5),
  ('Yara', 5, 'Intriga e suspense presentes em todas as páginas.', 5),
  ('Zeca', 4, 'Estrutura bem construída e cheia de surpresas.', 5);

-- Avaliações para o livro 'Eu, Robô' (id_livro = 6) – 4 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Amanda', 4, 'Contos que desafiam a ética e a tecnologia.', 6),
  ('Bruna', 3, 'Interessante reflexão sobre o futuro.', 6),
  ('César', 4, 'Algumas histórias soam visionárias.', 6),
  ('Diego', 5, 'Uma abordagem fascinante sobre robôs e humanidade.', 6);

-- Avaliações para o livro 'A Revolução dos Bichos' (id_livro = 7) – 10 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Eduarda', 5, 'Sátira política que permanece atual.', 7),
  ('Fábio', 4, 'Crítica contundente sobre poder e corrupção.', 7),
  ('Gustavo', 3, 'Mensagem clara, apesar da narrativa simples.', 7),
  ('Heloísa', 5, 'Impactante em sua simplicidade e profundidade.', 7),
  ('Irene', 4, 'Leitura provocativa que questiona o sistema.', 7),
  ('João', 5, 'Clássico que merece várias releituras.', 7),
  ('Kátia', 3, 'Algumas abordagens parecem simplistas.', 7),
  ('Leonardo', 4, 'Crítica ácida com humor inteligente.', 7),
  ('Marta', 5, 'Obra que continua relevante e atual.', 7),
  ('Nivaldo', 2, 'Alguns trechos deixam a desejar na profundidade.', 7);

-- Avaliações para o livro 'Memórias Póstumas de Brás Cubas' (id_livro = 8) – 5 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Olívia', 4, 'Narrativa inovadora e crítica social marcante.', 8),
  ('Pedro', 3, 'Leitura desafiadora, porém enriquecedora.', 8),
  ('Quésia', 4, 'Humor e ironia presentes em cada linha.', 8),
  ('Rafaela', 5, 'Obra-prima do realismo brasileiro.', 8),
  ('Samuel', 3, 'Estilo único que instiga a reflexão.', 8);

-- Avaliações para o livro 'O Hobbit' (id_livro = 9) – 3 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Tatiana', 5, 'Aventura mágica e encantadora do início da Terra-média.', 9),
  ('Ulisses', 4, 'Personagens cativantes e cenário detalhado.', 9),
  ('Valentina', 4, 'Introdução perfeita ao universo de Tolkien.', 9);

-- Avaliações para o livro 'O Assassinato de Roger Ackroyd' (id_livro = 10) – 7 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('William', 4, 'Suspense clássico com final surpreendente.', 10),
  ('Xavier', 5, 'Narrativa inovadora que quebra padrões.', 10),
  ('Yasmin', 3, 'Alguns pontos falhos, mas mantém o mistério.', 10),
  ('Zuleica', 4, 'Reviravoltas inteligentes e cativantes.', 10),
  ('Alexandre', 5, 'Imperdível para os fãs de mistério.', 10),
  ('Bianca', 4, 'Trama ágil que prende a atenção.', 10),
  ('Caio', 5, 'Mantém o leitor em constante suspense.', 10);

-- Avaliações para o livro 'Harry Potter e a Câmara Secreta' (id_livro = 11) – 5 avaliações
INSERT INTO livros_comentarios (cliente, avaliacao, comentario, id_livro) VALUES
  ('Daniela', 5, 'Encantador, repleto de magia e segredos.', 11),
  ('Elias', 4, 'Continua a tradição mágica com qualidade.', 11),
  ('Fernanda', 3, 'Algumas passagens previsíveis, mas cativantes.', 11),
  ('Gustavo', 5, 'Mais um capítulo que surpreende e encanta.', 11),
  ('Helena', 4, 'Cativante e cheio de surpresas a cada página.', 11);

-- Seleciona todos os registros da tabela 'categorias'
SELECT * FROM categorias;

-- Seleciona todos os registros da tabela 'autores'
SELECT * FROM autores;

-- Seleciona todos os registros da tabela 'editoras'
SELECT * FROM editoras;

-- Seleciona todos os registros da tabela 'livros'
SELECT * FROM livros;

-- Seleciona todos os registros da tabela 'livros_comentarios'
SELECT * FROM livros_comentarios;


a

