USE MLanding1;

WITH Non_compliant AS (
SELECT g.Source_FacilityID,g.RegionName, g.DistrictName, a.AgeGroup, r.Gender,  d.Year, d.MonthName, f.ConfirmedCases, f.TotalCases FROM gold.Fact_Malaria f
 INNER JOIN gold.DimGeography g ON f.Geographykey = g.Geographykey
 INNER JOIN gold.DimDate d ON f.DateKey = d.DateKey
 INNER JOIN gold.DimGender r ON f.GenderKey = r.GenderKey  
 INNER JOIN gold.DimAgeGroup a ON f.AgeKey = a.AgeKey
WHERE f.ConfirmedCases IS NULL 
OR f.TotalCases IS NULL
)
SELECT h.Source_FacilityID AS [FacilityID], h.RegionName AS Region, h.DistrictName AS District,
h.AgeGroup, h.Gender,
h.Year As [Year] , h.MonthName AS [MonthName], h.ConfirmedCases AS [ConfirmedCases], h.TotalCases AS [TotalCases] FROM Non_Compliant h
WHERE h.Year = 2024
 ;