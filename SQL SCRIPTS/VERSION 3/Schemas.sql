USE MLanding1;

--Bronze Layer
CREATE SCHEMA bronze;

--Staging schema
CREATE SCHEMA stage;
 
GO

--Reporting Scehma
CREATE SCHEMA gold;
GO

--Data audit Schema
CREATE SCHEMA audit;

GO

--Migrating tables to their respective Schemas

--AUDIT

ALTER SCHEMA [audit] TRANSFER dbo.pipelineExecutionlogs;

ALTER SCHEMA [audit] TRANSFER dbo.DataQualityCheckLogs;



ALTER SCHEMA [audit] TRANSFER dbo.my_first_dbt_model;


-- Stage

ALTER SCHEMA [stage] TRANSFER dbo.Stg_Malaria_Permanent;
GO
ALTER SCHEMA [stage] TRANSFER dbo.Stg_Population_Unpivoted;
GO
ALTER SCHEMA [stage] TRANSFER dbo.Stg_Population_Pivoted;


--Bronze

ALTER SCHEMA [bronze] TRANSFER dbo.Malaria2020

ALTER SCHEMA [bronze] TRANSFER dbo.Malaria2021

ALTER SCHEMA [bronze] TRANSFER dbo.Malaria2022

ALTER SCHEMA [bronze] TRANSFER dbo.Malaria2023

ALTER SCHEMA[bronze] TRANSFER dbo.Malaria2024


ALTER SCHEMA[bronze] TRANSFER dbo.Malaria2025


ALTER SCHEMA[bronze] TRANSFER dbo.Malaria2026


ALTER SCHEMA[bronze] TRANSFER dbo.Malaria2028


ALTER SCHEMA[bronze] TRANSFER dbo.UBOS_population_data;



--Gold

ALTER SCHEMA [gold] TRANSFER dbo.DimGender;
GO

ALTER SCHEMA [gold] TRANSFER dbo.DimGeography;

GO

ALTER SCHEMA [gold] TRANSFER dbo.Fact_Malaria;

GO

ALTER SCHEMA [gold] TRANSFER dbo.Fact_Population;

GO

ALTER SCHEMA [gold] TRANSFER dbo.DimAgeGroup;

GO

ALTER SCHEMA [gold] TRANSFER dbo.DimDate;
