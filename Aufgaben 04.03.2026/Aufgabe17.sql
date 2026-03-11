SELECT location.name
FROM location
WHERE location.id NOT IN (
    SELECT veranstaltung.location_id
    FROM veranstaltung
    JOIN tournee ON veranstaltung.tournee_id = tournee.id
    WHere tournee.name = "Electronic Universe"

)