BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS `User` (
	`Username`	TEXT NOT NULL UNIQUE,
	`Password`	TEXT NOT NULL,
	`ClearanceLevel`	INTEGER CHECK(0 or 1),
	`UserEmail`	TEXT NOT NULL,
	PRIMARY KEY(`Username`)
);
CREATE TABLE IF NOT EXISTS `SubCategory` (
	`SubCategoryID`	INTEGER NOT NULL,
	`SubCategoryType`	TEXT NOT NULL,
	PRIMARY KEY(`SubCategoryID`)
);
CREATE TABLE IF NOT EXISTS `Product` (
	`ProductKey`	INTEGER NOT NULL,
	`ProductName`	TEXT NOT NULL,
	`ProductWeight`	INTEGER NOT NULL CHECK(ProductWeight > 0),
	`CategoryID`	INTEGER NOT NULL,
	`SubCategoryID`	INTEGER NOT NULL,
	FOREIGN KEY(`CategoryID`) REFERENCES `Category`(`CategoryID`),
	PRIMARY KEY(`ProductKey`),
	FOREIGN KEY(`SubCategoryID`) REFERENCES `SubCategory`(`SubCategoryID`)
);
CREATE TABLE IF NOT EXISTS `Order` (
	`OrderID`	INTEGER NOT NULL UNIQUE,
	`OrderStatus`	INTEGER NOT NULL DEFAULT 0,
	`TotalSale`	INTEGER DEFAULT 0 CHECK(TotalSale >= 0),
	`TrackingNumber`	INTEGER,
	`DateCreated`	NUMERIC,
	`DestinationAddress`	TEXT,
	PRIMARY KEY(`OrderID`)
);
CREATE TABLE IF NOT EXISTS `Item` (
	`ItemID`	INTEGER NOT NULL UNIQUE,
	`ProductKey`	INTEGER NOT NULL,
	`ItemStatus`	INTEGER NOT NULL DEFAULT 0,
	`OrderID`	INTEGER,
	PRIMARY KEY(`ItemID`),
	FOREIGN KEY(`ProductKey`) REFERENCES `Product`(`ProductKey`),
	FOREIGN KEY(`OrderID`) REFERENCES `Order`(`OrderID`)
);
CREATE TABLE IF NOT EXISTS `Category` (
	`CategoryID`	INTEGER NOT NULL,
	`CategoryType`	TEXT NOT NULL,
	PRIMARY KEY(`CategoryID`)
);
COMMIT;
