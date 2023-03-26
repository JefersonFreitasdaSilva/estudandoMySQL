create database cadastro;                                                #DDL cria banco de dados#
create table pessoas(                                                    #DDL cria tabela#
nome varchar(30),
idade tinyint,
sexo char (1),
peso float,#cria cada coluna#
altura float,
nacionalidade varchar(20)
);
########################################################################################
drop database cadastro; #apaga banco de dados#
                                                                        
 ########################################################################################
create database cadastro 
default character set utf8
default collate utf8_general_ci;
########################################################################################
create table pessoas(
id int not null auto_increment,                                          #DDL a cada cadastro o valor se incrementa automaticamente#
nome varchar(30) NOT NULL,
nascimento DATE,
sexo enum('F','M'),      
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar (20) default 'Brasil',
primary key (id)          #chave principal#
)default charset = utf8;  #para usar acentuação#

use cadastro;     


insert into 
pessoas (id,nome,nascimento,sexo,peso,altura,nacionalidade)
values 
(default,'maria','1984-01-02','M','78.5','1.83','Portugal'),
(default,'maria','1984-01-02','M','78.5','1.83','Portugal'),
(default,'maria','1984-01-02','M','78.5','1.83','Portugal'),  #DML ADICIONAR REGISTRO PARA O BANCO#
(default,'maria','1984-01-02','M','78.5','1.83','Portugal');
########################################################################################
select * from pessoas;   #VER DADOS DML#
########################################################################################
desc pessoas;
########################################################################################

alter table cursos
add column totaulas int unsigned;     #Alterar local e tamanho tipo do campo#

alter table pessoas
add column codigo int first;

alter table pessoas
add column profissao varchar (10) after nome;

########################################################################################
alter table pessoas
drop column codigo;             #apaga somente colunas#
########################################################################################

alter table cursos
modify column totaulas int unsigned;        #posso mudar o tipo#

alter table pessoas
modify column profissao varchar(20) not null default ' '; 

########################################################################################
alter table cursos
change column totaaulas totaulas  varchar(20);
########################################################################################
alter table pessoas rename to gafanhotos;
########################################################################################
create table if not exists cursos ( #caso não exista ela cria a tabela#
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaaulas int unsigned,
ano year default '2016'
)default charset = utf8mb3;
########################################################################################
alter table cursos add column idcurso int first;
alter table cursos add primary key (idcurso);  #criando coluna e colocando como chave primaria#
#########################################################################################
#teste pratico#                                                                         #                  
select*from cursos;                                                                     #
																						#
insert into cursos value									                         	#
('1','HTML4','Curso de HTML5','40','37','2014'),										#
('2','Algoritmos','Lógica de Programação','20','15','2014'),							#
('3','Photoshop','Dicas de Photoshop CC','10','8','2014'),								#
('4','PGP','Curso de PHP para iniciantes','40','20','2010'),							#
('5','Jarva','Introdução à Linguagem Java','10','29','2000'),							#
('6','MySQL','Bancos de Dados MySQL','30','15','2016'),									#
('7','Word','Curso completo de Word','40','30','2016'),									#
('8','Sapateado','Dança Rítmicas','40','30','2018'),							    	#
('9','YouTuber','Gerar polêmica e ganhar inscritos','5','2','2018');		     		#
#########################################################################################
update cursos
set nome = 'HTML5'                #manipulação de linha#
WHERE idcurso='1';

update cursos
set nome = 'PHP', ano = '2015'
where idcurso= '4';

update cursos
set nome = 'Java',carga= '40',ano= '2015'
where idcurso= '5'
limit 1;
###########################################################################################
delete from cursos
where idcurso= '9';              #apagar linhas#

delete from cursos
where ano='2018'                  #apaga todos que possuem as datas(limit 2= apaga somente 2 registros)#
limit 2;

truncate cursos;              #apaga a tabela inteira#

################################################################################################
describe gafanhotos;
use cadastro;

select * from amigos;

###########################################################################################

select * from gafanhotos;
select * from cursos;

select * from cursos
order by nome desc;      

select * from cursos   
order by nome asc;                    

select nome,carga,ano from cursos
order by ano,nome;               #da para organizar de diferentes formas#

select * from cursos
where ano='2016'
order by nome;

select nome,descricao,carga from cursos#menor ou igual a 2015#
where ano <='2015'
order by nome;

select nome,descricao,carga from cursos #maior ou igual a 2015#
where ano >='2015'
order by nome;

select nome,descricao,carga from cursos #(<> OU !=)#
where ano !='2015'
order by nome;

SELECT NOME,ano from cursos              #entre 2014 e 2016#
where ano between 2014 and 2016;    

select nome,descricao,ano from cursos #apenas anos especificados#
where ano in (2014,2016)
order by ano;

select nome,carga,totaulas from cursos   #selecionando filtros#
where carga > 35 or totaulas < 30;

#######################################################################################

select * from cursos
where nome like '%A%';  #qualquer nome que tiver A#

select * from cursos
where nome like 'A%';  #qualquer nome que tiver A NO INICIO#

select * from cursos
where nome like '%A';  #qualquer nome que tiver A NO FINAL#

select * from cursos
where nome like 'PH%P_';  # EXIGE TE TENHA UM CARACTERE NO FINAL#

select distinct nacionalidade from gafanhotos; #mostra os diferentes termos na coluna sem mostrar a quantidade#

select count(*) from cursos where carga > 40;
select max(carga) from cursos;
select nome, max(totaulas) from cursos where ano='2016';
select nome, min(totaulas) from cursos where ano='2016';

############################################################################################################################################################
#atividade#

select nome from gafanhotos where sexo='F';  
#1)nome de TODAS AS GAFANHOTAS#
select * from gafanhotos where nascimento between '2000-01-01' and '2015-12-31'; 
#2)Uma lista com os dados de todos aqueles que nasceram entre 1/jan/2000 e 31/dez/2015#
select nome from gafanhotos where sexo='M' and profissao='programador';  
#3) uma lista com o nome de todos os homens que trabalham como programadores#
select * from gafanhotos where  nome LIKE 'J%' AND sexo='F' and nacionalidade='Brasil';
#4)^^^^^^Uma lista com os dados de todas as mulheres que nascceram no brasil e que tem o nome iniciado com J#
select nome,nacionalidade from gafanhotos where nome like '%_silva' and nacionalidade <> 'Brasil' and peso < '100'; 
#5)^^^^^^Uma lista comm o nome e nacionalidade de todos os homens que tem Silva no nome ,não nasceram no Brasil e pesam menos de 100kg#
select max(altura) from gafanhotos where nacionalidade='Brasil' and sexo= 'M';
#6)^^^^^^Qual é a maior altura entre gafanhotos homens que moram no brasil#
SELECT AVG(peso) FROM gafanhotos;
#7)^^^^^^^^qual é a media de peso dos gafanhotos cadastrados#
select min(peso) from gafanhotos where nascimento between '1990-01-01' and '2000-12-31' and nacionalidade <> 'Brasil' and sexo='F';
#8)^^^^^^^^qual é o menor peso entre as gafanhotos mulheres que nasceram fora do brasil e entre 01/jan/1990 e 31/dez/2000#
select count(*) from gafanhotos where altura > '1.9' and sexo='F';
#9)^^^^^^^^quantas gafanhotos mulheres tem mais de 1.9 de altura#

###############################################################################################################################################################

select distinct carga from cursos order by carga; #mostra todos que são diferentes usando de somente um de cada valor#

select carga,count(nome) from cursos group by carga;    #ele agrupa todos que são iguais [32,32,32],[2,2],[35,35],[3]#

select totaulas,count(*) from cursos group by totaulas;

select carga,count(*) from cursos where totaulas = 30 group by carga;

select ano,count(*) from cursos
 group by ano having count(ano)>= 3     #se a quantidade dos dados for menor que 3 que atende ao requisito,ele estara fora do filtro#
 order by count(*) desc;

select carga,count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);
################################################################################################################################################################
#atividade 2#
select profissao,count(*) from gafanhotos group by profissao; 
#uma lista com as profissoes dos gafanhotos e seus respectivos quantitativos#
select sexo,count(*) from gafanhotos where nascimento > '2005-01-01' group by sexo; 
#quantos gafanhotos homens e quantas mulheres nasceram apos 01/jan/2005#
select nacionalidade,count(*) from gafanhotos where nacionalidade <> 'Brasil' group by nacionalidade having count(*) > 3;
#uma lista com os gafanhotos que nasceram fora do Brasil,mostrando pais de origem e o total de pessoas nascidas la,so no interessam os paises que tiverem mais de #
#3 gafanhotos com essa nacionalidade#
select altura,count(*) from gafanhotos  where peso > '100' group by altura having altura >(select avg(altura) from gafanhotos);
#uma lista agrupada pela altura dos gaffanhotos,mostrando quantas pessoas pesam mais de 100kg e que estão acima da media de altura de todos os cadastrados#
###################################################################################################################################################################

 use cadastro;
 
 describe gafanhotos;
 
 alter table gafanhotos
 add column cursopreferido int;
 
 alter table gafanhotos
 add foreign key (cursopreferido)
 references cursos (idcurso);
 
 select * from gafanhotos;
 
 update gafanhotos set cursopreferido='6' where id='1';
 
 delete from cursos where idcurso='6'; #não funciona, porque isso esta ligado a um pessoa (manter integridade)#
 
  delete from cursos where idcurso='28';
  
   select gafanhotos.nome,cursos.nome,cursos.ano from gafanhotos join cursos  #relaciona as duas tabelas porem sem filtro#
  on cursos.idcurso=gafanhotos.cursopreferido           #filtro para mostrar somente as relações#
  order by gafanhotos.nome;
  
  select g.nome,c.nome,c.ano from gafanhotos as g join cursos as c  #substitui as palavras inteiras por c e g para não extender muito o codigo#
  on c.idcurso=g.cursopreferido order by g.nome;
  
  select g.nome,c.nome,c.ano from gafanhotos as g left join cursos as c  #vai dar prioridade em mostrar todos os gafanhotos mesmo que não esteja relacionado com algum cursos#
  on c.idcurso=g.cursopreferido 
  order by g.nome;
  
  select g.nome,c.nome,c.ano from gafanhotos as g right join cursos as c  #vai dar prioridade em mostrar todos os cursos mesmo que não esteja relacionado com algum gafanhoto#
  on c.idcurso=g.cursopreferido 
  order by g.nome,c.idcurso;
  
  create table gafanhoto_assiste_curso(
  id int not null auto_increment,
  data date,
  idgafanhoto int,                                                          #tabela para ajudar a fazer muito para muitos#
  idcurso int,
  primary key(id),
  foreign key (idgafanhoto) references gafanhotos(id),
  foreign key (idcurso) references cursos(idcurso))default charset=utf8mb3;
  
  drop table gafanhoto_assiste_curso;
 
  

 
 
 

