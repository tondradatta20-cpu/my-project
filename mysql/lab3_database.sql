-- Create database and use it
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- DROP (table delete যদি আগে থাকে)
DROP TABLE IF EXISTS students;

-- CREATE table
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cgpa DECIMAL(4,2),
    department VARCHAR(20),
    contact VARCHAR(15)
);

-- INSERT data
INSERT INTO students(student_id,name,cgpa,department,contact) VALUES
(1,'Tandra Datta',3.37,'CSE','0129999999'),
(2,'Fatema Jahan',3.57,'EEE','0129990000'),
(3,'Sabrina Akter',3.67,'CSE','0129992222'),
(4,'Ritu Sarkar',3.87,'ICE','0129991111'),
(5,'Rafia Akter',3.47,'CSE','0129339999');

-- SELECT all data
SELECT * FROM students;

-- SELECT specific columns (FROM clause use)
SELECT name, cgpa FROM students;

-- WHERE clause use (condition)
SELECT * FROM students WHERE cgpa > 3.50;

-- WHERE with specific condition
SELECT name, department FROM students WHERE department = 'CSE';

-- multiple condition (AND)
SELECT * FROM students 
WHERE cgpa > 3.50 AND department = 'CSE';

-- multiple condition (OR)
SELECT * FROM students 
WHERE department = 'EEE' OR department = 'ICE';

-- final দেখার জন্য
SELECT * FROM students;