 psql -h localhost -p 5432 -U postgres -d postgres


CREATE TABLE learners (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT
);


INSERT INTO learners (name, age) VALUES
    ('Liam', 18),
    ('Olivia', 21),
    ('Noah', 20),
    ('Ava', 22);


\dt


\d learners


SELECT * FROM learners;


DROP TABLE learners;
