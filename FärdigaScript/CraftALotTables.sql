use ElGiganto35;
GO

DROP TABLE IF EXISTS [Transaction];
DROP TABLE IF EXISTS TransactionType;
DROP TABLE IF EXISTS OrderProduct;
DROP TABLE IF EXISTS [Order];
DROP TABLE IF EXISTS CartProduct;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Category;


CREATE TABLE Category(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50)
);

CREATE TABLE Product(
    Id INT PRIMARY KEY IDENTITY(1,1),
    CategoryId INT FOREIGN KEY REFERENCES Category(Id) NOT NULL,
    ArticleNr VARCHAR(20) UNIQUE NOT NULL,
    Name VARCHAR(50),
    Price DECIMAL(5,2),
    Info VARCHAR(2000),
    Popularity INT,
    Quantity INT,
    Reserved INT DEFAULT 0,
    -- Popularity och Quantity har en default på 0
);
ALTER TABLE Product
 ADD CONSTRAINT df_Popularity
 DEFAULT 0 FOR Popularity;
ALTER TABLE Product
 ADD CONSTRAINT df_Quantity
 DEFAULT 0 FOR Quantity;

CREATE TABLE Customer(
    Id INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    StreetName VARCHAR(50) NOT NULL,
    StreetNr VARCHAR(10) NOT NULL,
    ZipCode VARCHAR(10) NOT NULL,
    City VARCHAR(50) NOT NULL,
    TelNr VARCHAR(20)
);

CREATE TABLE [Order](
    Id INT PRIMARY KEY IDENTITY(1,1),
    CustromerId INT FOREIGN KEY REFERENCES Customer(Id),
    OrderNr VARCHAR(10) UNIQUE NOT NULL,
    CreateDate DATE 
    -- CREATEDATE HAR EN DEFAULT GETDATE()
);
 ALTER TABLE [Order]
 ADD CONSTRAINT df_CreateDate
 DEFAULT GETDATE() FOR CreateDate;

CREATE TABLE OrderProduct(
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT FOREIGN KEY REFERENCES Product(Id) NOT NULL,
    OrderId INT FOREIGN KEY REFERENCES [Order](Id) NOT NULL,
    Quantity INT,
    Price DECIMAL(5,2),
    Returned INT DEFAULT 0
);

CREATE TABLE Cart(
    Id INT PRIMARY KEY IDENTITY(1,1),
    CreatDate DATE DEFAULT GETDATE()
);

CREATE TABLE CartProduct(
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT FOREIGN KEY REFERENCES Product(Id),
    CartId INT FOREIGN KEY REFERENCES Cart(Id),
    ProductQuantity INT 
);

CREATE TABLE TransactionType(
    Id INT PRIMARY KEY IDENTITY(1,1),
    [Type] VARCHAR(50) NOT NULL   
);

CREATE TABLE [Transaction](
    Id INT PRIMARY KEY IDENTITY(1,1),
    ProductId INT FOREIGN KEY REFERENCES Product(Id) NOT NULL,
    TransactionTypeId INT FOREIGN KEY REFERENCES TransactionType(Id) NOT NULL,
    [Date] DATE DEFAULT GETDATE(),
    Quantity INT
);

SELECT * FROM [Transaction]


CREATE INDEX idx_ProductQuantity
ON Product (Quantity);
-- 
CREATE INDEX idx_ProductName
ON Product (Name);

CREATE INDEX idx_ProductCategoryId
ON Product (CategoryId);


CREATE INDEX idx_OrderCreateDate
ON [Order] (CreateDate);

CREATE INDEX idx_OrderCustomerId
ON [Order] (CustromerId);


CREATE INDEX idx_OrderProductProductId
ON OrderProduct (ProductId);

CREATE INDEX idx_OrderProductOrderId
ON OrderProduct (OrderId);


CREATE INDEX idx_CartProductProductId
ON CartProduct (ProductId);

CREATE INDEX idx_CartProductCartId
ON CartProduct (CartId);


CREATE INDEX idx_TransactionProductId
ON [Transaction] (ProductId);

CREATE INDEX idx_TransactionTransactionTypeId
ON [Transaction] (TransactionTypeId);

