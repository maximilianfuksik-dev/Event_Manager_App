
--Aufgabe 13 Lernplatform Teil SQL Befehle anderer Teil ist ERD 
CREATE TABLE Lieferant (
    ID INT PRIMARY KEY
);

CREATE TABLE Produkt (
    ID INT PRIMARY KEY
);

CREATE TABLE Produktgruppe (
    ID INT PRIMARY KEY
);

CREATE TABLE Vertreter (
    ID INT PRIMARY KEY
);

CREATE TABLE Provisionssatz (
    ID INT PRIMARY KEY
);
-- FK
CREATE TABLE Kunde (
    ID INT PRIMARY KEY,
    Vertreter_ID INT,
    FOREIGN KEY (Vertreter_ID) REFERENCES Vertreter(ID)
);

CREATE TABLE Auftrag (
    ID INT PRIMARY KEY,
    Kunde_ID INT,
    Provisionssatz_ID INT,
    FOREIGN KEY (Kunde_ID) REFERENCES Kunde(ID),
    FOREIGN KEY (Provisionssatz_ID) REFERENCES Provisionssatz(ID)
);
-- n:m
CREATE TABLE Lieferant_Produkt (
    Lieferant_ID INT,
    Produkt_ID INT,
    PRIMARY KEY (Lieferant_ID, Produkt_ID),
    FOREIGN KEY (Lieferant_ID) REFERENCES Lieferant(ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkt(ID)
);

CREATE TABLE Produkt_Produktgruppe (
    Produkt_ID INT,
    Produktgruppe_ID INT,
    PRIMARY KEY (Produkt_ID, Produktgruppe_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkt(ID),
    FOREIGN KEY (Produktgruppe_ID) REFERENCES Produktgruppe(ID)
);

CREATE TABLE Produkt_Auftrag (
    Produkt_ID INT,
    Auftrag_ID INT,
    PRIMARY KEY (Produkt_ID, Auftrag_ID),
    FOREIGN KEY (Produkt_ID) REFERENCES Produkt(ID),
    FOREIGN KEY (Auftrag_ID) REFERENCES Auftrag(ID)
);