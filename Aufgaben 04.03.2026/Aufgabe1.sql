SELECT aufgabe_spezifisch,
COUNT(mitarbeiter_id) AS anzahl_mitarbeiter
From event_personal_einsatz
GROUP BY aufgabe_spezifisch;


SELECT mitarbeiter.name,
        mitarbeiter.vorname,
        event_personal_einsatz.aufgabe_spezifisch
FROM mitarbeiter 
INNER JOIN event_personal_einsatz ON event_personal_einsatz.mitarbeiter_id =  mitarbeiter.id
