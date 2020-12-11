use ElGiganto35;
GO

INSERT INTO Category (Name) 
VALUES ('Textil'), ('Papper'), ('Pärlor'), ('Pennor');

SELECT * FROM Category;

INSERT INTO Product (ArticleNr, CategoryId, Name, Price, Popularity, Quantity, Info)
VALUES  (306090, 1, 'Tyg 145cm Leo Pink', 130, 5, 0,'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Leo Pink'),
        (306093, 1, 'Tyg 145cm Zebra Black', 130, 10, 30, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Zebra Black'),
        (305881, 1, 'Tyg 145cm Folklore Red Fan', 50, 20, 1, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %.  Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Folklore Red Fan'),
        (365238, 2, 'Designark Glitter röd', 25, 10, 10, 'Glittriga designark, med vacker lyster – perfekt för scrapbooking, kortmakeri, dekorationer m.m. 305x305 mm, ytvikt 216 g. Pris per ark. Notera att arken endast är glittriga på ena sidan. Glitter röd'),
        (365266, 2, 'Designark Hjort', 15, 25, 20, 'Designark, med jultema – enkelsidiga, 305x305 mm, ytvikt 230 g, syra- och ligninfritt. I serien finns sex ark med olika motiv och färger. Pris per ark. Hjort.'),
        (365264, 2, '40 designark 30x30 cm grön', 120, 5, 0, 'Paper Pad, mönstrade papper i block 30x30 cm, ytvikt 80 g. Dessa tunna papper kan t.ex. användas till omslag, origami, kortmakeri m.m. Block med 40 dubbelsidiga ark. 40 ark med grönt och mörkt tema.'),
        (802344, 3, '150 klara bokstavspärlor', 60, 30, 5, 'Alphabet beads, pärlor i transparent akryl med tryckta bokstäver i vit relief. Att pärla är alltid kul – blanda hejvilt mellan olika sorters pärlor och gör ett statement eller skriv dina bästa vänners namn i ett armband eller halsband. Förpackningen innehåller 150 alfabetspärlor med bokstäverna A-Z. Pärlorna är 6 mm stora och hålet 1 mm.'),
        (580128, 3, 'Rocaillespärla 9/0 l.rosa tran', 40, 50, 1, 'Rocaillespärlor (9/0), av glas (preciosa), kallas även för seed beads. Dekorativa pärlor som finns i många läckra färger, vackra att använda både som accent till eller som dominerande material i halsband, armband, mobilsmycken m.m. Perfekta även för användning i pärlväv och dekorativa att brodera med på t.ex. kuddar och väskor. Pärlorna är tillverkade inom Europa enligt traditionell teknik som garanterar hög kvalitet, storlekens tolerans Ø 2.4-2.8 mm – men i vissa fall kan pärlor ned till Ø 2.2 mm påträffas . Hål ca 0,7 mm. Innehåll 30 g, ca 1 350 st. - Ljusrosa transparent'),
        (590019, 3, 'TOHO-pärlor 11/0 turkos lyster', 20, 45, 2, 'TOHO seed beads 11/0– från Japan är av absolut högsta kvalitet och är bland de vackraste, nättaste och mest färgstarka glaspärlorna du någonsin sett. TOHO:s cylinderformade Treasure-pärlor är 2,0-2,2 millimeter stora och försedda med ett hål på 0,8 millimeter, och har en väldigt hög regelbundenhet. Pärlornas enhetliga form och färg gör dem lätta att arbeta med samt uppnå goda resultat. Deras ringa storlek ställer en del krav på precision, men möjliggör ytterst detaljerad pärlsömnad / pärlarbete / pärlbroderi / pärlväv med vackra mjuka övergångar mellan färger, eller starka konstraster om man så önskar. Det går alldeles utmärkt att enbart arbeta med TOHO-pärlor för att skapa föremål med mjuk och flexibel yta, men de gör sig också väldigt väl som kontrast mellan andra sorters pärlor och detaljer. Pärlornas stora hål innebär även att man kan trä flera trådar genom samma hål – något som ger oanade möjligheter när det gäller mönster i flera lager eller för hållbarhetens skull. Förpackningen innehåller 3 gram pärlor. Turkos lyster.'),
        (820071, 4, 'Gelpennor glitter m.m. 50-pack', 230, 5, 30, 'Gelpennor 50-pack, få allt att gnistra och lysa i 50 unika nyanser med olika effekt. Det här lekfulla setet får dotted- & bullet journals, teckningar, noteringar och målarböcker att leva upp. I setet finns en bred palett av pennor med glitter-, metallic-, neon- och pastellfärger – allt blir lite roligare med gelrollers!'),
        (652766, 4, 'Pennset med 100 pennor', 399, 15, 100, 'Color & Sketch Set, för den som tycker om att rita och färglägga har vi här samlat en kraftfull palett med massor av bas-, neon-, och metallicfärger. I setet ingår även de flesta grafit- och blyertspennor med varierande hårdhetsgrad som du kan tänkas behöva för skisser eller teckning med enbart blyerts / grafit. Oavsett om du älskar målarböcker, ritar porträtt, tecknar mode eller natur så kommer du ha stor glädje av det här setet. Eller så känner du någon som skulle ha det, i såfall har du hittat den perfekta presenten. Samtliga pennor är 17,5 cm långa. Setet kommer i ett robust förvaringsfodral med blixtlås där pennorna ligger i 4 lager.'),
        (652714, 4, 'Twin Brush pennor 8 st Pastel', 139, 10, 22, 'Twin Brush pennor, dubbelspetsiga pennor med fine tip i ena änden (1 mm) och penselspets i den andra. De här pennorna briljerar med sin mångsidighet och rika färger när du vill färglägga, teckna eller göra vackra tavlor och kort med brush lettering.');

SELECT * FROM Product
WHERE CategoryId = 1;
SELECT * FROM Product
WHERE CategoryId = 2;
SELECT * FROM Product
WHERE CategoryId = 3;
SELECT * FROM Product
WHERE CategoryId = 4;

-- INSERT INTO Customer (Name)
-- VALUES ('Guest'), ('Johanna'), ('Tom'), ('Julius');

-- SELECT * FROM Customer;

INSERT INTO Cart (Quantity)
VALUES (0);
INSERT INTO Cart (Quantity)
VALUES (0);
INSERT INTO CartProduct (ProductId, CartId, ProductQuantity)
VALUES (2, 1, 1);
UPDATE Cart SET Cart.Quantity = Cart.Quantity + 1
WHERE Cart.Id = 1;
-- UPDATE Cart SET Quantity = Quantity + 2;
INSERT INTO CartProduct (ProductId, CartId, ProductQuantity)
VALUES (3, 1, 1);
UPDATE Cart SET Cart.Quantity = Cart.Quantity + 1
WHERE Cart.Id = 1;
INSERT INTO CartProduct (ProductId, CartId, ProductQuantity)
VALUES (5, 2, 2);
UPDATE Cart SET Cart.Quantity = Cart.Quantity + 1
WHERE Cart.Id = 2;
INSERT INTO CartProduct (ProductId, CartId, ProductQuantity)
VALUES (7, 2, 3);
UPDATE Cart SET Cart.Quantity = Cart.Quantity + 1
WHERE Cart.Id = 2;
-- UPDATE CartProduct SET ProductQuantity = isNull(ProductQuantity,0) + 2
-- WHERE CartId = 1 AND ProductId = 3;

SELECT * FROM Cart;
SELECT * FROM CartProduct;
