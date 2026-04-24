CREATE DATABASE IF NOT EXISTS university;
USE university;
-- Drop table if already exists (to avoid duplicate error)
DROP TABLE IF EXISTS dept;
CREATE TABLE dept (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE emp (
    emp_id   INT PRIMARY KEY,
    emp_name VARCHAR(40) NOT NULL,
    dept_id  INT,
    salary   DECIMAL(10,2),
    FOREIGN KEY (dept_id) REFERENCES dept(dept_id)
);

INSERT INTO dept VALUES 
(1,'ICE'),
(2,'CSE'),
(3,'EEE'),
(4,'ME');
INSERT INTO emp VALUES
(1,'Rahim', 1, 45000),
(2,'Karim', 2, 55000),
(3,'Nadia', 1, 50000),
(4,'Hasan', 3, 60000),
(5,'Sumon', NULL, 40000);

-- CROSS JOIN
SELECT emp.emp_name, dept.dept_name FROM emp CROSS JOIN dept;

-- NATURAL JOIN
SELECT emp_name, dept_name FROM emp NATURAL JOIN dept;

-- LEFT OUTER JOIN
SELECT emp.emp_name, dept.dept_name
FROM emp LEFT JOIN dept ON emp.dept_id = dept.dept_id;

-- right OUTER JOIN
SELECT emp.emp_name, dept.dept_name
FROM emp RIGHT JOIN dept ON emp.dept_id = dept.dept_id;
-- FULL OUTER JOIN (UNION)
SELECT emp.emp_name, dept.dept_name
FROM emp LEFT JOIN dept ON emp.dept_id = dept.dept_id
UNION
SELECT emp.emp_name, dept.dept_name
FROM emp RIGHT JOIN dept ON emp.dept_id = dept.dept_id;
