COPY TEMP_MARC01
(
    nome,
    documento,
    data_marca
)
FROM 'C:/marcacoes1.csv'
DELIMITER '|'
CSV HEADER;

UPDATE TEMP_MARC01 SET
			id_ponto = 1,
			nome = REPLACE(nome, '''', ''),
			documento = REPLACE(documento, '''', ''),
			data_marca = REPLACE(data_marca, '''', '');

--//////////////////////--//////////////////////////////////--///////////////////////////////////

COPY TEMP_MARC02
(
    nome,
    documento,
    data_marca
)
FROM 'C:/marcacoes2.csv'
DELIMITER ';'
CSV HEADER;

UPDATE TEMP_MARC02 SET
			id_ponto = 2,
			nome = REPLACE(nome, '''', ''),
			documento = REPLACE(documento, '''', ''),
			data_marca = REPLACE(data_marca, '''', '');

--//////////////////////--//////////////////////////////////--///////////////////////////////////

COPY TEMP_MARC03
(
    nome,
    documento,
    data_marca
)
FROM 'C:/marcacoes3.csv'
DELIMITER '|'
CSV HEADER;

UPDATE TEMP_MARC03 SET
			id_ponto = 3,
			nome = REPLACE(nome, '''', ''),
			documento = REPLACE(documento, '''', ''),
			data_marca = REPLACE(data_marca, '''', '');

--//////////////////////--//////////////////////////////////--///////////////////////////////////

COPY TEMP_MARC04
(
    nome,
    documento,
    data_marca
)
FROM 'C:/marcacoes4.csv'
DELIMITER ';'
CSV HEADER;

UPDATE TEMP_MARC04 SET
			id_ponto = 4,
			nome = REPLACE(nome, '''', ''),
			documento = REPLACE(documento, '''', ''),
			data_marca = REPLACE(data_marca, '''', '');

--//////////////////////--//////////////////////////////////--///////////////////////////////////

INSERT INTO TEMP_MARC05_A VALUES ( 5, pg_read_file('marcacoes5.json')::JSONB );

INSERT INTO TEMP_MARC05
select 
	5 as id_ponto,
	info ->> 'nome' as nome,
	info ->> 'Documento' as documento,
	info ->> 'marcacao' as marcacao
from(
select jsonb_array_elements(conteudo -> 'data') as info from TEMP_MARC05_A) marc05;


--//////////---/////////////////////////--////////////////////////////--

COPY TEMP_PONTO01
(
	nome,
	documento,
	fone,
	celular,
	email,
	rua,
	bairro,
	complemento,
	numero,
	cidade,
	estado
)
FROM 'C:/ponto1.csv'
DELIMITER '|'
CSV HEADER;

UPDATE TEMP_PONTO01 SET
			id_ponto = 1;


--//////////---/////////////////////////--////////////////////////////--

COPY TEMP_PONTO02
(
	id_ponto,
	nome,
	documento,
	fone,
	celular,
	email,
	rua,
	bairro,
	complemento,
	numero,
	cidade,
	estado
)
FROM 'C:/ponto2.csv'
DELIMITER ';'
CSV HEADER;

UPDATE TEMP_PONTO02 SET
			id_ponto = 2;


--//////////---/////////////////////////--////////////////////////////--

COPY TEMP_PONTO03
(
	nome,
	documento,
	fone,
	celular,
	email,
	rua,
	bairro,
	complemento,
	numero,
	cidade,
	estado
)
FROM 'C:/ponto3.csv'
DELIMITER '|'
CSV HEADER;

UPDATE TEMP_PONTO03 SET
			id_ponto = 3;

--//////////---/////////////////////////--////////////////////////////--

COPY TEMP_PONTO04
(
	id_ponto,
	nome,
	documento,
	fone,
	celular,
	email,
	rua,
	bairro,
	complemento,
	numero,
	cidade,
	estado
)
FROM 'C:/ponto4.csv'
DELIMITER ';'
CSV HEADER;

UPDATE TEMP_PONTO04 SET
			id_ponto = 4;


--//////////////////////--//////////////////////////////////--///////////////////////////////////

INSERT INTO TEMP_PONTO05_A VALUES ( 5, pg_read_file('ponto5.json')::JSONB );

INSERT INTO TEMP_PONTO05
select 
	5 as id_ponto,
	info ->> 'nome' as nome,
	info ->> 'documento' as documento,
	info ->> 'fone' as fone,
	info ->> 'celular' as celular,
	info ->> 'email' as email,
	info ->> 'rua' as rua,
	info ->> 'bairro' as bairro,
	info ->> 'complemento' as complemento,
	info ->> 'numero' as numero,
	info ->> 'cidade' as cidade,
	info ->> 'estado' as estado
from TEMP_PONTO05_A, 
     jsonb_array_elements(conteudo) AS info(data);




