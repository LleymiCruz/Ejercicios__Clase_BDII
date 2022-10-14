use ejemploIntegridad
CREATE TABLE ubicacion (
cod_ubicacion integer  not null primary key,
nombre varchar(60) not null
);
CREATE TABLE restaurante(
nombre varchar(60) not null,
licencia varchar(60) not null,
cod_restaurante varchar(5)  not null primary key,
direccion varchar(60),
fecha_apertura DATE not null,
horario varchar(60),
cod_ubicacion integer not null
);
alter table restaurante add constraint fk_rest_ubicacion
foreign key (cod_ubicacion) references ubicacion(cod_ubicacion);

CREATE TABLE cliente(
dni varchar(8) not null primary key,
nombre varchar(60) not null,
direccion varchar(60),
cod_restaurante varchar(5) 
);
alter table restaurante add constraint fk_cliente_restaurante
foreign key (cod_restaurante) references restaurante(cod_restaurante);

CREATE TABLE producto(
cod_d integer not null,
precio decimal not null,
cod_resproducto varchar(10) not null primary key,
nombre varchar(60) not null,
cantidataurante varchar(5) 
);
alter table restaurante add constraint fk_producto_restaurante
foreign key (cod_restaurante) references restaurante(cod_restaurante);

create table empleado(
dni_empleado varchar(8) primary key not null,
nombre varchar(60) not null,
domicilio varchar(60)

);
create table rest_empleado(
cod_restaurante varchar(5) not null,
dni_empleado varchar(8) not null,
puesto_trabajo varchar(20) not null
);
alter table rest_empleado add constraint pk_rest_empleado
primary key (cod_restaurante,dni_empleado);

alter table rest_empleado add constraint fk_rest_empleado_rest
foreign key (cod_restaurante) references restaurante(cod_restaurante);
alter table rest_empleado add constraint fk_rest_empleado_empleado
foreign key (dni_empleado) references empleado(dni_empleado);

alter table restaurante add constraint ck_horario
check (horario in ('HOR1', 'HOR2','HOR3'));

alter table producto add constraint ck_precio
check (precio<>0);

insert into ubicacion values ('001', 'tegucigalpa');
insert into ubicacion values ('002', 'comayaguela');
select*from ubicacion;
insert into restaurante values ('00001', 'restaurante 1', '00255', 'tegucigalpa', '02-12-1989', 'HOR1', '002');
select*from restaurante;
