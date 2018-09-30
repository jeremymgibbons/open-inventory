create database Inventory;

USE Inventory;
/*
Item table to hold all information specific to that item
*/
CREATE TABLE Item
    (ItemName VARCHAR (40) NOT NULL,
    ItemID VARCHAR (60) NOT NULL,
    TotalItems INT NOT NULL,
    Price DECIMAL (12,2) NOT NULL,
    ItemWeight DECIMAL (12,2) NOT NULL,
    ProductKey VARCHAR (60) NOT NULL,
    PrimaryCat VARCHAR (40) NOT NULL,
    SecondayCat VARCHAR (40) NOT NULL,
    Brand VARCHAR (40) NOT NULL,
    Manufacturer VARCHAR(40) NOT NULL,
    ItemStatus BIT DEFAULT 1,
    StorageLocation VARCHAR (60),
    OrderID VARCHAR (60) DEFAULT '0',
    UNIQUE (ItemID, ProductKey, OrderID),
    PRIMARY KEY(ItemID, ProductKey));
/*
Orders table to keep track of items being sold and other useful info
specific to that order
*/
CREATE TABLE Orders
    (OrderID VARCHAR (60) NOT NULL,
    OrderStatus BIT DEFAULT 1,
    TotalSold INT NOT NULL,
    TrackingNumber VARCHAR (60),
    DateSold DATE,
    ReceivingAddress VARCHAR (120) NOT NULL,
    CustomerID VARCHAR (60) NOT NULL,
    ProductKey VARCHAR (60) NOT NULL,
    UNIQUE (OrderID, CustomerID, ProductKey),
    PRIMARY KEY (OrderID, CustomerID),
    FOREIGN KEY (OrderID) REFERENCES Item (OrderID),
    FOREIGN KEY (ProductKey) REFERENCES Item (ProductKey));
/*
Main categories
*/
CREATE TABLE Category
    (CategoryID INT NOT NULL,
    CatName VARCHAR (40) NOT NULL,
    PRIMARY KEY (CategoryID));
/*
Junct table to hold many relationships between product and category
*/
CREATE TABLE ProductCategory
    (ItemID VARCHAR (60) NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (ItemID, CategoryID),
    FOREIGN KEY (ItemID) REFERENCES Item (ItemID),
    FOREIGN KEY (CategoryID) REFERENCES Category (CategoryID));

/*
Possible Tables to create: Customer, Users, SalesInfo, Seperate Address Table
*/
