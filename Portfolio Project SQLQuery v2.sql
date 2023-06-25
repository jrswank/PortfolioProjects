/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [RECORD_ID]
      ,[HOSPITAL_SYSTEM]
      ,[Name]
      ,[State]
      ,[City]
      ,[Address]
      ,[Zip]
      ,[Size]
      ,[Type_For Profit]
      ,[Type_NonProfit]
      ,[Type_Church Affiliated]
      ,[Type_Urban]
      ,[Type_Rural]
      ,[Tier 1_Lown Composite Overall Rank]
      ,[Tier 1_Lown Composite Overall Grade]
      ,[Tier 2_Equity Overall Rank]
      ,[Tier 2_Equity Overall Grade]
      ,[Tier 3_Pay Equity Rank]
      ,[Tier 3_Pay Equity Grade]
      ,[Tier 3_Community Benefit Rank]
      ,[Tier 3_Community Benefit Grade]
      ,[Tier 3_Inclusivity Rank]
      ,[Tier 3_Inclusivity Grade]
      ,[Tier 4_Pay Equity_Exec Comp to Worker Wages Rank]
      ,[Tier 4_Comm Benefit_Charity Care Spending Rank]
      ,[Tier 4_Comm Benefit_Other Benefit Spending Rank]
      ,[Tier 4_Comm Benefit_Medicaid Rev Share of Patient Rev Rank]
      ,[Tier 4_Inclusivity_Income Rank]
      ,[Tier 4_Inclusivity_Racial Rank]
      ,[Tier 4_Inclusivity_Education Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  
 --Inspecting the Data Overall-- 
 --Cleaning the Data--
 --Identifying Duplicates, Identifying/Deleteing NULLS Values, 
 --Removing space from column, Converting lower & Uppercase--


  SELECT *
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]


 SELECT DISTINCT Name
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]


 SELECT *
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 WHERE [RECORD_ID] IS NULL


 --DELETE FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 --WHERE [RECORD_ID] IS NULL


  SELECT Name,
  TRIM(Name) AS name_update
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  --  WHERE Name LIKE '%Sinai%'


  --The Zip column has 4 & 5 characters-
  --Used FORMAT function for adding leading 0's to fill missing digits--
  

 SELECT  RECORD_ID, Name, City, Zip,
	LEN(Zip) AS zip_length
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 WHERE LEN(Zip) > 0


 SELECT FORMAT(CAST(Zip AS INT), '00000') AS Zip
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]


 SELECT CONCAT(UPPER(SUBSTRING([Address],1,1)) , LOWER(SUBSTRING([Address],2, LEN([Address])))) 
	AS Address_lower_case
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]


  SELECT Size,
	UPPER(Size) AS Size_Uppercase
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 ORDER BY Size


  --Data Exploration/Data Validation--
  --Displaying a List of Health Systems by Overall Grade & Rank--
   

  SELECT Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'A'
  ORDER BY [Tier 2_Equity Overall Rank] ASC


  SELECT Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'A'
  AND [Tier 2_Equity Overall Rank] BETWEEN 1 AND 15
  ORDER BY [Tier 2_Equity Overall Rank] 
  

  SELECT Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'B'
  ORDER BY [Tier 2_Equity Overall Rank] DESC
   

  SELECT Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'C'
  OR [Tier 2_Equity Overall Grade] = 'D'
  ORDER BY [Tier 2_Equity Overall Rank]
  

  SELECT Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'D' 
  ORDER BY [Tier 2_Equity Overall Rank] DESC


   --Viewing Local Hospitals Overall Rank and Grade in Atlanta, GA--


  SELECT Name, City, State, [Tier 2_Equity Overall Rank], [Tier 2_Equity Overall Grade]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE State = 'GA' AND City = 'Atlanta'
  ORDER BY Name


  --Showing the Top 50 Hospitals/Health Systems according to Overall Equity Rank with an A Grade--


  SELECT TOP 50 Name, State, [Tier 2_Equity Overall Grade], [Tier 2_Equity Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Grade] = 'A'
  ORDER BY [Tier 2_Equity Overall Rank] 
  

  --Looking at Top 25 Hospitals/Health Systems Composite Overall Equity Ranking--


  SELECT TOP 25 Name, State, [Tier 1_Lown Composite Overall Grade], [Tier 1_Lown Composite Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 1_Lown Composite Overall Grade] = 'A'
  ORDER BY [Tier 1_Lown Composite Overall Rank]


  --Top 10 Hospital/Health Systems with 'A' Grade across Community Benefit--
  --Pay Equity, Charity Care Spending, and Inclusity--


  SELECT TOP 10 Name, State, [Tier 3_Community Benefit Grade], [Tier 3_Community Benefit Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 3_Community Benefit Grade] = 'A' 
  ORDER BY [Tier 3_Community Benefit Rank] 


  SELECT TOP 10 Name, State, [Tier 3_Pay Equity Grade], [Tier 3_Pay Equity Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 3_Pay Equity Grade] = 'A' 
  ORDER BY [Tier 3_Pay Equity Rank]


  SELECT TOP 10 Name, State, [Tier 3_Inclusivity Grade], [Tier 3_Inclusivity Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 3_Inclusivity Grade] = 'A' 
  ORDER BY [Tier 3_Inclusivity Rank]
  

  --A Number Count of Hospitals/Health Systems in the dataset-- 
  --Displays the Total # of For Profit facilities(1) and Non-Profit facilities(0)--
  --Displays the Total sum of Church/Urban systems within GA by size--
  --Percentage Calculations for Overall Grade--


 SELECT COUNT(*) AS count_of_hospitals
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]


SELECT
	[Type_For Profit],
		COUNT([State]) AS Total_type
FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
GROUP BY [Type_For Profit], [Type_NonProfit]


SELECT 
	[Size],
	SUM([Type_Church Affiliated]) AS Total_Church_size,
	SUM([Type_Urban]) AS Total_Urban_size
FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
WHERE [State] = 'GA'
GROUP BY [Size]
HAVING SUM([Type_Urban]) > 10


  -- Shows No.1 Ranking Hospital/Health System Overall by State(s)--


  SELECT COUNT(*) 
	Name, State, [Tier 1_Lown Composite Overall Rank]
  FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
  WHERE [Tier 2_Equity Overall Rank] = 1
  GROUP BY State, [Tier 1_Lown Composite Overall Rank]


  -- Percentage calculation on Equity Overall Grade and Overall Composite--
  -- Summarize Data w/ Average, Min, and Max according to Overall Ranking--


 SELECT [Tier 2_Equity Overall Grade], COUNT(*) * 100.0 / (SELECT COUNT(*) 
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]) AS 'Equity_Overall_Grade_percentage'
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 GROUP BY [Tier 2_Equity Overall Grade]
 

 SELECT [Tier 1_Lown Composite Overall Grade], COUNT(*) * 100.0 / (SELECT COUNT(*) 
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]) AS 'Composite_Overall_percentage'
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]
 GROUP BY [Tier 1_Lown Composite Overall Grade] 
 ORDER BY [Tier 1_Lown Composite Overall Grade] 


 SELECT AVG([Tier 1_Lown Composite Overall Rank]) AS avg_composite_rank_overall,
		AVG([Tier 2_Equity Overall Rank]) AS avg_equity_rank_overall,
		MIN([Tier 1_Lown Composite Overall Rank]) AS min_composite,
		MAX([Tier 2_Equity Overall Rank]) AS max_composite
 FROM [lown_hospitals_index].[dbo].[Lown_Hospital_Index_Equity_Grade]

 
 