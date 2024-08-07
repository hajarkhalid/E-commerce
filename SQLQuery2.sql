-- Create the database
CREATE DATABASE ecommerce; 

-- Select the database for use
USE ecommerce;

-- Create the Customers table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY,
    Firstname VARCHAR(250) NOT NULL,
    Lastname VARCHAR(250) NOT NULL,
    Email VARCHAR(250) NOT NULL,
    Password VARCHAR(250) NOT NULL,
    Date_of_birth DATE,
    Order_ID INT,
    Review_ID VARCHAR(250),
    TimeStamp DATETIME NOT NULL DEFAULT GETDATE()
);

-- Create the Country table
CREATE TABLE Country (
    Country_ID INT PRIMARY KEY,
    CountryName VARCHAR(250) NOT NULL
);

-- Create the LOCATION table
CREATE TABLE LOCATION (
    Address_ID VARCHAR(150) PRIMARY KEY,
    Country_ID INT,
    City VARCHAR(150) NOT NULL,
    State VARCHAR(150) NOT NULL,
    Postal_Code VARCHAR(10) NOT NULL,
    Region VARCHAR(250) NOT NULL,
    FOREIGN KEY (Country_ID) REFERENCES Country(Country_ID)
);

-- Create the Products table
CREATE TABLE Products (
    Product_ID INT PRIMARY KEY,
    Product_category VARCHAR(250) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    Image VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10, 2) DEFAULT 0.00,
    Quantity INT,
    Color VARCHAR(50)
);

-- Create the Supplier table
CREATE TABLE Supplier (
    Supplier_ID VARCHAR(250) PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    SupplierProduct_ID VARCHAR(250) NOT NULL
);

-- Create the Courier table
CREATE TABLE Courier (
    Courier_ID VARCHAR(250) PRIMARY KEY,
    Courier_name VARCHAR(250) NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Address_ID VARCHAR(250),
    Product_ID INT,
    Courier_ID VARCHAR(250),
    Discount DECIMAL(10, 2) NOT NULL,
    Profits DECIMAL(10, 2) NOT NULL,
    Tracking_ID VARCHAR(250) NOT NULL,
    OrderDate DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Address_ID) REFERENCES LOCATION(Address_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Courier_ID) REFERENCES Courier(Courier_ID)
);

-- Create the Reviews table
CREATE TABLE Reviews (
    Customer_ID INT NOT NULL,
    Order_ID INT NOT NULL,
    Review_ID VARCHAR(250) PRIMARY KEY,
    Rating INT NOT NULL,
    Product_ID INT,
    Courier_ID VARCHAR(250),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),
    FOREIGN KEY (Courier_ID) REFERENCES Courier(Courier_ID)
);

-- Create the Cart table
CREATE TABLE Cart (
    Customer_ID INT NOT NULL,
    Cart_ID INT PRIMARY KEY,
    Date DATE NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Create the Shopping_Cart table
CREATE TABLE Shopping_Cart (
    ShoppingCart_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Supplier_ID VARCHAR(250) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID)
);


DROP TABLE LOCATION;
-- Drop the Orders table if it exists
IF OBJECT_ID('Orders', 'U') IS NOT NULL
    DROP TABLE Orders;

-- Drop the Customers table if it exists
IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;

-- Drop the LOCATION table if it exists
IF OBJECT_ID('LOCATION', 'U') IS NOT NULL
    DROP TABLE LOCATION;

-- Drop the Products table if it exists
IF OBJECT_ID('Products', 'U') IS NOT NULL
    DROP TABLE Products;

-- Drop the Supplier table if it exists
IF OBJECT_ID('Supplier', 'U') IS NOT NULL
    DROP TABLE Supplier;

-- Drop the Supplier_Products table if it exists
IF OBJECT_ID('Supplier_Products', 'U') IS NOT NULL
    DROP TABLE Supplier_Products;

-- Drop the Courier table if it exists
IF OBJECT_ID('Courier', 'U') IS NOT NULL
    DROP TABLE Courier;

-- Drop the Supplier_Courier table if it exists
IF OBJECT_ID('Supplier_Courier', 'U') IS NOT NULL
    DROP TABLE Supplier_Courier;

-- Drop the Reviews table if it exists
IF OBJECT_ID('Reviews', 'U') IS NOT NULL
    DROP TABLE Reviews;

-- Drop the Cart table if it exists
IF OBJECT_ID('Cart', 'U') IS NOT NULL
    DROP TABLE Cart;

-- Drop the Shopping_Cart table if it exists
IF OBJECT_ID('Shopping_Cart', 'U') IS NOT NULL
    DROP TABLE Shopping_Cart;
	IF OBJECT_ID('Customers', 'U') IS NOT NULL
    DROP TABLE Customers;
IF OBJECT_ID('Country', 'U') IS NOT NULL
    DROP TABLE Country;
