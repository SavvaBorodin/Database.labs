DROP TABLE IF EXISTS
    final_summary,
    batken_region,
    jalalabad_region,
    issykkul_region,
    naryn_region,
    osh_region,
    talas_region,
    chui_region,
    export_goods
CASCADE;

CREATE TABLE export_goods (
    region_id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL,
    y2011 NUMERIC,
    y2012 NUMERIC,
    y2013 NUMERIC,
    y2014 NUMERIC,
    y2015 NUMERIC,
    y2016 NUMERIC,
    y2017 NUMERIC,
    y2018 NUMERIC,
    y2019 NUMERIC,
    y2020 NUMERIC,
    y2021 NUMERIC,
    y2022 NUMERIC,
    y2023 NUMERIC,
    y2024 NUMERIC
);

INSERT INTO export_goods
(region_name, y2011, y2012, y2013, y2014, y2015, y2016, y2017, y2018, y2019, y2020, y2021, y2022, y2023, y2024)
VALUES
('Batken Region', 32.1, 34.7, 41.3, 15.9, 8.1, 8.5, 12.0, 24.3, 16.6, 19.7, 23.6, 65.2, 69.3, 55.9),
('Jalal-Abad Region', 61.8, 137.7, 88.2, 106.2, 81.7, 123.2, 175.6, 160.1, 214.8, 188.2, 221.3, 210.3, 300.9, 287.2),
('Issyk-Kul Region', 15.7, 12.6, 15.1, 26.9, 26.8, 14.0, 25.3, 19.6, 14.6, 20.8, 13.9, 11.3, 24.7, 47.6),
('Naryn Region', 0.6, 0.4, 0.4, 0.7, 3.8, 5.2, 1.4, 1.4, 1.0, 2.5, 0.6, 1.7, 0.7, 2.2),
('Osh Region', 45.6, 41.3, 19.3, 23.9, 31.6, 25.1, 24.8, 50.1, 79.2, 64.2, 73.1, 94.5, 92.3, 61.9),
('Talas Region', 40.1, 33.2, 56.0, 46.2, 35.1, 48.5, 40.2, 44.9, 61.7, 53.6, 111.7, 71.4, 246.2, 183.9),
('Chui Region', 100.8, 125.5, 117.8, 159.6, 120.0, 103.0, 140.3, 236.8, 217.9, 234.0, 373.7, 887.7, 485.1, 892.8);

CREATE TABLE batken_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE jalalabad_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE issykkul_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE naryn_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE osh_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE talas_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

CREATE TABLE chui_region (
    region_id INT PRIMARY KEY REFERENCES export_goods(region_id),
    value_2011 NUMERIC,
    avg_2011_2024 NUMERIC,
    value_2024 NUMERIC
);

INSERT INTO batken_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Batken Region';

INSERT INTO jalalabad_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Jalal-Abad Region';

INSERT INTO issykkul_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Issyk-Kul Region';

INSERT INTO naryn_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Naryn Region';

INSERT INTO osh_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Osh Region';

INSERT INTO talas_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Talas Region';

INSERT INTO chui_region
SELECT region_id, y2011,
ROUND((y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
       y2019+y2020+y2021+y2022+y2023+y2024)/14,2),
y2024
FROM export_goods WHERE region_name='Chui Region';

CREATE TABLE final_summary (
    summary_id SERIAL PRIMARY KEY,
    indicator TEXT NOT NULL,
    region_id INT NOT NULL REFERENCES export_goods(region_id),
    value NUMERIC
);

INSERT INTO final_summary (indicator, region_id, value)
SELECT 'Max 2011', region_id, y2011
FROM export_goods
ORDER BY y2011 DESC
LIMIT 1;

INSERT INTO final_summary (indicator, region_id, value)
SELECT 'Max Average', region_id,
(y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
 y2019+y2020+y2021+y2022+y2023+y2024)/14
FROM export_goods
ORDER BY
(y2011+y2012+y2013+y2014+y2015+y2016+y2017+y2018+
 y2019+y2020+y2021+y2022+y2023+y2024)/14 DESC
LIMIT 1;

INSERT INTO final_summary (indicator, region_id, value)
SELECT 'Max 2024', region_id, y2024
FROM export_goods
ORDER BY y2024 DESC
LIMIT 1;
