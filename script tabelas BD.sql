-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8 ;
USE mydb ;

-- -----------------------------------------------------
-- Table `mydb`.`alunos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.alunos (
  matricula INT NOT NULL,
  nome_al VARCHAR(45) NOT NULL,
  nasc_al DATETIME NOT NULL,
  cpf_al INT(11) NOT NULL,
  fone_al INT NOT NULL,
  email_al VARCHAR(45) NOT NULL,
  PRIMARY KEY (`matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.cursos (
  id_cursos INT NOT NULL,
  nome_cursos VARCHAR(45) NOT NULL,
  espec_curso VARCHAR(45) NOT NULL,
  carga_horaria_curso INT NOT NULL,
  valor_curso DECIMAL NOT NULL,
  PRIMARY KEY (`id_cursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`professores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.professores (
  id_professores INT NOT NULL,
  nome_prof INT NOT NULL,
  salario_prof INT NOT NULL,
  espec_prof VARCHAR(45) NOT NULL,
  hora_prof INT NOT NULL,
  PRIMARY KEY (`id_professores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`turmas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS mydb.turmas (
  alunos_matricula INT NOT NULL,
  cursos_id_cursos INT NOT NULL,
  data_inicio DATETIME NOT NULL,
  data_formatura DATETIME NOT NULL,
  professores_id_professores INT NOT NULL,
  PRIMARY KEY (alunos_matricula, cursos_id_cursos, professores_id_professores),
  CONSTRAINT fk_alunos_has_cursos_alunos
    FOREIGN KEY (`alunos_matricula`)
    REFERENCES mydb.alunos (matricula)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_alunos_has_cursos_cursos1
    FOREIGN KEY (cursos_id_cursos)
    REFERENCES mydb.cursos (id_cursos)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_turmas_professores1
    FOREIGN KEY (professores_id_professores)
    REFERENCES mydb.professores (id_professores)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into mydb.alunos(matricula, nome_al, nasc_al, cpf_al, fone_al, email_al)
	values (1, "João da Silva", 17/09/2003, 11111111111, 47996785634, "joao@gmail.com");
    
insert into mydb.alunos(matricula, nome_al, nasc_al, cpf_al, fone_al, email_al)
	values (2, "Maria da Silva", 06/10/2003, 22222222222, 47998457634, "maria@gmail.com");

insert into mydb.cursos(id_cursos, nome_cursos, espec_curso, carga_horaria_curso, valor_curso)
	values(1, "Pintura em aquarela", "especialização da técnica de aquarela para iniciantes/intermediários", 40, 200);
    
insert into mydb.cursos(id_cursos, nome_cursos, espec_curso, carga_horaria_curso, valor_curso)
	values(2, "Grafite", "especialização da técnica de grafite com tinta spray em paredes/áreas urbanas", 50, 500);

insert into mydb.professores(id_professores, nome_prof, salario_prof, espec_prof, hora_prof)
	values(1, "Amanda Soares", 1.800, "formado em artes visuais", 40);
    
insert into mydb.professores(id_professores, nome_prof, salario_prof, espec_prof, hora_prof)
	values(2, "Jonas Felipe Henning", 1.800, "bacharelado em administração", 40);
        
insert into mydb.turmas(alunos_matricula, cursos_id_cursos, data_inicio, data_formatura, professores_id_professores)
	values(1, 1, 12/06/2022, 12/12/2022, 1);
    
insert into mydb.turmas(alunos_matricula, cursos_id_cursos, data_inicio, data_formatura, professores_id_professores)
	values(2, 2, 12/06/2022, 12/12/2022, 2);

    
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
