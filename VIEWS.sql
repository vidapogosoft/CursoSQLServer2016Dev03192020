
---Vistas

use Bd_Gtisys
go

create view LineaProducto
as

select 
a.ID_PRODUCTO, a.DESCRIPCION, b.PRECIO_COSTE, 
b.PRECIO_VENTA, c.DESCRIPCION as Grupo, d.DESCRIPCION as SubGrupo
from INV_PRODUCTO a
inner join INV_DET_PRODUCTO b on b.ID_PRODUCTO = a.ID_PRODUCTO
inner join INV_GRUPO c on c.ID_GRUPO = a.ID_GRUPO
inner join INV_SUBGRUPO d on d.ID_SUBGRUPO = a.ID_SUBGRUPO


select * from LineaProducto a inner join FAC_DET_PEDIDO b on b.ID_PRODUCTO = a.ID_PRODUCTO
