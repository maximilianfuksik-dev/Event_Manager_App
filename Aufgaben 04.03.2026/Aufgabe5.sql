SELECT veranstaltung.titel,
        veranstaltung.datum,
        location.name
FROM veranstaltung
INNER JOIN location on veranstaltung.location_id = location.id
WHERE veranstaltungsart = "Club";
