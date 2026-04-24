CREATE DATABASE IF NOT EXISTS university;
USE university;
-- Drop table if already exists (to avoid duplicate error)
DROP TABLE IF EXISTS marks;
CREATE TABLE marks (
    roll           INT PRIMARY KEY,
    student_name   VARCHAR(40) NOT NULL,
    subject        VARCHAR(30),
    marks_obtained INT,
    grade          VARCHAR(5)
);

INSERT INTO marks VALUES
(1,'Rahim Uddin',    'Math',    85,'A'),
(2,'Karim Hossain',  'Math',    72,'B+'),
(3,'Nadia Islam',    'Physics', 90,'A+'),
(4,'Hasan Ahmed',    'Physics', 65,'B'),
(5,'Sumaiya Akter',  'Math',    78,'A-'),
(6,'Rafi Khan',      'Chemistry',88,'A'),
(7,'Mita Das',       'Chemistry',55,'C+'),
(8,'Jamal Hossain',  'Physics', 95,'A+');

-- COUNT all
SELECT COUNT(*) AS total_students FROM marks;

-- COUNT per subject
SELECT subject, COUNT(*) AS num_students FROM marks GROUP BY subject;

-- MAX
SELECT MAX(marks_obtained) AS highest FROM marks;

-- MIN
SELECT MIN(marks_obtained) AS lowest FROM marks;

-- AVG
SELECT AVG(marks_obtained) AS average FROM marks;

-- All aggregate functions grouped by subject
SELECT subject,
       COUNT(*)              AS num_students,
       MAX(marks_obtained)   AS highest,
       MIN(marks_obtained)   AS lowest,
       AVG(marks_obtained)   AS average
FROM marks
GROUP BY subject
ORDER BY average DESC;
