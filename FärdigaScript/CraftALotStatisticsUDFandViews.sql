use ElGiganto35;
GO

-- Popularitetsrapport
-- ­ INPUT: KategoriId
-- ­ De 5 mest populära produkterna för vald kategori

CREATE OR ALTER FUNCTION dbo.PopStatistics (@CategoryId INT)
RETURNS TABLE
AS
RETURN
    SELECT TOP 5
        Category.Name AS Kategori,
        Product.ArticleNr AS ArtikelNr,
        Product.Name AS Namn,
        Product.Popularity AS Popularitet
    FROM Product
    JOIN Category ON Category.Id = Product.CategoryId
    WHERE Category.Id = @CategoryId
    ORDER BY Product.Popularity DESC
GO

SELECT * FROM dbo.PopStatistics(4);
GO

-- Returrapport
-- ­ INPUT: KategoriId
-- ­ De 5 mest returnerade produkterna för vald kategori
CREATE OR ALTER FUNCTION dbo.ReturnStatistics (@CategoryId INT)
RETURNS TABLE
AS
RETURN
    SELECT TOP 5
        Category.Name AS Kategori,
        Product.ArticleNr AS ArtikelNr,
        Product.Name AS Namn,
        SUM(OrderProduct.Returned) AS Retunerade
    FROM Product
    JOIN Category ON Category.Id = Product.CategoryId
    JOIN OrderProduct ON OrderProduct.ProductId = Product.Id
    WHERE Category.Id = @CategoryId
    GROUP BY Product.Name, Category.Name, Product.ArticleNr
    ORDER BY Retunerade DESC
GO

SELECT * FROM dbo.ReturnStatistics(2);
GO



-- Kategorirapport
-- (en rad per kategori)
-- ­ Sålt antal innevarande månad
-- ­ Sålt antal föregående månad
-- ­ Sålt antal senaste 365 dagarna
-- ­ Returnerat antal innevarande månad
-- ­ Returnerat antal föregående månad
-- ­ Returnerat antal senaste 365 dagarna

CREATE OR ALTER VIEW CategoryStatistics AS
SELECT 
    *
FROM(
SELECT 
    'FörsäljningNuvarandeMånad' AS Period, 
    Category.Name AS Kategori,
    SUM(OrderProduct.Quantity) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE (MONTH([Order].CreateDate) = MONTH(GETDATE())) 
    AND YEAR([Order].CreateDate) = YEAR(GETDATE())
GROUP BY Category.Name
UNION ALL
SELECT 
    'FörsäljningFörraMånaden' AS Period,
    Category.Name AS Kategori,
    SUM(OrderProduct.Quantity) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE DATEPART(MONTH, [Order].CreateDate) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE()))
    AND DATEPART(YEAR, [Order].CreateDate) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()))
GROUP BY Category.Name
UNION ALL
SELECT 
    'FörsäljningEttÅrBakåt' AS Period,
    Category.Name AS Kategori,
    SUM(OrderProduct.Quantity) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE [Order].CreateDate >= DATEADD(DAY, -365, GETDATE())
GROUP BY Category.Name
UNION ALL
SELECT 
    'RetuneratNuvarandeMånad' AS Period, 
    Category.Name AS Kategori,
    SUM(OrderProduct.Returned) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE (MONTH([Order].CreateDate) = MONTH(GETDATE())) 
    AND YEAR([Order].CreateDate) = YEAR(GETDATE())
GROUP BY Category.Name
UNION ALL
SELECT 
    'RetuneratFörraMånaden' AS Period,
    Category.Name AS Kategori,
    SUM(OrderProduct.Returned) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE DATEPART(MONTH, [Order].CreateDate) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE()))
    AND DATEPART(YEAR, [Order].CreateDate) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()))
GROUP BY Category.Name
UNION ALL
SELECT 
    'RetuneratEttÅrBakåt' AS Period,
    Category.Name AS Kategori,
    SUM(OrderProduct.Returned) AS Antal
FROM OrderProduct 
JOIN Product ON Product.Id = OrderProduct.ProductId
JOIN [Order] ON [Order].Id = OrderProduct.OrderId
JOIN Category ON Category.Id = Product.CategoryId
WHERE [Order].CreateDate >= DATEADD(DAY, -365, GETDATE())
GROUP BY Category.Name
) AS SaleSourceTable 
PIVOT(
    SUM(Antal)
    FOR Period IN (
        [FörsäljningNuvarandeMånad],
        [FörsäljningFörraMånaden],
        [FörsäljningEttÅrBakåt],
        [RetuneratNuvarandeMånad],
        [RetuneratFörraMånaden],
        [RetuneratEttÅrBakåt]  
    )
) AS SaleTable
GO


SELECT * FROM  CategoryStatistics;
GO

