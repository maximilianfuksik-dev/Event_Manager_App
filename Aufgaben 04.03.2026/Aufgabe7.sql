SELECT 
    mitarbeiter.name AS nachname,
    veranstaltung.titel AS veranstaltung,
    tournee.name AS tournee
FROM event_personal_einsatz
JOIN mitarbeiter
ON event_personal_einsatz.mitarbeiter_id = mitarbeiter.id
JOIN veranstaltung
ON event_personal_einsatz.veranstaltung_id = veranstaltung.id
JOIN tournee
ON veranstaltung.tournee_id = tournee.id;