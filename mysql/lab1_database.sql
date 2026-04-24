-- Create database and use it
CREATE DATABASE IF NOT EXISTS university;
USE university;
-- Drop table if already exists (to avoid duplicate error)
DROP TABLE IF EXISTS student;
-- Create student table
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(30),
    cgpa DECIMAL(4,2),
    contact VARCHAR(15));
-- INSERT data
INSERT INTO student (student_id, name, department, cgpa, contact) VALUES
(1, 'Rahim Uddin',   'ICE', 3.75, '01711000001'),
(2, 'Karim Hossain', 'CSE', 3.50, '01711000002'),
(3, 'Nadia Islam',   'EEE', 3.90, '01711000003'),
(4, 'Hasan Ahmed',   'ICE', 3.20, '01711000004'),
(5, 'Sumaiya Akter', 'CSE', 3.60, '01711000005');
SELECT * FROM student;

-- UPDATE data
UPDATE student 
SET cgpa = 3.80 
WHERE student_id = 4;
UPDATE student 
SET department = 'CSE' 
WHERE student_id = 3;
-- DELETE data
DELETE FROM student 
WHERE student_id = 5;
-- View final table
SELECT * FROM student;
