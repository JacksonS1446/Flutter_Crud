CREATE DATABASE IF NOT EXISTS projeto;

USE projeto;

DROP TABLE IF EXISTS usuarios;

CREATE TABLE usuarios(
    id int auto_increment primary key,
    nome varchar(255) not null,
    email varchar(255) not null unique,
    senha varchar(255) not null,
    dt_cadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    dt_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=INNODB;
