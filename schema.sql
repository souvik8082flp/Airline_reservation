CREATE DATABASE IF NOT EXISTS airline_reservation;
use airline_reservation;
CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    iata_code CHAR(3) UNIQUE
);
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    origin_airport_id INT,
    destination_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    total_seats INT,
    FOREIGN KEY (origin_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (destination_airport_id) REFERENCES Airports(airport_id)
);
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(20)
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    seat_number VARCHAR(5),
    booking_date DATETIME,
    status VARCHAR(20), -- Confirmed, Cancelled, Pending
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATETIME,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(50),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);
