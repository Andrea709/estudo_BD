CREATE DATABASE aurora;
USE aurora;
---------------------------------------------------------
CREATE TABLE alunos (
	id_al INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_al VARCHAR(50) NOT NULL,
    nasc_al DATA,
    cpf_al VARCHAR(15),
    fone_al VARCHAR(15),
    email_al VARCHAR(40)
);

CREATE TABLE matricula (
	id_mat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_mat DATA,
    FOREIGN KEY(id_turmas) REFERENCES turmas(id_turmas),
    FOREIGN KEY(id_alunos) REFERENCES alunos(id_alunos)
);

CREATE TABLE turmas (
	id_turmas INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATA,
    data_final DATA,
    carga_horaria NUMBER,
    FOREIGN KEY(id_cursos) REFERENCES cursos(id_cursos)
);

CREATE TABLE cursos (
	id_cursos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(50) NOT NULL,
    espec_curso VARCHAR(300),
    carga_horaria_curso DATA,
    valor_curso NUMBER
);

CREATE TABLE professores (
	id_prof INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    salario_prof number,
    espec_prof varchar(150),
    hora_prof number,
    FOREIGN KEY(nome_curso) REFERENCES cursos(nome_curso)
    
);
