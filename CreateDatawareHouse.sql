-- Crea la base de datos vacia
create database DWTailspinToys2025;

-- Utiliza la base de datos
use DWTailspinToys2025;

-- Crea la dimension de Producto
CREATE TABLE DimProducts (
    ProductKey INT PRIMARY KEY IDENTITY,
    ProductID INT NOT NULL,
    ProductSKU NVARCHAR(50) NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    ProductCategory NVARCHAR(50) NOT NULL,
    ItemGroup NVARCHAR(50) NOT NULL,
    SkillRequired NVARCHAR(50) NOT NULL,
    KitType NVARCHAR(50) NOT NULL,
    CurrentRow BIT DEFAULT 1,
    effective_date DATETIME DEFAULT GETDATE(),
    expiration_date DATETIME DEFAULT '9999-12-31'
);

-- Crea la dimension de Estado
CREATE TABLE DimStates (
    StateKey INT PRIMARY KEY IDENTITY,
    StateID INT NOT NULL,
    StateName NVARCHAR(50) NOT NULL,
    RegionName NVARCHAR(50) NOT NULL,
    TimeZone NVARCHAR(50) NOT NULL,
    CurrentRow BIT DEFAULT 1,
    effective_date DATETIME DEFAULT GETDATE(),
    expiration_date DATETIME DEFAULT '9999-12-31'
);


-- Crea la dimension de Fechas
CREATE TABLE DimDates (
    DateKey INT PRIMARY KEY IDENTITY,
    [Date] DATETIME NOT NULL,
    [Year] INT NOT NULL,
    [Month] INT NOT NULL,
    [Day] INT NOT NULL,
    [Week] INT NOT NULL,
);

-- Crea la tabla de hechos de Ventas
CREATE TABLE FactSales (
    SalesKey INT PRIMARY KEY IDENTITY,
    SalesID NVARCHAR(10) NOT NULL,
    ProductID INT NOT NULL,
    StateID INT NOT NULL,
    DateID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(18, 2) NOT NULL,
    Subtotal DECIMAL(18, 2) NOT NULL,
    DiscountAmount DECIMAL(18, 2) NOT NULL,
    Total DECIMAL(18, 2) NOT NULL,
    PromotionCode NVARCHAR(20) NOT NULL

    -- Llaves foráneas
    FOREIGN KEY (ProductID) REFERENCES DimProducts(ProductKey),
    FOREIGN KEY (StateID) REFERENCES DimStates(StateKey),
    FOREIGN KEY (DateID) REFERENCES DimDates(DateKey)
);
