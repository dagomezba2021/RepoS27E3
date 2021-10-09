create database consultorio_medico;
use consultorio_medico;

create table paciente (
ID_Documento_identidad_Paciente varchar(10)not null,
primer_nombre varchar(20) not null,
segundo_nombre varchar(20) not null,
primer_apellido varchar(20) not null,
segundo_apellido varchar(20) not null,
fecha_nacimiento date not null,
correo_electronico varchar(40) not null,
telefono_fijo varchar(15) not null,
telefono_celular varchar(15) not null,
genero varchar (1) not null,
contrasena_paciente varchar(15)not null,
constraint paciente_pk primary key (ID_Documento_identidad_Paciente),
constraint paciente_genero_ck check(genero='M'or genero='F'));


create table consulta(
ID_consulta varchar(10)not null,
ID_Documento_identidad_Paciente varchar (10)not null,
constraint consulta_pk primary key (ID_consulta),
constraint consulta_paciente_pk foreign key (ID_Documento_identidad_Paciente)references paciente (ID_Documento_identidad_Paciente));

insert into consulta values ('1234','80100100');
insert into consulta values ('3214','70200200');
insert into consulta values ('1478','60300300');
insert into consulta values ('8522','50400400');
insert into consulta values ('3693','40500500');
insert into consulta values ('7898','12784586');
insert into consulta values ('1238','12484510');


create table cita(
ID_cita varchar(10)not null,
ID_Documento_identidad_Paciente varchar(10)not null,
Fecha_separación_de_cita date not null,
hora_Inicio_cita time not null,
hora_finalizacion_cita time not null,
constraint cita_pk primary key(ID_cita),
constraint cita_paciente_pk foreign key (ID_Documento_identidad_Paciente)references paciente (ID_Documento_identidad_Paciente));

create table reserva (
ID_Reserva varchar(10) not null,
ID_Documento_identidad_Paciente varchar(10)not null,
Fecha_reserva date not null,
Hora_reserva time not null,
constraint reserva_pk primary key (ID_Reserva),
constraint consulta_pk foreign key (ID_Documento_identidad_Paciente)references paciente (ID_Documento_identidad_Paciente));

insert into reserva values ('12347','80100100','2021-10-11','15:30:00');
insert into reserva values ('32142','70200200','2021-10-12','14:30:00');
insert into reserva values ('14789','60300300','2021-10-13','18:00:00');
insert into reserva values ('85221','50400400','2021-10-14','20:10:00');
insert into reserva values ('36933','40500500','2021-10-15','17:30:00');
insert into reserva values ('78980','12784586','2021-10-16','12:25:00');
insert into reserva values ('12389','12484510','2021-10-17','13:40:00');


create table registro(
ID_registro varchar(10)not null,
ID_Documento_identidad_Paciente varchar(10)not null,
primer_nombre varchar(25)not null,
segundo_nombre varchar(25)not null,
primer_apellido varchar(25)not null,
segundo_apellido varchar(25)not null,
fecha_nacimiento date not null,
correo_electronico varchar(25)not null,
telefono_fijo varchar(15)not null,
telefono_celular varchar(15)not null,
genero varchar (1)not null, 
constraint registro_pk primary key(ID_registro),
constraint paciente_genero_ck check(genero='M'or genero='F'),
constraint registro_paciente_fk foreign key(ID_Documento_identidad_Paciente)references paciente(ID_Documento_identidad_Paciente));

insert into registro values ('005','80100100','Giselle','Daneidy','Barrera','Turbay','2010-09-05','correo1000@uis.edu.co','1511411','3101842111','F');
insert into registro values ('456','70200200','Jairo','Robert.','Manrique','Alvarez','1990-08-29','correo2000@uis.edu.co','2272242','3102024222','M');
insert into registro values ('154','60300300','Julia','Cindy','Jimenez','Chavez','1980-07-30','correo3000@uis.edu.co','3233733','3103830403','F');
insert into registro values ('565','50400400','Saul','patricio','Rojas','Chavez','1970-04-22','correo4000@uis.edu.co','4874342','3104146324','M');
insert into registro values ('002','40500500','Ines','Catherine','Alvarez','Smith','1960-09-19','correo5000@uis.edu.co','5525458','310587559','F');
insert into registro values ('656','12784586','laura','natalia','hernandez','jimenez','1999-10-19','correo6000@uis.edu.co','44827456','3254785235','F');
insert into registro values ('078','12484510','natalia','juliana','hernandez','rodriguez','2000-10-19','correo7000@uis.edu.co','428274556','15852235','F');

create table medicamento(
ID_medicamento varchar (10) not null,
nombre_medicamento varchar (50) not null,
descripcion varchar (150) not  null,
cantidad varchar (10) not null,
fecha_vencimiento date not null,
laboratorio varchar(20) not null,
constraint medicamento_pk primary key(ID_medicamento));

insert into medicamento values ('0045267','Acetaminofén','ACETAMINOFEN 500 mg','12','2022-11-12','Genfar');
insert into medicamento values ('0247851','Aspirina','Aspirina  250 mg','4','2023-11-12','Tecnoquimicas');
insert into medicamento values ('0247847','complejo b','complejo b  50 mg','3','2023-11-12','Tecnoquimicas');
insert into medicamento values ('02897851','Ivermectina','Ivermectina  400 mg','4','2023-11-12','Tecnoquimicas');
insert into medicamento values ('0515959','dolex','dolex  500 mg','10','2023-11-12','Tecnoquimicas');



create table paciente_medicamento(
ID_Documento_identidad_Paciente varchar(10)not null,
ID_medicamento varchar(10)not null,
constraint  paciente_medicamento_pk primary key(ID_Documento_identidad_Paciente ,ID_medicamento),
constraint paciente_medicamento_fk foreign key (ID_Documento_identidad_Paciente)references paciente (ID_Documento_identidad_Paciente),
constraint paciente_medicamento_ID_medicamento foreign key (ID_medicamento)references medicamento(ID_medicamento));


insert into paciente values ('80100100','Giselle','Daneidy','Barrera','Turbay','2010-09-05','correo1000@uis.edu.co','1511411','3101842111','F','contrasena100');
insert into paciente values ('70200200','Jairo','Robert.','Manrique','Alvarez','1990-08-29','correo2000@uis.edu.co','2272242','3102024222','M','contrasena200');
insert into paciente values ('60300300','Julia','Cindy','Jimenez','Chavez','1980-07-30','correo3000@uis.edu.co','3233733','3103830403','F','contrasena300');
insert into paciente values ('50400400','Saul','patricio','Rojas','Chavez','1970-04-22','correo4000@uis.edu.co','4874342','3104146324','M','contrasena400');
insert into paciente values ('40500500','Ines','Catherine','Alvarez','Smith','1960-09-19','correo5000@uis.edu.co','5525458','310587559','F','contrasena500');
insert into paciente values ('12784586','laura','natalia','hernandez','jimenez','1999-10-19','correo6000@uis.edu.co','44827456','3254785235','F','contrasena600');
insert into paciente values ('12484510','natalia','juliana','hernandez','rodriguez','2000-10-19','correo7000@uis.edu.co','428274556','15852235','F','contrasena700');

create table empleado(
ID_doctor varchar(10)not null,
primer_nombre varchar(20)not null,
segundo_nombre varchar(20)not null,
primer_apellido varchar(20)not null,
segundo_apellido varchar(20)not null,
fecha_nacimiento date not null,
contrasena_doctor varchar(15)not null,
constraint ID_doctor_pk primary key (ID_doctor)); 


insert into empleado values ('714685942','camilo','daniel','gonzales','Turbay','2000-12-24','cami4502');
insert into empleado values ('4127452389','cristian','daniel','torres','gonzalez','1998-02-16','cris0007tg');
insert into empleado values ('5127945863','diego','fernando','martin','gomez','1994-05-12','consulta024');
insert into empleado values ('4124574565','david','camilo','smith','smith','1996-07-06','consulta548');
insert into empleado values ('2781857854','natalia','andrea','gomez','lopez','2001-04-07','consulta004');

create table paciente_empleado(
ID_Documento_identidad_Paciente varchar(10)not null,
ID_doctor varchar(10)not null,
constraint paciente_emleado_pk primary key(ID_Documento_identidad_Paciente,ID_doctor ),
constraint paciente_empleado_ID_documento_indentidad_fk foreign key(ID_Documento_identidad_Paciente) references paciente (ID_Documento_identidad_Paciente),
constraint paciente_empleado_ID_doctor_fk foreign key (ID_doctor) references empleado(ID_doctor));


