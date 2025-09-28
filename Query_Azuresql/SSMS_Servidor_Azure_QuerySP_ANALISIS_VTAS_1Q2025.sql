select * from ventasfebrero
select * from clientes

select c.clienteid, c.nombre, sum(v.monto) as MontoTotal
from ventasenero v
inner join clientes c on c.clienteid = v.clienteid
group by c.clienteid, c.nombre


--CTE PARA UNIR y CREAR TB DE VENTAS TRIMESTRAL
with vtas_trimestre_1Q AS ( 
	select * from ventasenero
	union all
	select * from ventasfebrero
	union all
	select * from ventasmarzo
	)
Select * into Ventas_1Q_2025
from vtas_trimestre_1Q

select * from ventas_1Q_2025

UPDATE ventas_1Q_2025
set Fecha = Dateadd(year, 1, Fecha) --súmale 1 año a la fecha que ya existe
where year(Fecha) = 2024            -- Solo tomamos las filas donde el año de la fecha es 2024.
	and month(fecha) in (2, 3);     -- Y además que el mes sea febrero (2) o marzo (3).

--SP - Analisis Ventas 1Q-2025
-- SP devuelve: Ventas por mes - por cliente - top del trimestre

create or alter procedure sp_analisis_ventas_1Q
as
begin
	--ventas por mes
	select 
	format(fecha, 'yyyy-MM') as mes,
	sum(monto) as VentaTotal
	from ventas_1Q_2025
	group by format(fecha, 'yyyy-MM')
	order by mes;

	--venta por cliente
	select
	c.clienteid,
	c.nombre,
	sum(monto) as Total_Vta_Cliente
	from ventas_1Q_2025 v
	inner join clientes c on c.clienteid = v.clienteid
	group by c.clienteid, c.nombre
	order by Total_Vta_Cliente desc;

	--cliente con mayor monto 
	select top 1 
	c.clienteid, c.nombre,
	sum(monto) as Total_Ventas
	from ventas_1Q_2025 v
	inner join clientes c on c.clienteid = v.clienteid
	group by c.clienteid, c.nombre
	order by Total_Ventas desc;
end;

exec sp_analisis_ventas_1Q