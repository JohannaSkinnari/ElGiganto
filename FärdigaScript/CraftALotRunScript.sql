-- Kategorilista
-- Produktlista för kategori (endast produkter som är tillgängliga i lager)
-- ­ Sorteringsmetod Popularitet 
SELECT 'Kategorilista'
EXEC dbo.spProduct_ProductListByCategory @ProductCategoryId = 1;
GO 

-- Produktlista sökning
-- ­ Sökterm och få tillbaka det som matchar
-- ­ Kunna välja att endast få tillbaka de som är tillgängliga i lager
-- ­ Valbar sorteringsmetod (Popularitet, Pris eller Namn)
SELECT 'Produktlista sökning'
SELECT 'Alla som matchar, sorterat efter lägsta pris'
EXEC dbo.spProduct_ProduktListBySearch @Search = 'des', @OnlyInInventory = 0, @Name = 0, @PriceHigh = 0, @PriceLow = 1, @Popularity = 0;
GO
SELECT 'Endast tillgängliga i lager, sorterat efter högsta pris'
EXEC dbo.spProduct_ProduktListBySearch @Search = 'des', @OnlyInInventory = 1, @Name = 0, @PriceHigh = 1, @PriceLow = 0, @Popularity = 0;
SELECT 'Endast tillgängliga i lager, sorterat efter namn'
EXEC dbo.spProduct_ProduktListBySearch @Search = 'des', @OnlyInInventory = 1, @Name = 1, @PriceHigh = 0, @PriceLow = 0, @Popularity = 0;
SELECT 'Endast tillgängliga i lager, sorterat efter popularitet'
EXEC dbo.spProduct_ProduktListBySearch @Search = 'des', @OnlyInInventory = 1, @Name = 0, @PriceHigh = 0, @PriceLow = 0, @Popularity = 1;
GO

-- Produktdetaljer
-- ­ Tänk dig att denna skall ta fram alla detaljer om en specifik produkt
-- ­ Inklusive lagerstatus (i lager eller inte i lager)
-- ­ Öka populäritet med 1 varje gång någon begär produktdetaljer
SELECT 'Produktdetaljer'

EXEC dbo.spProduct_GetProductDetailes @ProductId = 1;
GO
SELECT 'Efter'
SELECT Id, Name, Popularity FROM Product WHERE Id = 1;


-- Visa varukorg
-- ­ Innehållet i varukorg listas
SELECT 'Visa varukorg'
EXEC dbo.spProduct_GetListOfProductsInCart @CartId = 1;
GO

-- Skapa en varukorg.
SELECT 'Skapa varukorg'
SELECT 'Före'
SELECT * FROM Cart;
EXEC dbo.spCart_CreateACart;
GO
SELECT 'Efter'
SELECT * FROM Cart;

-- Lägga i varukorg
-- ­ Om produkten finns i varukorgen ökas antalet,
-- annars läggs artikeln till
-- ­ Öka populäritet med 5 varje gång någon lägger i varukorgen
        -- använder den nyskapade kundkorgen
SELECT 'Lägga i varukorg'
SELECT 'Popularitet Före'
SELECT Id, Name, Popularity FROM Product WHERE Id IN(7, 1, 3, 10, 17);
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 7, @Quantity = 2;
GO
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
GO
SELECT 'Lägga i podukt som är 0 i lager'
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 1, @Quantity = 1;
GO
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
GO
SELECT 'Lägga i produkt som inte finns tillräckligt av'
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 3, @Quantity = 2;
GO
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
SELECT 'Lägga i andra produkter'
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 10, @Quantity = 2;
GO
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 17, @Quantity = 1;
GO
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
SELECT 'Lägga i produkt som redan finns'
EXEC dbo.spCart_AddToCart @CartId = 3, @ProductId = 7, @Quantity = 1;
GO
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
SELECT 'Popularitet Efter'
SELECT Id, Name, Popularity FROM Product WHERE Id IN(7, 1, 3, 10, 17);

-- Ta bort en produkt från varukorgen
SELECT 'Ta bort en produkt från varukorgen'
SELECT 'Före'
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;
EXEC dbo.spCartProduct_RemoveItem  @ProductId = 17, @CartId = 3;
GO
SELECT 'Efter'
SELECT * FROM CartProduct WHERE CartProduct.CartId = 3;


-- Skapa en kund
SELECT 'Skapa en kund'
EXEC dbo.spCustomer_CreateCustomer 'Liam', 'Wallin', 'Edeforsvägen', '23', '50778', 'Borås';
GO
SELECT * FROM Customer;

-- Checka ut varukorg
-- ­ En order med ordernummer skapas till kunden
-- ­ Artikeln reserveras i lager
-- ­ Öka populäritet med 10 varje gång någon checkar ut ordern
        -- Behöver ha skapat en ny kund om detta kundid ska funka.
SELECT 'Checka ut varukorg'
SELECT 'Före'
SELECT Id, Name, Popularity, Reserved FROM Product WHERE Id IN(7, 10);
EXEC dbo.spOrder_Checkout @CartId = 3,  @CustomerId = 6,  @OrderNr = '234569';
GO
SELECT 'Efter'
SELECT Id, Name, Popularity, Reserved FROM Product WHERE Id IN(7, 10);
SELECT * FROM [Order];
SELECT * FROM OrderProduct WHERE OrderProduct.OrderId = 16;

-- Leverera order
-- ­ Reservationen tas bort
-- ­ Lagersaldot sänks
-- ­ Lagertransaktion skapas
        -- 16 är den ordern som kommer ha skapats om man kört checkouten.
SELECT 'Leverera order'
SELECT 'Före'
SELECT Id, Name, Quantity, Reserved FROM Product WHERE Id IN(7, 10);
EXEC dbo.spProduct_ShipOrder @OrderId = 16;
GO
SELECT 'Efter'
SELECT Id, Name, Quantity, Reserved FROM Product WHERE Id IN(7, 10);
SELECT * FROM TransactionType;
SELECT * FROM [Transaction];

-- Justera lagret
-- ­ Lagersaldot justeras
-- ­ Lagertransaktion skapas
SELECT 'Inventering'
SELECT 'Före'
SELECT Id, Name, Quantity FROM Product WHERE Id = 6;
EXEC dbo.spProduct_TakeInventory  @ProductId =6, @Quantity = 10;
GO
SELECT 'Efter'
SELECT Id, Name, Quantity FROM Product WHERE Id = 6;
SELECT * FROM TransactionType;
SELECT * FROM [Transaction];

-- Returnera order
-- ­ Valbart om produkten skall läggas tillbaka i lagret
-- ­ Lagersaldot ökas
-- ­ Lagertransaktion skapas
-- ­ Markera på orderaden hur mycket som är returnerat
SELECT 'Returnera order'
SELECT 'Före'
SELECT Id, Name, Quantity FROM Product WHERE Id IN(7, 10);
EXEC dbo.spProduct_Return @OrderId = 16, @ProductId = 7, @Quantity = 1, @PutBack = 0
EXEC dbo.spProduct_Return @OrderId = 16, @ProductId = 10, @Quantity = 1, @PutBack = 1
SELECT 'Efter'
SELECT Id, Name, Quantity FROM Product WHERE Id IN(7, 10);
SELECT * FROM TransactionType;
SELECT * FROM [Transaction];
SELECT * FROM OrderProduct WHERE OrderProduct.OrderId = 16;


-- Popularitetsrapport
SELECT 'Popularitetsrapport'
SELECT * FROM dbo.PopStatistics(4);
GO

-- Returrapport
SELECT 'Returrapport'
SELECT * FROM dbo.ReturnStatistics(2);
GO

-- Kategorirapport
SELECT 'Kategorirapport'
SELECT * FROM  CategoryStatistics;
GO

