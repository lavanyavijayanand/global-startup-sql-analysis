-- GLOBAL STARTUP ANALYSIS PROJECT
-- File: global_startup_analysis.sql
-- Author: Lavanya V

--SCHEMA & TABLE CREATION
CREATE SCHEMA startup;
USE startup;

CREATE TABLE global_startup (
  Startup_Name VARCHAR(100),
  Founded_Year INT,
  Country VARCHAR(100),
  Industry VARCHAR(100),
  Funding_Stage VARCHAR(100),
  Total_Funding INT,
  Number_of_Employees INT,
  Annual_Revenue INT,
  Valuation INT,
  Success_Score INT,
  Acquired VARCHAR(100),
  IPO VARCHAR(100),
  Custome_Base INT,
  Tech_Stack VARCHAR(100),
  Social_Media_Followers INT
);

--Total Number of Startups 
SELECT COUNT(*) AS total_startups FROM global_startup;
-- Number of Startups per Country
SELECT country, COUNT(*) AS startup_count
FROM global_startup
GROUP BY country
ORDER BY startup_count DESC;
-- Average Funding per Stage
SELECT funding_stage, ROUND(AVG(total_funding), 2) AS avg_funding
FROM global_startup
GROUP BY funding_stage
ORDER BY avg_funding DESC;
-- Startups Founded Per Year
sql
Copy code
SELECT founded_year, COUNT(*) AS startups_founded
FROM global_startup
GROUP BY founded_year
ORDER BY founded_year;

-- Country-wise Total Funding
SELECT country, SUM(total_funding) AS total_country_funding
FROM global_startup
GROUP BY country
ORDER BY total_country_funding DESC;
--Startups with Revenue > Funding 
SELECT industry, ROUND(AVG(valuation), 2) AS avg_valuation
FROM global_startup
GROUP BY industry
ORDER BY avg_valuation DESC;
--Average Valuation by Industry
SELECT 
  SUM(CASE WHEN ipo = 'Yes' THEN 1 ELSE 0 END) AS ipo_count,
  SUM(CASE WHEN acquired = 'Yes' THEN 1 ELSE 0 END) AS acquired_count
FROM global_startup;
--Count of IPO vs Acquired
SELECT startup_name, valuation
FROM global_startup
WHERE country = 'India'
ORDER BY valuation DESC
LIMIT 5;
--Top 5 Valued Startups in India
SELECT startup_name, success_score, social_media_followers
FROM global_startup
WHERE social_media_followers IS NOT NULL
ORDER BY success_score DESC;
--Success Score vs Social Media Followers
SELECT funding_stage, ROUND(AVG(number_of_employees), 0) AS avg_employees
FROM global_startup
GROUP BY funding_stage
ORDER BY avg_employees DESC;

--Average Employees by Funding Stage
SELECT funding_stage, ROUND(AVG(number_of_employees), 0) AS avg_employees
FROM global_startup
GROUP BY funding_stage
ORDER BY avg_employees DESC;
--Industry-wise Success Score Ranking
WITH RankedStartups AS (
  SELECT *,
         RANK() OVER (PARTITION BY industry ORDER BY success_score DESC) AS rank_score
  FROM global_startup
)
SELECT startup_name, industry, success_score
FROM RankedStartups
WHERE rank_score = 1;
--Startups with funding above country average
SELECT g1.startup_name, g1.country, g1.total_funding
FROM global_startup g1
WHERE g1.total_funding > (
  SELECT AVG(g2.total_funding)
  FROM global_startup g2
  WHERE g2.country = g1.country
);
-- Classify Funding Stage 
SELECT funding_stage,
       CASE
         WHEN funding_stage = 'Seed' THEN 1
         WHEN funding_stage = 'Series A' THEN 2
         WHEN funding_stage = 'Series B' THEN 3
         WHEN funding_stage = 'Series C' THEN 4
         WHEN funding_stage = 'IPO' THEN 5
         ELSE 6
       END AS stage_level
FROM global_startup;

--  Predict Potential IPO Candidate
SELECT startup_name, valuation, success_score, number_of_employees,
       CASE
         WHEN valuation >= 20 AND success_score >= 5 AND number_of_employees >= 500 THEN 'Likely IPO Candidate'
         ELSE 'Not Yet'
       END AS ipo_prediction
FROM global_startup;
--Startup Growth Indicator
SELECT startup_name, valuation, annual_revenue,
       ROUND(valuation / annual_revenue, 2) AS growth_multiplier
FROM global_startup
ORDER BY growth_multiplier DESC
LIMIT 10;

-- ✅ TECH STACK TREND
SELECT tech_stack, COUNT(*) AS total_startups
FROM global_startup
GROUP BY tech_stack
ORDER BY total_startups DESC;

-- ✅ FINAL DATA CHECK
SELECT * FROM global_startup;
