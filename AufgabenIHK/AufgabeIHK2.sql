SELECT MARB.Personalnummer, 
        MARB.Name, 
        MARB.Vorname, 
        MARB.Geb-Dat     
FROM MARB
JOIN ZEITWIRTSCHAFT
ON MARB.Personalnummer = ZEITWIRTSCHAFT.Personalnummer
WHERE ZEITWIRTSCHAFT.Schichtmodell = "Vollkonti"
AND jahrDat(MARB.Ein)

-- Filter für bestimmtes Alter 
-- Ich brauch eine Berechnung des Alters 
-- Ich brauche eine Berechnung für ein anzahl zum bestimmten Datum 


--1.1 
SELECT COUNT(*)
FROM ZEITWIRTSCHAFT
WHERE Istzeit - Sollzeit >= 10;