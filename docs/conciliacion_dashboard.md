# Conciliación del dashboard

## Evidencia disponible

Se recibieron dos notebooks, tres CSV y dos capturas incrustadas en ambos notebooks. No se recibió el PBIX. La captura muestra 51.99 millones de revenue, 8.86 millones de profit, 2.87 millones de marketing, ticket de 2.08 mil y 7.12 productos por orden.

Los notebooks tienen procesos de limpieza distintos. La versión inicial solo reportaba inconsistencias de monto; la revisada las filtraba y normalizaba país. El CSV adjunto concuerda con el revenue y ticket de la versión revisada. Esto es compatible con un dashboard construido con un estado anterior, pero sin PBIX no se puede confirmar su origen, filtros ni fórmula de profit.

| Métrica | Captura histórica | Recalculado con CSV |
|---|---:|---:|
| Revenue | 51.99 millones | 48.77 millones |
| Profit/resultado | 8.86 millones, definición no verificada | 4.06 millones provisionales después de marketing y costos conocidos |
| Marketing | 2.87 millones | 2.87 millones |
| Ticket | 2.08 mil | 2.61 mil |
| Unidades por orden | 7.12 | 8.82 |

Las cifras de profit no deben interpretarse como una comparación equivalente sin revisar sus fórmulas. Revenue − suma de costos conocidos incluye 6441.07 de ingresos cuyos costos faltan; en cambio, sumar márgenes por fila omite esas filas porque el margen es nulo. Esta diferencia explica por qué ambas formas de agregación no concilian automáticamente. No imputar costo cero a productos desconocidos.

## Qué revisar en Power BI

- Actualizar las fuentes con la versión elegida y conciliar número de pedidos e importes.
- Usar una dimensión de productos con clave única y dimensiones compartidas de fecha y país para ventas y marketing. Evitar relacionar directamente ambas tablas de hechos de manera que se multipliquen importes.
- Definir costo como cantidad × costo unitario y mostrar faltantes de costo. Definir beneficio bruto por separado del resultado después de marketing.
- Revisar YTD: la curva de la captura cae, mientras el acumulado de ingresos positivos recalculado crece de enero a junio. Sin el modelo no se identifica la causa exacta.
- Mantener marketing sin asignación por producto salvo que exista una regla documentada. Un filtro de producto no basta para repartir gasto de campañas.
- Verificar que el detalle incluya id_pedido si se pretende inspeccionar órdenes individuales; la captura visible muestra producto, cantidad, monto y profit.
- Comprobar drill-through y filtros en el archivo original. Las capturas no permiten verificar esa interacción.

No se fabricó un PBIX ni se presentaron medidas nuevas como parte del trabajo original.
