SELECT tournee.name,  
    AVG(location.kapazitaet) 
FROM tournee
    JOIN veranstaltung ON tournee_id = veranstaltung.tournee_id 
    JOIN location ON veranstaltung.location_id = location.id 
GROUP BY tournee.name 
HAVING AVG(location.kapazitaet) > 20000;