SELECT veranstaltung.titel, 
        veranstaltung.datum,
        location.name
FROM veranstaltung
INNER JOIN location ON veranstaltung.location_id = location_id
WHERE adresse = "Stuttgart";