select * from ORDEN;


select Fecha, 
CAST(FORMAT(Fecha, 'yyyyMMdd') as BigInt) as Id_fecha,
Fecha as 'fecha',
year(Fecha) as 'Year',
month(Fecha) as 'Month',
day(Fecha) as 'Day',
LEFT(DATENAME(MONTH, Fecha),3) as 'Month_mmm',
LEFT(DATENAME(MONTH, Fecha),3) + '-' + RIGHT(DATENAME(YEAR, FECHA),2) as 'Month_Year',
LEFT(DATENAME(WEEKDAY, Fecha), 3) as 'Week_day'
from ORDEN;

