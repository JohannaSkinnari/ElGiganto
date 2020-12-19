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





-- SELECT * FROM(
-- SELECT 
--     SUM(SaleCurrentMonth.Textil) AS 'Textil',
--     SUM(SaleCurrentMonth.Papper) AS 'Papper',
--     SUM(SaleCurrentMonth.Pärlor) AS 'Pärlor',
--     SUM(SaleCurrentMonth.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE (MONTH([Order].CreateDate) = MONTH(GETDATE())) 
--     AND YEAR([Order].CreateDate) = YEAR(GETDATE())) AS SaleCurrentMonth
-- UNION ALL
-- SELECT 
--     SUM(SaleLastMonth.Textil) AS 'Textil',
--     SUM(SaleLastMonth.Papper) AS 'Papper',
--     SUM(SaleLastMonth.Pärlor) AS 'Pärlor',
--     SUM(SaleLastMonth.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE DATEPART(MONTH, [Order].CreateDate) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE()))
--     AND DATEPART(YEAR, [Order].CreateDate) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()))) AS SaleLastMonth
-- UNION ALL
-- SELECT 
--     SUM(SaleLastYear.Textil) AS 'Textil',
--     SUM(SaleLastYear.Papper) AS 'Papper',
--     SUM(SaleLastYear.Pärlor) AS 'Pärlor',
--     SUM(SaleLastYear.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE [Order].CreateDate >= DATEADD(DAY, -365, GETDATE())) AS SaleLastYear
-- UNION ALL
-- SELECT 
--     SUM(ReturnCurrentMonth.Textil) AS 'Textil',
--     SUM(ReturnCurrentMonth.Papper) AS 'Papper',
--     SUM(ReturnCurrentMonth.Pärlor) AS 'Pärlor',
--     SUM(ReturnCurrentMonth.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE (MONTH([Order].CreateDate) = MONTH(GETDATE())) 
--     AND YEAR([Order].CreateDate) = YEAR(GETDATE())) AS ReturnCurrentMonth
-- UNION ALL
-- SELECT 
--     SUM(ReturnLastMonth.Textil) AS 'Textil',
--     SUM(ReturnLastMonth.Papper) AS 'Papper',
--     SUM(ReturnLastMonth.Pärlor) AS 'Pärlor',
--     SUM(ReturnLastMonth.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE DATEPART(MONTH, [Order].CreateDate) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE()))
--     AND DATEPART(YEAR, [Order].CreateDate) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()))) AS ReturnLastMonth
-- UNION ALL
-- SELECT 
--     SUM(ReturnLastYear.Textil) AS 'Textil',
--     SUM(ReturnLastYear.Papper) AS 'Papper',
--     SUM(ReturnLastYear.Pärlor) AS 'Pärlor',
--     SUM(ReturnLastYear.Pennor) AS 'Pennor'
-- FROM 
--    ( SELECT 
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Returned
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE [Order].CreateDate >= DATEADD(DAY, -365, GETDATE())) AS ReturnLastYear
-- ) AS SourceTable
-- PIVOT(
--     SUM(Product.CategoryId)
--     FOR CategoryId IN (
--         [SaleCurrentMonth],
--         [SaleLastMonth],
--         [SaleLastYear],
--         [ReturnCurrentMonth],
--         [ReturnLastMonth],
--         [ReturnLastYear]
        
--     )
-- ) AS PivotTable




-- SELECT 
--     [Period],
--     Textil,
--     Papper,
--     Pärlor,
--     Pennor
-- FROM(
-- SELECT 
--     'SaleCurrentMonth' AS Period,
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE (MONTH([Order].CreateDate) = MONTH(GETDATE())) 
--     AND YEAR([Order].CreateDate) = YEAR(GETDATE())
-- UNION ALL
-- SELECT 
--     'SaleLastMonth' AS Period,
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE DATEPART(MONTH, [Order].CreateDate) = DATEPART(MONTH, DATEADD(MONTH, -1, GETDATE()))
--     AND DATEPART(YEAR, [Order].CreateDate) = DATEPART(YEAR, DATEADD(MONTH, -1, GETDATE()))
-- UNION ALL
-- SELECT 
--     'SaleLastYear' AS Period,
--     CASE 
--         WHEN Product.CategoryId = 1 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Textil',
--     CASE 
--         WHEN Product.CategoryId = 2 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Papper',
--     CASE 
--         WHEN Product.CategoryId = 3 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pärlor',
--     CASE 
--         WHEN Product.CategoryId = 4 THEN OrderProduct.Quantity
--         ELSE 0
--         END AS 'Pennor'
-- FROM OrderProduct 
-- JOIN Product ON Product.Id = OrderProduct.ProductId
-- JOIN [Order] ON [Order].Id = OrderProduct.OrderId
-- WHERE [Order].CreateDate >= DATEADD(DAY, -365, GETDATE())) AS SaleTable 
-- PIVOT(
--     SUM(Textil)
--     FOR Period IN (
--         [SaleCurrentMonth],
--         [SaleLastMonth],
--         [SaleLastYear]
--         -- [ReturnCurrentMonth],
--         -- [ReturnLastMonth],
--         -- [ReturnLastYear]
        
--     )
-- ) AS PivotTable





