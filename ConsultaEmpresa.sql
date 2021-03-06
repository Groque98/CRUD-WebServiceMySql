CREATE TABLE departamento
(codigo_departamento INT PRIMARY KEY,
nombre_depto VARCHAR(75),
presupuesto DECIMAL)

CREATE TABLE empleado
(
dpi INT PRIMARY KEY,
nombre VARCHAR(100),
apellidos VARCHAR(125),
cod_depto INT ,
FOREIGN KEY (cod_depto)
REFERENCES departamento(codigo_departamento)
)

select *from departamento
select *from empleado
DELETE from empleado 

INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(001,'Gerencia',55000),
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(002,'Administración y Finanzas',118000),
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(003,'Contabilidad',63550),(004,'RRHH',45000),(005,'Proyectos',1305000),
INSERT INTO departamento(codigo_departamento,nombre_depto,presupuesto) VALUES(006,'Comercial',354647),(007,'Mercadeo',556000),(008,'Produccion',13500300),(009,'Logistica',5905400),(010,'Bodega',2566500),(012,'Inteligencia',65000),(014,'Informática',157000),(077,'Investigacion',157000)



INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16967,'AARON ISAAC','PAR GUITZ',3),(15251,'ADELFA VERONICA','PEREZ LOPEZ',5),(13621,'ADELIO','PEREZ Y PEREZ',9),
(15752,'ADELSO','ZUÑIGA REGALADO',1),(18228,'ADELY NATYNELLY','MARGOTTIUL CU',10),(25757,'BECERA SUZZETH','OVALLE ROLDAN',7),(22011,'BEIMER DANILO','PEREZ BAUTISTA',2),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13382,'BELBETH YESENIA','HERNANDEZ GONZALEZ',4),(10569,'BELGICA ANABELLA','DERAS ROMAN',77),(18600,'BELICA ANABELA','MIRANDA MONZON',6),
(21163,'BELLANIRA DANALY','MEDRANO MORALES',12),
(13837,'BELMIN PINEDA','GONZALEZ',1),
(24367,'BELSY KORINA','ALVARADO HERNANDEZ',5),
(20561,'BELSY LORENA','DE LEON GODINEZ',8),
(17449,'BELSY YUCELA','SOLANO CRUZ',3),
(19107,'CARMEN LUCIA','ACU RECINOS',5),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20940,'CARMEN LUCIA','NAJARRO RUANO',9),
(24517,'CARMEN MARIA','AREVALO HERNANDEZ',10),
(20784,'DAVID JOSUE','LOPHES GUZMAN',7),
(20523,'DAVID LIONEL','PIVARAL ALBUREZ',14),
(22891,'DAVID MOISES','ELIAS AGUILAR',4),
(13332,'DAVID OSWALDO','QUIYUCH TOCAY',7),
(24434,'DAVID RIGOBERTO','VILLEDA SANCHEZ',6),
(24815,'DAVID URBANO','PIVARAL GONZALEZ',6),
(13071,'DAVID YURAMBIR','RIVERA ALVARADO',5),
(15277,'DAYRIN LIZMENIA','TEO SALGUERO',1),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16052,'DAYRIN ROCIO','MEJIA',8),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22073,'DEBBIE DEL CARMEN','SOLOMAN ORTIZ',1),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(20252,'DEBORA CELESTE','CHAN GUERRA',3),
(16199,'DEBORA GREACE','AVILA CHACON',5),
(20391,'DEBORA GUISELA','MEJICANOS',10),
(26053,'DEBORA MARIE','ESTHERPALACIOS VALDEZ',7),
(19291,'DEBORA MISHELL','CIFUENTES ESCOBAR',14),
(20418,'DEBORA RAQUEL','JUAREZ FUENTES',4),
(23647,'DEBORA RENEE','RODRIGUEZ RECINOS',1),
(21707,'DEBORAH VIOLETA','SIERRA LOPEZ',77),
(22661,'DEBRACK INDIRA','LOYO BRAN',6),
(21112,'DEBRAH ESTHER','LOBOS TOLEDO',12),
(16194,'DEGLY LEONEL','RODERICOMORALES NOGUERA',5),
(24546,'DEICY MARILIS','PINEDA REVOLORIO',8),
(25551,'DEISY VANESSA','FRANCO CERNA',3),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21957,'DELBERT URIEL','DOMINGUEZ MARTINEZ',14),
(11518,'DELCY NOHEMI','SALGUERO ESQUIVEL',9),
(24823,'DELFINA JEANNETTE','GARCIA MORALES',10),
(10882,'DELHI YOHANA','OROZCO JUAREZ',7),
(20930,'EDGAR ROLANDO','LOPEZ TOJES',2),
(20112,'EDGAR ROLANDO','ORTIZ GONZALEZ',4),
(10755,'EVER LIBERATO','MARTINEZ BARRIOS',14),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(22595,'EVER MANOLO','MORALES LOPEZ',6),
(15628,'EZVIN OSWALDO','GUERRA GALVEZ',12),
(19969,'EZZIO GIANCARLO','GUILLEN AYAU',1),
(12360,'FABIAN ALBERTO','RAMOS BARAHONA',8),
(24618,'FABIAN ALFONSO','GARCIA ALVARADO',14),
(13176,'FABIAN','DE LEON PEREZ',9),
(11267,'FABIAN HERIBERTO','MOLINA SOSA',2),
(18302,'FABIOLA CORINA','MANZANERO GARCIA',3),
(14055,'FRANCISCO RAUL','ALVARADO CHAVEZ',5),
(20627,'FRANCISCO RAYMUNDO','UJPAN VASQUEZ',3),
(17606,'FRANZ ROBERTO','POLANCO MEJIA',9),
(22183,'FRED ERICK','RENEGARCIA GARCIA',10),
(16423,'FREDY ESTUARDO','OGALDEZ FERNANDEZ',7),
(20963,'GABRIELA SOFIA','PORTILLO LOPEZ',2),
(23517,'GARDENIA ENEDINA','MAZA CASTELLANOS',4),
(14693,'GARY ALEXANDER','CONTRERAS NAJERA',3),
(21712,'GILMAR ALEXANDER','CUC GUERRERO',7),
(19855,'GREYS MARIANA','PINTO',6),
(11583,'GUSTAVO ADOLFO','TABIN GRAMAJO',12),
(18303,'HENRY ERNESTO','RODRIGUEZ VILLALTA',8),
(12871,'HENRY ESTEBAN','SOSOF RAMIREZ',3),
(19484,'INGRID YESENIA','CHAVARRIA MORAN',5),
(18005,'INGRID YESENIA','LOPEZ GALVEZ',3),
(24270,'JUAN CARLOS','AMARRA ROBLES',9),
(17193,'KARLA MARIELA','DE LEON LOPEZ',10),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(16970,'KARLA OLIVIA','IXMUCANEALVA ARROYO',7),
(21454,'LIDIA ELIZABETH','SOLARES',2),
(17668,'LIDIA ENCARNACION','COY MACZ',4),
(12816,'OCTAVIO','CHEGUEN GONZALEZ',1),
(15802,'ROSA ODILIA','NAVASSI DIAZ',77),
(23204,'ROSALICIA','GUZMAN ALDANA',6),
(25659,'SANDRA IVONNE','MARTINEZ AGUILAR',12),
(16407,'SANDRA LISSETTE','MORALES RAMIREZ',8),
(22263 ,'TERESA DE JESUS','GONZALEZ TELON',3),
(15112 ,'TERESA DE JESUS','VASQUEZ VILLATORO',3),
(13365 ,'WENDY LISBETH','MARROQUIN CASTILLO',5),
(11725 ,'WILFIDO','PANTALEON PACHECO',9),
(16177 ,'WILFREDO','ALDANA ARCHILA',10),
(19261 ,'YESIKA MANUELA','MACARIO TAQUIEJ',7),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(21731 ,'ZULMY RAQUEL','GARCIA CISNEROS',2),
(20275 ,'ZULY GABRIELA','ALVARADO BARRIOS',4),
INSERT INTO empleado (dpi,nombre,apellidos,cod_depto) VALUES(13729 ,'ZULY MAYTE','SANDOVAL SANDOVAL',77)