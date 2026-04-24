-- Create database and use it
CREATE DATABASE IF NOT EXISTS pubs;
USE pubs;

-- Drop tables if exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS publishers;

-- =========================
-- Create Tables
-- =========================

CREATE TABLE publishers (
    pub_id VARCHAR(5) PRIMARY KEY,
    pub_name VARCHAR(50)
);

CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,
    title_name VARCHAR(50),
    price DECIMAL(6,2),
    pub_id VARCHAR(5)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    title_id VARCHAR(5),
    qty INT
);

-- =========================
-- Insert Data
-- =========================

INSERT INTO publishers VALUES
('P01','ABC Publications'),
('P02','XYZ Publications');

INSERT INTO titles VALUES
('T01','Database Systems',500,'P01'),
('T02','Networking Basics',300,'P01'),
('T03','AI Fundamentals',700,'P02');

INSERT INTO sales VALUES
(1,'T01',10),
(2,'T02',5),
(3,'T03',8),
(4,'T01',7);

-- =========================
-- 1. Show all records
-- =========================
SELECT * FROM titles;

-- =========================
-- 2. Show specific columns
-- =========================
SELECT title_name, price FROM titles;

-- =========================
-- 3. ORDER BY (Sorting)
-- =========================
SELECT * FROM titles
ORDER BY price DESC;

-- =========================
-- 4. Aggregate Function (SUM, AVG)
-- =========================
SELECT AVG(price) AS average_price FROM titles;

SELECT title_id, SUM(qty) AS total_sales
FROM sales
GROUP BY title_id;

-- =========================
-- 5. GROUP BY + JOIN
-- =========================
SELECT t.title_name, SUM(s.qty) AS total_sales
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title_name;

-- =========================
-- 6. HAVING (Group condition)
-- =========================
SELECT t.title_name, SUM(s.qty) AS total_sales
FROM titles t
JOIN sales s ON t.title_id = s.title_id
GROUP BY t.title_name
HAVING SUM(s.qty) > 10;

-- =========================
-- 7. Formatted String Output
-- =========================
SELECT 
    CONCAT(title_name, ' costs ', price, ' BDT') AS info
FROM titles;