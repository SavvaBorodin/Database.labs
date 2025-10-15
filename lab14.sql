psql -h localhost -p 5432 -U postgres -d postgres

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    email VARCHAR(100),
    faculty VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty VARCHAR(10)
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT REFERENCES courses(course_id),
    grade CHAR(2)
);
INSERT INTO students (student_id, name, age, email, faculty) VALUES
(11111, 'Aizada Batrudimova', 20, 'ab@auca.kg', 'SFW'),
(11112, 'Bekzat Orozov', 22, 'bo@auca.kg', 'AMI'),
(11113, 'Cholponbek Nurmatov', 19, 'cn@auca.kg', 'ECO'),
(11114, 'Dinara Sadykova', 23, 'ds@auca.kg', 'SFW'),
(11115, 'Ermek Kadyrov', 21, 'ek@auca.kg', 'AMI');

INSERT INTO courses (course_id, course_name, faculty) VALUES
(1, 'Programming Basics', 'SFW'),
(2, 'Data Structures', 'AMI'),
(3, 'Microeconomics', 'ECO'),
(4, 'Databases', 'SFW'),
(5, 'Algorithms', 'AMI');

INSERT INTO enrollments (student_id, course_id, grade) VALUES
(11111, 1, 'A'),
(11111, 4, 'B+'),
(11112, 2, 'A-'),
(11112, 5, 'B'),
(11113, 3, 'A'),
(11114, 1, 'B'),
(11115, 2, 'A');

SELECT 
    s.student_id,
    s.name AS student_name,
    s.faculty AS student_faculty,
    c.course_name,
    c.faculty AS course_faculty,
    e.grade
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.student_id, c.course_id;

SELECT 
    s.faculty AS student_faculty,
    COUNT(e.enrollment_id) AS total_enrollments,
    AVG(CAST(NULLIF(e.grade,'F') AS FLOAT)) AS dummy_avg 
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.faculty;
