SELECT DISTINCT
    PONTO,
	pt_documento,
	pt_nome,
	case when substr(FONE,1,1) = '(' then SUBSTR(FONE,2,2) ELSE NULL END AS DDD,
	case when substr(FONE,1,1) = '(' then SUBSTR(FONE,6,9) ELSE FONE END AS FONE,
	case when substr(TRIM(CELULAR),1,1) = '(' then SUBSTR(TRIM(CELULAR),2,2) ELSE NULL END AS DDD,
	case when substr(TRIM(CELULAR),1,1) = '(' then SUBSTR(TRIM(CELULAR),6,9) ELSE FONE END AS CELULAR,
	EMAIL,
	pt_bairro,
	pt_cidade,
	ESTADO,
	pt_rua,
	NUMERO,
	COMPLEMENTO,
	mc_data
FROM(
SELECT DISTINCT
	PT.ID_PONTO AS PONTO,
	PT.DOCUMENTO as pt_documento,
	PT.NOME as pt_nome,
	PT.FONE AS FONE,
	PT.CELULAR AS CELULAR,
	PT.EMAIL AS EMAIL,
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade,
	PT.ESTADO AS ESTADO,
	PT.RUA as pt_rua,
	PT.NUMERO AS NUMERO,
	PT.COMPLEMENTO AS COMPLEMENTO,
	MAX(MC.DATA_MARCA) as mc_data
FROM TEMP_MARC01 MC
LEFT JOIN TEMP_PONTO01 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
GROUP BY 
	PT.ID_PONTO,
	PT.DOCUMENTO,
	PT.NOME,
	PT.FONE,
	PT.CELULAR,
	PT.EMAIL,
	PT.bairro,
	PT.cidade,
	PT.ESTADO,
	PT.RUA,
	PT.NUMERO,
	PT.COMPLEMENTO

UNION ALL

SELECT DISTINCT
	PT.ID_PONTO AS PONTO,
	PT.DOCUMENTO as pt_documento,
	PT.NOME as pt_nome,
	PT.FONE AS FONE,
	PT.CELULAR AS CELULAR,
	PT.EMAIL AS EMAIL,
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade,
	PT.ESTADO AS ESTADO,
	PT.RUA as pt_rua,
	PT.NUMERO AS NUMERO,
	PT.COMPLEMENTO AS COMPLEMENTO,
	MAX(MC.DATA_MARCA) as mc_data
FROM TEMP_MARC02 MC
LEFT JOIN TEMP_PONTO02 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
GROUP BY 
	PT.ID_PONTO,
	PT.DOCUMENTO,
	PT.NOME,
	PT.FONE,
	PT.CELULAR,
	PT.EMAIL,
	PT.bairro,
	PT.cidade,
	PT.ESTADO,
	PT.RUA,
	PT.NUMERO,
	PT.COMPLEMENTO
	
UNION ALL
	
	SELECT DISTINCT
	PT.ID_PONTO AS PONTO,
	PT.DOCUMENTO as pt_documento,
	PT.NOME as pt_nome,
	PT.FONE AS FONE,
	PT.CELULAR AS CELULAR,
	PT.EMAIL AS EMAIL,
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade,
	PT.ESTADO AS ESTADO,
	PT.RUA as pt_rua,
	PT.NUMERO AS NUMERO,
	PT.COMPLEMENTO AS COMPLEMENTO,
	MAX(MC.DATA_MARCA) as mc_data
FROM TEMP_MARC03 MC
LEFT JOIN TEMP_PONTO03 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
GROUP BY 
	PT.ID_PONTO,
	PT.DOCUMENTO,
	PT.NOME,
	PT.FONE,
	PT.CELULAR,
	PT.EMAIL,
	PT.bairro,
	PT.cidade,
	PT.ESTADO,
	PT.RUA,
	PT.NUMERO,
	PT.COMPLEMENTO

UNION ALL

SELECT DISTINCT
	PT.ID_PONTO AS PONTO,
	PT.DOCUMENTO as pt_documento,
	PT.NOME as pt_nome,
	PT.FONE AS FONE,
	PT.CELULAR AS CELULAR,
	PT.EMAIL AS EMAIL,
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade,
	PT.ESTADO AS ESTADO,
	PT.RUA as pt_rua,
	PT.NUMERO AS NUMERO,
	PT.COMPLEMENTO AS COMPLEMENTO,
	MAX(MC.DATA_MARCA) as mc_data
FROM TEMP_MARC04 MC
LEFT JOIN TEMP_PONTO04 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
GROUP BY 
	PT.ID_PONTO,
	PT.DOCUMENTO,
	PT.NOME,
	PT.FONE,
	PT.CELULAR,
	PT.EMAIL,
	PT.bairro,
	PT.cidade,
	PT.ESTADO,
	PT.RUA,
	PT.NUMERO,
	PT.COMPLEMENTO

UNION ALL

SELECT DISTINCT
	PT.ID_PONTO AS PONTO,
	PT.DOCUMENTO as pt_documento,
	PT.NOME as pt_nome,
	PT.FONE AS FONE,
	PT.CELULAR AS CELULAR,
	PT.EMAIL AS EMAIL,
	PT.bairro as pt_bairro,
	PT.cidade as pt_cidade,
	PT.ESTADO AS ESTADO,
	PT.RUA as pt_rua,
	PT.NUMERO AS NUMERO,
	PT.COMPLEMENTO AS COMPLEMENTO,
	MAX(MC.DATA_MARCA) as mc_data
FROM TEMP_MARC05 MC
LEFT JOIN TEMP_PONTO05 PT
ON SUBSTR(PT.DOCUMENTO,1,11) = MC.DOCUMENTO
GROUP BY 
	PT.ID_PONTO,
	PT.DOCUMENTO,
	PT.NOME,
	PT.FONE,
	PT.CELULAR,
	PT.EMAIL,
	PT.bairro,
	PT.cidade,
	PT.ESTADO,
	PT.RUA,
	PT.NUMERO,
	PT.COMPLEMENTO
) BUSCA
ORDER BY PT_DOCUMENTO;