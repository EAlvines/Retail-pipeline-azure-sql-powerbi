-- STAGING: recibe el CSV tal cual
IF OBJECT_ID('dbo.stg_ventas') IS NULL
CREATE TABLE dbo.stg_ventas (
    Id_venta NVARCHAR(100),
    Id_cliente NVARCHAR(100),
	Fecha_venta DATE,
    Producto   NVARCHAR(100),
    Cantidad   INT,
    Precio_Unitario DECIMAL(10,2)
);

-- FACT (serving): lista para BI
IF OBJECT_ID('dbo.fact_ventas') IS NULL
CREATE TABLE dbo.fact_ventas (
    Id_venta  INT IDENTITY(1,1) PRIMARY KEY,
    Fecha_venta     DATE,
    Id_cliente   NVARCHAR(100),
    Producto  NVARCHAR(100),
    Cantidad  INT,
    Precio    DECIMAL(10,2),
    Monto_Total   AS (Cantidad * Precio) PERSISTED
);
