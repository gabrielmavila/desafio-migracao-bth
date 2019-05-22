CREATE TABLE TEMP_MARC01
(
	id_ponto integer,
    NOME VARCHAR(200),
    DOCUMENTO VARCHAR(50),
    DATA_MARCA VARCHAR(50)
);
COMMENT ON TABLE public.TEMP_MARC01
    IS 'Registro de importacao Marcacoes 01';

--/////////////////////--////////////////////////////--/////////////
	
CREATE TABLE TEMP_MARC02
(
	id_ponto integer,
    NOME VARCHAR(200),
    DOCUMENTO VARCHAR(50),
    DATA_MARCA VARCHAR(50)
);
COMMENT ON TABLE public.TEMP_MARC02
    IS 'Registro de importacao Marcacoes 02';

--/////////////////////--////////////////////////////--/////////////
	
CREATE TABLE TEMP_MARC03
(
	id_ponto integer,
    NOME VARCHAR(200),
    DOCUMENTO VARCHAR(50),
    DATA_MARCA VARCHAR(50)
);
COMMENT ON TABLE public.TEMP_MARC03
    IS 'Registro de importacao Marcacoes 03';

--/////////////////////--////////////////////////////--/////////////
	
CREATE TABLE TEMP_MARC04
(
	id_ponto integer,
    NOME VARCHAR(200),
    DOCUMENTO VARCHAR(50),
    DATA_MARCA VARCHAR(50)
);
COMMENT ON TABLE public.TEMP_MARC04
    IS 'Registro de importacao Marcacoes 04';

--/////////////////////--////////////////////////////--/////////////

CREATE TABLE TEMP_MARC05_A
(
    id_ponto INTEGER,
    conteudo JSONB
);
COMMENT ON TABLE public.TEMP_MARC05_A
    IS 'Registro de importacao Marcacoes 05 A';

CREATE TABLE TEMP_MARC05
(
	id_ponto integer,
    NOME VARCHAR(200),
    DOCUMENTO VARCHAR(50),
    DATA_MARCA VARCHAR(50)
);
COMMENT ON TABLE public.TEMP_MARC05
    IS 'Registro de importacao Marcacoes 05';

--/////////////////////--////////////////////////////--/////////////

CREATE TABLE TEMP_PONTO01
(
	id_ponto integer,
	nome varchar(60),
	documento varchar(20),
	fone varchar(20),
	celular varchar(20),
	email varchar(60),
	rua varchar(60),
	bairro varchar(60),
	complemento varchar(60),
	numero varchar(8),
	cidade varchar(60),
	estado varchar(60)
);
COMMENT ON TABLE public.TEMP_PONTO01
    IS 'Registro de importacao Ponto 01';

--/////////////////////--////////////////////////////--/////////////
	
CREATE TABLE TEMP_PONTO02
(
	id_ponto integer,
	nome varchar(60),
	documento varchar(20),
	fone varchar(20),
	celular varchar(20),
	email varchar(60),
	rua varchar(60),
	bairro varchar(60),
	complemento varchar(60),
	numero varchar(8),
	cidade varchar(60),
	estado varchar(60)
);
COMMENT ON TABLE public.TEMP_PONTO02
    IS 'Registro de importacao Ponto 02';


--/////////////////////--////////////////////////////--/////////////

CREATE TABLE TEMP_PONTO03
(
	id_ponto integer,
	nome varchar(60),
	documento varchar(20),
	fone varchar(20),
	celular varchar(20),
	email varchar(60),
	rua varchar(60),
	bairro varchar(60),
	complemento varchar(60),
	numero varchar(8),
	cidade varchar(60),
	estado varchar(60)
);
COMMENT ON TABLE public.TEMP_PONTO03
    IS 'Registro de importacao Ponto 03';


--/////////////////////--////////////////////////////--/////////////

CREATE TABLE TEMP_PONTO04
(
	id_ponto integer,
	nome varchar(60),
	documento varchar(20),
	fone varchar(20),
	celular varchar(20),
	email varchar(60),
	rua varchar(60),
	bairro varchar(60),
	complemento varchar(60),
	numero varchar(8),
	cidade varchar(60),
	estado varchar(60)
);
COMMENT ON TABLE public.TEMP_PONTO04
    IS 'Registro de importacao Ponto 04';

--/////////////--////////////////////////--//////////////////

CREATE TABLE TEMP_PONTO05_A
(
    id_ponto INTEGER,
    conteudo JSONB
);
COMMENT ON TABLE public.TEMP_PONTO05_A
    IS 'Registro de importacao Ponto 05 A';

CREATE TABLE TEMP_PONTO05
(
	id_ponto integer,
	nome varchar(60),
	documento varchar(20),
	fone varchar(20),
	celular varchar(20),
	email varchar(60),
	rua varchar(60),
	bairro varchar(60),
	complemento varchar(60),
	numero varchar(8),
	cidade varchar(60),
	estado varchar(60)
);
COMMENT ON TABLE public.TEMP_PONTO05
    IS 'Registro de importacao Ponto 05';

