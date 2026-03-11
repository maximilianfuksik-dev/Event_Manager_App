CREATE TABLE tournee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE location (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    adresse VARCHAR(255),
    kapazitaet INT
);

CREATE TABLE mitarbeiter (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    vorname VARCHAR(50),
    berufsgruppe ENUM('Security', 'Catering', 'Sanitäter', 'Technik')
);

-- Ebene 2: Die Veranstaltung (verknüpft Tournee und Location)
CREATE TABLE veranstaltung (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titel VARCHAR(100),
    datum DATE,
    veranstaltungsart ENUM('Open-Air', 'Halle', 'Club'),
    tournee_id INT,
    location_id INT,
    FOREIGN KEY (tournee_id) REFERENCES tournee(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

-- Ebene 3: Die n:m Verknüpfung für den Personaleinsatz
CREATE TABLE event_personal_einsatz (
    veranstaltung_id INT,
    mitarbeiter_id INT,
    aufgabe_spezifisch VARCHAR(100),
    PRIMARY KEY (veranstaltung_id, mitarbeiter_id),
    FOREIGN KEY (veranstaltung_id) REFERENCES veranstaltung(id),
    FOREIGN KEY (mitarbeiter_id) REFERENCES mitarbeiter(id)
);

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