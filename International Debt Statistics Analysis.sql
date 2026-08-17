create database international_debt_statistics;
use international_debt_statistics;

SELECT * FROM international_debt;

-- What is the number of distinct countries present in the database?
SELECT 
	COUNT(DISTINCT country_name) as no_distinct_countries
FROM international_debt;

/*Highest Country Debt*/
SELECT 
	country_name, 
    SUM(debt) as total_debt
FROM international_debt
GROUP BY country_name
ORDER BY total_debt DESC
LIMIT 1;

/*Country with the lowest amount of principal repayments
(indicated by the "DT.AMT.DLXF.CD" indicator code*/
SELECT 
    country_name, 
	indicator_name,
	MIN(debt) AS lowest_repayment
FROM international_debt
WHERE indicator_code='DT.AMT.DLXF.CD'
GROUP BY country_name, indicator_name
ORDER BY lowest_repayment
LIMIT 1;

/*Top 5 Countries by Total Debt (Principal + Interest)*/
SELECT 
    country_name,
    SUM(debt) AS total_debt
FROM 
    international_debt
WHERE 
    indicator_code IN ('DT.AMT.DLXF.CD', 'DT.INT.DLXF.CD')
GROUP BY 
    country_name
ORDER BY 
    total_debt DESC
LIMIT 5;

/*Average Debt by Debt Type*/
SELECT 
    indicator_name,
    ROUND(AVG(debt), 2) AS average_debt
FROM 
    international_debt
GROUP BY 
    indicator_name
ORDER BY 
    average_debt DESC;
    
    
