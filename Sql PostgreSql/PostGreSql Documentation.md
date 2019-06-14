# @Documentação Postgresql@

## Criar Database

```bat
createdb "Nome"
```

## Apagar Database


```bat
dropdb "Nome"
```

## Comandos Básicos


+ Acessar um Database


```bat
psql "Nome"
```

+ Acessar o painel de ajuda


```bat
\h
```

+ Sair do comando de psql


```bat
\q
```

+ Criar uma tabela


```sql
create table First (
    a int,
    b smallint,
    c real,
    d double precision,
    e char(20),
    f varchar(60),
    g date,
    h time,
    i timestamp,
    j interval
);
```

+ Apagar uma tabela


``` sql
drop table "Nome";
```

+ Inserir dados

+ Inserir dados a partir de um arquivo de já estava predefinido em acordo com parametros da tabela


```sql
insert into "Nome_da_Tabela" ("Campos_especificos") values ("Valores_para_cada_colune");
copy "Destino" from 'Caminho_do_arquivo.txt';
```

+ Fazer atualizações na sua tabelas

```sql
update "Nome_da_Tabela" set "campo_determinado" = "Valor definido" where "Condição";
```

+ Fazer exclusões da sua tabela

```sql
delete from "Nome_da_Tabela" where "condição";
```

+ Comentário


``` sql
-- "Conteudo do Comentário";
```

## Querys Básicas

+ Consultar na tabela

+ Consultar todos os dados de uma tabela

+ Consultar dados filtrados através de operações entre os campos de uma Nome_da_Tabela

+ Consultar dados que estão dentro de uma determinada condição

+ Consultar dados em uma determinada ordem crescente ou decrescente disposta por um campo

+ Consultar dados não duplicados detro de uma tabela


```sql
select "Campos_especificos" from "Nome_da_Tabela";
select * from "Nome_da_Tabela";
select "Operações_dentro_das_tabelas" as "Nome_nova_coluna" from "Nome_da_Tabela";
select * from "Nome_da_Tabela" where "campo_determinado" = "Condição";
select * from "Nome_da_Tabela" order by "campo_determinado" Asc or desc;
select distinct "campo_determinado" from "Nome_da_Tabela";
```

## Querys Avançadas

+ Consultando dados de mais de uma tabela em um mesmo select

+ Consultar todos os  dados de mais de uma tabela seguindo as condições de que estão determinadas na duas tabelas "Intercessão entre as tabelas"

+ Consultar todos os dados que vem do lado esquerdo da tabela


```sql
select "Nome_da_Tabela"."campo_determinado", "Nome_da_Tabela2"."campo_determinado2" from "Nome_da_Tabela", "Nome_da_Tabela2";
select * from "Nome_da_Tabela" inner join "Nome_da_Tabela2" on ("Nome_da_Tabela"."campo_determinado" = "Nome_da_Tabela2"."campo_determinado2");
select * from "Nome_da_Tabela" left outer join "Nome_da_Tabela2" on ("Nome_da_Tabela"."campo_determinado" = "Nome_da_Tabela2"."campo_determinado2");
```

+ Subquery para aplicação de funções agregadas no WHERE CLAUSE

+ Query de execução para agrupar por determinado campo

+ Query de execução para agrupar por determinado campo mas mantendo um restrição do parametro HAVING


```sql
select "Campos_especificos" from "Nome_da_Tabela" WHERE "campo_determinado" = (select max("campo_determinado") from "Nome_da_Tabela");
select "campo_determinado", Function("campo_determinado2") as "Nome_nova_coluna" from "Nome_da_Tabela" group by "campo_determinado";
select "campo_determinado", Function("campo_determinado2") as "Nome_nova_coluna" from "Nome_da_Tabela" group by "campo_determinado" having Function("campo_determinado2");
```

## Recursos da linguagem

#### View

+ Criação de um nova visualização no qual é possivel agrupar dados de varias tabela


```sql
create view "Nome_da_Visualização" as
  select "Campos_especificos", "Campos_especificos2"
  from "Nome_da_Tabela", "Nome_da_Tabela2"
  where "Condição";
select * from "Nome_da_Visualização";
```

#### Foreign Key

+ Famosa chave estrangeira no qual vai fazer referencia em outras tabelas

```sql
--Definida na Tabela 1
city     varchar(80) primary key,
--Definida na Tabela 2
city      varchar(80) references cities(city)
```

#### Transições

```sql
BEGIN TRANSACTION; -- Inicio

UPDATE CONTA_CORRENTE
  set saldoConta= saldoConta - @Valor
  where numConta = @contaDe;

UPDATE CONTA_CORRENTE
  set saldoConta= saldoConta + @Valor
  where numConta = @contaPara;

COMMIT; -- Fim
ROLLBACK; -- Voltar ao original
```
