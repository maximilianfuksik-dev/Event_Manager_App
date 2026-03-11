SELECT 
    tournee.name,
    SUM(location.kapazitaet) AS gesamt_kapazitaet
FROM veranstaltung
JOIN tournee
ON veranstaltung.tournee_id = tournee.id
JOIN location
ON veranstaltung.location_id = location.id
GROUP BY tournee.name;