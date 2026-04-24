-- Create database and use it
CREATE DATABASE IF NOT EXISTS university;
USE university;

-- DROP (table delete যদি আগে থাকে)
DROP TABLE IF EXISTS students;

-- CREATE (table তৈরি)
CREATE TABLE students(
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    cgpa DECIMAL(4,2),
    contact VARCHAR(50)
);

-- data insert (example দেখানোর জন্য)
INSERT INTO students(student_id,name,cgpa,contact) VALUES
(1,'Tandra Datta',3.37,'0129999999'),
(2,'Fatema Jahan',3.57,'0129990000'),
(3,'Sabrina Akter',3.67,'0129992222');

-- table show
SELECT * FROM students;

-- ALTER (table modify করা)

-- 1. নতুন column add করা
ALTER TABLE students ADD department VARCHAR(20);

-- 2. column modify করা
ALTER TABLE students MODIFY contact VARCHAR(15);

-- 3. column rename করা (MySQL 8+ হলে)
ALTER TABLE students CHANGE name full_name VARCHAR(50);

-- table show after alter
SELECT * FROM students;

-- DROP (column delete করা)
ALTER TABLE students DROP COLUMN department;

-- final table show
SELECT * FROM students;

-- DROP (পুরো table delete করা)
DROP TABLE students;