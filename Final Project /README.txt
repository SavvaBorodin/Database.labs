----------------------------------------------Export Goods Database Project

---------- Project Description
Project is taking data from goverment statistic of Kyrgyz republic about oblasts and making stastic arfmetic about leadership and summary between all of oblasts. Data is taken from https://www.stat.gov.kg/ru/statistics/vneshneekonomicheskaya-deyatelnost/ 
This project represents a relational database implemented in PostgreSQL that stores and analyzes export statistics of goods across regions.
The database is designed to organize historical export data, calculate regional indicators, and generate statistical summaries.

The project is created and managed using **pgAdmin 4** and SQL.



----------- Database Structure

The database consists of **nine tables**, logically connected through primary and foreign keys.

### 1. `export_goods`

This is the **central table** of the database.
It contains export indicators for each region from **2011 to 2024**.

**Main columns:**

* `region_id` — primary key
* `region_name` — unique region name
* `y2011` – `y2024` — export values by year

This table serves as the **data source** for all other tables.




2. Regional Tables

There are **seven regional tables**, each representing a specific region:

* `batken_region`
* `jalalabad_region`
* `issykkul_region`
* `naryn_region`
* `osh_region`
* `talas_region`
* `chui_region`

Each regional table contains:

* export value for **2011**
* **average export value** for the period 2011–2024
* export value for **2024**

Each table has:

* `region_id` as a **primary key**
* a **foreign key** referencing `export_goods(region_id)`

This establishes a **one-to-one relationship** between each regional table and the central table.




3. `final_summary`

The `final_summary` table represents the **statistical result** of the project.

It stores **aggregated indicators** derived from all regions:

* Maximum export value in **2011**
* Maximum **average export value** (2011–2024)
* Maximum export value in **2024**

**Columns:**

* `summary_id` — primary key
* `indicator` — type of statistical indicator
* `region_id` — foreign key referencing `export_goods(region_id)`
* `value` — calculated maximum value

This table is linked to the central table via a **foreign key**, allowing identification of the region that achieved each maximum value.




-------------------------Table Relationships

* `export_goods` is the **parent table**
* All regional tables reference `export_goods` via `region_id`
* `final_summary` references `export_goods` to indicate the source region of each statistical result

These relationships are enforced using **FOREIGN KEY constraints** and are visible in the ER diagram within pgAdmin 4.




-------------------------Purpose of the Project

* Store export data in a structured relational form
* Calculate regional indicators (year-based and average values)
* Provide a clear **statistical summary** of the best-performing regions
* Demonstrate correct database normalization and table relationships



------------------------Technologies Used

* PostgreSQL
* SQL
* pgAdmin 4


------------Result

The project successfully demonstrates:

* normalized relational database design
* clear table relationships
* statistical aggregation using SQL
* final analytical output stored in a dedicated summary table
