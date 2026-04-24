CREATE DATABASE Retail_Insights;
USE Retail_Insights;

DROP TABLE IF EXISTS SalesTransactions;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories (
    CategoryID INT NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(80) NOT NULL,
    Department VARCHAR(60) NOT NULL,
    PRIMARY KEY (CategoryID),
    UNIQUE (CategoryName)
) ENGINE=InnoDB;

CREATE TABLE Products (
    ProductID INT NOT NULL AUTO_INCREMENT,
    ProductName VARCHAR(120) NOT NULL,
    CategoryID INT NOT NULL,
    UnitPrice DECIMAL(8,2) NOT NULL,
    StockCount INT NOT NULL DEFAULT 0,
    ExpiryDate DATE NULL,
    AddedOn DATE NOT NULL DEFAULT (CURRENT_DATE),
    PRIMARY KEY (ProductID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    CHECK (UnitPrice > 0),
    CHECK (StockCount >= 0)
) ENGINE=InnoDB;

CREATE TABLE SalesTransactions (
    TransactionID INT NOT NULL AUTO_INCREMENT,
    ProductID INT NOT NULL,
    QuantitySold INT NOT NULL,
    SalePrice DECIMAL(8,2) NOT NULL,
    SaleDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    StoreLocation VARCHAR(80) NULL,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    CHECK (QuantitySold > 0),
    CHECK (SalePrice > 0)
) ENGINE=InnoDB;

INSERT INTO Categories (CategoryName, Department) VALUES
('Dairy & Eggs','Perishables'),
('Bakery','Perishables'),
('Fresh Produce','Perishables'),
('Beverages','Dry Goods'),
('Snacks & Confectionery','Dry Goods'),
('Frozen Foods','Frozen'),
('Personal Care','Non-Food'),
('Household Supplies','Non-Food');

INSERT INTO Products (ProductName, CategoryID, UnitPrice, StockCount, ExpiryDate, AddedOn) VALUES
('Full-Cream Milk 1L',1,1.85,120,DATE_ADD(CURDATE(), INTERVAL 3 DAY),DATE_SUB(CURDATE(), INTERVAL 10 DAY)),
('Greek Yoghurt 500g',1,2.40,85,DATE_ADD(CURDATE(), INTERVAL 5 DAY),DATE_SUB(CURDATE(), INTERVAL 8 DAY)),
('Cheddar Cheese Block 400g',1,4.99,60,DATE_ADD(CURDATE(), INTERVAL 6 DAY),DATE_SUB(CURDATE(), INTERVAL 15 DAY)),
('Organic Butter 250g',1,3.50,30,DATE_ADD(CURDATE(), INTERVAL 30 DAY),DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
('Free-Range Eggs (12pk)',1,3.20,95,DATE_ADD(CURDATE(), INTERVAL 2 DAY),DATE_SUB(CURDATE(), INTERVAL 12 DAY)),
('White Sandwich Bread',2,1.50,200,DATE_ADD(CURDATE(), INTERVAL 1 DAY),DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
('Multigrain Loaf',2,2.10,55,DATE_ADD(CURDATE(), INTERVAL 4 DAY),DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
('Croissants (4pk)',2,2.80,70,DATE_ADD(CURDATE(), INTERVAL 7 DAY),DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
('Blueberry Muffins (6pk)',2,3.30,40,DATE_ADD(CURDATE(), INTERVAL 2 DAY),DATE_SUB(CURDATE(), INTERVAL 4 DAY)),
('Bananas (per kg)',3,0.99,150,DATE_ADD(CURDATE(), INTERVAL 5 DAY),DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
('Roma Tomatoes 500g',3,1.60,90,DATE_ADD(CURDATE(), INTERVAL 3 DAY),DATE_SUB(CURDATE(), INTERVAL 3 DAY)),
('Baby Spinach 200g',3,2.20,65,DATE_ADD(CURDATE(), INTERVAL 6 DAY),DATE_SUB(CURDATE(), INTERVAL 2 DAY)),
('Seedless Grapes 500g',3,3.75,80,DATE_ADD(CURDATE(), INTERVAL 4 DAY),DATE_SUB(CURDATE(), INTERVAL 5 DAY)),
('Avocados (each)',3,1.20,45,DATE_ADD(CURDATE(), INTERVAL 7 DAY),DATE_SUB(CURDATE(), INTERVAL 1 DAY)),
('Orange Juice 2L',4,2.95,100,DATE_ADD(CURDATE(), INTERVAL 60 DAY),DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
('Sparkling Water 1.5L',4,1.10,200,NULL,DATE_SUB(CURDATE(), INTERVAL 20 DAY)),
('Energy Drink 250ml',4,1.75,75,DATE_ADD(CURDATE(), INTERVAL 180 DAY),DATE_SUB(CURDATE(), INTERVAL 15 DAY)),
('Green Tea 25 Bags',4,2.50,50,NULL,DATE_SUB(CURDATE(), INTERVAL 90 DAY)),
('Salted Potato Chips 150g',5,1.80,120,DATE_ADD(CURDATE(), INTERVAL 90 DAY),DATE_SUB(CURDATE(), INTERVAL 45 DAY)),
('Dark Chocolate Bar 100g',5,2.60,80,DATE_ADD(CURDATE(), INTERVAL 200 DAY),DATE_SUB(CURDATE(), INTERVAL 60 DAY)),
('Mixed Nuts 300g',5,5.40,35,NULL,DATE_SUB(CURDATE(), INTERVAL 70 DAY)),
('Gummy Bears 200g',5,1.90,110,DATE_ADD(CURDATE(), INTERVAL 120 DAY),DATE_SUB(CURDATE(), INTERVAL 80 DAY)),
('Frozen Peas 1kg',6,2.10,140,DATE_ADD(CURDATE(), INTERVAL 300 DAY),DATE_SUB(CURDATE(), INTERVAL 25 DAY)),
('Fish Fingers 400g',6,3.80,60,DATE_ADD(CURDATE(), INTERVAL 270 DAY),DATE_SUB(CURDATE(), INTERVAL 30 DAY)),
('Beef Burger Patties 4pk',6,5.50,45,DATE_ADD(CURDATE(), INTERVAL 240 DAY),DATE_SUB(CURDATE(), INTERVAL 35 DAY)),
('Shampoo 400ml',7,4.20,55,NULL,DATE_SUB(CURDATE(), INTERVAL 100 DAY)),
('Toothpaste 100g',7,1.95,90,NULL,DATE_SUB(CURDATE(), INTERVAL 110 DAY)),
('Dish-Washing Liquid 500ml',8,2.30,70,NULL,DATE_SUB(CURDATE(), INTERVAL 120 DAY)),
('Paper Towels (2pk)',8,3.10,160,NULL,DATE_SUB(CURDATE(), INTERVAL 130 DAY));

INSERT INTO SalesTransactions (ProductID, QuantitySold, SalePrice, SaleDate, StoreLocation) VALUES
(1,10,1.85,DATE_SUB(CURDATE(), INTERVAL 1 DAY),'Northside Branch'),
(1,8,1.85,DATE_SUB(CURDATE(), INTERVAL 5 DAY),'Southside Branch'),
(1,15,1.85,DATE_SUB(CURDATE(), INTERVAL 10 DAY),'Northside Branch'),
(2,6,2.40,DATE_SUB(CURDATE(), INTERVAL 3 DAY),'Central Store'),
(2,9,2.40,DATE_SUB(CURDATE(), INTERVAL 12 DAY),'Southside Branch'),
(3,5,4.99,DATE_SUB(CURDATE(), INTERVAL 7 DAY),'Central Store'),
(5,20,3.20,DATE_SUB(CURDATE(), INTERVAL 2 DAY),'Northside Branch'),
(5,18,3.20,DATE_SUB(CURDATE(), INTERVAL 9 DAY),'Southside Branch'),
(6,50,1.50,DATE_SUB(CURDATE(), INTERVAL 1 DAY),'Central Store'),
(6,45,1.50,DATE_SUB(CURDATE(), INTERVAL 3 DAY),'Northside Branch'),
(6,38,1.50,DATE_SUB(CURDATE(), INTERVAL 8 DAY),'Southside Branch'),
(6,30,1.50,DATE_SUB(CURDATE(), INTERVAL 15 DAY),'Central Store'),
(7,12,2.10,DATE_SUB(CURDATE(), INTERVAL 4 DAY),'Northside Branch'),
(10,30,0.99,DATE_SUB(CURDATE(), INTERVAL 2 DAY),'Southside Branch'),
(10,25,0.99,DATE_SUB(CURDATE(), INTERVAL 6 DAY),'Central Store'),
(10,40,0.99,DATE_SUB(CURDATE(), INTERVAL 14 DAY),'Northside Branch'),
(11,22,1.60,DATE_SUB(CURDATE(), INTERVAL 3 DAY),'Central Store'),
(15,18,2.95,DATE_SUB(CURDATE(), INTERVAL 5 DAY),'Southside Branch'),
(15,14,2.95,DATE_SUB(CURDATE(), INTERVAL 20 DAY),'Northside Branch'),
(17,35,1.75,DATE_SUB(CURDATE(), INTERVAL 2 DAY),'Central Store'),
(17,28,1.75,DATE_SUB(CURDATE(), INTERVAL 11 DAY),'Southside Branch'),
(19,25,1.80,DATE_SUB(CURDATE(), INTERVAL 6 DAY),'Northside Branch'),
(19,30,1.80,DATE_SUB(CURDATE(), INTERVAL 18 DAY),'Central Store'),
(23,20,2.10,DATE_SUB(CURDATE(), INTERVAL 7 DAY),'Central Store'),
(23,15,2.10,DATE_SUB(CURDATE(), INTERVAL 22 DAY),'Southside Branch'),
(24,12,3.80,DATE_SUB(CURDATE(), INTERVAL 10 DAY),'Northside Branch'),
(26,8,4.20,DATE_SUB(CURDATE(), INTERVAL 4 DAY),'Central Store'),
(29,22,3.10,DATE_SUB(CURDATE(), INTERVAL 8 DAY),'Southside Branch');

INSERT INTO SalesTransactions (ProductID, QuantitySold, SalePrice, SaleDate, StoreLocation) VALUES
(4,5,3.50,DATE_SUB(CURDATE(), INTERVAL 65 DAY),'Central Store'),
(9,8,3.30,DATE_SUB(CURDATE(), INTERVAL 75 DAY),'Northside Branch'),
(21,3,5.40,DATE_SUB(CURDATE(), INTERVAL 80 DAY),'Southside Branch');

SELECT
p.ProductID,
p.ProductName,
c.CategoryName,
p.StockCount,
p.ExpiryDate,
DATEDIFF(p.ExpiryDate, CURDATE()) AS DaysUntilExpiry,
p.UnitPrice,
ROUND(p.StockCount * p.UnitPrice, 2) AS StockAtRiskValue
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.ExpiryDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
AND p.StockCount > 50
ORDER BY DaysUntilExpiry ASC, StockAtRiskValue DESC;

SELECT
p.ProductID,
p.ProductName,
c.CategoryName,
p.StockCount,
p.UnitPrice,
ROUND(p.StockCount * p.UnitPrice, 2) AS TiedUpCapital,
p.AddedOn
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
WHERE p.ProductID NOT IN (
SELECT DISTINCT ProductID
FROM SalesTransactions
WHERE SaleDate >= DATE_SUB(CURDATE(), INTERVAL 60 DAY)
)
AND p.StockCount > 0
ORDER BY TiedUpCapital DESC, p.ProductName ASC;

SELECT 
    c.CategoryName,
    c.Department,
    COUNT(st.TransactionID) AS TotalTransactions,
    SUM(st.QuantitySold) AS TotalUnitsSold,
    SUM(st.QuantitySold * st.SalePrice) AS TotalRevenue
FROM SalesTransactions st
JOIN Products p 
    ON st.ProductID = p.ProductID
JOIN Categories c 
    ON p.CategoryID = c.CategoryID
WHERE st.SaleDate >= DATE_FORMAT(DATE_SUB(CURDATE(), INTERVAL 1 MONTH), '%Y-%m-01')
  AND st.SaleDate < DATE_FORMAT(CURDATE(), '%Y-%m-01')
GROUP BY c.CategoryName, c.Department
ORDER BY TotalRevenue DESC;
