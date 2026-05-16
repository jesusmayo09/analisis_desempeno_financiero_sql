# Análisis de Desempeño Financiero de Adventure Works con SQL

### Objetivos del proyecto

1. Navegar un esquema relacional y escribir JOINs para combinar tablas.

2. Extraer, filtrar y limpiar datos con SQL (manejo de NULLs, casting de tipos, estandarización de categorías).

3. Calcular indicadores financieros clave: ingresos, costos, beneficio bruto, margen y ROI.

4. Validar y controlar calidad (QA) con comprobaciones de totales y márgenes.

5. Redactar un informe ejecutivo con visualizaciones y el método Contexto → Hallazgo → Implicación (C→F→I).

### Dataset del proyecto

Tablas Disponibles

Usaremos un subconjunto del dataset de AdventureWorks. Estas son las tablas que están disponibles para ti:

* ventas_2017: transacciones de líneas de pedido (2017). Grano: una línea por producto y pedido.
* productos: catálogo con atributos, costo y precio unitario por ClaveProducto.
* productos_categorias: jerarquía categoría/subcategoría para enriquecer productos.
* clientes: maestro de clientes con segmento y ubicación.
* territorios: mapa de ClaveTerritorio → país y continente.
* campanas: gasto de marketing por territorio/campaña.

### Contexto del negocio

* ¿Cuánto estamos ganando por país?
* ¿Qué tan rentable es cada mercado considerando los gastos de marketing?
