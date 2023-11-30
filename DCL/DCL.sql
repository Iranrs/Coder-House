-- 01 - criação de um usuário onde será permitido apenas leitura de dados das tabelas
create user 'leonardo@localhost';
grant select on pet_friends.* to 'leonardo@localhost'; /* Crianção de uma permissão de leitura para o usuário 
criado */


-- 02 - criação de um usuário onde será permitido leitura, inserção de dados e update de dados das tabelas
create user 'caroline@localhost';
grant select, insert, update on pet_friends.* TO 'caroline@localhost'; /* Crianção de uma permissão de 
leitura, inserção e update para o usuário criado */


-- 03 - criação de um usuário onde terá todas as permissões
create user 'iran@localhost';
grant all on pet_friends.* TO 'iran@localhost'; /* Crianção de uma permissão geral para o usuário criado */


-- show grants para verificar permissões estabelecidas
show grants for 'leonardo@localhost';
show grants for 'caroline@localhost';
show grants for 'iran@localhost';








