# MalariaDataWareHouse 
Development of a data Warehouse for Malaria Records in Uganda Between 2020 to 2024 


# Table of Contents
1. Architecture  BackGround
2. Repository File Structure
3. The wide-Matrix Pipeline Breakdown
4. Database Schema Blueprint (Gold Layer)
5. Data Quality & Auditing Framework(dbt)
6. Native Automation & Orchestration(SQL server Agent)
7. Analytical Perfomance & Benchmarks
8. Downstream Applications (PowerBI, ArcGIS & Data Science)
9. Getting Started & Installation
10. Academic Reference & Citation


## 1. Architecture Background
- Unlike legacy infrastructures that rely heavily  on mapping blocks(e.g , SSIS) which might crash when headers change  or exceed character limits, this system utilizes a code-first pipeline:
1.  **Bronze(Raw Landing Layer):** Using Python to ingest wide matrix-column csv files into SQL server database(Landing Zone)(Extract-Load)
2.  **Silver(Staging Layer):** Horizontally unpivoted  the raw data using  dynamic SQL (CROSS APPLY VALUES) , Transfomed and inserted into the Permanent Staging Table.(Load - Transform)
3.  **Gold(Analytical Layer):** Finally ingested the data from the permanent staging table into an organised dimensional Star schema with historical tracking(SCD-2), using a virtual presentation Layer(rpt).


   ## 2. Repository File Structure
   - This repsoitory is partitioned into clear directories. 
   ├── .github/
│   └── workflows/              # CI/CD pipelines for automated dbt testing on commit
├── automation/
│   ├── run_etl_pipeline.bat    # Windows Batch wrapper orchestrating the full execution loop
│   └── sql_agent_config.sql    # T-SQL initialization scripts for SQL Server Agent Steps
├── database/
│   ├── 01_schemas.sql          # Instantiates logical isolation (bronze, stage, gold, audit, rpt)
│   ├── 02_dimensions.sql       # DDL creating conformed entities (DimDate, DimGeography, etc.)
│   ├── 03_facts.sql            # DDL establishing core quantitative tables (Fact_Malaria, Fact_Population)
│   └── 04_views.sql            # Core reporting abstraction layer views under the 'rpt' schema
├── dbt_analytics/              # Modern Data Stack quality assurance & contract validation framework
│   ├── models/
│   │   ├── staging/            # Staging schema definitions and automated test configurations
│   │   └── schema.yml          # Declarative data assertions (not_null, unique, positive constraints)
│   └── dbt_project.yml         # Project configuration file mapping metrics to the audit schema
├── ingestion/
│   ├── requirements.txt        # Python dependency registry (pandas, sqlalchemy, pyodbc)
│   └── bulk_csv_streamer.py    # Code-first schema-on-read Python bulk ingestion engine
└── stored_procedures/
    ├── stage.SP_ETL_Stage1_Bronze_To_Silver.sql   # Dynamic catalog-driven matrix unpivot engine
    ├── gold.SP_ETL_Stage2_Sync_Dimensions.sql     # Idempotent Kimball SCD Type 2 sync procedure
    ├── gold.SP_ETL_Stage3_Silver_To_Gold_Fact.sql # Relational bulk fact aggregation mechanism
    └── audit.SP_Orchestrate_Malaria_Pipeline.sql  # Master pipeline supervisor, transaction manager, & logger

 
     
 
     
