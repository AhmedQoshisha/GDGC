
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

INSERT INTO Customer (CustomerID, Name, Address, Email, PhoneNumber)
VALUES 
(1, 'John', '123 Main St', 'john@example.com', '1234567890'),
(2, 'peter', '456 Elm St', 'peter@example.com', '0987654321');

CREATE TABLE OrderTable (
    OrderID INT PRIMARY KEY,
    TotalAmount DECIMAL(10,2),
    OrderDate DATE,
    Status VARCHAR(50),
    CustomerID INT,
    OrderDetailsID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
);

INSERT INTO OrderTable (OrderID, TotalAmount, OrderDate, Status, CustomerID, OrderDetailsID)
VALUES 
(1, 150.75, '2023-05-10', 'Completed', 1, 101),
(2, 299.99, '2023-06-15', 'Pending', 2, 102);


CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    Category VARCHAR(50),
    Description NVARCHAR(200),
    Price DECIMAL(10,2),
    Name VARCHAR(100),
    OrderDetailsID INT
);

INSERT INTO Product (ProductID, Category, Description, Price, Name, OrderDetailsID)
VALUES 
(1, 'Electronics', 'Smartphone with 128GB storage', 599.99, 'Smartphone X', 101),
(2, 'Appliances', 'High-power vacuum cleaner', 199.99, 'Vacuum Cleaner Pro', 102);

CREATE TABLE Order_Product (
    ProductID INT,
    OrderID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES OrderTable(OrderID)
);

INSERT INTO Order_Product (ProductID, OrderID)
VALUES 
(1, 1),
(2, 2);


CREATE TABLE OrderDetails (
    OrderDetailsID INT PRIMARY KEY,
    Quantity INT,
    Price DECIMAL(10,2),
    Status VARCHAR(50)
);

INSERT INTO OrderDetails (OrderDetailsID, Quantity, Price, Status)
VALUES 
(101, 2, 599.99, 'Shipped'),
(102, 1, 199.99, 'Processing');


CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    ContactInfo VARCHAR(255),
    Name VARCHAR(100)
);

INSERT INTO Supplier (SupplierID, ContactInfo, Name)
VALUES 
(1, 'contact@supplier1.com', 'Tech Suppliers Inc.'),
(2, 'info@supplier2.com', 'Home Appliances Ltd.');

CREATE TABLE Product_Supplier (
    SupplierID INT,
    ProductID INT,
    PRIMARY KEY (SupplierID, ProductID),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Product_Supplier (SupplierID, ProductID)
VALUES 
(1, 1),
(2, 2);
--DDL

ALTER TABLE Product 
ADD Rating INT DEFAULT 0;

ALTER TABLE Product 
ALTER COLUMN Category SET DEFAULT 'new';

ALTER TABLE Product 
DROP COLUMN Rating;

DROP TABLE Users;

DROP DATABASE SocialMediaPlatform;

UPDATE TABLE OrderTable 
SET OrderDate = GETUTCDATE()
WHERE OrderID > 0;

DELETE FROM Product 
WHERE Name <> NULL ;
