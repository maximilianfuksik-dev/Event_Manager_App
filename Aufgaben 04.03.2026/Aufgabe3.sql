SELECT tournee.name,
        veranstaltung.titel
FROM veranstaltung
INNER JOIN tournee ON veranstaltung.tournee_id = tournee.id
ORDER BY tournee.name ASC ;

-- Der Fokus liegt hier bei den Events daher holen wir "FROM"  veranstaltungen da diese Tabelle
-- mit Datensätzen im Mittelpunkt steht. 