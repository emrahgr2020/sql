/*
	SELECT - LIKE kosulu
	 LIKE : Sorgulama yaparken belirli kalip ifadeleri kullanabilmemizi saglar
	 ILIKE : Sorgulama yaparken buyuk/kucuk harfe duyarsiz olarak eslestirir
	 LIKE : ~~
	 ILIKE : ~~*
	 NOT LIKE : !~~
	 NOT ILIKE : !~~*
	 
	% --> 0 veya dahafazla karakteri belirtir
	_ --> Tek bir karakteri belirtir

*/

-- Ismi A harfi ile baslayan personeli listele
SELECT * FROM personel WHERE isim LIKE 'A%'; 

-- Ismi t harfi ile biten personeli listele
SELECT * FROM personel WHERE isim LIKE '%t';

-- isminin 2. harfi e olan personeli listeleyiniz 
SELECT * FROM personel WHERE isim LIKE '_e%'

-- 'a' ile başlayıp 'n' ile biten personel isimlerini listeleyiniz
select isim from personel WHERE isim ~~* 'a%n'              --CALISMADI!!!!!!

-- ikinci karakteri 'a' ve dördüncü karakteri 'u' olan personel isimlerini listeleyiniz
SELECT isim FROM personel WHERE isim LIKE '_a_u%'

-- İçinde 'e' ve 'r' bulunan personel isimlerini listeleyiniz
select isim from personel where isim ~~* '%e%' and isim ~~* '%r%'

-- 2. harfi e olup diğer harflerinde y olan personeli listeleyiniz
SELECT * FROM personel WHERE isim LIKE '_e%y%'

-- a harfi olmayan personeli listeleyin
SELECT * FROM personel WHERE isim NOT LIKE '%a%'

-- 1. harfi A ve 7. harfi a olan personeli listeleyin
select * from personel where isim ~~* 'A_____a%'

--Sondan ikinci karakteri 'r' olan "isim" değerlerini listeleyiniz.
SELECT isim FROM personel WHERE isim LIKE '%r_' 






