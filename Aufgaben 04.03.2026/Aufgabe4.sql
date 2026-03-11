SELECT mitarbeiter.name, 
        mitarbeiter.vorname,
        mitarbeiter.berufsgruppe,
        event_personal_einsatz.aufgabe_spezifisch
FROM mitarbeiter
INNER JOIN event_personal_einsatz ON event_personal_einsatz.mitarbeiter_id =  mitarbeiter.id
WHERE mitarbeiter.berufsgruppe = "Technik";        