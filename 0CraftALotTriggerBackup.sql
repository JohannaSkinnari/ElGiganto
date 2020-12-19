use ElGiganto35;
GO

DROP TRIGGER IF EXISTS TR_CartProduct_DeleteEmptyProducts;
GO

-- Ändra varukorg
-- ­ Om antalet är 0 tas artikeln bort ur varukorgen
CREATE OR ALTER TRIGGER TR_CartProduct_DeleteEmptyProducts
ON CartProduct
AFTER INSERT, UPDATE
AS
BEGIN
    DELETE CartProduct
    WHERE CartProduct.ProductQuantity = 0;
END
GO