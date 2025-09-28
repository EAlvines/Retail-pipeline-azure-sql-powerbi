--SP de carga limpia (limpia fact y vuelve a cargar desde staging)
create or alter procedure dbo.sp_cargar_fact_ventas
as
begin
set nocount on;  --para evitar que SQL notifique sobre el n° de fila afectadas / reduce trafico de red y sobrecaraga de procesamiento
truncate table [dbo].[fact_ventas]; --eliminar filas pero conservando la estructira de la tab

insert into [dbo].[fact_ventas] (Fecha_venta, Id_cliente, Producto, Cantidad, Precio)
select
try_convert(date, Fecha_venta, 103) as Fecha_Venta, --103 -- convierte dd/MM/yyyy
ltrim(rtrim(Id_cliente)) as Id_cliente,
ltrim(rtrim(Producto)) as Producto,
try_convert(int, Cantidad) as Cantidad,
try_convert(decimal(10,2), Precio) as Precio
from [dbo].[stg_ventas];
end;

