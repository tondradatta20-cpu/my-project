-- Create database and use it
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Drop table if exists
DROP TABLE IF EXISTS students;

-- Create table
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    cgpa DECIMAL(4,2),
    department VARCHAR(20)
);

-- Insert data
INSERT INTO students VALUES
(1,'Tandra',3.37,'CSE'),
(2,'Fatema',3.57,'EEE'),
(3,'Sabrina',3.67,'CSE'),
(4,'Ritu',3.87,'ICE'),
(5,'Rafia',3.47,'CSE');

-- Show all data
SELECT * FROM students;

-- =========================
-- GROUP BY
-- =========================
SELECT department, AVG(cgpa) AS avg_cgpa
FROM students
GROUP BY department;

-- =========================
-- HAVING (condition on group)
-- =========================
SELECT department, AVG(cgpa) AS avg_cgpa
FROM students
GROUP BY department
HAVING AVG(cgpa) > 3.50;

-- =========================
-- ORDER BY (sorting)
-- =========================
SELECT * FROM students
ORDER BY cgpa DESC;

-- =========================
-- CREATE VIEW
-- =========================
CREATE VIEW cse_students AS
SELECT * FROM students WHERE department = 'CSE';

-- View check
SELECT * FROM cse_students;

-- =========================
-- INDEXING
-- =========================
CREATE INDEX idx_name
ON students(name);

-- =========================
-- PROCEDURE
-- =========================
DELIMITER //

CREATE PROCEDURE show_students()
BEGIN
    SELECT * FROM students;
END //

DELIMITER ;

-- Call procedure
CALL show_students();