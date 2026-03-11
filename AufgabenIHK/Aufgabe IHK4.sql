--- Erstellen Sie eine SQL-Anweisung, mit der Sie das Ferienhaus mit der höchsten Auslas
-- tung (Anzahl Tage) erhalten.

--A
SELECT  Ferienhaus.Ferienhaus_ID, max(Mietvertag.Tage) AS MAX_TAGE
FROM Ferienhaus


--Erstellen Sie eine SQL-Anweisung, mit der Sie die Kunden erhalten, die für das laufende 
--Jahr noch nicht gebucht haben. 

--B 
SELECT Kunde_ID, Kunde_Name
FROM Mietvertrag
INNER JOIN Kunde ON Mietvertrag.Kunde_ID = Kunde_ID
WHERE YEAR(Mietvertrag.Beginn) != YEAR(CURDATE()) OR YEAR(Mietvertrag.Ende) != YEAR(CURDATE());

--Erstellen Sie eine SQL-Anweisung, mit der Sie alle Ferienhäuser mit Mängelanzeigen im 
--Verhältnis zu der Anzahl der Buchungen aufsteigend sortiert nach dem Verhältnis erhalten. 

--C
SELECT Ferienhaus_ID,
FROM Ferienhaus
ORDER BY  (SELECT COUNT(ID)
            FROM Meangelanzeige
            WHERE Meangelanzeige.Ferienhaus_ID = Ferienhaus.Ferienhaus_ID)
            /
           (SELECT COUNT(ID)
            FROM Mietvertrag
            WHERE Meangelanzeige.Ferienhaus_ID = Ferienhaus.Ferienhaus_ID)
ASC;

--Erstellen Sie eine SQL-Anweisung, mit der Sie eine Liste aller Ferienhaus-lDs nach Anzahl 
--der Vermietungstage absteigend sortiert erhalten.



--D
SELECT Mietvertrag.Ferienhaus_ID,
SUM(Mietvertrag.Tage) AS Vermietungstage
FROM Mietvertrag
GROUP BY Mietvertrag.Ferienhaus_ID
ORDER BY Vermietungstage DESC;

--Erstellen Sie eine SQL-Anweisung, mit der Sie alle Ferienhäuser, die eine unterdurch
--schnittliche Auslastung (unter 50 %) haben, nach Auslastung absteigend sortiert erhalten. 

--E
SELECT Mietvertrag.Ferienhaus_ID,
    SUM(Mietvertrag.Tage) AS Vermietungstage
    (SUM(Mietvertag.Tage) / 365) * 100 AS Auslastung
FROM Mietvertrag
GROUP BY Mietvertag.TFerienhaus_ID
HAVING (SUM(Mietvertrag.Tage /365) * 100 < 50 )
ORDER BY Auslastung DESC;


