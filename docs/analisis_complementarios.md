# Análisis complementarios del proyecto original

Estos resultados proceden de salidas históricas de los notebooks, no de una nueva ejecución. Los datos de eventos, usuarios, actividad y experimento no fueron adjuntados. Las consultas SQL se conservan sin conexiones ni credenciales.

## Eventos

El original muestra 7796 usuarios con first_visit y 6240 con purchase. Su cociente es 80.04%, pero las consultas cuentan usuarios por evento de forma independiente y dividen por el mayor conteo. No verifican que las mismas personas recorran etapas en orden ni dentro de una ventana temporal. Por tanto, se documenta como cobertura relativa de eventos, no como conversión de un funnel secuencial validado.

El orden por conteo coloca add_to_cart antes de select_item. No puede inferirse un orden real de navegación a partir del volumen agregado.

## Cohortes

Las consultas agrupan por mes de registro y calculan usuarios activos en días 1–7, 8–14 y 15–21. Las salidas históricas de enero–mayo de 2025 muestran tasas entre 40.07% y 43.98% según cohorte y ventana. Antes de compararlas debe confirmarse que todas las cohortes tienen seguimiento completo y que la tabla de actividad cubre las ventanas. No se volvió a consultar la base.

## Experimento de checkout

La salida original indica 4965 usuarios en control y 5035 en tratamiento, con conversiones de 15.69% y 16.29%; z = 0.8133 y p = 0.4161. A nivel 0.05 no se rechaza igualdad de proporciones; esto no prueba ausencia de efecto ni equivalencia. No se reconstruyeron microdatos ni se volvió a ejecutar la prueba.

El notebook complementario conserva el código del contraste y sus salidas históricas; necesita `data/raw/experiment_checkout_ui.csv`. La recomendación es revisar diseño, potencia y efecto mínimo relevante antes de decidir si se necesita más evidencia, sin prolongar pruebas de forma oportunista hasta obtener significancia.

## Procedencia y limpieza

Los dos notebooks recibidos representan versiones diferentes del trabajo. Se conservaron extractos pertinentes de la versión revisada y se dejó intacto el archivo original recibido. La copia para GitHub excluye credenciales, datos de conexión y comentarios de revisión académica.

La preparación histórica requiere tres fuentes brutas no adjuntas. Se adaptaron rutas locales y el destino de exportación para no sobrescribir los CSV aportados. Las transformaciones y sus limitaciones están documentadas en el notebook de preparación.
