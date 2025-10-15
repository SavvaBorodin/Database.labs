psql -h localhost -p 5432 -U postgres -d postgres

SELECT 
    s.student_id,
    s.name,
    s.faculty,
    COUNT(e.course_id) AS total_courses,
    MAX(e.grade) AS highest_grade
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name, s.faculty
ORDER BY total_courses DESC, highest_grade DESC;

SELECT
    s.faculty,
    s.student_id,
    s.name,
    COUNT(e.course_id) AS courses_taken,
    RANK() OVER (PARTITION BY s.faculty ORDER BY COUNT(e.course_id) DESC) AS faculty_rank
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
GROUP BY s.faculty, s.student_id, s.name
ORDER BY s.faculty, faculty_rank;

WITH grade_numeric AS (
    SELECT 
        enrollment_id,
        student_id,
        course_id,
        CASE grade
            WHEN 'A' THEN 4.0
            WHEN 'A-' THEN 3.7
            WHEN 'B+' THEN 3.3
            WHEN 'B' THEN 3.0
            WHEN 'B-' THEN 2.7
            WHEN 'C+' THEN 2.3
            WHEN 'C' THEN 2.0
            WHEN 'C-' THEN 1.7
            WHEN 'D+' THEN 1.3
            WHEN 'D' THEN 1.0
            WHEN 'F' THEN 0
            ELSE NULL
        END AS grade_numeric
    FROM enrollments
)
SELECT 
    c.course_id,
    c.course_name,
    c.faculty,
    COUNT(e.enrollment_id) AS num_students,
    ROUND(AVG(gn.grade_numeric)::numeric, 2) AS avg_grade
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
LEFT JOIN grade_numeric gn ON e.enrollment_id = gn.enrollment_id
GROUP BY c.course_id, c.course_name, c.faculty
ORDER BY avg_grade DESC;

SELECT 
    s.student_id,
    s.name,
    s.faculty AS student_faculty,
    c.course_name,
    c.faculty AS course_faculty
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.faculty <> c.faculty
ORDER BY s.student_id;

SELECT 
    s.student_id,
    s.name,
    s.faculty,
    COUNT(e.course_id) OVER (PARTITION BY s.student_id ORDER BY e.course_id) AS cumulative_courses,
    e.grade
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
ORDER BY s.student_id, e.course_id;
