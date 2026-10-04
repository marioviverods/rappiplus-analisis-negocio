-- Consulta histórica extraída del notebook. No ejecutada en esta revisión.
SELECT
    nombre_evento,
    COUNT(DISTINCT id_usuario) AS usuarios_unicos,
    ROUND(
        COUNT(DISTINCT id_usuario) * 100.0 /
        MAX(COUNT(DISTINCT id_usuario)) OVER (), 2
    ) AS tasa_conversion_pct
FROM events
GROUP BY nombre_evento
ORDER BY usuarios_unicos DESC;
