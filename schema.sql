-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/g4o5uY
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
DROP TABLE IF EXISTS diverted_flights;
DROP TABLE IF EXISTS cancelled_flights;
DROP TABLE IF EXISTS airports;

CREATE TABLE airports (
    "IATA_code" Text   NOT NULL,
    "name" Text   NOT NULL,
    "city" Text   NOT NULL,
    "state" Text   NOT NULL,
    "lat" float,
    "long" float,
    CONSTRAINT pk_airports PRIMARY KEY (
        "IATA_code"
     )
);

CREATE TABLE cancelled_flights (
	"index" Integer,
    "flight_number" Integer   NOT NULL,
    "year" Integer   NOT NULL,
    "month" Integer   NOT NULL,
    "day" Integer   NOT NULL,
    "dow" Text   NOT NULL,
    "airline" Text   NOT NULL,
    "tail_number" Text,
    "origin" Text   NOT NULL,
    "destination" Text   NOT NULL,
    "departure_time" Integer,
    "reason" Text   NOT NULL,
    CONSTRAINT pk_cancelled_flights PRIMARY KEY (
        "index"
     )
);

CREATE TABLE diverted_flights (
	"index" Integer,
    "flight_number" Integer   NOT NULL,
    "year" Integer   NOT NULL,
    "month" Integer   NOT NULL,
    "day" Integer   NOT NULL,
    "dow" Text   NOT NULL,
    "airline" Text   NOT NULL,
    "tail_number" Text,
    "origin" Text   NOT NULL,
    "destination" Text   NOT NULL,
    "departure_time" Integer,
    "arrival_time" Integer,
    CONSTRAINT pk_diverted_flights PRIMARY KEY (
        "index"
     )
);

ALTER TABLE cancelled_flights ADD CONSTRAINT fk_cancelled_flights_origin FOREIGN KEY("origin")
REFERENCES airports ("IATA_code");

ALTER TABLE cancelled_flights ADD CONSTRAINT fk_cancelled_flights_destination FOREIGN KEY("destination")
REFERENCES airports ("IATA_code");

ALTER TABLE diverted_flights ADD CONSTRAINT fk_diverted_flights_origin FOREIGN KEY("origin")
REFERENCES airports ("IATA_code");

ALTER TABLE diverted_flights ADD CONSTRAINT fk_diverted_flights_destination FOREIGN KEY(destination)
REFERENCES airports ("IATA_code");

