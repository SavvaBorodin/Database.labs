psql -h localhost -p 5432 -U postgres -d postgres

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    faculty VARCHAR(10)
);

INSERT INTO students (student_id, name, age, email, faculty) VALUES
(11111, 'Aizada Batrudimova', 20, 'ab@auca.kg', 'SFW'),
(11112, 'Bekzat Orozov', 22, 'bo@auca.kg', 'AMI'),
(11113, 'Cholponbek Nurmatov', 19, 'cn@auca.kg', 'ECO'),
(11114, 'Dinara Sadykova', 23, 'ds@auca.kg', 'SFW'),
(11115, 'Ermek Kadyrov', 21, 'ek@auca.kg', 'AMI');

SELECT * FROM students WHERE student_id = 11111;

SELECT * FROM students WHERE age BETWEEN 18 AND 23;

SELECT * FROM students WHERE email LIKE 'ab@auca.kg';

SELECT * FROM students WHERE faculty = 'SFW';

SELECT 
    COUNT(*) AS total_students,
    COUNT(DISTINCT faculty) AS total_faculties,
    AVG(age) AS average_age,
    MIN(age) AS youngest_student,
    MAX(age) AS oldest_student
FROM students;

SELECT
    faculty,
    COUNT(*) AS students_in_faculty,
    AVG(age) AS average_age,
    MIN(age) AS youngest,
    MAX(age) AS oldest
FROM students
GROUP BY faculty
ORDER BY faculty;
