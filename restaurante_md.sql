select * from DIM_ALIMENTO;

---[DB].[schema].[tabla]
insert into [Restaurante_md].[dbo].DIM_ALIMENTO (Id_alimento, nombre)
select IdAlimento, Nombre from [Rest_Jr_sample].[dbo].ALIMENTO;



