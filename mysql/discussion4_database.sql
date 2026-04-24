-- 1. Create Database
CREATE DATABASE company;
USE company;

-- 2. Drop tables if already exist
DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Items;
DROP TABLE IF EXISTS CustomersAndSuppliers;

-- 3. Create Customers & Suppliers Table
CREATE TABLE CustomersAndSuppliers (
    cust_supp_id VARCHAR(6) PRIMARY KEY,
    name VARCHAR(50),
    sold_amnt DECIMAL(10,2) DEFAULT 0,
    proc_amnt DECIMAL(10,2) DEFAULT 0
);

-- 4. Create Items Table
CREATE TABLE Items (
    item_id VARCHAR(6) PRIMARY KEY,
    item_name VARCHAR(50),
    price DECIMAL(10,2)
);

-- 5. Create Transactions Table
CREATE TABLE Transactions (
    tran_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_supp_id VARCHAR(6),
    item_id VARCHAR(6),
    tran_amount DECIMAL(10,2),
    tran_type CHAR(1),
    FOREIGN KEY (cust_supp_id)
        REFERENCES CustomersAndSuppliers(cust_supp_id),
    FOREIGN KEY (item_id)
        REFERENCES Items(item_id)
);

-- 6. Create Trigger (Auto Update)
DELIMITER //

CREATE TRIGGER trg_update_customer_supplier
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    -- If Sales (S)
    IF NEW.tran_type = 'S' THEN
        UPDATE CustomersAndSuppliers
        SET sold_amnt = sold_amnt + NEW.tran_amount
        WHERE cust_supp_id = NEW.cust_supp_id;

    -- If Purchase (P)
    ELSEIF NEW.tran_type = 'P' THEN
        UPDATE CustomersAndSuppliers
        SET proc_amnt = proc_amnt + NEW.tran_amount
        WHERE cust_supp_id = NEW.cust_supp_id;
    END IF;
END //

DELIMITER ;

-- 7. Insert Initial Data (Customers)
INSERT INTO CustomersAndSuppliers VALUES
('C001', 'ABC Traders', 30000, 10000),
('C002', 'XYZ Suppliers', 250000, 20000);

-- 8. Insert Items
INSERT INTO Items VALUES
('I001', 'Laptop', 50000),
('I002', 'Mouse', 500);

-- 9. Insert Transactions
INSERT INTO Transactions (cust_supp_id, item_id, tran_amount, tran_type) VALUES
('C001', 'I001', 5000, 'S'),
('C002', 'I002', 10000, 'P');

-- 10. Show Results
SELECT * FROM CustomersAndSuppliers;
SELECT * FROM Items;
SELECT * FROM Transactions;