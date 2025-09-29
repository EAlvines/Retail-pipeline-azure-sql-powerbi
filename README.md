# 🚀 Mini Proyecto ETL en Azure (ADF + Blob + SQL + Power BI)

![Python](https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white) ![SQL Server](https://img.shields.io/badge/SQL%20Server-CC2927?logo=microsoftsqlserver&logoColor=white) ![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?logo=powerbi&logoColor=black) ![Azure](https://img.shields.io/badge/Microsoft%20Azure-0089D6?logo=microsoftazure&logoColor=white)  

---
# 📌 Descripción

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

# Prints
## Contenedor en Azure
<img width="500" height="250" alt="image" src="https://github.com/user-attachments/assets/94d459bb-b595-411a-a5e2-2f537039ed3d" />

## Pipeline Azure Data Factory
<img width="500" height="250" alt="image" src="https://github.com/user-attachments/assets/3592406f-41b0-4ea4-b37c-82af8ed307a8" />

## Trigger
<img width="500" height="200" alt="image" src="https://github.com/user-attachments/assets/1f79e5ff-5f5f-43ab-b574-245ba327fd91" />

## Prueba de flujo
<img width="500" height="250" alt="image" src="https://github.com/user-attachments/assets/2e50f392-aba5-4e68-8fdc-a81f027ce406" />

## Power BI Service con Actualización
<img width="500" height="250" alt="image" src="https://github.com/user-attachments/assets/c3f20927-d870-4d45-9f05-6535e40f133d" />
<img width="300" height="250" alt="image" src="https://github.com/user-attachments/assets/e447845d-8553-4fac-919d-a2d9f6d51569" />





