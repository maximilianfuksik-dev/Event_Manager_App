SELECT veranstaltung.titel; location.name 
FROM veranstaltung
JOIN location ON veranstaltung.location_id = location.id 
WHERE location.kapazitaet > (
    SELECT AVG(location.kapazitaet)
    FROM location
)