import os
from main import main
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv

print("Starting the application...")

def main():
    print("start")


# -------------------------------------------------
# MENU
# -------------------------------------------------

def menu(connection):
    
    is_running = True
    while is_running:

        menu_board = """-------- Event Manager App ----

                1. Hauptmenu
                2. Alle Locations anzeigen
                3. Neue Location hinzufügen
                4. Suche nach großen Locations-Kapazitäten
                5. Kapazität einer Location aktualisieren
                6. Location entfernen
                7. Alle Tourneen anzeigen
                8. Neue Tournee hinzufügen
                9. Tournee entfernen
                10. Tournee einer Location zuweisen
                11. Tournee von einer Location entfernen
                12. Alle Tourneen einer Location anzeigen
                13. Statistik
                14. Programm beenden
                """

        print(menu_board)

        user_input = input("Bitte wählen Sie eine Option: ")

        match user_input:
            case "1":
                continue

            case "2":
                zeige_alle_locations(connection)

            case "3":
                add_location(connection)

            case "4":
                suche_große_location(connection)

            case "5":
                update_kapaziteat(connection)

            case "6":
                del_location(connection)

            case "7":
                zeige_alle_tourneen(connection)

            case "8":
                add_tournee(connection)

            case "9":
                del_tournee(connection)

            case "10":
                location_to_tournee(connection)

            case "11":
                del_location_to_tournee(connection)

            case "12":
                show_location_form_tournee(connection)

            case "13":
                statistik_ausgeben(connection)

            case "14":
                print("Good bye")
                is_running = False


# -------------------------------------------------
# ENVIRONMENT
# -------------------------------------------------

load_dotenv()
print("Loading environment variables...")


# -------------------------------------------------
# DATABASE CONNECTION
# -------------------------------------------------

def create_connection():
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST"),
            user=os.getenv("DB_USER"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME")
        )

        if connection.is_connected():
            return connection

    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None


print("Connection to MySQL database was successful!")


# -------------------------------------------------
# LOCATION FUNKTIONEN
# -------------------------------------------------

def zeige_alle_locations(connection):

    cursor = connection.cursor()
    sql_abfrage = "SELECT id, name, kapazitaet FROM location ORDER BY id ASC"

    try:
        print("Try in zeige alle Locations")
        cursor.execute(sql_abfrage)

        ergennisse = cursor.fetchall()

        for id, name, kapazitaet in ergennisse:
            print(f"ID: {id}, Name: {name}, Kapazität: {kapazitaet:>6}")

    except Error as e:
        print(f"Error executing query: {e}")

    finally:
        cursor.close()


print("Fetching all locations from the database...")


def suche_große_location(connection, mindest_grosse):

    cursor = connection.cursor()

    sql_abfrage = """
    SELECT name, kapazitaet
    FROM location
    WHERE kapazitaet >= %s
    ORDER BY kapazitaet DESC
    """

    try:
        cursor.execute(sql_abfrage, (mindest_grosse,))
        ergennisse = cursor.fetchall()

        for name, kapazitaet in ergennisse:
            print(f"Name: {name:<25}, Kapazität: {kapazitaet:>6}")

    except Error as e:
        print(f"Error executing query: {e}")

    finally:
        cursor.close()


def add_location(connection):

    try:
        cursor = connection.cursor()

        
        
        name = input("Name")
        adresse = input("Adresse")
        kapaziteat = input("Kapazität")

        sql_abfrage = """
        INSERT INTO location (name, adresse, kapazitaet)
        VALUES (%s, %s, %s)
        """
        daten = (name, adresse, int(kapaziteat))
        
        cursor.execute(sql_abfrage, daten)
        connection.commit()
        
        print(f"Erfolg: {name} wird mit der ID {cursor.lastrowid} gespeichert")

    except Error as e:
        connection.rollback()
        print(f"Fehelr beim Speichern: {e}")

    finally:
        cursor.close()


def del_location(connection):
    zeige_alle_locations(connection)
    try:
        cursor = connection.cursor()
        user_input_id = int(input("Bitte ID zum Löschen wählen: "))

        sql = "DELETE FROM location WHERE id = %s"
        
    
        cursor.execute(sql, (user_input_id,))
        connection.commit()
        print("Gelöscht")
    except Error as e:
        print(f"{e}")
    finally:
        cursor.close()
    


def update_kapaziteat():
    print("")


# -------------------------------------------------
# TOUREN FUNKTIONEN
# -------------------------------------------------

def zeige_alle_tourneen(connection):

    cursor = connection.cursor()
    sql_abfrage = "SELECT tournee.name FROM tournee ORDER BY tournee.name ASC"

    try:
        cursor.execute(sql_abfrage)
        ergennisse = cursor.fetchall()

        for (name) in ergennisse:
            print(f"NAME: {name}")

    except Error as e:
        print(f"Error executing query: {e}")
        return None

    finally:
        cursor.close()


print("Fetching all tournees from the database...")


def add_tournee(connection):

    try:
        
        name = input("Name")

        sql_abfrage = "INSERT INTO tournee (name) VALUES (%s)"
        
        
        cursor = connection.cursor()
        cursor.execute(sql_abfrage, (name,))
        
        connection.commit()
        

        print(f"Erfolg: {name} wird gespeichert")

    except Error as e:
        connection.rollback()
        print(f"Fehelr beim Speichern: {e}")

    finally:
        cursor.close()
        


def del_tournee(connection):
    
    
    #try:
        
    #except Error as e:
    print()


def tournee_zuweisen(connection):
    print()


def location_to_tournee(connection):
    print()


def del_location_to_tournee(connection):
    print()


def show_location_form_tournee(connection):
    print()


# -------------------------------------------------
# STATISTIK
# -------------------------------------------------

def statistik_ausgeben():
    print("")


# -------------------------------------------------
# PROGRAM START
# -------------------------------------------------

if __name__ == "__main__":

    connection = create_connection()

    if connection:
        print("Connection to MySQL database was successful!")
        menu(connection)
        connection.close()

print("Programm beendet.")