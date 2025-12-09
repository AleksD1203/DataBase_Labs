-- Клієнти, які витратили більше 200 грн
SELECT c.name,
       SUM(b.total_amount) AS total_spent
FROM CUSTOMER c
         JOIN BOOKING b ON c.customer_id = b.customer_id
GROUP BY c.name
HAVING SUM(b.total_amount) > 200;

-- Жанри з середньою тривалістю більше 140 хвилин
SELECT m.genre,
       AVG(m.duration) AS avg_duration
FROM MOVIE m
GROUP BY m.genre
HAVING AVG(m.duration) > 140;

-- Зали, в яких більше 1 сеансу
SELECT h.name,
       COUNT(s.session_id) AS session_count
FROM HALL h
         JOIN SESSION s ON h.hall_id = s.hall_id
GROUP BY h.name
HAVING COUNT(s.session_id) > 1;

-- Фільми, на які продано більше 1 квитка
SELECT m.title,
       COUNT(t.ticket_id) AS tickets_sold
FROM MOVIE m
         JOIN SESSION s ON m.movie_id = s.movie_id
         JOIN TICKET t ON s.session_id = t.session_id
GROUP BY m.title
HAVING COUNT(t.ticket_id) > 1;

-- Дні з більше ніж 1 бронюванням
SELECT booking_date,
       COUNT(*) AS bookings_count
FROM BOOKING
GROUP BY booking_date
HAVING COUNT(*) > 1;