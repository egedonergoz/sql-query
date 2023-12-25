/* SELECT id, ad, soyad from yazarlar 

 SELECT * from yazarlar WHERE id=3 
 
 SELECT COUNT(*) AS 'yazar sayısı' from yazarlar 
 
 SELECT COUNT(*) AS 'Erkek yazar sayısı' FROM yazarlar WHERE cinsiyet='Erkek' 
 
 SELECT * FROM yazarlar 
 WHERE dogum_yili > 1950 
 AND dogum_yili < 1990
 AND cinsiyet='Erkek'    */
 
 /*
 SELECT DISTINCT dogum_yeri FROM yazarlar WHERE cinsiyet='Kız' 
 /* distinct tekrarlanan veriyi tek gösterir */ 
 /*
 SELECT * FROM yazarlar 
 where  dogum_yili < YEAR(CURDATE())-50 
 OR dogum_yeri ='Aydın'
 ORDER BY dogum_yeri desc, ad  
 /* order by sıralama yapar 
 desc eklenince tersten sıralar
  */
 /*
SELECT * FROM kitaplar 
WHERE sayfa_sayisi >= 300 
AND sayfa_sayisi <= 500
ORDER BY sayfa_sayisi
*/
/*
SELECT * FROM kitaplar 
where sayfa_sayisi between 300 AND 500  /* between değer AND değer 
AND yayinevi_id=2
ORDER BY sayfa_sayisi
*/

/*SELECT COUNT(*) FROM kitaplar
WHERE yayinevi_id = 5*/

/* SELECT *, IF(sayfa_sayisi>300, 'Kalın', 'İnce') AS kitap_kalinligi FROM kitaplar 


SELECT * , IF(dogum_yili>1990,'Genç','Yaşlı') AS yazar_yasi FROM yazarlar */

/*SELECT kitaplar.ad, sayfa_sayisi, yazar_id, yazarlar.ad as yazar FROM kitaplar

INNER JOIN yazarlar ON kitaplar.yazar_id = yazarlar.id*/


/*
SELECT k.ad, k.sayfa_sayisi, CONCAT(y.ad,' ',y.soyad) yazar FROM kitaplar k

INNER JOIN yazarlar y ON k.yazar_id = y.id */


/*
SELECT k.ad kitap_adi, t.ad tur_adi FROM kitaplar k

INNER JOIN kitap_tur kt ON kt.kitap_id = k.id
INNER JOIN turler t ON kt.tur_id = t.id

ORDER BY k.ad

*/


/*
SELECT CONCAT(y.ad, ' ', y.soyad) yazar, COUNT(*) kitap_sayisi FROM kitaplar k

INNER JOIN yazarlar y ON k.yazar_id =y.id

GROUP BY yazar_id

HAVING kitap_sayisi > 5
 
ORDER BY kitap_sayisi DESC , yazar 
*/

/*
SELECT t.ad,
COUNT(*) kitap_sayisi,
MIN(sayfa_sayisi) en_az_sayfa_sayisi, 
MAX(sayfa_sayisi) en_fazla_sayfa_sayisi,
AVG(sayfa_sayisi)  ortalama_sayfa_sayisi,
SUM(sayfa_sayisi) toplam_sayfa_sayisi

FROM kitaplar k

INNER JOIN kitap_tur kt 
	ON kt.kitap_id = k.id
INNER JOIN turler t  
	ON kt.tur_id= t.id

GROUP BY kt.tur_id

ORDER BY kitap_sayisi

*/


/*sayfa sayısı en fazla olan kitabın yayinevi id ve adı*/
/*
SELECT id, ad FROM yayinevleri 

WHERE id= (SELECT yayinevi_id FROM kitaplar
				ORDER BY sayfa_sayisi DESC 
				LIMIT 1)
*/

/* en genç erkek yazarın yazdığı kitaplar */

/*
SELECT id, ad FROM kitaplar
WHERE yazar_id= (SELECT id FROM yazarlar
						WHERE cinsiyet = 'Erkek'
						ORDER BY dogum_yili DESC, ad
						LIMIT 1)

/*Hatay'lı yazarların kitapları*/
/*
SELECT * FROM kitaplar
WHERE yazar_id IN (SELECT id FROM yazarlar 
			 			 WHERE dogum_yeri = 'Hatay')

*/

/*psikoloji alanında kitap yazan yazarlar*/
/*
SELECT id,ad,soyad FROM yazarlar

WHERE id IN (SELECT yazar_id FROM kitaplar k
					INNER JOIN kitap_tur kt ON k.id = kt.kitap_id
					WHERE kt.tur_id=(SELECT id FROM turler where ad="Psikoloji") )
 */

/* 
UPDATE yazarlar 
SET cinsiyet='E' 
WHERE cinsiyet='Erkek';

UPDATE yazarlar 
SET cinsiyet='K' 
WHERE cinsiyet='Kız';
*/

/*
 UPDATE kitaplar
SET sayfa_sayisi=sayfa_sayisi + 4
WHERE yayinevi_id= (SELECT id FROM yayinevleri WHERE ad='Can')
*/ 
 
 /*
 UPDATE kitaplar 
 SET puan= ROUND( RAND()*100)
 */
 
 /*Silme*/
 /*
 DELETE FROM kitaplar 
 WHERE puan < 5 
 */
 
 DELETE FROM yazarlar 
 WHERE ad="Maşuk" AND soyad="Çavdar"
 
 
 
 
 
 
 