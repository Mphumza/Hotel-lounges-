Create Database NewINFM_Db;
--using database NewINFM_Db;

Create table Category(
CategoryID int primary key not null,
CategoryName varchar(25) not null,
	
);

--Creation of tables in SQL

CREATE TABLE Suppliers (
	SupplierID INT not null,
	SupplierName VARCHAR(25) not null,
	Address VARCHAR(25) not null,
	City VARCHAR(25) not null,
	Province VARCHAR(25) not null,
	PostalCode Char(10) not null,
	Email VARCHAR(25) not null,
	Phone VARCHAR(10) not null,
	ContactPerson VARCHAR(255) not null,
	PRIMARY KEY (SupplierID)
);

CREATE TABLE Product (
	ProductID INT not null,
	ProductName VARCHAR(25) not null,
	ProductPrice DECIMAL(10, 2) not null,
	ProductDescription TEXT not null,
	ProductCount INT not null,CategoryID INT not null,
	SupplierID INT not null,
	PRIMARY KEY (ProductID),
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ProductCategory (
	CategoryID INT not null,
	ProductID INT not null,
	FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE "Order" (
	OrderID INT not null,
	UserID INT not null,
	CreateDate DATE,
	PRIMARY KEY (OrderID)
);

CREATE TABLE OrderDetail (
	ID INT not null,
	OrderID INT not null,
	UnitPrice DECIMAL(10, 2) not null,
	Quantity INT,
	PRIMARY KEY (ID),
	FOREIGN KEY (OrderID) REFERENCES "Order"(OrderID)
);

CREATE TABLE ProductSupplier (
	ProductID INT not null,
	SupplierID INT not null,
	Field VARCHAR(255) not null,
	PRIMARY KEY (ProductID, SupplierID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE CartDetail (
	ID INT not null,
	ProductID INT not null,
	ShoppingCartID INT not null,
	Quantity INT not null,
	Field VARCHAR(255) not null,
	PRIMARY KEY (ID)
);

CREATE TABLE ShoppingCart (
	ShoppingCartID INT not null,
	UserID INT not null,
	IsDeleted  BOOLEAN not null,
	PRIMARY KEY (ShoppingCartID),
	FOREIGN KEY (UserID) REFERENCES "Order" (UserID)
);

CREATE TABLE OrderStatus (
	StatusID INT not null,
	StatusIn VARCHAR(65) not null,
	PRIMARY KEY (StatusID)
);
-- Inserting random data into the Category table
INSERT INTO Category (CategoryName) VALUES
  ('Category 1'),
  ('Category 2'),
  ('Category 3'),
  ('Category 4'),
  ('');

-- Inserting random data into the ProductCategory table
-- Assuming that CategoryID and ProductID are valid IDs from other tables
INSERT INTO ProductCategory (CategoryID, ProductID) VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);

-- Inserting random data into the Suppliers table
INSERT INTO Suppliers (SupplierName, Address, City, Province, PostalCode, Email, Phone, ContactPerson) VALUES
  (' Mini', 'Disney', 'Durban', 'KZN', '2345', 'minenhle@example.com', '023-456-7890', 'Contact Person 1'),
  ('Siyanda', '456 Elm St', 'Durban', 'KZN', '3456', 'supplier2@example.com', '034-567-8901', 'Contact Person 2'),
  ('Nkanyiso', '789 Oak St', 'Durban', 'KZN', '4567', 'supplier3@example.com', '045-678-9012', 'Contact Person 3'),
  ('Nampumelelo','101 Pine St', 'Durban', 'KZN', '5678', 'supplier4@example.com', '056-789-0123', 'Contact Person 4'),
  ('Samuel', '202 Maple St', 'Durban', 'KZN', '6789', 'supplier5@example.com', '067-890-1234', 'Contact Person 5'),
  ('Sipho ', '303 Cedar St', 'Pretoria', 'KZN', '7890', 'supplier6@example.com', '078-901-2345', 'Contact Person 6'),
  ('Siyabonga', '424 Min Sr', 'Durban', 'KZN', '8901', 'supplier7@example.com', '089-012-3456', 'Contact Person 7'),
  ('Silelela', '533 Siy St', 'Durban', 'KZN', '9012', 'supplier8@example.com', '070-123-4567', 'Contact Person 8'),
  ('Simphe', '455 SDF St','Durban' ,'KZN', '0123', 'supplier9@example.com', '081-234-5678', 'Contact Person 9'),
  ('Sibeko', '43 KID St', 'Durban', 'KZN', '1234', 'supplier10@example.com', '062-345-6789', 'Contact Person 10');

-- Inserting random data into the Order table
-- Assuming UserID is a valid user ID from your application
INSERT INTO "Order" (UserID, CreateDate) VALUES
  (1, '2023-10-27'),
  (2, '2023-10-28'),
  (3, '2023-10-29'),
  (4, '2023-10-30'),
  (5, '2023-10-31'),
  (6, '2023-11-01'),
  (7, '2023-11-02'),
  (8, '2023-11-03'),
  (9, '2023-11-04'),
  (10, '2023-11-05');

-- Inserting random data into the OrderDetail table
-- Assuming OrderID refers to valid order IDs
INSERT INTO OrderDetail (OrderID, UnitPrice, Quantity) VALUES
  (1, 139.99, 5),
  (2, 294.99, 3),
  (3, 95.99, 10),
  (4, 49.99, 2),
  (5, 393.99, 4),
  (6, 145.99, 8),
  (7, 243.99, 6),
  (8, 753.99, 12),
  (9, 343.99, 2),
  (10, 224.99, 7);

-- Inserting random data into the Product table
-- Assuming CategoryID and SupplierID are valid IDs from other tables
INSERT INTO Product (ProductName, ProductPrice, ProductDescription, ProductCount, CategoryID, SupplierID) VALUES
  ('Soap', 39.99, 'Description 1', 100, 1, 1),
  ('Shampoo', 19.99, 'Description 2', 50, 2, 2),
  ('Washing Powder', 29.99, 'Description 3', 75, 3, 3),
  ('Tools', 49.99, 'Description 4', 30, 4, 4),
  ('Lays', 14.99, 'Description 5', 200, 5, 5),
  ('Water', 24.99, 'Description 6', 80, 6, 6),
  ('Pie', 9.99, 'Description 7', 150, 7, 7),
  ('Outlet', 54.99, 'Description 8', 40, 8, 8),
  ('Glove', 19.99, 'Description 9', 120, 9, 9),
  ('Shoe', 29.99, 'Description 10', 90, 10, 10);

-- Inserting random data into the ProductSupplier table
-- Assuming ProductID and SupplierID are valid IDs from other tables
 --INSERT INTO ProductSupplier ON DUPLICATE KEY UPDATE (ProductID, SupplierID, Field) VALUES
 -- (1, 1, 'Field 1'),
 -- (2, 2, 'Field 2'),
 -- (3, 3, 'Field 3'),
 -- (4, 4, 'Field 4'),
 -- (5, 5, 'Field 5'),
 -- (6, 6, 'Field 6'),
 -- (7, 7, 'Field 7'),
 -- (8, 8, 'Field 8'),
 -- (9, 9, 'Field 9'),
 -- (10, 10, 'Field 10');

-- Inserting random data into the CartDetail table
-- Assuming ProductID and ShoppingCartID are valid IDs from other tables
INSERT INTO CartDetail (ProductID, ShoppingCartID, Quantity, Field) VALUES
  (1, 1, 2, 'Cart Field 1'),
  (2, 2, 3, 'Cart Field 2'),
  (3, 3, 1, 'Cart Field 3'),
  (4, 4, 4, 'Cart Field 4'),
  (5, 5, 2, 'Cart Field 5'),
  (6, 6, 1, 'Cart Field 6'),
  (7, 7, 3, 'Cart Field 7'),
  (8, 8, 2, 'Cart Field 8'),
  (9, 9, 1, 'Cart Field 9'),
  (10, 10, 4, 'Cart Field 10');

-- Inserting random data into the ShoppingCart table
-- Assuming UserID refers to valid user IDs
INSERT INTO ShoppingCart (UserID, IsDeleted) VALUES
  (1, 0),
  (2, 0),
  (3, 0),
  (4, 0),
  (5, 0),
  (6, 0),
  (7, 0),
  (8, 0),
  (9, 0),
  (10, 0);

-- Inserting random data into the OrderStatus table
-- Assuming StatusID refers to valid status IDs
INSERT INTO OrderStatus (StatusID, StatusIn) VALUES
  (1, 'Status 1'),
  (2, 'Status 2'),
  (3, 'Status 3'),
  (4, 'Status 4'),
  (5, 'Status 5'),
  (6, 'Status 6'),
  (7, 'Status 7'),
  (8, 'Status 8'),
  (9, 'Status 9'),
  (10, 'Status 10');

