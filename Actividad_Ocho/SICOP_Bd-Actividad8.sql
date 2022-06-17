CREATE DATABASE SICOP;
USE SICOP;

CREATE TABLE Usuario (
id_Usuario INT PRIMARY KEY AUTO_INCREMENT,
tipoDocumento ENUM('CC','CE','PP') NOT NULL,
nombres VARCHAR (40) NOT NULL,
apellidos VARCHAR (40) NOT NULL,
edad SMALLINT (3) NOT NULL,
correo VARCHAR (70) NOT NULL,
contraseña VARCHAR (60) NOT NULL,
direccion VARCHAR (60) NOT NULL,
celular BIGINT (12) NOT NULL,
id_Roles INT NOT NULL,
fecha_nacimiento DATE
);

CREATE TABLE Roles (
id_Roles INT PRIMARY KEY AUTO_INCREMENT,
rol VARCHAR (30) NOT NULL,
permisos VARCHAR (60) NOT NULL
);

CREATE TABLE LogAcciones (
num_Conexion INT PRIMARY KEY AUTO_INCREMENT,
id_Usuario INT,
accion VARCHAR (200) NOT NULL,
fecha DATETIME NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Ventas (
id_Venta INT PRIMARY KEY AUTO_INCREMENT,
id_Usuario INT NOT NULL,
tipo_Venta ENUM('Punto de Venta','Domicilio') NOT NULL,
id_producto INT NOT NULL,
fecha DATE NOT NULL,
precio_Venta DECIMAL (7,2) NOT NULL,
cantidad SMALLINT (3) NOT NULL,
preciototal DECIMAL (7,2) NOT NULL
);

CREATE TABLE Producto (
id_Venta INT NOT NULL,
id_Inventario INT NOT NULL,
Stock INT NOT NULL,
valor_Venta DECIMAL (7,2) NOT NULL
);

CREATE TABLE Pedido (
id_Pedido INT PRIMARY KEY AUTO_INCREMENT,
id_Venta INT NOT NULL,
direccion VARCHAR (60) NOT NULL,
celular BIGINT(12) NOT NULL
);

CREATE TABLE Inventario (
id_Inventario INT PRIMARY KEY AUTO_INCREMENT,
id_Eventos INT NOT NULL,
id_Proveedor INT NOT NULL,
id_Categoria  INT NOT NULL,
fecha DATE NOT NULL,
StockVenta INT NOT NULL,
StockCompra INT NOT NULL,
precio_Compra DECIMAL (7,2) NOT NULL,
precio_Venta DECIMAL (7,2) NOT NULL,
lote VARCHAR (14) NOT NULL,
fechaVencimiento DATE NOT NULL
);

CREATE TABLE Proveedores (
id_Proveedor INT PRIMARY KEY AUTO_INCREMENT,
NIT SMALLINT (14),
Nombre_Empresa VARCHAR (60),
Correo VARCHAR (60),
Celular SMALLINT (12),
direccion VARCHAR (60)
);

CREATE TABLE Categoria (
id_Categoria INT PRIMARY KEY AUTO_INCREMENT,
nombre_Categoria VARCHAR (20) NOT NULL,
marca VARCHAR (20) NOT NULL,
detalle VARCHAR (20) NOT NULL,
presentacion VARCHAR (20) NOT NULL
);

CREATE TABLE EVENTOS (
id_Eventos INT PRIMARY KEY AUTO_INCREMENT,
Nombre_Evento VARCHAR (60),
nombreProducto VARCHAR (60),
tipodePromocion VARCHAR (40),
descuento SMALLINT (3),
otroProducto VARCHAR (60),
fechaDesde DATE,
fechaHasta DATE
);

# ------------------Relaciones entre tablas------------------

ALTER TABLE Usuario ADD CONSTRAINT fk_id_Roles FOREIGN KEY (id_Roles) REFERENCES Roles (id_Roles) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE LogAcciones ADD CONSTRAINT fk_id_Usuario FOREIGN KEY (id_Usuario) REFERENCES Usuario (id_Usuario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Producto ADD CONSTRAINT fk_id_Venta FOREIGN KEY (id_Venta) REFERENCES Ventas (id_Venta) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Producto ADD CONSTRAINT fk_id_Inventario FOREIGN KEY (id_Inventario) REFERENCES Inventario (id_Inventario) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Inventario ADD CONSTRAINT fk_id_Eventos FOREIGN KEY (id_Eventos) REFERENCES Eventos (id_Eventos) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Inventario ADD CONSTRAINT fk_id_Proveedor FOREIGN KEY (id_Proveedor) REFERENCES Proveedores (id_Proveedor) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Inventario ADD CONSTRAINT fk_id_Categoria FOREIGN KEY (id_Categoria) REFERENCES Categoria (id_Categoria) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Pedido ADD CONSTRAINT fk_id_PVenta FOREIGN KEY (id_Venta) REFERENCES Ventas (id_Venta) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE Ventas ADD CONSTRAINT fk_id_V_Usuario FOREIGN KEY (id_Usuario) REFERENCES Usuario (id_Usuario) ON DELETE CASCADE ON UPDATE CASCADE;


# ------------------INSERTAR DATOS------------------
INSERT INTO Roles (id_Roles,Rol,permisos)
VALUES 
(1,'Administrador',' '),
(DEFAULT,'Empleado',' '),
(DEFAULT,'Cliente',' ');

INSERT INTO Proveedores (id_Proveedor, NIT, Nombre_Empresa, Correo, Celular, direccion)
VALUES
(1,'8600052246','Bavaria S A','comercial@bavaria.com','3145786958','CLL 96 63-57'),
(DEFAULT,'8967845214','Licores Cundinamarca SAS','areacomercial@licorescundin.com','3102546958','Av Funza 02-04'),
(DEFAULT,'8745789652','Bodegas Añejas Ltda','gerentecomercial@bodegasltda.com','3215478795','Crr 197 cll 85-07'),
(DEFAULT,'904465785','Dislicores S.A','jackeline@dislicores.com','3226559748','Av Autopista Norte 197-05');

INSERT INTO Usuario(id_Usuario,tipoDocumento,nombres,apellidos,edad,correo,contraseña,direccion,celular,id_Roles,fecha_nacimiento)
VALUES
(78547978,'CC','CLAUDIA','VALENCIA','44','claudiavalencia@gmail.com','claudia123*','CLL6863-89','3102879465','1','1978-05-15'),
(80745123,'CC','JESUS','CASTRO','42','j_Castro1987@yahoo.es','ca74896','CLL6878-24','3102457847','2','1980-02-28'),
(100403587,'CC','CRISTIAN','JOHANY','23','cristianjo_00@hotmail.es','Paname74+','AV796-86','3115467895','2','1999-01-01'),
(79847587,'CE','SEBAS','RODRIGUEZ','25','srodriguez19@gmail.com','rodri1745','AV68CLL67-25','3104785868','2','1997-04-14'),
(587498,'PP','MARIA','CHAVEZ','23','macha_aguirre@hotmail.com','chama19+','TV4CLL41-04','3201457489','3','1999-06-01'),
(1005714897,'CE','LINA','MARGATIRA','25','margatira19_lin@gmail.com','linamargarita780','CLL14064-84','3224578965','3','1997-04-28'),
(478569,'PP','JULIAN','CARDENAS','27','car2005@hotmail.es','carjulian27*','CLL7563-85','3024785847','3','1995-06-15'),
(96745874,'CE','JUAN','FIGOROA','28','jufigo_roa@hotmail.com','figo_j1994','TV5CLL74-74','3053621548','3','1994-06-10'),
(91547874,'CC','ELIZABETH','MONROY','31','montoryeli10@gmail.com','moneli_zalez96','AV1CLL53-85','3121235874','3','1991-02-14'),
(89745327,'CC','EZEQUIEL','GONZALEZ','33','ezeq_gonzalez1995@gmail.com','gonZalZ-ezequiel01+','CLL9685-25','3102478596','3','1989-06-02');

INSERT INTO Categoria (id_Categoria,nombre_Categoria,marca,detalle,presentacion)
VALUES
(101,'CERVEZA','AGUILA','Light','individual'),
(102,'CERVEZA','AGUILA','Tradicional','individual'),
(103,'CERVEZA','BBC','Trigo','individual'),
(104,'CERVEZA','BUDWEISER','Budweiser','individual'),
(105,'CERVEZA','CLUD','Dorada','individual'),
(106,'CERVEZA','CLUD','Negra','individual'),
(107,'CERVEZA','CLUD','Roja','individual'),
(108,'CERVEZA','CLUD','Roja','individual'),
(109,'CERVEZA','CORONITA','Tradicional','individual'),
(110,'CERVEZA','COSTEÑITA','Tradicional','individual'),
(111,'CERVEZA','POKER','Roja','individual'),
(112,'CERVEZA','POKER','Tradicional','individual'),
(113,'CERVEZA','POKER','Malta','individual'),
(114,'CERVEZA','REDDS','Tradicional','individual'),
(115,'CERVEZA','AGUILA','Light','x4'),
(116,'CERVEZA','AGUILA','Tradicional','x4'),
(117,'CERVEZA','BBC','Trigo','x4'),
(118,'CERVEZA','BUDWEISER','Budweiser','x4'),
(119,'CERVEZA','CLUD','Dorada','x4'),
(120,'CERVEZA','CLUD','Negra','x4'),
(121,'CERVEZA','CLUD','Roja','x4'),
(122,'CERVEZA','CLUD','Roja','x4'),
(123,'CERVEZA','CORONITA','Tradicional','x4'),
(124,'CERVEZA','COSTEÑITA','Tradicional','x4'),
(125,'CERVEZA','POKER','Roja','x4'),
(126,'CERVEZA','POKER','Tradicional','x4'),
(127,'CERVEZA','POKER','Malta','x4'),
(128,'CERVEZA','REDDS','Tradicional','x4'),
(129,'CERVEZA','AGUILA','Light','x6'),
(130,'CERVEZA','AGUILA','Tradicional','x6'),
(131,'CERVEZA','BBC','Trigo','x6'),
(132,'CERVEZA','BUDWEISER','Budweiser','x6'),
(133,'CERVEZA','CLUD','Dorada','x6'),
(134,'CERVEZA','CLUD','Negra','x6'),
(135,'CERVEZA','CLUD','Roja','x6'),
(136,'CERVEZA','CLUD','Roja','x6'),
(137,'CERVEZA','CORONITA','Tradicional','x6'),
(138,'CERVEZA','COSTEÑITA','Tradicional','x6'),
(139,'CERVEZA','POKER','Roja','x6'),
(140,'CERVEZA','POKER','Tradicional','x6'),
(141,'CERVEZA','POKER','Malta','x6'),
(142,'CERVEZA','REDDS','Tradicional','x6'),
(143,'CERVEZA','AGUILA','Light','x12'),
(144,'CERVEZA','AGUILA','Tradicional','x12'),
(145,'CERVEZA','BBC','Trigo','x12'),
(146,'CERVEZA','BUDWEISER','Budweiser','x12'),
(147,'CERVEZA','CLUD','Dorada','x12'),
(148,'CERVEZA','CLUD','Negra','x12'),
(149,'CERVEZA','CLUD','Roja','x12'),
(150,'CERVEZA','CLUD','Roja','x12'),
(151,'CERVEZA','CORONITA','Tradicional','x12'),
(152,'CERVEZA','COSTEÑITA','Tradicional','x12'),
(153,'CERVEZA','POKER','Roja','x12'),
(154,'CERVEZA','POKER','Tradicional','x12'),
(155,'CERVEZA','POKER','Malta','x12'),
(156,'CERVEZA','REDDS','Tradicional','x12'),
(157,'CERVEZA','AGUILA','Light','x24'),
(158,'CERVEZA','AGUILA','Tradicional','x24'),
(159,'CERVEZA','BBC','Trigo','x24'),
(160,'CERVEZA','BUDWEISER','Budweiser','x24'),
(161,'CERVEZA','CLUD','Dorada','x24'),
(162,'CERVEZA','CLUD','Negra','x24'),
(163,'CERVEZA','CLUD','Roja','x24'),
(164,'CERVEZA','CLUD','Roja','x24'),
(165,'CERVEZA','CORONITA','Tradicional','x24'),
(166,'CERVEZA','COSTEÑITA','Tradicional','x24'),
(167,'CERVEZA','POKER','Roja','x24'),
(168,'CERVEZA','POKER','Tradicional','x24'),
(169,'CERVEZA','POKER','Malta','x24'),
(170,'CERVEZA','REDDS','Tradicional','x24'),
(201,'AGUARDIENTE','NECTAR','Verde','125ml'),
(211,'AGUARDIENTE','Antioqueño','Rojo','250ml'),
(212,'AGUARDIENTE','Antioqueño','Azul','250ml'),
(213,'AGUARDIENTE','NECTAR','Verde','250ml'),
(221,'AGUARDIENTE','Amarillo-Manzanares','Sinazucar','750ml'),
(231,'AGUARDIENTE','Antioqueño','Azul','1Lt'),
(232,'AGUARDIENTE','CHORRITO','Tradicional','1Lt'),
(233,'AGUARDIENTE','NECTAR','Verde','1Lt'),
(241,'AGUARDIENTE','NECTAR','Verde','1/2Lt'),
(301,'RON','RonSantafe','Añejo','125ml'),
(311,'RON','RonViejodeCaldas','Esencial-Azul','750ml'),
(312,'RON','RonViejodeCaldas','RobleBlanco','750ml'),
(313,'RON','RonSantafe','Añejo','750ml'),
(314,'RON','RonViejodeCaldas','Tradicional','750ml'),
(315,'RON','RonMedellin','Dorado','750ml'),
(321,'RON','RonViejodeCaldas','Tradicional','1Lt'),
(401,'TEQUILA','TresCaballos','Gold','1Lt'),
(511,'VINO','Sanson','Tradicional','750ml'),
(512,'VINO','Canan','VinoTinto-Uva','750ml'),
(513,'VINO','VinoMozcatoPazzito','Tradicional','750ml'),
(521,'VINO','Vinaja','Moscateldepasas','1Lt'),
(611,'VOBKA','Bacardy','Limon','750ml'),
(612,'VOBKA','Smirnoff','Lulo','750ml'),
(711,'WHISKY','BlackandWhite','Tradicional','250ml'),
(721,'WHISKY','PassPort','Tradicional','500ml'),
(731,'WHISKY','Ballantinas','Finest','700ml'),
(732,'WHISKY','BlackandWhite','Tradicional','700ml'),
(733,'WHISKY','JohnnieWalker','RedLaber','700ml'),
(741,'WHISKY','Grants','Tradicional','750ml'),
(742,'WHISKY','Harris','Tradicional','750ml'),
(743,'WHISKY','JohnThomas','Tradicional','750ml'),
(751,'WHISKY','SomethingSpecial','Tradicional','1Lt');

INSERT INTO Inventario (id_Inventario,id_Eventos,id_Proveedor,id_Categoria,fecha,StockVenta,StockCompra,precio_Compra,precio_Venta,lote,fechaVencimiento)
VALUES
(1,'0','1','101','2022-02-01','0','30','60000','72000','V142578','2023-01-01'),
(DEFAULT,'0','1','111','2022-02-01','0','30','58000','69600','HG4785','2023-01-01'),
(DEFAULT,'0','1','119','2022-02-01','0','7','22000','26400','T47F85W','2023-01-01'),
(DEFAULT,'0','1','131','2022-02-01','0','4','35000','42000','H7489657','2022-07-24'),
(DEFAULT,'0','1','156','2022-02-01','0','6','96000','115200','100122','2022-12-25'),
(DEFAULT,'0','2','221','2022-02-27','0','8','25000','30000','R147857','2022-09-25'),
(DEFAULT,'0','2','231','2022-02-27','0','10','110000','132000','R25478','2023-04-25'),
(DEFAULT,'0','3','751','2022-04-05','0','2','140000','168000','WH47','2023-01-12'),
(DEFAULT,'0','3','612','2022-04-05','0','14','287000','344400','1022022','2022-12-12'),
(DEFAULT,'0','3','732','2022-04-05','0','4','162000','194400','BW1452','2023-02-02'),
(DEFAULT,'0','4','511','2022-06-01','0','20','120000','144000','W147','2023-03-17');

SET FOREIGN_KEY_CHECKS =0;
ALTER TABLE Inventario MODIFY precio_Compra DECIMAL NOT NULL;
ALTER TABLE Inventario MODIFY precio_Venta DECIMAL NOT NULL;
# ------------------Procedimientos Almacenados------------------

#Search ages
DELIMITER //
CREATE PROCEDURE consumerAge (Age1 INT , Age2 INT)
	SELECT Nombres,Apellidos, Edad FROM Usuario
    WHERE edad BETWEEN Age1 AND Age2;
END //
DELIMITER ;
CALL consumerAge(20,30);
----------------------------------------------------
#Actualizar precio de venta
SELECT * FROM Inventario;
DROP PROCEDURE Actualizar;
DELIMITER //
CREATE PROCEDURE Actualizar (newPrecioV DECIMAL, Cod INT)
UPDATE Inventario SET precio_Venta=newPrecioV WHERE id_Inventario = Cod;
//
DELIMITER ;
CALL Actualizar(75000,101);
----------------------------------------------------
#Actualizar contraseña
DROP PROCEDURE actualizarContraseña;
SELECT * FROM Usuario;
DELIMITER //
CREATE PROCEDURE actualizarContraseña (IN email VARCHAR(70), IN passwd VARCHAR (70))
BEGIN
UPDATE Usuario SET contraseña = passwd WHERE correo = email; 
END //
DELIMITER ;
CALL actualizarContraseña("car2005@hotmail.es ", "478968");
----------------------------------------------------
#Producto a vencer entre
SELECT * FROM Inventario;
DROP PROCEDURE Buscarentre;
DELIMITER //
CREATE PROCEDURE Buscarentre (IN desde DATE, IN hasta DATE)
BEGIN
SELECT id_Categoria, StockCompra, fechaVencimiento FROM Inventario WHERE fechaVencimiento > desde AND fechaVencimiento < hasta;
END //
DELIMITER ;
CALL Buscarentre("2022-01-01 ","2022-12-31 ");

# ------------------Triggers------------------
#Dispara cuando hay un evento en un cierto momento (before or later) .
#Sintaxis : CREATE trigger + nombre del trigger + momento + evento on (UPDATE, INSERT, REVOKE, DELETE.ETC.) + Nombre tabla que recibe el evento
# + for each row

#Creacion de usuario
DELIMITER //
CREATE TRIGGER log_Usuarios AFTER INSERT ON Usuario FOR EACH ROW 
BEGIN
	INSERT INTO Ingreso (hora_Salida) VALUE ('Se creo un registro en alumno');
END //
DELIMITER ;

#Seguimiento Usuarios
DROP TRIGGER log_Usuarios;
DELIMITER //
CREATE TRIGGER log_Usuarios AFTER INSERT ON Usuario FOR EACH ROW 
BEGIN
	INSERT INTO logAcciones(accion) VALUE ('Se creo un registro en alumno');
END //
DELIMITER ;
SELECT * FROM Usuario;
SELECT * FROM logAcciones;
#Seguimiento Inventario
DROP TRIGGER log_Usuarios;
DELIMITER //
CREATE TRIGGER log_Inventario AFTER INSERT ON inventario FOR EACH ROW 
BEGIN
	INSERT INTO logAcciones(accion) VALUE ('Se ingreso valores al inventario');
END //
DELIMITER ;
SELECT * FROM Inventario;
SELECT * FROM logAcciones;

#Seguimiento Ventas
DROP TRIGGER log_Ventas;
DELIMITER //
CREATE TRIGGER log_Ventas AFTER INSERT ON Ventas FOR EACH ROW 
BEGIN
	INSERT INTO logAcciones(accion) VALUE ('Se ingreso nueva venta');
END //
DELIMITER ;
SELECT * FROM Ventas;
SELECT * FROM logAcciones;

#Seguimiento Roles
DROP TRIGGER log_Roles;
DELIMITER //
CREATE TRIGGER log_Roles AFTER INSERT ON Roles FOR EACH ROW 
BEGIN
	INSERT INTO logAcciones(accion) VALUE ('Se ingreso un nuevo Rol');
END //
DELIMITER ;
SELECT * FROM Roles;
SELECT * FROM logAcciones;
#------------------APUNTES-----------------
#SET FOREIGN_KEY_CHECKS =0;
#ALTER TABLE Inventario MODIFY precio_Compra DECIMAL NOT NULL;
#ALTER TABLE Inventario MODIFY precio_Venta DECIMAL NOT NULL;
-- Siempre se empieza por GRANT (Asignar, dar permiso) y luego el nombre del privilegio yh la palabra "on"
-- SINTAXIS  CREAR USUARIO
# GRANT (Asignar) + privilegio o permiso + on + nombre de base de datos, y tabla + to + nombre de usuario + @SERVIDOR (Nombre del servidor) + IDENTIFIED + BY + "CONTRASELA" 
# GRANT (Asignar) + privilegio o permiso + on + nombre de base de datos, y tabla + to + nombre de usuario + @SERVIDOR (Nombre del servidor) + IDENTIFIED + BY + "CONTRASELA" 

-- DAR PERMISOS
# GRANT + SE COLOCA EL PERMISO + ON + BASE DE DATOS, TABLA + TO + Nombre_usuario;

-- Eliminar todos los privilegios
# REVOKE + Se epecifica los permisos + ON +  base de datos.table +  FROM + NOMBRE DEL USUARIO

-- Mostrar los privilegios del usuario
# SHOW GRANTS FOR   + Nombre del susuario;

-- Borrar usuario
#"DROP  + Nombre del usuarui + nombre del servidor

-- Privilegios
#Create
#Select
#Insert
#Update
#Delete
#All Priviligies


