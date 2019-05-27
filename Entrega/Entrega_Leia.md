# desafio-migração-bth

Este arquivo visa esplanar a entrega para o desafio de recrutamento da Betha Sistema

#Arquitetura

Foi utilizado como banco de destino o PostegreSQL em sua versão 10, incluindo PGAdmin 4 em sua versão WEB.
Esse foi o banco utilizado devido a versatilidade e facilidade para se trabalhar com o importação de arquios csv e json.

#Arquivos importantes

Tabela_Estados.csv, Tabela_Municipios_SIAFI.csv -> Estes são arquivos importantes para o cadastro dos usuários dos pontos, e foram baixados do site do IBGE, os arquivos devem ser colocados na pasta raiz do sistema operacional onde o banco de destino está instalado, juntamente com todos os outros arquivos csv fornecidos no desafio.

Os arquivos json devem ser colocados na pasta "directory" de instalação do banco, que pode ser encontrada rodando o comando "show data_directory"

#Estrututura de importação

Para importação das informações dos banco foram criadas as tabelas padrão fornecida na documentação com o nome de Estrutura_dados_controle_acesso.sql, porém, no padrão PostgreSQL, que se encontra no arquivo Estrutura_dados_controle_acesso_PostGresql.sql

Foram criadas tabelas auxiliares para todos os pontos e todas as marcações, com o intúito de organizar, analisar e tratar as informações e posteriormente inseri-las nas tabelas finais, com os arquivos:
Estrutura_Tabelas_import_Postgres.sql

Foi criada uma rotina de inserção nas tabelas auxiliares: Estrutura_Rotina_import_Postgres.sql

#Tratamento de informações

Como forma de organizar as informações e extrair apenas as ultimas leituras dos pontos, para que as mesmas sejam analisadas e tratadas, foi criada uma query, que foi salva no arquivo Query_ultima_data.sql.

Também foras criadas as query: Insert_Bairros.sql, Insert_Cidades.sql, Insert_Estados.sql e Insert_Rua.sql, para realizar as inserções nas tabelas de unificação.

Seguindo a ordem em que os arquivos foram citados neste documento, se tem toda informação necessária para começar o tratamento e organização das mesmas dentro das tabelas de destino unificadas.