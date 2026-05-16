/*
Paso 3: Calcular Beneficio Bruto, Margen y ROI
Ya tenemos ventas, costos y campañas. Ahora toca transformarlos en indicadores que hablan el idioma del negocio:

Beneficio Bruto (ganancia antes de marketing) → ¿cuánto sobra después de cubrir costos directos?
Margen % (eficiencia de ventas) → ¿qué porcentaje de cada dólar vendido se queda como ganancia bruta?
ROI % (retorno sobre campañas) → ¿qué tan rentable es cada peso invertido en marketing?
Piensa en estas métricas como un zoom financiero: ingresos muestran tamaño, pero estas tres muestran qué tan buen negocio es cada mercado.
*/

SELECT
    p.pais,
    p.clave_territorio,
    SUM(p.ingresos)::integer AS ingresos,
    SUM(p.costos)::integer AS costos,
    COALESCE(SUM(c.costo_campana), 0)::integer AS costo_campana,
    -- Calcula beneficio_bruto = suma (p.ingresos)::integer –  suma (p.costos)::integer
    SUM(p.ingresos)::integer - SUM(p.costos)::integer AS beneficio_bruto,
    -- margen_pct = (Ingresos – Costos) / Ingresos * 100
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0) / NULLIF(SUM(p.ingresos), 0) AS margen_pct,
    -- roi_pct = Sumas (Ingresos – Costos) / CostoCampanas * 100 y usa nullif para evitar dividir entre cero
    ((SUM(p.ingresos) - SUM(p.costos)) * 100.0) / NULLIF(SUM(c.costo_campana), 0) AS roi_pct

FROM pais_ingreso_costo AS p
LEFT JOIN pais_campanas AS c
  ON p.clave_territorio = c.clave_territorio
GROUP BY
    p.pais,
    p.clave_territorio
ORDER BY
    p.clave_territorio, ingresos, costos;