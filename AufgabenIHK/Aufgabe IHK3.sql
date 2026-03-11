-- A
SELECT Ertag.anlagen_ID
FROM Ertag
INNER JOIN Anlage ON Ertag.anlagen_ID = Anlage.anlagen_ID
INNER JOIN SonnenStd ON Ertag.datum = SonnenStd.datum AND SonnenStd.plz = Anlage.plz
WHERE Ertag.datum = "11-11-2007" AND
Ertag.tagesertag < 0.8 * (SonnenStd.sonnenstunden * Anlage.maxertrag)

--B
SELECT Ertrag.anlagen_ID SUM(tagesertag)
FROM Ertrag
WHERE Ertrag.datum BETWEEN "01-10-2007" AND "31-10-2007"
ORDER BY Ertrag.anlagen_ID;

--C

SELECT Ertrag.anlagen_ID
FROM Ertrag
JOIN Anlage ON Ertrag.anlagen_ID = Anlage.anlagen_ID
WHERE Anlage.plz = "51491"
    AND Ertrag.datum = "2007-11-11"
    AND Ertrag.tagesertag < (
        SELECT AVG(Ertrag.tagesertag)
        FROM Ertrag
            JOIN Anlage ON Ertrag.anlagen_ID = Anlage.anlagen_ID
            WHERE Anlage.plz = "51491"
            AND Ertrag.datum = "2007-11-11"
    );

