/*
Paso 2: Agregar la inversión en campañas de marketing
Ya sabes cuánto entra (ingresos) y cuánto cuesta operar (costos).

Pero aún nos falta una pieza clave: ¿cuánto estamos gastando en campañas de marketing?

La idea es combinar lo que venden los países con lo que se invirtió en campañas, para ver la foto completa.

Piensa así:

Primero calcula ingresos y costos por país/territorio (como hiciste en el paso 1).
Luego, calcula cuánto se gastó en campañas por territorio.
Después, junta ambos mundos con un LEFT JOIN.
Y listo: ahora puedes comparar ventas, costos y gasto en marketing lado a lado.
*/

SELECT
    v.numero_pedido,
    v.clave_producto,
    p.nombre_producto,
    pc.clave_categoria,
    COALESCE(p.precio_producto, 0)  AS precio_producto,
    COALESCE(v.cantidad_pedido, 0)  AS cantidad_pedido,
    COALESCE(p.costo_producto, 0)   AS costo_producto,
    t.pais,
    t.continente,
    v.clave_territorio,
-- Calcula  ingreso_total y costo_total
  coalesce(precio_producto * cantidad_pedido, 0) AS ingreso_total,
  coalesce(costo_producto * cantidad_pedido, 0) AS costo_total
FROM ventas_2017 AS v
JOIN productos AS p
  ON v.clave_producto = p.clave_producto
LEFT JOIN productos_categorias AS pc
  ON p.clave_subcategoria = pc.clave_subcategoria
LEFT JOIN territorios AS t
  ON v.clave_territorio = t.clave_territorio;