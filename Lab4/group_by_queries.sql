-- Кількість сеансів для кожного фільму
SELECT m.title,
       COUNT(s.session_id) AS total_sessions
FROM MOVIE m
         JOIN SESSION s ON m.movie_id = s.movie_id
GROUP BY m.title;

-- Загальна сума бронювань для кожного клієнта
SELECT c.name,
       SUM(b.total_amount) AS total_spent
FROM CUSTOMER c
         JOIN BOOKING b ON c.customer_id = b.customer_id
GROUP BY c.name;

-- Кількість місць у кожному залі (сортування)
SELECT h.name,
       h.total_seats
FROM HALL h
ORDER BY h.total_seats DESC;

-- Кількість квитків, проданих на кожен фільм
SELECT m.title,
       COUNT(t.ticket_id) AS tickets_sold
FROM MOVIE m
         JOIN SESSION s ON m.movie_id = s.movie_id
         JOIN TICKET t ON s.session_id = t.session_id
GROUP BY m.title;

-- Кількість бронювань по днях
SELECT booking_date,
       COUNT(*) AS bookings_count
FROM BOOKING
GROUP BY booking_date
ORDER BY booking_date;