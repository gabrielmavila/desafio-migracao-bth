CREATE TABLE public.estados
(
    id_estados smallint NOT NULL,
    nome varchar(20) COLLATE pg_catalog."default" NOT NULL,
    uf varchar(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT estados_pkey PRIMARY KEY (id_estados)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.estados
    OWNER to postgres;
COMMENT ON TABLE public.estados
    IS 'Registros de Estados';

COMMENT ON COLUMN public.estados.id_estados
    IS 'C�digo do Estado';

COMMENT ON COLUMN public.estados.nome
    IS 'Nome';

COMMENT ON COLUMN public.estados.uf
    IS 'unidade federativa';


CREATE TABLE public.cidades
(
    id_cidades integer NOT NULL,
    id_estados smallint,
    nome varchar(50) COLLATE pg_catalog."default" NOT NULL,
    cod_siafi integer,
    CONSTRAINT cidades_pkey PRIMARY KEY (id_cidades),
    CONSTRAINT fk_bairros_reference_cidades FOREIGN KEY (id_estados)
        REFERENCES public.estados (id_estados) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cidades
    OWNER to postgres;
COMMENT ON TABLE public.cidades
    IS 'Registros de Cidades';

COMMENT ON COLUMN public.cidades.id_cidades
    IS 'C�digo da Cidade';

COMMENT ON COLUMN public.cidades.id_estados
    IS 'Sigla do Estado';

COMMENT ON COLUMN public.cidades.nome
    IS 'Descri��o';

COMMENT ON COLUMN public.cidades.cod_siafi
    IS 'C�digo no SIAFI';
	

CREATE TABLE public.bairros
(
    id_bairros integer NOT NULL DEFAULT nextval('table_BAIRO_id_BAIRRO'),
    id_cidades integer NOT NULL,
    nome varchar(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT bairros_pkey PRIMARY KEY (id_bairros),
    CONSTRAINT fk_bairros_reference_cidades FOREIGN KEY (id_cidades)
        REFERENCES public.cidades (id_cidades) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.bairros
    OWNER to postgres;
COMMENT ON TABLE public.bairros
    IS 'Registros de Bairros';

COMMENT ON COLUMN public.bairros.id_bairros
    IS 'C�digo do Bairro';

COMMENT ON COLUMN public.bairros.id_cidades
    IS 'C�digo da Cidade';

COMMENT ON COLUMN public.bairros.nome
    IS 'Descri��o';
	

CREATE TABLE public.ruas
(
    id_ruas integer NOT NULL,
    id_cidades integer NOT NULL,
    nome varchar(50) COLLATE pg_catalog."default" NOT NULL,
    cep varchar(8) COLLATE pg_catalog."default",
    CONSTRAINT ruas_pkey PRIMARY KEY (id_ruas),
    CONSTRAINT fk_ruas_reference_cidades FOREIGN KEY (id_cidades)
        REFERENCES public.cidades (id_cidades) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.ruas
    OWNER to postgres;
COMMENT ON TABLE public.ruas
    IS 'Registros de Ruas';

COMMENT ON COLUMN public.ruas.id_ruas
    IS 'C�digo da Rua';

COMMENT ON COLUMN public.ruas.id_cidades
    IS 'C�digo da Cidade';

COMMENT ON COLUMN public.ruas.nome
    IS 'Nome';

COMMENT ON COLUMN public.ruas.cep
    IS 'CEP';
	

CREATE TABLE public.pessoas
(
    id_pessoas integer NOT NULL,
    nome varchar(60) COLLATE pg_catalog."default" NOT NULL,
    documento varchar(11) COLLATE pg_catalog."default",
    ddd varchar(2) COLLATE pg_catalog."default",
    telefone varchar(9) COLLATE pg_catalog."default",
    ddd_cel varchar(2) COLLATE pg_catalog."default",
    celular varchar(9) COLLATE pg_catalog."default",
    email varchar(60) COLLATE pg_catalog."default",
    CONSTRAINT pessoas_pkey PRIMARY KEY (id_pessoas)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.pessoas
    OWNER to postgres;
COMMENT ON TABLE public.pessoas
    IS 'Registros de Pessoas';

COMMENT ON COLUMN public.pessoas.id_pessoas
    IS 'C�digo da Pessoa';

COMMENT ON COLUMN public.pessoas.nome
    IS 'Nome';

COMMENT ON COLUMN public.pessoas.documento
    IS 'Documento';

COMMENT ON COLUMN public.pessoas.ddd
    IS 'DDD';

COMMENT ON COLUMN public.pessoas.telefone
    IS 'Telefone';

COMMENT ON COLUMN public.pessoas.ddd_cel
    IS 'DDD do celular';

COMMENT ON COLUMN public.pessoas.celular
    IS 'Celular';

COMMENT ON COLUMN public.pessoas.email
    IS 'Email';
	

CREATE TABLE public.pessoas_enderecos
(
    id_pessoas integer NOT NULL,
    tipo_endereco varchar(1) COLLATE pg_catalog."default" NOT NULL,
    id_ruas integer,
    id_bairros integer,
    complemento varchar(50) COLLATE pg_catalog."default",
    numero varchar(8) COLLATE pg_catalog."default",
    CONSTRAINT pessoas_enderecos_pkey PRIMARY KEY (id_pessoas, tipo_endereco),
    CONSTRAINT fk_pessoas_enderecos_reference_bairros FOREIGN KEY (id_bairros)
        REFERENCES public.bairros (id_bairros) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_pessoas_enderecos_reference_pessoas FOREIGN KEY (id_pessoas)
        REFERENCES public.pessoas (id_pessoas) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_pessoas_enderecos_reference_ruas FOREIGN KEY (id_ruas)
        REFERENCES public.ruas (id_ruas) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ASA9206" CHECK ((tipo_endereco = ANY (ARRAY['P'::bpchar, 'C'::bpchar, 'S'::bpchar])) AND ascii(tipo_endereco::text) < 97)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.pessoas_enderecos
    OWNER to postgres;
COMMENT ON TABLE public.pessoas_enderecos
    IS 'Registros de Endere�os das Pessoas';

COMMENT ON COLUMN public.pessoas_enderecos.id_pessoas
    IS 'C�digo da Pessoa';

COMMENT ON COLUMN public.pessoas_enderecos.tipo_endereco
    IS 'Tipo do endere�o (P-Pessoal, C-Correspond�ncia, S-Servi�o)';

COMMENT ON COLUMN public.pessoas_enderecos.id_ruas
    IS 'C�digo da Rua';

COMMENT ON COLUMN public.pessoas_enderecos.id_bairros
    IS 'C�digo do Bairro';

COMMENT ON COLUMN public.pessoas_enderecos.complemento
    IS 'Complemento';

COMMENT ON COLUMN public.pessoas_enderecos.numero
    IS 'N�mero';
	
CREATE TABLE public.pontos_acessos
(
    id_ponto integer NOT NULL,
    "Nome" varchar(50) COLLATE pg_catalog."default" NOT NULL,
    "Descricao" varchar(254) COLLATE pg_catalog."default",
    numero smallint,
    CONSTRAINT pontos_acessos_pkey PRIMARY KEY (id_ponto)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.pontos_acessos
    OWNER to postgres;
COMMENT ON TABLE public.pontos_acessos
    IS 'Registros dos pontos de acessos da entidade';

COMMENT ON COLUMN public.pontos_acessos.id_ponto
    IS 'C�digo do Ponto';

COMMENT ON COLUMN public.pontos_acessos."Nome"
    IS 'Nome do Ponto de acesso';

COMMENT ON COLUMN public.pontos_acessos."Descricao"
    IS 'Descri��o para detalhamento do Ponto de acesso';

COMMENT ON COLUMN public.pontos_acessos.numero
    IS 'N�mero';
	
CREATE TABLE public.permicoes_acessos
(
    "id_permiss�o" integer NOT NULL,
    id_ponto integer NOT NULL,
    id_pessoas integer NOT NULL,
    inicio_acesso timestamp without time zone NOT NULL,
    fim_acesso timestamp without time zone,
    CONSTRAINT permicoes_acessos_pkey PRIMARY KEY ("id_permiss�o"),
    CONSTRAINT fk_permicoes_acessos_reference_pessoas FOREIGN KEY (id_pessoas)
        REFERENCES public.pessoas (id_pessoas) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_permicoes_acessos_reference_pontos_acessos FOREIGN KEY (id_ponto)
        REFERENCES public.pontos_acessos (id_ponto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.permicoes_acessos
    OWNER to postgres;
COMMENT ON TABLE public.permicoes_acessos
    IS 'Registros de permiss�es de acessos da entidade';

COMMENT ON COLUMN public.permicoes_acessos."id_permiss�o"
    IS 'C�digo da Permiss�o';

COMMENT ON COLUMN public.permicoes_acessos.id_ponto
    IS 'C�digo do Ponto';

COMMENT ON COLUMN public.permicoes_acessos.id_pessoas
    IS 'C�digo da Pessoa';

COMMENT ON COLUMN public.permicoes_acessos.inicio_acesso
    IS 'Inicio do Acesso';

COMMENT ON COLUMN public.permicoes_acessos.fim_acesso
    IS 'Final do Acesso';


CREATE TABLE public.acessos
(
    id_acesso integer NOT NULL,
    id_ponto integer NOT NULL,
    id_pessoas integer NOT NULL,
    marcacao timestamp without time zone NOT NULL,
    CONSTRAINT acessos_pkey PRIMARY KEY (id_ponto),
    CONSTRAINT fk_acessos_reference_pessoas FOREIGN KEY (id_pessoas)
        REFERENCES public.pessoas (id_pessoas) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fk_acessos_reference_pontos_acessos FOREIGN KEY (id_ponto)
        REFERENCES public.pontos_acessos (id_ponto) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.acessos
    OWNER to postgres;
COMMENT ON TABLE public.acessos
    IS 'Registros de marca��es de acessos a entidade';

COMMENT ON COLUMN public.acessos.id_acesso
    IS 'C�digo do Acesso';

COMMENT ON COLUMN public.acessos.id_ponto
    IS 'C�digo do Ponto';

COMMENT ON COLUMN public.acessos.id_pessoas
    IS 'C�digo da Pessoa';

COMMENT ON COLUMN public.acessos.marcacao
    IS 'Marca��o de acesso';