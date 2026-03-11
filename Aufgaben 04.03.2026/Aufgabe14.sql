SELECT location.name, location.kapazitaet
FROM veranstaltung
INNER JOIN location
ON veranstaltung.location_id = location.id
INNER JOIN tournee 
ON veranstaltung.tournee_id = tournee.id
WHERE tournee.name = "Classic Rock Revival"
ORDER BY location.kapazitaet DESC LIMIT 1; 