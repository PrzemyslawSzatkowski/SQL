
SELECT Postać.postać, Kanał.nazwa FROM Postać 
	JOIN Serial ON Postać.id_serialu=Serial.id_serialu 
	JOIN Kanał ON Serial.id_kanału=Kanał.id_kanału;

SELECT Serial.nazwa, COUNT(*) AS 'liczba zmarłych postaci w serialu' FROM Serial 
	JOIN Postać ON Serial.id_serialu=Postać.id_serialu 
	WHERE Postać.ginie='T' 
	GROUP BY Serial.nazwa, Postać.ginie;

SELECT Kanał.nazwa FROM Kanał 
	LEFT JOIN Serial ON Kanał.id_kanału=Serial.id_kanału 
	WHERE Serial.id_kanału IS NULL 
	ORDER BY Kanał.rok_powstania

SELECT Kanał.nazwa, AVG(Serial1.ocena) AS 'średnia ocen seriali z wyłączeniem najniższej' FROM Serial Serial1
	JOIN Kanał ON Kanał.id_kanału=Serial1.id_kanału 
	WHERE ocena!=
		(
		SELECT MIN(Serial2.ocena) FROM Serial Serial2 
		WHERE Serial1.id_kanału=Serial2.id_kanału
		)
	GROUP BY Kanał.nazwa

SELECT Serial.nazwa FROM Serial 
	WHERE Serial.rok_koniec IS NULL AND Serial.id_kanału IN 
		(
		SELECT Serial.id_kanału FROM Serial 
		WHERE Serial.id_serialu IN 
			(
			SELECT Serial.id_serialu FROM Serial WHERE 
			Serial.rok_koniec IS NULL
			) 
		GROUP BY Serial.id_kanału
		HAVING COUNT(*)=1
		)

SELECT Postać.postać FROM Postać 
	JOIN Serial ON Postać.id_serialu=Serial.id_serialu 
	WHERE Serial.id_serialu IN 
		(
		SELECT Serial.id_serialu FROM Serial 
		WHERE Serial.ocena=
			(
			SELECT MAX(Serial.ocena) FROM Serial
			)
		)

SELECT kanał.nazwa, Serial1.nazwa FROM Serial Serial1 
	JOIN kanał ON kanał.id_kanału=Serial1.id_kanału 
	WHERE ocena=
		(
		SELECT MAX(Serial2.ocena) FROM Serial Serial2 
		WHERE Serial1.id_kanału=Serial2.id_kanału
		)

SELECT K.nazwa, S.nazwa, S.rok_start,
		(
		SELECT COUNT(*) FROM Serial S2
		WHERE S2.rok_start <= S.rok_start AND S2.id_kanału = S.id_kanału
		) 'którym (według roku powstania) serialem na swoim kanale jest'
	FROM Kanał K, Serial S
	WHERE K.id_kanału=S.id_kanału AND S.rok_start-K.rok_powstania<20
	ORDER BY K.nazwa, S.rok_start;
