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
      
<img width="383" height="461" alt="image" src="https://github.com/user-attachments/assets/b37bc26b-d583-4dd1-af19-69c1a8b3ba1b" />

**Directory Overview**
-**Automation/:** - Houses the scheduling configuring scripts. The native SQL Server Agent uses these files to trigger the Python streaming components via OS commands (CmdExec) before firing internal databases engine
 - **database/:** - Conatains the structural blueprint of the warehouse. Objects are explicitly sorted into custom schemas(bronze, stage, gold, audit, rpt) to enforce strict security perimeters and eliminate clutter.
 - **dbt_analytics/** - Configured as localized data governance suite. It translates descriptive YAML rules into live verification models , compiling automated alerts directly into **audi.DataQaulityCheckLogs** and **audit.my_first_dbt_model**.
 - **ingestion/:** Python-driven Extract and Load framework. It reads raw malaria CSV files into 
the bronze scehma into SQLServer Management system.
- **stored_procedures:** Houses the transactional processing units of the warehouse. Automates steps fom ingestion of data into thestaging Zone upto ingestion into the  Fact and dimensions.
