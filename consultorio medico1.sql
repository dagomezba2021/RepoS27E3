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

create table medicamento(
ID_medicamento varchar (10) not null,
nombre_medicamento varchar (50) not null,
descripcion varchar (150) not  null,
cantidad varchar (10) not null,
fecha_vencimiento date not null,
laboratorio varchar(20) not null,
constraint medicamento_pk primary key(ID_medicamento));

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

create table empleado(
ID_doctor varchar(10)not null,
primer_nombre varchar(20)not null,
segundo_nombre varchar(20)not null,
primer_apellido varchar(20)not null,
segundo_apellido varchar(20)not null,
fecha_nacimiento date not null,
contrasena_doctor varchar(15)not null,
constraint ID_doctor_pk primary key (ID_doctor)); 

create table paciente_empleado(
ID_Documento_identidad_Paciente varchar(10)not null,
ID_doctor varchar(10)not null,
constraint paciente_emleado_pk primary key(ID_Documento_identidad_Paciente,ID_doctor ),
constraint paciente_empleado_ID_documento_indentidad_fk foreign key(ID_Documento_identidad_Paciente) references paciente (ID_Documento_identidad_Paciente),
constraint paciente_empleado_ID_doctor_fk foreign key (ID_doctor) references empleado(ID_doctor));





