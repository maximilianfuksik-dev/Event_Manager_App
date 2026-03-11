SELECT COUNT(*)
FORM event_personal_einsatz
INNER JOIN mitarbeiter
ON event_personal_einsatz.mitarbeiter_id = mitarbeiter.id
INNER JOIN veranstaltung 
on event_personal_einsatz.veranstaltung_id = veranstaltung.id 
INNER JOIN tournee
on veranstaltung.tournee_id = veranstaltung.id
WHERE mit.berufsgruppe = "Security"
AND tournee.name = " Summer Beats 2026";