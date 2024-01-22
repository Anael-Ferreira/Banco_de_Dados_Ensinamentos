-- DDL (Linguagem de definição de dados)

-- Create database / criação do banco de dados - Create database <nome do banco>
	create database estudos_prova;
	use estudos_prova;

-- Create table / criação da tabela - Create table (definições na tabela)
create table pais(
id int(11) not null primary key auto_increment,
nome varchar(150) not null,
sigla char(3) not null,
idioma char(2) not null
);

create table estados(
id int(10) not null primary key auto_increment,
nome varchar(100) not null,
sigla char(2) null,
regiao varchar(20) not null,
pais_id int(11) not null,
foreign key (pais_id) references pais(id)
);

create table municipio(
id int(10) not null primary key auto_increment,
cidade varchar(100) not null,
uf int(10) not null,
foreign key (uf) references estados(id)
);

-- drop table / remoção da tabela - Drop table (nome da tabela) 
	drop table municipio;

-- alter table / alteração da tabela - Alter table (nome da tabela) ADD (nome do campo novo) e (nome do campo)
	alter table municipio add bandeira varchar(100) not null after cidade;

-- show databases / lista os bancos de dados existentes;
	show databases;

-- ------------------------------------------------------------------------------------------------------------------------------------------

-- DML (Linguagem de manipulação de dados)

-- insert / insere novos registros em uma tabela - Insert INTO (nome da tabela) [campos] values (valor_campo1, valor_campo2, valor_campo3,...)
insert into pais (id, nome, sigla, idioma) values (1, 'Afeganistão','PS', 'AF');
insert into pais (id, nome, sigla, idioma) values (2, 'Argentina','AR', 'ES');
insert into pais (id, nome, sigla, idioma) values (3, 'Brasil','BR', 'PT');
insert into pais (id, nome, sigla, idioma) values (4, 'Camarões','CA', 'ES');
insert into pais (id, nome, sigla, idioma) values (5, 'Croácia','CR', 'CR');
insert into pais (id, nome, sigla, idioma) values (6, 'Dinamarca','DI', 'DI');
insert into pais (id, nome, sigla, idioma) values (7, 'Espanha','ES', 'ES');

insert into estados (id, nome, populacao, sigla, regiao, pais_id) values (default, 'Distrito Federal', 100,'DF', 'centro-oeste','30');
insert into estados (id, nome, populacao, sigla, regiao, pais_id) values (default, 'Goiás', 550,'GO', 'centro-oeste','30');
insert into estados (id, nome, populacao, sigla, regiao,pais_id) values (default, 'Bahia', 220,'BA', 'nordeste','30');
insert into estados (id, nome, populacao, sigla, regiao, pais_id) values (default, 'Ceará', 300,'CE', 'nordeste','30');
insert into estados (id, nome, populacao, sigla, regiao, pais_id) values (default, 'Maranhão', 405 ,'MA', 'nordeste','30');
insert into estados (id, nome, populacao, sigla, regiao, pais_id) values (default, 'Minas Gerais', 200 ,'MG', 'sudeste','30');

insert into municipio (id, cidade, bandeira, uf) values (default, 'Gama','Azul','1');
insert into municipio (id, cidade, bandeira, uf) values (default, 'Goiania','Branca','2');
insert into municipio (id, cidade, bandeira, uf) values (default, 'Pau Fincado','Marrom','3');
insert into municipio (id, cidade, bandeira, uf) values (default, 'Fortaleza','Cinza','4');
insert into municipio (id, cidade, bandeira, uf) values (default, 'São Luis','Branca','5');
insert into municipio (id, cidade, bandeira, uf) values (default, 'Belo Horizonte','Vermelha','6');

-- select / recupera dados já armazenados - Select * FROM (nome da tabela)
	select * from pais;
	update pais set nome = "Bahamas" where id = '3'; 
-- update / altera algum dade já armazenado na tabela - update (nome da tabela) SET (campo a ser modificado) = novo valor WHERE condição
	update pais set nome = 'Brasil', idioma='BR' where id = 3;

-- delete / exclui definitivamente um registro da tabela - delete FROM (nome da tabela) WHERE condição
	delete from pais where id = 1;

-- operadores de comparação:

-- = / igual a
-- != ou <> / diferente de
-- > / maior que
-- < / menor que
-- => / maior ou igual a
-- <= / menor ou igual a

-- operadores lógicos:

-- and / e
-- or / ou
-- not / não

-- outros operadores:
-- in / testar valores em uma lista especifica - select * from (nome da tabela) where [id in ('condicao1', 'condicao2')]
	select * from estados where id in ('2', '4');

-- between / testar valores em uma faixa especifica - select * from (nome da tabela) where id [between 'condicao1' and 'condicao2']
	select * from estados where id between '1' and '5';

-- order by / ordenar o resultado de uma consulta pelo campo de sua preferencia - select * from (nome da tabela) where id between 'condicao1' and 'condicao2' [order by regiao]
	select * from estados where id between '1' and '4' order by regiao;

-- ASC / listados em ordem crescente; DESC / listados em ordem decrescente
	select * from estados where id between '1' and '7' order by regiao ASC;
	select * from estados where id between '1' and '7' order by regiao DESC;

-- group by / serve para agrupar os resultados de uma consulta - select (nome da coluna) [count(*)] FROM (nome da tabela) [group by (nome da coluna)]
	select regiao, count(*) from estados group by regiao;
    
-- having / buscar uma condição aplicada só ao final da consulta - select (nome da coluna), count(*) FROM (nome da tabela) [group by regiao having count(*)>5]
	select regiao, count(*) FROM estados group by regiao having count(*)>1;

-- distinct / elimina valores duplos da saida - [select distinct (nome da coluna)] FROM nome da tabela;
	select distinct regiao from estados;

-- limit / estabelece um limite de registros na consulta select * from (nome da tabela) [limit 5;]
	select * from pais limit 4;

-- funções de agregaçao:
-- count / faz a contagem dos registros - [select count(*)] from (nome da tabela);
	select count(*) from municipio;
 
 -- sum / soma os valores - select sum() FROM (nome da tabela)
	select sum(populacao) FROM estados;
  
  -- avg / calcula a média - select avg() FROM (nome da tabela)
	select avg(populacao) FROM estados;
    
-- max / retorna maior número da coluna - select max() FROM (nome da tabela)
	select max(populacao) FROM estados;
    
-- min /  retorna menor número da coluna - select min() FROM (nome da tabela)
	select min(populacao) FROM estados;

-- ------------------------------------------------------------------------------------------------------------------------------------------

-- Join:

-- inner join ou join / retorna as linhas das tabelas com ao menos uma correspondência entre ambas
-- outer join / retorna as linhas das tabelas mesmo sem uma correspondência entre ambas
-- cross join / mistura todas as linhas
-- select * campos FROM (tabela1) JOIN (tabela2) ON t1.pk = t2.pk

select cidade, nome, sigla 
FROM municipio as m
JOIN estados as e
ON e.id = m.uf
WHERE cidade = "Belo Horizonte";

-- ------------------------------------------------------------------------------------------------------------------------------------------

-- Like / comparação de strings - select * FROM (nome da tabela) where (nome da coluna) LIKE '_B'

-- % qualquer quantidade de caracteres
-- _ exatamente um único caractere

select * from estados where nome like 'b%';

-- ------------------------------------------------------------------------------------------------------------------------------------------

create view Belo_Horizonte_Consulta as 
select cidade, nome, sigla 
FROM municipio as m
JOIN estados as e
ON e.id = m.uf
WHERE cidade = "Belo Horizonte";

select * from Belo_Horizonte_Consulta;

-- ------------------------------------------------------------------------------------------------------------------------------------------