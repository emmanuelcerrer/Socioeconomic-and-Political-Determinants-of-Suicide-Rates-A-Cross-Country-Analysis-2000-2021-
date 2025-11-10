-- Data Preview
SELECT * FROM suicide_rate

-- Avg Suicide Mortality Rate by Country & Year
SELECT country_name,year,AVG(suicide_mortality_rate) AS avg_suicide_mortality_rate FROM suicide_rate
GROUP BY country_name, year
ORDER BY AVG(suicide_mortality_rate) DESC;

-- Avg GDP by Country & Year
SELECT country_name,year,AVG(gdp) AS avg_gdp FROM suicide_rate
GROUP BY country_name,year
ORDER BY AVG(gdp) DESC;

-- Avg Political Stability by Country & Year
SELECT country_name,year,AVG(political_stability) FROM suicide_rate
GROUP BY country_name,year
ORDER BY AVG(political_stability) DESC;

-- Top 10 Countries – Suicide Mortality Rate
SELECT country_name, MAX(suicide_mortality_rate) AS max_suicide_rate FROM suicide_rate
GROUP BY country_name
ORDER BY max_suicide_rate DESC
LIMIT 10;

-- Top 10 Countries – GDP
SELECT country_name, MAX(gdp) AS max_gdp FROM suicide_rate
GROUP BY country_name
ORDER BY MAX(gdp) DESC
LIMIT 10;

-- Top 10 Countries – Lowest Political Stability
SELECT country_name,MIN(political_stability) AS min_political_stability FROM suicide_rate
GROUP BY country_name
ORDER BY MIN(political_stability) ASC
LIMIT 10;

-- Country Concern Levels (High/Med/Low)
SELECT country_name,suicide_mortality_rate, 
CASE 
    WHEN suicide_mortality_rate <5 THEN 'low'
    WHEN suicide_mortality_rate BETWEEN 5 AND 15 THEN 'mid'
    ELSE 'high'
END AS concern_level
FROM suicide_rate;

-- Compare Country vs Global Avg Suicide Rate
SELECT country_name,year,suicide_mortality_rate,
(SELECT AVG(suicide_mortality_rate) FROM suicide_rate) AS global_avg_suicide_mortality_rate
FROM suicide_rate;