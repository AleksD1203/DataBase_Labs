-- Загальна кількість клієнтів
SELECT COUNT(*) AS total_customers
FROM CUSTOMER;

-- Загальна сума всіх бронювань
SELECT SUM(total_amount) AS total_booking_revenue
FROM BOOKING;

-- Середня тривалість фільмів
SELECT AVG(duration) AS avg_movie_duration_minutes
FROM MOVIE;

-- Максимальна та мінімальна вартість квитка
SELECT MAX(price) AS max_ticket_price,
       MIN(price) AS min_ticket_price
FROM TICKET;

-- Кількість сеансів всього
SELECT COUNT(*) AS total_sessions
FROM SESSION;

-- Середня ціна квитка
SELECT AVG(price) AS avg_ticket_price
FROM TICKET;

-- Мінімальна та максимальна кількість місць у залах
SELECT MIN(total_seats) AS min_hall_seats,
       MAX(total_seats) AS max_hall_seats
FROM HALL;