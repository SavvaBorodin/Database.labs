psql -h localhost -p 5432 -U postgres -d postgres

CREATE TABLE population (
    country_id SERIAL PRIMARY KEY,
    country VARCHAR(50),
    population_millions VARCHAR(50),
    gdp_billions VARCHAR(50)
);
INSERT INTO population (country, population_millions, gdp_billions) VALUES 
('China', '1440', '17700'),
('India', '1410', '3100'),
('United States', '338', '24000');

UPDATE population 
SET gdp_billions = '27000' 
WHERE country = 'United States' AND population_millions = '338';

SELECT * FROM population;
