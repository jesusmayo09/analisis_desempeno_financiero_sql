/*
Paso 1: Calcular ingresos y costos por país
En esta etapa y tendras la tabla ventas_clean. Ahora puedes utilizarla como la base para continuar con los siguientes pasos. Debes calcular el total de ingresos y costos en cada país. 

Piensa así:

Quiero ver cada país y territorio como una fila.
Para cada fila, sumar todo lo que entró (ingresos) y todo lo que gastamos (costos).
Mostrar como entero para hacer el valor más legible.
Y ordenar para ver primero los países más grandes en ventas.
*/

SELECT 
    pais,
    clave_territorio,
    coalesce(SUM(ingreso_total)::integer,0) AS ingresos,
    coalesce(SUM(costo_total)::integer, 0) AS costos
FROM ventas_clean
GROUP BY pais, clave_territorio
ORDER BY ingresos DESC;