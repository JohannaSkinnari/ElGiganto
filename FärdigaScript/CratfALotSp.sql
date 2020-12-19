use ElGiganto35;
GO

-- DROP PROCEDURE dbo.spProduct_ProductListByCategory;
-- GO 
-- DROP PROCEDURE dbo.spProduct_ProduktListBySearch;
-- GO 
-- DROP PROCEDURE dbo.spProduct_GetProductDetailes;
-- GO 
-- DROP PROCEDURE dbo.spProduct_GetListOfProductsInCart;
-- GO 
-- DROP PROCEDURE dbo.spCart_CreateACart;
-- GO 
-- DROP PROCEDURE dbo.spCart_AddToCart;
-- GO 
-- DROP PROCEDURE dbo.spCartProduct_RemoveEmptyItem;
-- GO 
-- DROP PROCEDURE dbo.spCustomer_CreateCustomer;
-- GO 
-- DROP PROCEDURE dbo.spOrder_Checkout;
-- GO 
-- DROP PROCEDURE dbo.spProduct_ShipOrder;
-- GO
-- DROP PROCEDURE dbo.spProduct_TakeInventory;
-- GO
-- DROP PROCEDURE dbo.spProduct_Return;
-- GO

-- Kategorilista
-- Produktlista för kategori (endast produkter som är tillgängliga i lager)
-- ­ Sorteringsmetod Popularitet 
CREATE OR ALTER PROCEDURE dbo.spProduct_ProductListByCategory
    @ProductCategoryId INT
AS
BEGIN
    SELECT 
        Product.Id AS ProduktId,
        Product.Name AS Namn, 
        Product.Price AS Pris
    FROM Product
    WHERE Product.CategoryId = @ProductCategoryId AND Product.Quantity != 0
    ORDER BY Popularity DESC
END
GO

EXEC dbo.spProduct_ProductListByCategory 1
GO 

-- Produktlista sökning
-- ­ Sökterm och få tillbaka det som matchar
-- ­ Kunna välja att endast få tillbaka de som är tillgängliga i lager
-- ­ Valbar sorteringsmetod (Popularitet, Pris eller Namn)
CREATE OR ALTER PROCEDURE dbo.spProduct_ProduktListBySearch
    @Search VARCHAR(50),
    @OnlyInInventory BIT = 0, 
    @Name BIT = 0,
    @PriceHigh BIT = 0,
    @PriceLow BIT = 0,
    @Popularity BIT = 0
AS
BEGIN
    IF @OnlyInInventory = 1
        BEGIN
            SELECT 
                Product.Id AS ProduktId,
                Product.Name AS Namn,
                Product.Price AS Pris
            FROM Product 
            WHERE 
                Product.Name LIKE '%' + @Search + '%'
                AND product.Quantity != 0 
            ORDER BY 
                CASE 
                    WHEN @Name = 1 THEN Product.Name
                END ASC,
                CASE
                    WHEN @PriceLow = 1 THEN Product.Price 
                END ASC,
                CASE
                    WHEN @PriceHigh = 1 THEN Product.Price 
                END DESC,
                CASE
                    WHEN @Popularity = 1 THEN Product.Popularity 
                END DESC
        END
    ELSE
        BEGIN
            SELECT 
                Product.Id AS ProduktId,
                Product.Name AS Namn,
                Product.Price AS Pris
            FROM Product 
            WHERE 
                Product.Name LIKE '%' + @Search + '%'
                AND product.Quantity >= 0 
            ORDER BY 
                CASE 
                    WHEN @Name = 1 THEN Product.Name
                END ASC,
                CASE
                    WHEN @PriceLow = 1 THEN Product.Price 
                END ASC,
                CASE
                    WHEN @PriceHigh = 1 THEN Product.Price 
                END DESC,
                CASE
                    WHEN @Popularity = 1 THEN Product.Popularity 
                END DESC
        END
END
GO

EXEC dbo.spProduct_ProduktListBySearch @Search = 'des', @OnlyInInventory = 0, @PriceHigh = 1
GO

-- Produktdetaljer
-- ­ Tänk dig att denna skall ta fram alla detaljer om en specifik produkt
-- ­ Inklusive lagerstatus (i lager eller inte i lager)
-- ­ Öka populäritet med 1 varje gång någon begär produktdetaljer
CREATE OR ALTER PROCEDURE dbo.spProduct_GetProductDetailes
    @ProductId INT
AS 
BEGIN
    SELECT 
        Product.Id AS ProduktId,
        Product.Name AS Namn,
        Product.Price AS Pris,
        Product.Info AS Info,
        Product.Popularity AS Popularitet,
        Product.ArticleNr AS ArtikelNr,
        Category.Name AS Kategori,
        Product.Quantity AS Antal,
        CASE
            WHEN Product.Quantity != 0 THEN 'Ja'
            WHEN Product.Quantity = 0 THEN 'Nej'
        END AS 'I Lager'
    FROM Product
    JOIN Category ON Category.Id = Product.CategoryId
    WHERE @ProductId = Product.Id

    UPDATE Product 
    SET Product.Popularity += 1
    WHERE Product.Id = @ProductId;

END 
GO

EXEC dbo.spProduct_GetProductDetailes 1
GO

-- Visa varukorg
-- ­ Innehållet i varukorg listas
CREATE OR ALTER PROCEDURE dbo.spProduct_GetListOfProductsInCart
    @CartId INT 
AS
BEGIN
SELECT 
    Product.Id AS ProduktId,
    Product.ArticleNr AS ArtikelNr,
    Product.Name AS Namn,
    Product.Price As Pris,
    CartProduct.ProductQuantity AS Antal
FROM Product
JOIN CartProduct ON CartProduct.ProductId = Product.Id
JOIN Cart ON Cart.Id = CartProduct.CartId
WHERE @CartId = Cart.Id 
END
GO

EXEC dbo.spProduct_GetListOfProductsInCart 1;
GO

-- Skapa en varukorg.
CREATE OR ALTER PROCEDURE dbo.spCart_CreateACart
AS
BEGIN
    INSERT INTO Cart DEFAULT VALUES;
END
GO

EXEC dbo.spCart_CreateACart;
GO

-- Lägga i varukorg
-- ­ Om produkten finns i varukorgen ökas antalet,
-- annars läggs artikeln till
-- ­ Öka populäritet med 5 varje gång någon lägger i varukorgen
CREATE OR ALTER PROCEDURE dbo.spCart_AddToCart
    @CartId INT,
    @ProductId INT,
    @Quantity INT
AS
BEGIN

    IF  @Quantity <= (SELECT Product.Quantity - Product.Reserved FROM Product WHERE @ProductId = Product.Id) AND @Quantity > 0
        BEGIN
            IF (SELECT COUNT(*) FROM CartProduct WHERE CartProduct.CartId = @CartId AND CartProduct.ProductId = @ProductId) > 0
                BEGIN
                    UPDATE CartProduct 
                    SET CartProduct.ProductQuantity = CartProduct.ProductQuantity + @Quantity
                    WHERE CartProduct.ProductId = @ProductId 
                    AND CartProduct.CartId = @CartId
                END
            ELSE 
                BEGIN
                    INSERT INTO CartProduct (CartId, ProductId, ProductQuantity)
                    VALUES (@CartId, @ProductId, @Quantity);
                END
            UPDATE Product 
            SET Product.Popularity += 5
            WHERE Product.Id = @ProductId;
        END
END
GO

EXEC dbo.spCart_AddToCart @CartId = 8, @ProductId = 4, @Quantity = 0;
GO


-- Ta bort en produkt från varukorgen
CREATE OR ALTER PROCEDURE dbo.spCartProduct_RemoveItem
    @ProductId INT,
    @CartId INT
AS
BEGIN
    DELETE CartProduct
    WHERE CartProduct.ProductId = @ProductId 
    AND CartProduct.CartId = @CartId;
END
GO

EXEC dbo.spCartProduct_RemoveItem 2, 8;
GO

-- Skapa en kund
CREATE OR ALTER PROCEDURE dbo.spCustomer_CreateCustomer
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @StreetName VARCHAR(50),
    @StreetNr VARCHAR(10),
    @ZipCode VARCHAR(10),
    @City VARCHAR(50),
    @TelNr VARCHAR(20) = NULL
AS
BEGIN
    INSERT INTO Customer (FirstName, LastName, StreetName, StreetNr, ZipCode, City, TelNr)
    VALUES (@FirstName, @LastName, @StreetName, @StreetNr, @ZipCode, @City, @TelNr);
END
GO

EXEC dbo.spCustomer_CreateCustomer 'Liam', 'Wallin', 'Edeforsvägen', '23', '50778', 'Borås'
GO

-- Checka ut varukorg
-- ­ En order med ordernummer skapas till kunden
-- ­ Artikeln reserveras i lager
-- ­ Öka populäritet med 10 varje gång någon checkar ut ordern
CREATE OR ALTER PROCEDURE dbo.spOrder_Checkout
    @CartId INT,
    @CustomerId INT,
    @OrderNr VARCHAR(30)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            INSERT INTO [Order] (CustromerId, OrderNr)
            VALUES (@CustomerId, @OrderNr);

            DECLARE @OrderId INT
            SET @OrderId = SCOPE_IDENTITY();

            INSERT INTO OrderProduct (ProductId, OrderId, Quantity, Price)
            SELECT 
                CartProduct.ProductId, 
                @OrderId, 
                CartProduct.ProductQuantity, 
                Product.Price
            FROM CartProduct
            JOIN Product ON Product.Id = CartProduct.ProductId
            WHERE @CartId = CartProduct.CartId 
            AND (Product.Quantity - Product.Reserved) >= CartProduct.ProductQuantity;

        -- reservera
            UPDATE Product 
            SET Product.Reserved +=  CartProduct.ProductQuantity
            FROM CartProduct
            JOIN Product ON Product.Id = CartProduct.ProductId
            WHERE @CartId = CartProduct.CartId
            AND (Product.Quantity - Product.Reserved) >= CartProduct.ProductQuantity;

        -- uppdatera pop
            UPDATE Product 
            SET Product.Popularity += 10
            FROM Product
            JOIN CartProduct ON Product.Id = CartProduct.ProductId
            WHERE @CartId = CartProduct.CartId;

        -- ta bort varukorg
            DELETE CartProduct
            WHERE @CartId = CartProduct.CartId;

            DELETE Cart 
            WHERE @CartId = Cart.Id; 

            IF ((SELECT COUNT(*)
            FROM OrderProduct
            WHERE OrderProduct.OrderId = @OrderId) = 0)
            BEGIN 
                DELETE [Order] 
                WHERE [Order].Id = @OrderId
            END

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'Tran Rolled back'
    END CATCH
END
GO

EXEC dbo.spOrder_Checkout 1, 3, '234569'
GO



-- Leverera order
-- ­ Reservationen tas bort
-- ­ Lagersaldot sänks
-- ­ Lagertransaktion skapas
CREATE OR ALTER PROCEDURE dbo.spProduct_ShipOrder
    @OrderId INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            UPDATE Product
            SET Product.Reserved -= OrderProduct.Quantity,
                Product.Quantity -= OrderProduct.Quantity
            FROM Product
            JOIN OrderProduct ON OrderProduct.ProductId = Product.Id
            WHERE @OrderId = OrderProduct.OrderId

            INSERT INTO [Transaction] (ProductId, TransactionTypeId, Quantity)
            SELECT 
                Product.Id,
                1,
                OrderProduct.Quantity
            FROM Product
            JOIN OrderProduct ON OrderProduct.ProductId = Product.Id
            WHERE @OrderId = OrderProduct.OrderId

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'Tran Rolled back'
    END CATCH
END
GO

EXEC dbo.spProduct_ShipOrder 16
GO

-- Justera lagret
-- ­ Lagersaldot justeras
-- ­ Lagertransaktion skapas
CREATE OR ALTER PROCEDURE dbo.spProduct_TakeInventory
    @ProductId INT,
    @Quantity INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            UPDATE Product
            SET Product.Quantity += @Quantity
            WHERE Product.Id = @ProductId;

            INSERT INTO [Transaction] (ProductId, TransactionTypeId, Quantity)
            VALUES (@ProductId, 3, @Quantity)

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'Tran Rolled back'
    END CATCH
END
GO

EXEC dbo.spProduct_TakeInventory 6, 10;
GO

-- Returnera order
-- ­ Valbart om produkten skall läggas tillbaka i lagret
-- ­ Lagersaldot ökas
-- ­ Lagertransaktion skapas
-- ­ Markera på orderaden hur mycket som är returnerat
CREATE OR ALTER PROCEDURE dbo.spProduct_Return
    @OrderId INT,
    @ProductId INT,
    @Quantity INT,
    @PutBack BIT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

            IF @PutBack = 1
                BEGIN
                    UPDATE Product
                    SET Product.Quantity += @Quantity
                    WHERE Product.Id = @ProductId;
                END
            INSERT INTO [Transaction] (ProductId, TransactionTypeId, Quantity)
            VALUES (@ProductId, 2, @Quantity);

            UPDATE OrderProduct
            SET OrderProduct.Returned += @Quantity
            WHERE OrderProduct.ProductId = @ProductId 
            AND OrderProduct.OrderId = @OrderId

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        PRINT 'Tran Rolled back'
    END CATCH
END
GO

EXEC dbo.spProduct_Return 25, 4, 1, 0


