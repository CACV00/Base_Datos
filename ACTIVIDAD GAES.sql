use SICOP;
DELIMITER //
/*-------------------------PRODUCTO-------------------------------*/
CREATE PROCEDURE ProcedimientoAlmacenado(
IN in_ID_Producto INT,
IN in_Nombre VARCHAR (60),
IN in_CantidadBodega INT,
IN in_PrecioBbodega FLOAT
)
BEGIN 
INSERT INTO PRODUCTO(
ID_Producto,
Nombre,
CantidadBodega,
PrecioBbodega
)
VALUES (
in_ID_Producto,
in_Nombre,
in_CantidadBodega,
in_PrecioBbodega
);
END //
/*-------------------------USUARIO-------------------------------*/
 CREATE PROCEDURE ProcedimientoUsuario(
IN in_ID_Usuarios INT,
IN in_Contraseña VARCHAR (60),
IN in_Nombre VARCHAR (60),
IN in_Correo VARCHAR (60),
IN in_Direccion VARCHAR (60)
)
BEGIN 
INSERT INTO  USUARIO(
ID_Usuarios,
Contraseña, 
Correo,
Direccion
)
VALUES (
in_ID_Usuarios,
in_Contraseña,
in_Nombre,
in_Correo,
in_Direccion
);
END //
/*-------------------------PEDIDO-------------------------------*/
CREATE PROCEDURE ProcedimientoPedido(
IN in_ID_Pedido BIGINT(6),
IN in_ID_Cliente BIGINT(14),
IN in_Cliente VARCHAR(60),
IN in_Producto VARCHAR(20),
IN in_Estado VARCHAR(20)
)
BEGIN 
INSERT INTO PEDIDO(
ID_Pedido ,
ID_Cliente ,
Cliente,
Producto,
Estado
)
VALUES (
in_ID_Pedido ,
in_ID_Cliente ,
in_Cliente,
in_Producto,
in_Estado
);
END //
/*-------------------------INVENTARIO-------------------------------*/
CREATE PROCEDURE ProcedimientoInventario(
IN in_Codigo INT(5),
IN in_Fecha DATE ,
IN in_Costo VARCHAR (20) ,
IN in_Valor_Venta FLOAT,
IN in_Cantidad INT(3) ,
IN in_Movimientos INT (6)
)
BEGIN INSERT INTO INVENTARIO(
Codigo,
Fecha,
Costo,
Valor_Venta ,
Cantidad,
Movimientos
)
VALUES(
in_Codigo,
in_Fecha ,
in_Costo ,
in_Valor_Venta ,
in_Cantidad ,
in_Movimientos
);
END //

/*-------------------------EVENTOS-------------------------------*/
CREATE PROCEDURE ProcedimientoEventos(
IN in_ID_Evento INT(5),
IN in_Nombre VARCHAR (60),
IN in_Fecha DATE,
IN in_Patrocinador VARCHAR (60)
)
BEGIN 
INSERT INTO EVENTOS(
ID_Evento,
Nombre ,
Fecha ,
Patrocinador
)
VALUES(
in_ID_Evento,
in_Nombre,
in_Fecha,
in_Patrocinador
);
END //
/*-------------------------VENTAS-------------------------------*/
CREATE PROCEDURE ProcedimientoVentas(
IN in_ID_Venta BIGINT(6),
IN in_ID_Pedido BIGINT(14),
IN in_IVA INT(2),
IN in_Total FLOAT,
IN in_Forma_pago VARCHAR (60)
)
BEGIN 
INSERT INTO VENTAS(
ID_Venta,
ID_Pedido,
IVA,
Total,
Forma_pago 
)
VALUES(
in_ID_Venta,
in_ID_Pedido,
in_IVA,
in_Total,
in_Forma_pago 
);
END //
/*-------------------------PROVEEDORES-------------------------------*/
CREATE PROCEDURE ProcedimientoProveedores(
IN in_ID_Proveedor BIGINT(14),
IN in_Nombre VARCHAR (60),
IN in_Telefono BIGINT(10),
IN in_Direccion VARCHAR (60),
IN in_Correo VARCHAR (60)
)
BEGIN 
INSERT INTO PROVEEDORES(
ID_Proveedor,
Nombre,
Telefono,
Direccion,
Correo
)
VALUES(
in_ID_Proveedor,
in_Nombre,
in_Telefono,
in_Direccion,
in_Correo
);
END //
/*-------------------------CATEGORIA-------------------------------*/
CREATE PROCEDURE  ProcedimeintoCategoria(
IN in_ID_Categoria VARCHAR (4),
IN in_Nombre VARCHAR (60),
IN in_Descripcion VARCHAR(60)
)
BEGIN 
INSERT INTO Categoria(
ID_Categoria,
Nombre,
Descripcion
)
VALUES(
in_ID_Categoria ,
in_Nombre ,
in_Descripcion
);
END //
/*-------------------------ROLES-------------------------------*/
CREATE PROCEDURE ProcedimientoRoles(
IN in_ID_Rol INT(14),
IN in_Rol VARCHAR(20) 
)
BEGIN 
INSERT INTO ROLES(
ID_Rol ,
Rol
)
VALUES(
in_ID_Rol,
in_Rol
);


END //
DELIMITER ;

CALL  ProcedimientoAlmacenado ('027', 'POKER','25','80000');
CALL ProcedimientoUsuario ('1195784632','123456','MAICOL GARCIA','cgarcia@gmail.com','Cra 112 B-46');
CALL ProcedimientoPedido('021','1001546562','JULIETH MAYORGA','AGUARDIENTE', 'DISPONIBLE');
CALL ProcedimientoInventario('048','04/08/22','50000','50000','05','02');
CALL ProcedimientoEventos('04','CLAUDIA LOPEZ','24/03/22','ANDINA');
CALL ProcedimientoVentas('026','027','5500','55500','EFECTIVO');
CALL ProcedimientoProveedores('010','JEISON NOVOA','3102275984','CLLE 35 #15-00','jnovoa01@gmail.com');
CALL ProcedimeintoCategoria('CERVEZA','POKER','Ninguna');
CALL ProcedimientoRoles('03','CLIENTE');