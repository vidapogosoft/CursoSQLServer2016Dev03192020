
---Devuelven Valores Escalares
---Devolver un tipo tabla
---Tabla en linea

--Funcion de tipo de dato escalar

use Bd_Gtisys
go

Create function EdadPersonaTaller (@FechaNacimiento date)
returns int
as
begin
		declare @EdadActual int

		select @EdadActual = datediff(YEAR,@FechaNacimiento, getdate())

		return (@EdadActual)
end


---select dbo.EdadPersona('1980-03-26') as Edad

select
NOMBRES_COMPLETO, FECHA_NACIMIENTO, dbo.EdadPersonaTaller(FECHA_NACIMIENTO) as Edad
from Bd_Gtisys..GEN_PERSONA
go
--Funciones de tipo table

create function PersonaTipoIdentificacion()
returns @Persona table
(
	Identificacion varchar(15),
	TipoIdentificacion varchar(30),
	Persona varchar(max)
)
as
begin
	
	Insert @Persona
	(
		Identificacion, TipoIdentificacion, Persona
	)

	select CEDULA, case when len(CEDULA) = 13 then 'RUC'
						when len(CEDULA) = 10 then 'CED'
						else 'EXT' end TipoId,
						NOMBRES_COMPLETO
	from Bd_Gtisys..GEN_PERSONA

	return
end

Select * from PersonaTipoIdentificacion()

go
--Funciones de tabal en linea

Create function SaldosDePedidos (@Anio int, @Saldo decimal(18,2))
returns table
as
return
(

	select 
	a.NUMERO, a.FECHA_EMISION, b.CEDULA, b.NOMBRES_COMPLETO, a.TOTAL,
	a.SALDO
	from Bd_Gtisys..FAC_PEDIDO a
	inner join Bd_Gtisys..GEN_PERSONA b on b.ID_PERSONA = a.ID_CLIENTE
	where year(a.FECHA_EMISION) = @Anio
	and a.SALDO > = @Saldo

)


select * from dbo.SaldosDePedidos(2018, 1)
