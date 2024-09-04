---[DB].[schema].[tabla]


-- DIMENSION ALIMENTO
-- select * from [Restaurante_md].[dbo].DIM_ALIMENTO
-- delete from [Restaurante_md].[dbo].DIM_ALIMENTO
insert into [Restaurante_md].[dbo].DIM_ALIMENTO (Id_alimento, nombre)
select IdAlimento, Nombre from [Rest_Jr_sample].[dbo].ALIMENTO;

-- DIMENSION CAJERO
-- select * from [Restaurante_md].[dbo].DIM_CAJERO
-- delete from [Restaurante_md].[dbo].DIM_CAJERO
insert into [Restaurante_md].[dbo].DIM_CAJERO (Id_cajero, nombre, apellido) 
select IdCajero, Nombre, Apellido from [Rest_Jr_sample].[dbo].[CAJERO];


-- DIMENSION ORDEN
-- select * from [Restaurante_md].[dbo].DIM_ORDEN
-- delete from [Restaurante_md].[dbo].DIM_ORDEN
insert into [Restaurante_md].[dbo].[DIM_ORDEN] (Id_orden)
select IdOrden from [Rest_Jr_sample].[dbo].[ORDEN];

-- DIMENSION FECHA
-- select * from [Restaurante_md].[dbo].DIM_DATE
-- delete from [Restaurante_md].[dbo].DIM_DATE
insert into [Restaurante_md].[dbo].DIM_DATE 
select 
CAST(FORMAT(Fecha, 'yyyyMMdd') as BigInt) as Id_fecha,
Fecha as 'fecha',
year(Fecha) as 'Year',
month(Fecha) as 'Month',
day(Fecha) as 'Day',
LEFT(DATENAME(MONTH, Fecha),3) as 'Month_mmm',
LEFT(DATENAME(MONTH, Fecha),3) + '-' + RIGHT(DATENAME(YEAR, FECHA),2) as 'Month_Year',
LEFT(DATENAME(WEEKDAY, Fecha), 3) as 'Week_day'
from [Rest_Jr_sample].[dbo].ORDEN;


--- FACT TABLE

SELECT * from [Restaurante_md].[dbo].FACT_ORDEN

insert into [Restaurante_md].[dbo].FACT_ORDEN
SELECT 
OA.IdOrden as 'Id_orden', 
OA.IdAlimento as 'Id_alimento',
CAST(FORMAT(O.Fecha, 'yyyyMMdd') as BigInt) as 'Id_fecha',
O.IdCajero as 'ID_Cajero',
OA.Cantidad as 'cantidad', 
OA.PrecioLinea as 'precio_linea'
FROM [Rest_Jr_sample].[dbo].ORDEN_ALIMENTO OA
JOIN [Rest_Jr_sample].[dbo].ORDEN O ON O.IdOrden = OA.IdOrden



-- Comprobacion
SELECT COUNT(*) FROM [Restaurante_md].[dbo].FACT_ORDEN
SELECT COUNT(*) FROM [Restaurante_md].[dbo].DIM_ORDEN
SELECT COUNT(*) FROM [Restaurante_md].[dbo].DIM_CAJERO
SELECT COUNT(*) FROM [Restaurante_md].[dbo].DIM_DATE
SELECT COUNT(*) FROM [Restaurante_md].[dbo].DIM_ALIMENTO