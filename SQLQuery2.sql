CREATE DATABASE KONTACT

CREATE TABLE Categories
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE BrandCategories
(
	Id INT IDENTITY PRIMARY KEY,
	CategoryId INT FOREIGN KEY(CategoryId) REFERENCES Categories(Id),
	BrandId INT FOREIGN KEY(BrandId) REFERENCES Brands(Id)
)

CREATE TABLE Brands
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL UNIQUE,
)

CREATE TABLE Products
(
	Id INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(50) NOT NULL UNIQUE,
	Price Decimal(18,2) NOT NULL,
	BrandId INT FOREIGN KEY(BrandId) REFERENCES Brands(Id)
)

Create TABLE Cart
(
	Id INT IDENTITY PRIMARY KEY,
	ProductName NVARCHAR(50),
	TotalPrice Decimal(18,2) NOT NULL,
	ProductId INT FOREIGN KEY(ProductId) REFERENCES Products(Id)
)

INSERT INTO Categories
VALUES
('Smartphones'),
('Laptopes'),
('Smart Watchs')


INSERT INTO Brands
VALUES
('Apple'),
('Samsung'),
('Xiaomi'),
('Huawei'),
('Lenovo')

INSERT INTO BrandCategories
VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(2,1),
(2,5),
(3,1),
(3,2),
(3,3),
(3,4)


INSERT INTO Products
VALUES
('iPhone 14 Pro',4619.99,1),
('Samsung Galaxy A13 DS',349.99,2),
('Xiaomi Redmi Note 11',389.99,3),
('Apple Watch 7',849.99,1),
('Samsung Watch 4',419.99,2),
('HUAWEI Watch FIT',159.99,4),
('Xiaomi Redmi watch 2 lite',128.99,3),
('HUAWEI Nova Y70',399.99,4),
('Apple Macbook Air13',3789.99,1),
('Noutbuk Lenovo Legion Y530',4059.99,5)


CREATE VIEW VW_GETCATEGORIES
AS
SELECT *  FROM Categories
	

CREATE VIEW VW_GETBRANDS
AS
SELECT *  FROM Brands

CREATE VIEW VW_GETPRODUCTS
AS
SELECT *  FROM Products

SELECT * FROM VW_GETCATEGORIES
SELECT * FROM VW_GETBRANDS
SELECT * FROM VW_GETPRODUCTS


SELECT * FROM Cart


CREATE PROCEDURE DeleteFromCart @ProductId INT
AS
DELETE FROM Cart 
WHERE ProductId=@ProductId


CREATE PROCEDURE AddToCart @ProductId INT
AS
INSERT INTO Cart(ProductName,TotalPrice,ProductId)
VALUES
(,Price,ProductId)


CREATE TRIGGER TRGGR_AFTERDELETE
ON Cart
AFTER DELETE
AS
SELECT * FROM Cart
