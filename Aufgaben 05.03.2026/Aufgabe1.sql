SELECT tournee.name, 
ROUND(AVG(location.kapazitaet),0) -- ROUND als befehl für die nach kommata stellen.
FROM tournee
INNER JOIN veranstaltung ON tournee.id = veranstaltung.tournee_id
INNER JOIN location ON veranstaltung.location_id = location.id
GROUP BY tournee.name;
