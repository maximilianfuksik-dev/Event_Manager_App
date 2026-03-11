-- Alle Daten die ich haben möchte mit Select auswählen 
SELECT veranstaltung.titel, 
        veranstaltung.datum,
        location.name,
        location.kapazitaet
FROM veranstaltung -- Tabel der ersten Datensätze 
INNER JOIN location ON veranstaltung.location_id = location.id; -- Verbindung schaffen für die andere Tabelle 
