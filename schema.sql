CREATE TABLE "airports" (
    "PK_IATA_code" varchar(255)   NOT NULL,
    "name" varchar(255)   NOT NULL,
    "city" varchar(255)   NOT NULL,
    "state" varchar(255)   NOT NULL,
    CONSTRAINT "pk_airports" PRIMARY KEY (
        "PK_IATA_code"
     )
);

CREATE TABLE "successful_flights" (
    "PK_index" Integer   NOT NULL,
    "flight_number" Integer   NOT NULL,
    "year" Integer   NOT NULL,
    "month" Integer   NOT NULL,
    "day" Integer   NOT NULL,
    "departure_time" Integer   NOT NULL,
    "tail_number" varchar(255),
    "FK_dow" Integer   NOT NULL,
    "FK_origin" varchar(255)   NOT NULL,
    "FK_destination" varchar(255)   NOT NULL,
    "FK_airline" varchar(255)   NOT NULL,
    CONSTRAINT "pk_successful_flights" PRIMARY KEY (
        "PK_index"
     )
);

CREATE TABLE "cancelled_flights" (
    "PK_index" Integer   NOT NULL,
    "flight_number" Integer   NOT NULL,
    "year" Integer   NOT NULL,
    "month" Integer   NOT NULL,
    "day" Integer   NOT NULL,
    "departure_time" Integer,
    "tail_number" varchar(255),
    "FK_dow" Integer   NOT NULL,
    "FK_origin" varchar(255)   NOT NULL,
    "FK_destination" varchar(255)   NOT NULL,
    "FK_airline" varchar(255)   NOT NULL,
    "FK_cancellation_code" varchar(255)   NOT NULL,
    CONSTRAINT "pk_cancelled_flights" PRIMARY KEY (
        "PK_index"
     )
);

CREATE TABLE "diverted_flights" (
    "PK_index" Integer   NOT NULL,
    "flight_number" Integer   NOT NULL,
    "year" Integer   NOT NULL,
    "month" Integer   NOT NULL,
    "day" Integer   NOT NULL,
    "departure_time" Integer   NOT NULL,
    "tail_number" varchar(255),
    "FK_dow" Integer   NOT NULL,
    "FK_origin" varchar(255)   NOT NULL,
    "FK_destination" varchar(255)   NOT NULL,
    "FK_airline" varchar(255)   NOT NULL,
    CONSTRAINT "pk_diverted_flights" PRIMARY KEY (
        "PK_index","flight_number"
     )
);

CREATE TABLE "airlines" (
    "PK_IATA_code" Varchar(255)   NOT NULL,
    "airline_name" varchar(255)   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "PK_IATA_code"
     )
);

CREATE TABLE "cancellation_reason" (
    "PK_cancellation_code" Char   NOT NULL,
    "cancellation_reason" Varchar(255)   NOT NULL,
    CONSTRAINT "pk_cancellation_reason" PRIMARY KEY (
        "PK_cancellation_code"
     )
);

CREATE TABLE "day_of_the_week" (
    "PK_index" Integer   NOT NULL,
    "day" varchar(16)   NOT NULL,
    CONSTRAINT "pk_day_of_the_week" PRIMARY KEY (
        "PK_index"
     )
);

ALTER TABLE "successful_flights" ADD CONSTRAINT "fk_successful_flights_FK_dow" FOREIGN KEY("FK_dow")
REFERENCES "day_of_the_week" ("PK_index");

ALTER TABLE "successful_flights" ADD CONSTRAINT "fk_successful_flights_FK_origin" FOREIGN KEY("FK_origin")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "successful_flights" ADD CONSTRAINT "fk_successful_flights_FK_destination" FOREIGN KEY("FK_destination")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "successful_flights" ADD CONSTRAINT "fk_successful_flights_FK_airline" FOREIGN KEY("FK_airline")
REFERENCES "airlines" ("PK_IATA_code");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_FK_dow" FOREIGN KEY("FK_dow")
REFERENCES "day_of_the_week" ("PK_index");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_FK_origin" FOREIGN KEY("FK_origin")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_FK_destination" FOREIGN KEY("FK_destination")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_FK_airline" FOREIGN KEY("FK_airline")
REFERENCES "airlines" ("PK_IATA_code");

ALTER TABLE "cancelled_flights" ADD CONSTRAINT "fk_cancelled_flights_FK_cancellation_code" FOREIGN KEY("FK_cancellation_code")
REFERENCES "cancellation_reason" ("PK_cancellation_code");

ALTER TABLE "diverted_flights" ADD CONSTRAINT "fk_diverted_flights_FK_dow" FOREIGN KEY("FK_dow")
REFERENCES "day_of_the_week" ("PK_index");

ALTER TABLE "diverted_flights" ADD CONSTRAINT "fk_diverted_flights_FK_origin" FOREIGN KEY("FK_origin")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "diverted_flights" ADD CONSTRAINT "fk_diverted_flights_FK_destination" FOREIGN KEY("FK_destination")
REFERENCES "airports" ("PK_IATA_code");

ALTER TABLE "diverted_flights" ADD CONSTRAINT "fk_diverted_flights_FK_airline" FOREIGN KEY("FK_airline")
REFERENCES "airlines" ("PK_IATA_code");

