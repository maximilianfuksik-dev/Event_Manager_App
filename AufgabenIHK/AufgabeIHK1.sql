--AA
SELECT kundenNR FROM kunde 
    WHERE plz NOT BETWEEN 50000 bis 50999;

--AB

SELECT SUM(autragsposition.menge * artikel.preis)
FROM auftragsposition
JOIN artikel ON auftragsposition.ArtikelNR = artikel.artikel
WHERE AuftragNR = 3419;

--AC
SELECT kunde.KundenNR
FROM kunde 
JOIN auftrag ON kunde.KundenNR = auftrag.KundenNR 
JOIN auftragsposition ON auftrag.AuftragNR = auftragsposition.AuftragNR  
JOIN artikel ON auftragsposition.ArtikelNR = auftrag.ArtikelNR 
WHERE auftragsposition.ArtikelNR = 1234 AND auftrag.datum >= Today - 30; 

--AD 
SELECT kunde.KundenNR  
(
    SELECT COUNT(*)
    FROM auftrag
    JOIN kunde ON auftrag.KundenNR = kunde.KundenNR
    WHERE auftrag.KundenNR = kunde.KundenNR 
) AS AnzahlAuftraege 
FROM kunde
ORDER BY AnzahlAuftraege DESC,
kunde.KundenNR
Der Befehl zählt die Kundenaufträge nach DESC Ordnung 