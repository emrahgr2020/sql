-- SELECT - SIMILAR TO -REGEX(Regular Expression) --
/*
	SIMILAR TO : Daha karmasik pattern ilesorgulama islemi icin SIMILAR TO kullanilabilir
	  sadece Postgre SQL  de kullanilir. Buyuk kucuk harff onemlidir
	  
	REGEX : Herhangi bir kod, metin icerisinde istenen yazi veya kod parcasinin aranip bulunmasini saglayan
	kendine ait bir soz dizimi olan bir yapidir. MySQL de(REGEXP_LIKE) olarak kullanilir.
	postgreSQL ' de "~" karakteri ile kullanilir.
*/
CREATE TABLE kelimeler
(
id int,
kelime VARCHAR(50),
harf_sayisi int
);

   INSERT INTO kelimeler VALUES (1001, 'hot', 3);
   INSERT INTO kelimeler VALUES (1002, 'hat', 3);
   INSERT INTO kelimeler VALUES (1003, 'hit', 3);
   INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
   INSERT INTO kelimeler VALUES (1005, 'hct', 3);
   INSERT INTO kelimeler VALUES (1006, 'adem', 4);
   INSERT INTO kelimeler VALUES (1007, 'selim', 5);
   INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
   INSERT INTO kelimeler VALUES (1009, 'hip', 3);
   INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
   INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
   INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
   INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
   INSERT INTO kelimeler VALUES (1014, 'haaat', 5);
   INSERT INTO kelimeler VALUES (1015, 'hooooot', 5);
   INSERT INTO kelimeler VALUES (1016, 'booooot', 5);
   INSERT INTO kelimeler VALUES (1017, 'bolooot', 5);

SELECT * FROM kelimeler

--  İçerisinde 'ot' veya 'at' bulunan kelimeleri listeleyiniz
--SIMILAR TO ILE 
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%(at|ot)';
--LIKE  ILE
SELECT * FROM kelimeler WHERE kelime ILIKE '%at%' OR kelime ILIKE '%ot%';
SELECT * FROM kelimeler WHERE kelime ~~* '%at%' OR kelime ~~* '%ot%';

--REGEX
SELECT * FROM kelimeler WHERE kelime ~* 'ot' OR kelime ~* 'at'

-- : 'ho' veya 'hi' ile başlayan kelimeleri listeleyeniz
--SIMILAR TO ILE 
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '(ho|hi)%';

--LIKE  ILE
SELECT * FROM kelimeler WHERE kelime ~~* 'ho%' OR kelime ~~*'hi%'

--REGEX ILE
SELECT * FROM kelimeler WHERE kelime ~* 'h[oi](.*)'  -- REGEX ' te ".(nokta) bir karakteri temsil eder"'
-- REGEX ' te ikinci karakter icin koseli parantex kullanilir'

--Sonu 't' veya 'm' ile bitenleri listeleyeniz
--SIMILAR TO ILE
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%t|%m';

--LIKE  ILE
SELECT * FROM kelimeler WHERE kelime ~~* '%t' OR kelime ~~*'%m'

--REGEX ILE
SELECT * FROM kelimeler WHERE kelime ~* '(.*)[tm]$' --$ karakteri bitisi gosterir 

-- h ile başlayıp t ile biten 3 harfli kelimeleri listeleyeniz
--SIMILAR TO ILE
SELECT * FROM kelimeler WHERE kelime SIMILAR TO 'h[a-z,A-Z,0-9]t';
--LIKE ILE
SELECT * FROM kelimeler WHERE kelime ~~* 'h_t';
--REGEX ILE
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-z,A-Z,0-9]t'

--İlk karakteri 'h', son karakteri 't' ve ikinci karakteri 'a'dan 'e'ye herhangi bir karakter olan “kelime" değerlerini çağırın.
--SIMILAR TO ILE
SELECT kelime FROM kelimeler WHERE kelime SIMILAR TO 'h[a-e](.*)%t';
--LIKE ILE
SELECT kelime FROM kelimeler WHERE kelime ~* 'h[a-e](.*)t' 
--REGEX ILE
select kelime from kelimeler where kelime ~* 'h[a-e](.*)t'

--İlk karakteri 's', 'a' veya 'y' olan "kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~ '^[say](.*)'  --^ baslangic'i temsil eder 

--Son karakteri 'm', 'a' veya 'f' olan "kelime" değerlerini çağırın.
SELECT * FROM kelimeler WHERE kelime ~'(.*)[maf]$'

--İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tüm bilgilerini sorgulayalım.
SELECT * FROM kelimeler WHERE kelime SIMILAR TO 'h[a|i]t';
REGEX ILE 
SELECT * FROM kelimeler WHERE kelime ~ '^h[a|i]t$'

--İlk harfi 'b' dan ‘s' ye bir karakter olan ve ikinci harfi herhangi bir karakter olup 
--üçüncü harfi ‘l' olan “kelime" değerlerini çağırın.
SELECT kelime FROM kelimeler WHERE kelime ~ '^[b-s].l(.*)'

--içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini listeleyiniz
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o][o]%'
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o]{2}%'  -- {} koseli parantezin icinde kac tane old belirtir 

--içerisinde en az 4 adet oooo barıdıran kelimelerin tüm bilgilerini listeleyiniz.
SELECT * FROM kelimeler WHERE kelime SIMILAR TO '%[o]{4}%'  

--'a', 's' yada 'y' ile başlayan VE 'm' yada 'f' ile biten "kelime" değerlerini çağırın.
select * from kelimeler where kelime ~ '^[asy](.*)[mf]$';






