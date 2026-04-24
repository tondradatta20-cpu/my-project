-- Database
CREATE DATABASE IF NOT EXISTS PUBSDB;
USE PUBSDB;

-- Drop Tables
DROP TABLE IF EXISTS TransactionsTbl, Item, CustomerAndSuppliers, 
TitleAuthor, Titles, Publishers, Authors;

-- Tables
CREATE TABLE Authors(
  au_id CHAR(6) PRIMARY KEY,
  au_fname VARCHAR(15) NOT NULL,
  au_lname VARCHAR(15) NOT NULL,
  city VARCHAR(12)
);

CREATE TABLE Publishers(
  pub_id CHAR(6) PRIMARY KEY,
  pub_name VARCHAR(30) NOT NULL,
  city VARCHAR(12)
);

CREATE TABLE Titles(
  title_id CHAR(6) PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  pub_id CHAR(6),
  royalty INT,
  FOREIGN KEY (pub_id) REFERENCES Publishers(pub_id)
);

CREATE TABLE TitleAuthor(
  au_id CHAR(6),
  title_id CHAR(6),
  PRIMARY KEY (au_id, title_id),
  FOREIGN KEY (au_id) REFERENCES Authors(au_id),
  FOREIGN KEY (title_id) REFERENCES Titles(title_id)
);

CREATE TABLE CustomerAndSuppliers(
  cusl_id CHAR(6) PRIMARY KEY CHECK (cusl_id LIKE 'C_____' OR cusl_id LIKE 'S_____'),
  cusl_fname CHAR(15) NOT NULL,
  cusl_lname VARCHAR(15),
  cusl_address TEXT,
  cusl_telno CHAR(12) CHECK (cusl_telno LIKE '___-________'),
  cusl_city CHAR(12) DEFAULT 'Rajshahi',
  sales_amnt DECIMAL(12,2) CHECK (sales_amnt >= 0),
  proc_amnt DECIMAL(12,2) CHECK (proc_amnt >= 0)
);

CREATE TABLE Item(
  item_id CHAR(6) PRIMARY KEY CHECK (item_id REGEXP '^P[0-9]{5}$'),
  item_name CHAR(12),
  item_category CHAR(10),
  item_price FLOAT CHECK (item_price >= 0),
  item_qoh INT CHECK (item_qoh >= 0),
  item_last_sold DATE
);
CREATE TABLE TransactionsTbl(
  tran_id CHAR(10) PRIMARY KEY CHECK (tran_id REGEXP '^T[0-9]{9}$'),
  item_id CHAR(6),
  cust_id CHAR(6),
  tran_type CHAR(1) CHECK (tran_type IN ('S','O')),
  tran_quantity INT CHECK (tran_quantity > 0),
  tran_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (item_id) REFERENCES Item(item_id),
  FOREIGN KEY (cust_id) REFERENCES CustomerAndSuppliers(cusl_id)
);

-- Insert Data
INSERT INTO Authors VALUES
('A00001','Iqbal','Hossain','Dhaka'),
('A00002','Rina','Khatun','Rajshahi'),
('A00003','Sami','Ahmed','Dhaka');

INSERT INTO Publishers VALUES
('P00001','Pearson','Dhaka'),
('P00002','Oxford','Rajshahi'),
('P00003','Cambridge','Chittagong');

INSERT INTO Titles VALUES
('T00001','Learning SQL','P00001',500),
('T00002','Advanced Java','P00002',700),
('T00003','Python Basics','P00003',600);

INSERT INTO TitleAuthor VALUES
('A00001','T00001'), ('A00002','T00002'), ('A00003','T00003');

INSERT INTO CustomerAndSuppliers VALUES
('C00001','Iqbal','Hossain','221/B Dhanmondi','017-00000000','Dhaka',0,0);

INSERT INTO Item VALUES
('P00001','Keyboard','Electrical',1200,10,'2026-02-15'),
('P00002','Mouse','Electrical',600,20,'2026-02-14'),
('P00003','Book','Books',350,15,'2026-02-13');

INSERT INTO TransactionsTbl VALUES
('T000000001','P00001','C00001','S',2,NOW()),
('T000000002','P00002','C00001','O',5,NOW()),
('T000000003','P00003','C00001','S',1,NOW());

-- Queries
-- Author + Title
SELECT t.title, a.au_fname, a.au_lname
FROM Authors a
JOIN TitleAuthor ta USING(au_id)
JOIN Titles t USING(title_id);

-- Author + Publisher
SELECT t.title, a.au_fname, a.au_lname, p.pub_name
FROM Authors a
JOIN TitleAuthor ta USING(au_id)
JOIN Titles t USING(title_id)
JOIN Publishers p USING(pub_id);

-- Same City
SELECT a.au_fname, a.au_lname, a.city, p.pub_name, p.city
FROM Authors a, Publishers p
WHERE a.city = p.city;

-- Max Royalty Author
SELECT a.au_fname, a.au_lname
FROM Authors a
JOIN TitleAuthor ta USING(au_id)
WHERE ta.title_id IN (
  SELECT title_id FROM Titles
  WHERE royalty = (SELECT MAX(royalty) FROM Titles)
);

-- Avg Royalty
SELECT * FROM Titles
WHERE royalty = (SELECT AVG(royalty) FROM Titles);

-- Item + Transactions
SELECT i.item_name, t.tran_type, t.tran_quantity, t.tran_date
FROM Item i
JOIN TransactionsTbl t USING(item_id);