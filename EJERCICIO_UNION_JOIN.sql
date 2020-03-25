
/*****************************************************/
/****EJERCICIO DE SELECCION DE MULTIPLES TABLAS Y UNIONS*****/

--JOIN = RELACION DIRECTA ENTRE TABLAS POR UN ELEMENTO COMUN

---ventas
select 
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroFactura,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroFactura,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroFactura,9,len(comprobante.NumeroFactura)) as SecuenciaComprobante,
convert(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
factura.NumeroFactura as Comprobante,
'Ventas' as TipoComprobante
from Bd_Gtisys..ComprobanteFactura comprobante
JOIN Bd_Gtisys..Factura factura 
on factura.IdEmpresa = comprobante.IdEmpresa 
and factura.NumeroFactura = comprobante.NumeroFactura
--join Bd_Gtisys..FacturaDetalle fd
--on fd.IdFactura = factura.IdFactura
where factura.Estado = 'ACTI'
and  DATEPART(YEAR,comprobante.FechaAutorizacion) = 2020
and  DATEPART(MONTH,comprobante.FechaAutorizacion) = 1
union all
---compras
select
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroComprobanteRetencion,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroComprobanteRetencion,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroComprobanteRetencion,9,len(comprobante.NumeroComprobanteRetencion)) as SecuenciaComprobante,
convert(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
comprobante.NumeroComprobanteRetencion as Comprobante,
'Compras' as TipoComprobante
from Bd_Gtisys..ComprobanteComprobanteRetencion comprobante
join Bd_Gtisys..CuentasXPagar cp
on cp.IdEmpresa = comprobante.IdEmpresa
and cp.IdCuentasXPagar = comprobante.IdCuentasXPagar
where cp.Estado = 'ACTI'
and  DATEPART(YEAR,comprobante.FechaAutorizacion) = 2020
and  DATEPART(MONTH,comprobante.FechaAutorizacion) = 1
order by FechaAutorizacion desc


-----Otras funciones de utilidad

--replace(viejo caracter, nuevo caracter)
--replicate(especificamos el caracter, el numero de veces)

select * from Bd_Gtisys..CuentasXPagar
---025-040-000064094

select len('000061451')

---compras
select
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroComprobanteRetencion,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroComprobanteRetencion,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroComprobanteRetencion,9,len(comprobante.NumeroComprobanteRetencion)) as SecuenciaComprobante,
convert(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
comprobante.NumeroComprobanteRetencion as Comprobante,

substring (replace(cp.NumeroDocumento,'-',''),7,15) + REPLICATE('0',15-len(replace(cp.NumeroDocumento,'-',''))) as NumeroDocumentoRetenido,

'Compras' as TipoComprobante
from Bd_Gtisys..ComprobanteComprobanteRetencion comprobante
join Bd_Gtisys..CuentasXPagar cp
on cp.IdEmpresa = comprobante.IdEmpresa
and cp.IdCuentasXPagar = comprobante.IdCuentasXPagar
where cp.Estado = 'ACTI'
and  DATEPART(YEAR,comprobante.FechaAutorizacion) = 2020
and  DATEPART(MONTH,comprobante.FechaAutorizacion) = 1
order by FechaAutorizacion desc


-----row_number

---ventas
select 
comprobante.ClienteIdentificacion as Identificacion,
comprobante.ClienteNombre as Cliente,
SUBSTRING(comprobante.NumeroFactura,1,3) as Establecimiento,
SUBSTRING(comprobante.NumeroFactura,5,3) as PuntoEmision,
SUBSTRING(comprobante.NumeroFactura,9,len(comprobante.NumeroFactura)) as SecuenciaComprobante,
convert(date,comprobante.FechaAutorizacion) as FechaAutorizacion,
factura.NumeroFactura as Comprobante,
ROW_NUMBER() OVER ( partition by comprobante.NumeroFactura  order by  comprobante.FechaEmision) AS SecuencialProducto,
fd.CodigoInterno as CodProducto, 
fd.PrecioUnitario as PU,
fd.Cantidad as Cantidad,
fd.ValorIva as Iva,
'Ventas' as TipoComprobante
from Bd_Gtisys..ComprobanteFactura comprobante
JOIN Bd_Gtisys..Factura factura 
on factura.IdEmpresa = comprobante.IdEmpresa 
and factura.NumeroFactura = comprobante.NumeroFactura
join Bd_Gtisys..FacturaDetalle fd
on fd.IdFactura = factura.IdFactura
where factura.Estado = 'ACTI'
and  DATEPART(YEAR,comprobante.FechaAutorizacion) = 2020
and  DATEPART(MONTH,comprobante.FechaAutorizacion) = 1
