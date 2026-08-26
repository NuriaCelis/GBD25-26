create database pruebas;
use pruebas;
create table alumnos (
    numalu INT NOT NULL,
    nomalu VARCHAR(25) DEFAULT NULL,
    diralu VARCHAR(45) DEFAULT NULL,
    cpalu VARCHAR(5) DEFAULT NULL,
    telalu INT DEFAULT NULL,
    emalu VARCHAR(25) DEFAULT NULL,
    PRIMARY KEY (numalu)
);

alter table alumnos add dni int;
alter table alumnos modify dni varchar(9);
alter table alumnos modify dni varchar(9) first;
alter table alumnos drop primary key;
alter table alumnos add primary key(dni);
alter table alumnos change emalu emailalu varchar(25) after cpalu;
alter table alumnos drop numalu;
alter table alumnos add numalu int after dni;
alter table alumnos add unique(numalu);


create table tutores(
dni varchar(9),
nombre varchar(25),
apellidos varchar(30));

alter table tutores add primary key(dni);
alter table alumnos add dnitutor varchar(9);
alter table alumnos add constraint fk_alumnos_profe foreign key(dnitutor) references tutores(dni)
on delete cascade on update cascade;
