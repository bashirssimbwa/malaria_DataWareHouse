USE MLanding1;

--Fact Malaria View

CREATE VIEW Malaria_fact_vw
AS 
SELECT FactID, DateKey, GenderKey, AgeKey, GeographyKey,
       ConfirmedCases, TreatedCases, PregnantCases, TotalCases
FROM gold.Fact_Malaria;



--Fact Population View

CREATE VIEW Fact_population_vw
AS 
    SELECT FactID, DateKey, GeographyKey, Estimated_Population
FROM gold.Fact_Population;




--DimDate View

CREATE VIEW dim_date_vw
AS 
    SELECT DateKey, FullDate, [Year], [Quarter], [Month], [MonthName],
           YearMonth
    FROM gold.DimDate;


--DimGender View 

CREATE VIEW dim_gender_vw
AS 
    SELECT GenderKey, Gender
    FROM gold.DimGender;


--DimAgeGroup View

CREATE VIEW dim_agegroup_vw
AS 
 SELECT AgeKey, AgeGroup
 FROM gold.DimAgeGroup;




 -- DimGeography  View

 CREATE VIEW dim_geography_vw
 AS 
    SELECT GeographyKey, Source_FacilityID, DistrictName, RegionName,
            IsCity, ValidFrom, ValidTo, IsCurrent
    FROM gold.DimGeography;


