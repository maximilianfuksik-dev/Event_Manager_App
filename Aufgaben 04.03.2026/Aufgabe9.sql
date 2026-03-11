SELECT 
    tournee.name,
    COUNT(event_personal_einsatz.mitarbeiter_id) AS anzahl_einsaetze
FROM event_personal_einsatz
JOIN veranstaltung
ON event_personal_einsatz.veranstaltung_id = veranstaltung.id
JOIN tournee
ON veranstaltung.tournee_id = tournee.id
GROUP BY tournee.name;