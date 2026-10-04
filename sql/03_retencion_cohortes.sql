-- Consulta histórica extraída del notebook. No ejecutada en esta revisión.
SELECT
    DATE_TRUNC('month', CAST(u.fecha_registro AS DATE)) AS cohorte,
    COUNT(DISTINCT u.id_usuario)                        AS clientes_iniciales,
 
    COUNT(DISTINCT CASE
        WHEN ua.dias_despues_registro BETWEEN 1 AND 7
         AND ua.activo = 1 THEN ua.id_usuario
    END)                                                AS retenido_w1,
 
    COUNT(DISTINCT CASE
        WHEN ua.dias_despues_registro BETWEEN 8 AND 14
         AND ua.activo = 1 THEN ua.id_usuario
    END)                                                AS retenido_w2,
 
    COUNT(DISTINCT CASE
        WHEN ua.dias_despues_registro BETWEEN 15 AND 21
         AND ua.activo = 1 THEN ua.id_usuario
    END)                                                AS retenido_w3,
 
    ROUND(COUNT(DISTINCT CASE WHEN ua.dias_despues_registro BETWEEN 1 AND 7
                               AND ua.activo = 1 THEN ua.id_usuario END)
          * 100.0 / COUNT(DISTINCT u.id_usuario), 2)    AS semana_1,
 
    ROUND(COUNT(DISTINCT CASE WHEN ua.dias_despues_registro BETWEEN 8 AND 14
                               AND ua.activo = 1 THEN ua.id_usuario END)
          * 100.0 / COUNT(DISTINCT u.id_usuario), 2)    AS semana_2,
 
    ROUND(COUNT(DISTINCT CASE WHEN ua.dias_despues_registro BETWEEN 15 AND 21
                               AND ua.activo = 1 THEN ua.id_usuario END)
          * 100.0 / COUNT(DISTINCT u.id_usuario), 2)    AS semana_3
 
FROM users u
LEFT JOIN user_activity ua ON u.id_usuario = ua.id_usuario
GROUP BY cohorte
ORDER BY cohorte;
