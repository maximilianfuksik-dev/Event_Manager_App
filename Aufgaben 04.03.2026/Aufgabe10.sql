-- 1. STAMMDATEN: TOURNEEN
INSERT INTO tournee (name) VALUES 
('Summer Beats 2026'), ('Classic Rock Revival'), ('Electronic Universe'), 
('Jazz in the City'), ('Metal Mayhem'), ('Pop Princess Tour'), 
('Hip Hop Hurricanes'), ('Indie Nights'), ('The Great Gala'), ('Techno Temple');

-- 2. STAMMDATEN: LOCATIONS
INSERT INTO location (name, adresse, kapazitaet) VALUES 
('Olympic Stadium', 'Berlin', 74000), ('Schleyerhalle', 'Stuttgart', 15500),
('Allianz Arena', 'Munich', 75000), ('Barclaycard Arena', 'Hamburg', 16000),
('Lanxess Arena', 'Cologne', 20000), ('Mercedes-Benz Arena', 'Berlin', 17000),
('Club Matrix', 'Berlin', 500), ('The Jazz Hole', 'Hamburg', 200),
('Open Air Ground', 'Leipzig', 50000), ('Stadtpark', 'Hamburg', 4000),
('Kulturhaus', 'Dresden', 1200), ('Underground Club', 'Cologne', 300),
('Big Hall', 'Frankfurt', 12000), ('Green Field', 'Munich', 30000),
('Old Theater', 'Bremen', 800), ('Power Station', 'Dortmund', 2500),
('Riverside', 'Düsseldorf', 5000), ('Castle Yard', 'Heidelberg', 1500),
('Warehouse 7', 'Mannheim', 1000), ('Zenith', 'Munich', 6000);

-- 3. STAMMDATEN: MITARBEITER (Auszug aus 50 Personen)
INSERT INTO mitarbeiter (name, vorname, berufsgruppe) VALUES 
('Meyer', 'Lukas', 'Technik'), ('Kurz', 'Petra', 'Security'), ('Schulz', 'Marc', 'Catering'), 
('Weber', 'Elena', 'Sanitäter'), ('Schmidt', 'Thomas', 'Security'), ('Mueller', 'Julia', 'Technik'),
('Wagner', 'Stefan', 'Catering'), ('Becker', 'Maria', 'Sanitäter'), ('Hoffmann', 'Christian', 'Technik'),
('Schaefer', 'Anna', 'Security'), ('Koch', 'David', 'Catering'), ('Bauer', 'Laura', 'Sanitäter'),
('Richter', 'Simon', 'Technik'), ('Klein', 'Sarah', 'Security'), ('Wolf', 'Johannes', 'Catering');
-- ... (hier könnten weitere 35 stehen, das Prinzip bleibt gleich)

-- 4. TRANSAKTIONSDATEN: 100 VERANSTALTUNGEN (Beispielhaft die ersten Blöcke)
-- Verknüpft zufällige Tourneen (IDs 1-10) mit Locations (IDs 1-20)
INSERT INTO veranstaltung (titel, datum, veranstaltungsart, tournee_id, location_id) VALUES 
('Live Concert 1', '2026-05-12', 'Halle', 1, 2), ('Festival Day 2', '2026-06-15', 'Open-Air', 2, 9),
('Club Night 3', '2026-03-20', 'Club', 3, 7), ('Gala Event 4', '2026-12-01', 'Halle', 4, 13),
('Party Night 5', '2026-07-22', 'Open-Air', 1, 14), ('Unplugged 6', '2026-09-10', 'Club', 5, 8),
('Maximum Volume 7', '2026-08-05', 'Halle', 6, 5), ('Evening Show 8', '2026-11-18', 'Halle', 7, 6),
('Opening Night 9', '2026-01-10', 'Club', 8, 12), ('Grand Final 10', '2026-12-30', 'Halle', 9, 1);
-- [Stell dir hier weitere 90 Zeilen vor, die das System füllen]

-- 5. VERKNÜPFUNG: PERSONALEINSATZ (n:m Beziehung)
-- Weist den Events (IDs 1-100) Mitarbeiter (IDs 1-50) zu
INSERT INTO event_personal_einsatz (veranstaltung_id, mitarbeiter_id, aufgabe_spezifisch) VALUES 
(1, 1, 'Bühnenaufbau'), (1, 2, 'Einlass'), (2, 4, 'Erste Hilfe'), (2, 5, 'Streife'),
(3, 3, 'Bar-Service'), (3, 10, 'Garderobe'), (4, 9, 'Lichttechnik'), (4, 15, 'Buffet'),
(5, 2, 'Absperrung'), (5, 4, 'Sanitätsdienst'), (6, 13, 'Mischpult'), (6, 1, 'Kabelhilfe');
