use Tienda
--1 El total de ingresos por cada producto vendido (considera Cantidad * Precio).
select top 5 p.Nombre as Productos_Más_vendidos,sum(Ventas.Cantidad*p.Precio) as Ingresos_totales_Soles
from Ventas 
inner join Productos as p on Ventas.ProductID=p.ProductID
group by p.Nombre
order by Ingresos_totales_Soles desc

--2 Encuentra los 3 clientes con mayor número de compras (suma de todas sus ventas).
--Quiero ver su nombre, ciudad y cantidad total de productos comprados.
SELECT TOP 3 
    c.Nombre AS Cliente,
    c.Ciudad,
    SUM(v.Cantidad) AS Total_Compras
FROM Ventas v
INNER JOIN Clientes c ON v.ClienteID = c.ClienteID
GROUP BY c.Nombre, c.Ciudad
ORDER BY Total_Compras DESC;

--Necesito saber qué proveedores son los más importantes.
--Lista el nombre del proveedor.
--Muestra la cantidad de productos distintos que nos surten.
--Ordénalo de mayor a menor.
SELECT 
    prov.Nombre AS Proveedor,
    COUNT(DISTINCT p.ProductID) AS Productos
FROM ProductoProveedor 
INNER JOIN Proveedores prov ON ProductoProveedor.ProveedorID = prov.ProveedorID
INNER JOIN Productos p ON ProductoProveedor.ProductID = p.ProductID
GROUP BY prov.Nombre
ORDER BY Productos DESC;


SELECT 
    p.Nombre AS Producto,
    p.Categoria
FROM Productos p
LEFT JOIN Ventas v ON p.ProductID = v.ProductID
WHERE v.ProductID IS NULL;
