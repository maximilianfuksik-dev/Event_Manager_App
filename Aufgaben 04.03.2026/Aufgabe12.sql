SELECT mitarbeiter.name,
        mitarbeiter.vorname 
FROM mitarbeiter
    LEFT JOIN event_personal_einsatzON mitarbeiter.id = event_personal_einsatz.mitarbeiter_id 
WHERE event_personal_einsatz.mitarbeiter_id IS NULL;