 -- Table: passengers
CREATE TABLE passengers (
    id BIGINT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    country_of_citizenship VARCHAR(50),
    country_of_residence VARCHAR(50),
    passport_number VARCHAR(20),
    created_at TIMESTAMP)

-- Table: no_fly_list
CREATE TABLE no_fly_list (
    id BIGINT PRIMARY KEY,
    active_from DATE,
    active_to DATE,
    no_fly_reason VARCHAR(255),
    created_at TIMESTAMP,
    psngr_id BIGINT,
    FOREIGN KEY (psngr_id) REFERENCES passengers (id))

-- Table: security_check
CREATE TABLE security_check (
    id BIGINT PRIMARY KEY,
    check_result VARCHAR(20),
    comments VARCHAR(20),
    created_at TIMESTAMP,
    passenger_id BIGINT,
    FOREIGN KEY (passenger_id) REFERENCES passengers (id))

-- Table: booking
CREATE TABLE booking (
    bookingid BIGINT PRIMARY KEY,
    flight_id BIGINT,
    status VARCHAR(20),
    booking_platform VARCHAR(20),
    created_at TIMESTAMP,
    passenger_id BIGINT,
    FOREIGN KEY (flight_id) REFERENCES flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES passengers (id))

-- Table: baggage
CREATE TABLE baggage (
    id BIGINT PRIMARY KEY,
    weight_in_kg DECIMAL(4,2),
    created_date TIMESTAMP,
    booking_id BIGINT,
    FOREIGN KEY (booking_id) REFERENCES booking (bookingid))

-- Table: baggage_check
CREATE TABLE baggage_check (
    id BIGINT PRIMARY KEY,
    check_result VARCHAR(50),
    created_at TIMESTAMP,
    booking_id BIGINT,
    passenger_id BIGINT,
    FOREIGN KEY (booking_id) REFERENCES booking (bookingid),
    FOREIGN KEY (passenger_id) REFERENCES passengers (id))

-- Table: flights
CREATE TABLE flights (
    flight_id BIGINT PRIMARY KEY,
    departing_gate VARCHAR(20),
    arriving_gate VARCHAR(20),
    created_at TIMESTAMP,
    airline_id BIGINT,
    departing_airport_id BIGINT,
    arriving_airport_id BIGINT,
    FOREIGN KEY (airline_id) REFERENCES airline (id),
    FOREIGN KEY (departing_airport_id) REFERENCES airport (id),
    FOREIGN KEY (arriving_airport_id) REFERENCES airport (id))

-- Table: flight_manifest
CREATE TABLE flight_manifest (
    id BIGINT PRIMARY KEY,
    created_at TIMESTAMP,
    booking_id BIGINT,
    flight_id BIGINT,
    FOREIGN KEY (booking_id) REFERENCES booking (bookingid),
    FOREIGN KEY (flight_id) REFERENCES flights (flight_id))

-- Table: airport
CREATE TABLE airport (
    id BIGINT PRIMARY KEY,
    airport_name VARCHAR(50),
    country VARCHAR(50),
    state VARCHAR(50),
    created_at TIMESTAMP)

-- Table: airline
CREATE TABLE airline (
    id BIGINT PRIMARY KEY,
    airline_code VARCHAR(10),
    airline_name VARCHAR(50),
    airline_country VARCHAR(50),
    created_at TIMESTAMP)

-- Table: boarding_pass
CREATE TABLE boarding_pass (
    id BIGINT PRIMARY KEY,
    qr_code VARCHAR(20),
    created_at TIMESTAMP,
    booking_id BIGINT,
    FOREIGN KEY (booking_id) REFERENCES booking (bookingid))