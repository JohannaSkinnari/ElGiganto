use ElGiganto35;
GO

INSERT INTO Category (Name) 
VALUES ('Textil'), ('Papper'), ('Pärlor'), ('Pennor');


INSERT INTO Product (ArticleNr, CategoryId, Name, Price, Popularity, Quantity, Info)
VALUES  (306090, 1, 'Tyg 145cm Leo Pink', 130, 5, 0,'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Leo Pink'),
        (306093, 1, 'Tyg 145cm Zebra Black', 130, 10, 30, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Zebra Black'),
        (305881, 1, 'Tyg 145cm Folklore Red Fan', 50, 20, 1, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %.  Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Folklore Red Fan'),
        (306091, 1, 'Tyg 145cm Leo Orange', 129.90, 3, 30, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Leo Orange'),
        (305728, 1, 'Tyg 145 cm Kaleidoscope', 50, 20, 0, 'Tyg metervara, bomullstyg i bredd 145 cm. 100% bomull - 150g/m². Tvätt 40 °C. Krympmån 5-7 %. Samma mönster finns även som tygbit 50x70 cm i annan grupp. Vår unika design finns bara hos oss och i viss mån även hos våra återförsäljare. Pris per meter (säljs endast i hela meter). OBS: våra tygrullars maxlängd är 6 meter, mer än så går inte att beställa i ett stycke. Kaleidoscope'),
        (725031, 1, 'Juteväv 180 cm natur Juteväv, natur', 129.90, 50, 5,'Tvätt 40 °C. Krympmån 5–7 %. Ca 50 trådar per 10 cm. Pris per meter (endast hela meter). Bredd 180 cm'),
        (365238, 2, 'Designark Glitter röd', 25, 10, 10, 'Glittriga designark, med vacker lyster – perfekt för scrapbooking, kortmakeri, dekorationer m.m. 305x305 mm, ytvikt 216 g. Pris per ark. Notera att arken endast är glittriga på ena sidan. Glitter röd'),
        (365266, 2, 'Designark Hjort', 15, 25, 20, 'Designark, med jultema – enkelsidiga, 305x305 mm, ytvikt 230 g, syra- och ligninfritt. I serien finns sex ark med olika motiv och färger. Pris per ark. Hjort.'),
        (365264, 2, '40 designark 30x30 cm grön', 120, 5, 0, 'Paper Pad, mönstrade papper i block 30x30 cm, ytvikt 80 g. Dessa tunna papper kan t.ex. användas till omslag, origami, kortmakeri m.m. Block med 40 dubbelsidiga ark. 40 ark med grönt och mörkt tema.'),
        (680312, 2, 'Silkespapper 50x70 5st röd', 26.90, 10, 100, 'Silkespapper, 50x70 cm. Genomfärgat papper i hög kvalitet. Med silkespapper kan du göra fina dekorationer, kort, presentinslagningar m.m. Syrafritt, ytvikt 18 g. Röd 5 st.'),
        (670005, 2, 'Silkespapper 68 ark 17 färger', 129.90, 40, 50, 'Sats silkespapper, 50x70 cm. Genomfärgat silkespapper i hög kvalitet. Ytvikt 18 g. Syrafritt. 4 av varje: vit, ljusgul, gul, orange, röd, vinröd, rosa, cerise, ljuslila, lila, ljusblå, blå, turkos, vårgrön, grön, gråbrun och svart. Förpackning med 68 st.'),
        (661012, 2, 'Brevpapper A4 80 g', 49.90, 20, 37, 'Röd Brevpapper 50-pack, av vackert papper i A4-format (210x297 mm) med 80 grams ytvikt. Brevpapper kommer till sin fulla rätt när du ska skriva eleganta inbjudningskort, menyer, placeringskort, tackkort och liknande. Saker där orden kanske betyder mycket eller tillfällena är från de viktigare ögonblicken i livet. Förpackningen innehåller 50 ark. Röd, A4.'),
        (802344, 3, '150 klara bokstavspärlor', 60, 30, 5, 'Alphabet beads, pärlor i transparent akryl med tryckta bokstäver i vit relief. Att pärla är alltid kul – blanda hejvilt mellan olika sorters pärlor och gör ett statement eller skriv dina bästa vänners namn i ett armband eller halsband. Förpackningen innehåller 150 alfabetspärlor med bokstäverna A-Z. Pärlorna är 6 mm stora och hålet 1 mm.'),
        (580128, 3, 'Rocaillespärla 9/0 l.rosa tran', 40, 50, 1, 'Rocaillespärlor (9/0), av glas (preciosa), kallas även för seed beads. Dekorativa pärlor som finns i många läckra färger, vackra att använda både som accent till eller som dominerande material i halsband, armband, mobilsmycken m.m. Perfekta även för användning i pärlväv och dekorativa att brodera med på t.ex. kuddar och väskor. Pärlorna är tillverkade inom Europa enligt traditionell teknik som garanterar hög kvalitet, storlekens tolerans Ø 2.4-2.8 mm – men i vissa fall kan pärlor ned till Ø 2.2 mm påträffas . Hål ca 0,7 mm. Innehåll 30 g, ca 1 350 st. - Ljusrosa transparent'),
        (590019, 3, 'TOHO-pärlor 11/0 turkos lyster', 20, 45, 2, 'TOHO seed beads 11/0– från Japan är av absolut högsta kvalitet och är bland de vackraste, nättaste och mest färgstarka glaspärlorna du någonsin sett. TOHO:s cylinderformade Treasure-pärlor är 2,0-2,2 millimeter stora och försedda med ett hål på 0,8 millimeter, och har en väldigt hög regelbundenhet. Pärlornas enhetliga form och färg gör dem lätta att arbeta med samt uppnå goda resultat. Deras ringa storlek ställer en del krav på precision, men möjliggör ytterst detaljerad pärlsömnad / pärlarbete / pärlbroderi / pärlväv med vackra mjuka övergångar mellan färger, eller starka konstraster om man så önskar. Det går alldeles utmärkt att enbart arbeta med TOHO-pärlor för att skapa föremål med mjuk och flexibel yta, men de gör sig också väldigt väl som kontrast mellan andra sorters pärlor och detaljer. Pärlornas stora hål innebär även att man kan trä flera trådar genom samma hål – något som ger oanade möjligheter när det gäller mönster i flera lager eller för hållbarhetens skull. Förpackningen innehåller 3 gram pärlor. Turkos lyster.'),
        (311698, 3, 'Seed Bead Tube Kit 49p Rainbow', 249.90, 36, 20, 'Seed Bead Tube Kit, små fina rocaillespärlor av glas i olika storlekar och starka levande färger. Mycket bättre än så här blir det inte för någon som älskar att göra sina egna smycken. Förpackningen innehåller sju rör i varje färg (7x7 st) och storleken på rören är 8 cm, Ø 12 mm. Var och en av färgerna kommer i 7 olika storlekar: Rörform ca 2,1 mm (håldiameter ca 0,9 mm) 5 gram. Rörform ca 6 mm (håldiameter ca 0,8 mm) 4 gram. Runda 10/0 ca 2,3 mm (håldiameter ca 0,8 mm) 6 gram. Runda 8/0 ca 3 mm (håldiameter ca 1 mm) 6 gram. Runda 6/0 ca 3,6 mm (håldiameter ca 1,1 mm) 5 gram. Förpackning innehåller totalt 49 rör.'),
        (800040, 3, 'Lots Of Fun Bead kit 850 g', 299.90, 5, 98, 'Barnpärlor & förvaring, pärlor, pärlor och ännu fler pärlor i alla de fantastiska färger och former. Älskar du att skapa personliga halsband och armband så har du kommit helt rätt. I vår praktiska låda har vi valt ut en härlig mix som både matchar och spretar. Skapa din egen stil! Från 4 år.'),
        (802737, 3, 'Hama midi 1000 mix 69', 17.90, 50, 64, 'Rörpärlor midi, Ø 5 mm, längd 5 mm. Förpackning med ca 1 000 st. Från 5 år. Mixade pastellfärger, både genomfärgade och transparenta.'),
        (820071, 4, 'Gelpennor glitter m.m. 50-pack', 230, 5, 30, 'Gelpennor 50-pack, få allt att gnistra och lysa i 50 unika nyanser med olika effekt. Det här lekfulla setet får dotted- & bullet journals, teckningar, noteringar och målarböcker att leva upp. I setet finns en bred palett av pennor med glitter-, metallic-, neon- och pastellfärger – allt blir lite roligare med gelrollers!'),
        (652766, 4, 'Pennset med 100 pennor', 399.90, 15, 100, 'Color & Sketch Set, för den som tycker om att rita och färglägga har vi här samlat en kraftfull palett med massor av bas-, neon-, och metallicfärger. I setet ingår även de flesta grafit- och blyertspennor med varierande hårdhetsgrad som du kan tänkas behöva för skisser eller teckning med enbart blyerts / grafit. Oavsett om du älskar målarböcker, ritar porträtt, tecknar mode eller natur så kommer du ha stor glädje av det här setet. Eller så känner du någon som skulle ha det, i såfall har du hittat den perfekta presenten. Samtliga pennor är 17,5 cm långa. Setet kommer i ett robust förvaringsfodral med blixtlås där pennorna ligger i 4 lager.'),
        (652714, 4, 'Twin Brush pennor 8 st Pastel', 139, 10, 22, 'Twin Brush pennor, dubbelspetsiga pennor med fine tip i ena änden (1 mm) och penselspets i den andra. De här pennorna briljerar med sin mångsidighet och rika färger när du vill färglägga, teckna eller göra vackra tavlor och kort med brush lettering.'),
        (820079, 4, 'Gelpennor basic 0,5mm 12-pack', 109, 45, 30, 'Gelpennor Basic, 0,5 mm. Att skriva och färglägga med, för ljusa papper (några av färgerna syns även på mörkt papper). Längd 14 cm. Förvaras liggande när de inte används. Förpackning med 12 färger.'),
        (602323, 4, 'Pen set 2+2 st (svart)', 30, 44, 30, 'Pen set 2+2, pennor med svart bläck och vackra pennskal i metallic (rosé och silver). Två kulspetspennor och två gelpennor. Förpackning med 4 st.'),
        (652747, 4, 'Tuschpennor 0.5 grå 4-pack', 79.90, 10, 59, 'Drawing Pens grå, fin spets 0.5 mm. Fyra olika grå färgnyanser. Fineliners för detaljrika teckningar, perfekta till s.k. Bullet Journaling. Ljusäkta pigmentbläck, syrafria, vattenfasta, bleknar inte. Förpackning med 4 st.');

INSERT INTO Cart DEFAULT VALUES;
INSERT INTO Cart DEFAULT VALUES;

INSERT INTO CartProduct (ProductId, CartId, ProductQuantity)
VALUES (2, 1, 1),
       (3, 1, 1),
       (5, 2, 2),
       (7, 2, 3);

INSERT INTO TransactionType ([Type])
VALUES ('Levererad Order'), ('Retur'), ('Inventering');

-- 1
EXEC dbo.spCustomer_CreateCustomer 'Orson', 'Carte', 'Karlsängen', '84', '14041', 'Sorunda'
GO
-- 2
EXEC dbo.spCustomer_CreateCustomer 'Warren', 'Peace', 'Sörbylund', '65', '13590', 'Tyresö'
GO
-- 3
EXEC dbo.spCustomer_CreateCustomer 'Sara', 'Gustafsson', 'Handelslagarevägen', '27', '23044', 'Bunkeflostrand'
GO
-- 4
EXEC dbo.spCustomer_CreateCustomer 'Melina', 'Olsson', 'Gärdslösa', '55', '84058', 'Pilgrimstad'
GO
-- 5
EXEC dbo.spCustomer_CreateCustomer 'Loui', 'Dahl', 'Kläppinge', '76', '19063', 'Öresunsbro'
GO

-- lägg in 15 st
DECLARE @randomInt INT
SET @randomInt = FLOOR(RAND()*(365-1+1))+1;

DECLARE @randomCustomer INT
SET @randomCustomer = FLOOR(RAND()*(5-1+1))+1;

DECLARE @randomOrderNumber INT
SET @randomOrderNumber = FLOOR(RAND()*(999999-100000+1))+100000;

INSERT INTO [Order] (CreateDate, CustromerId, OrderNr)
VALUES (DATEADD(DAY, -@randomInt, GETDATE()), @randomCustomer, CAST(@randomOrderNumber AS varchar(6)));
-- INSERT INTO [Order] (CreateDate, CustromerId, OrderNr)
-- VALUES (DATEADD(DAY, -32, GETDATE()), @randomCustomer, CAST(@randomOrderNumber AS varchar(6)));

SELECT * FROM [Order];


DECLARE @randomProduct INT
SET @randomProduct = FLOOR(RAND()*(24-1+1))+1;

DECLARE @randomOrder INT
SET @randomOrder = FLOOR(RAND()*(15-1+1))+1;

DECLARE @randomQuantity INT
SET @randomQuantity = FLOOR(RAND()*(6-1+1))+1;

DECLARE @randomReturn INT
SET @randomReturn = FLOOR(RAND()*(5+1));

-- insert into OrderProduct (ProductId, OrderId, Quantity, Returned)
-- VALUES (@randomProduct, 6, @randomQuantity, @randomReturn)
insert into OrderProduct (ProductId, OrderId, Quantity, Returned)
VALUES (@randomProduct, @randomOrder, @randomQuantity, @randomReturn)

SELECT * FROM OrderProduct;

UPDATE OrderProduct 
SET OrderProduct.Price = Product.Price
FROM Product
JOIN OrderProduct ON OrderProduct.ProductId = Product.Id
WHERE OrderProduct.ProductId = Product.Id 

-- UPDATE OrderProduct SET OrderProduct.Returned = 1
-- WHERE OrderProduct.Id = 55

-- SELECT * FROM OrderProduct WHERE OrderProduct.Id = 55