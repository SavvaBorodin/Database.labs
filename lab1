--  psql -h localhost -p 5432 -U postgres -d postgres

CREATE TABLE pupils (
    id SERIAL PRIMARY KEY,
    fullname VARCHAR(100),
    age INT
);

INSERT INTO pupils (fullname, age) VALUES
    ('Daniel', 19),
    ('Sophia', 22),
    ('Michael', 20),
    ('Emma', 23);

\dt

\d pupils

SELECT * FROM pupils;

DROP TABLE pupils;
