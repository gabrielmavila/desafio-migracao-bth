DROP SEQUENCE public.table_bairo_id_bairro  cascade;

CREATE SEQUENCE public.table_bairo_id_bairro
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.table_bairo_id_bairro
    OWNER TO postgres;
	
delete from bairros;

insert into bairros
select 
    nextval('table_BAIRO_id_BAIRRO') as id_bairro,
	id_cidade,
	pt_bairro
from (
SELECT DISTINCT
	id_cidades as id_cidade,
	pt_bairro
FROM(
SELECT DISTINCT
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade
FROM TEMP_MARC01 MC
LEFT JOIN TEMP_PONTO01 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO

UNION ALL

SELECT DISTINCT
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade
FROM TEMP_MARC02 MC
LEFT JOIN TEMP_PONTO02 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
	
UNION ALL
	
	SELECT DISTINCT
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade
FROM TEMP_MARC03 MC
LEFT JOIN TEMP_PONTO03 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO

UNION ALL

SELECT DISTINCT
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade
FROM TEMP_MARC04 MC
LEFT JOIN TEMP_PONTO04 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO

UNION ALL

SELECT DISTINCT
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade
FROM TEMP_MARC05 MC
LEFT JOIN TEMP_PONTO05 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO

) BUSCA
left join cidades cid
on (LOWER(retira_acentuacao(cid.nome)) = LOWER(retira_acentuacao(busca.pt_cidade)))
where pt_bairro is not null and id_cidades is not null
) BAI
order by id_bairro;

commit;