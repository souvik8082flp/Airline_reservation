SELECT total_seats - COUNT(b.seat_number) AS available_seats
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id AND b.status = 'Confirmed'
WHERE f.flight_id = 101
GROUP BY f.total_seats;


SELECT f.flight_id, f.airline_name, a1.city AS origin, a2.city AS destination, f.departure_time
FROM Flights f
JOIN Airports a1 ON f.origin_airport_id = a1.airport_id
JOIN Airports a2 ON f.destination_airport_id = a2.airport_id
WHERE a1.city = 'Delhi' AND a2.city = 'Mumbai';

SELECT f.flight_id, f.airline_name, a1.city AS origin, a2.city AS destination, f.departure_time
FROM Flights f
JOIN Airports a1 ON f.origin_airport_id = a1.airport_id
JOIN Airports a2 ON f.destination_airport_id = a2.airport_id
WHERE a1.city = 'Delhi' AND a2.city = 'Mumbai';


SELECT a1.city AS origin, a2.city AS destination, COUNT(*) AS total_bookings
FROM Flights f
JOIN Bookings b ON f.flight_id = b.flight_id
JOIN Airports a1 ON f.origin_airport_id = a1.airport_id
JOIN Airports a2 ON f.destination_airport_id = a2.airport_id
WHERE b.status = 'Confirmed'
GROUP BY a1.city, a2.city
ORDER BY total_bookings DESC
LIMIT 5;


SELECT p.first_name, p.last_name, COUNT(b.booking_id) AS total_flights
FROM Passengers p
JOIN Bookings b ON p.passenger_id = b.passenger_id
WHERE b.status = 'Confirmed'
GROUP BY p.passenger_id
HAVING COUNT(b.booking_id) > 5;
