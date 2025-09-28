# Retail-pipeline-azure-sql-powerbi
# 🚀 Mini Proyecto ETL en Azure (ADF + Blob + SQL + Power BI)

Este proyecto implementa un flujo de integración de datos en **Azure Data Factory (ADF)**, utilizando **Azure Blob Storage**, **Azure SQL Database** y **Power BI** para construir un pipeline automatizado de carga, transformación y visualización que se actualiza según los triggers programados.
## 📂 Flujo del Proceso    
         ┌──────────────────────────┐
         │  CSV en Blob (landing)   │  ej: ventas_*.csv
         └───────────┬──────────────  ┘
                     │  Trigger (Blob Created)
                     ▼
         ┌──────────────────────────┐
         │    Azure Data Factory    │
         │     Pipeline ETL         │
         └───────────┬─────────────┘
                     │ 1) Copy Data
                     ▼
             ┌─────────────────┐
             │  dbo.stg_ventas │  (raw)
             └────────┬────────┘
                      │ 2) Stored Procedure
                      ▼
             ┌─────────────────┐
             │ dbo.fact_ventas │  (clean)
             └────────┬────────┘
                      │
                      ▼
             ┌─────────────────┐
             │     Power BI    │  (dataset + report)
             └─────────────────┘

        
## ⚙️ Detalles Técnicos

- **Origen de datos:** Archivos `.csv` cargados en **Azure Blob Storage** (nomenclatura `ventas_*.csv`).
- **ADF Pipeline:** 
  - *Copy Data activity* → mueve datos desde el blob hacia la tabla `stg_ventas`.
  - *Stored Procedure activity* → ejecuta el SP que limpia y transforma la data hacia la tabla `fact_ventas`.
- **Trigger en ADF:** Detecta la llegada de un nuevo archivo y dispara el pipeline automáticamente.
- **Azure SQL Database:** 
  - `stg_ventas` → staging (raw).
  - `fact_ventas` → tabla final transformada.
- **Power BI:** Conectado a `fact_ventas`. Configurado para refrescar automáticamente al cierre del día.

## ⚙️ Tecnologías Usadas
**Azure Blob Storage** – almacenamiento de archivos.
**Azure Data Factory** – orquestación de procesos ETL.
**Azure SQL Database** – persistencia de datos transformados.
**Power BI** – análisis y visualización de datos.

## 🚀 Resultado
✔️ Proceso automatizado de carga y transformación de datos.
✔️ Eliminación de tareas manuales en integración de archivos.
✔️ Dashboard en Power BI siempre actualizado con datos frescos.

## ✅ Beneficios del Proyecto
Automatización completa del flujo de datos.
Procesamiento de múltiples archivos CSV de forma dinámica.
Transformación y limpieza centralizada en SQL.
Dashboard actualizado automáticamente en Power BI.
