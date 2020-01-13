DROP TABLE Productos CASCADE CONSTRAINTS
CREATE TABLE Productos  ( 
    Idproducto VARCHAR2(6);
    Producto VARCHAR2(50);
    Pr_venta NUMBER(5.2)
)

DROP TABLE Clientes CASCADE CONSTRAINTS
CREATE TABLE Clientes  ( 
    Idcliente NUMBER(3);
    Nif VARCHAR2(12) UNIQUE NOT NULL;
    Nombre VARCHAR2(50);
    Direccion VARCHAR2(80);
    Cod_postal VARCHAR2(5);
    Poblacion VARCHAR2(25) DEFAULT 'Murcia';
    Telefono VARCHAR2(9);
    Fax VARCHAR2(9);
    E-mail VARCHAR2(25) CHECK LIKE (%@);
    CONSTRAINT pk_Idcliente PRIMARY KEY (Idcliente)
)

DROP TABLE Factura CASCADE CONSTRAINTS
CREATE TABLE Factura  ( 
    N_factura NUMBER(6);
    Idcliente NUMBER(3);
    Fecha DATE DEFAULT SYSDATE;
    Descuento NUMBER(2) IN (0, 5, 10, 20) DEFAULT '0';
    IVA NUMBER(2) IN (4, 7, 16) DEFAULT '16';
    CONSTRAINT pk_factura PRIMARY KEY (N_factura)
)

DROP TABLE detalles_factura CASCADE CONSTRAINTS
CREATE TABLE detalles_factura  ( 
    N_factura NUMBER(6);
    Idproducto NUMBER(6);
    Cantidad NUMBER(3);
    CONSTRAINT pk_primaria PRIMARY KEY (N_factura, Idproducto)
)


