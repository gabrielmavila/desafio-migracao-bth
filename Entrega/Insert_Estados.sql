COPY ESTADOS
(
	id_estados,
	nome,
	uf
)
FROM 'C:/Tabela_Estados.csv'
DELIMITER ';'
CSV HEADER;

commit;