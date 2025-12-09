-- INNER JOIN: Детальна інформація про квитки
SELECT t.ticket_id,
       c.name AS customer_name,
       m.title AS movie_title,
       s.session_time,
       h.name AS hall_name,
       t.price
FROM TICKET t
         JOIN BOOKING b ON t.booking_id = b.booking_id
         JOIN CUSTOMER c ON b.customer_id = c.customer_id
         JOIN SESSION s ON t.session_id = s.session_id
         JOIN MOVIE m ON s.movie_id = m.movie_id
         JOIN HALL h ON t.hall_id = h.hall_id
ORDER BY t.ticket_id;

-- LEFT JOIN: Всі зали та їх сеанси (якщо є)
SELECT h.name AS hall_name,
       s.session_time,
       m.title AS movie_title
FROM HALL h
         LEFT JOIN SESSION s ON h.hall_id = s.hall_id
         LEFT JOIN MOVIE m ON s.movie_id = m.movie_id
ORDER BY h.name, s.session_time;

-- RIGHT JOIN: Всі сеанси та зали
SELECT h.name AS hall_name,
       s.session_time,
       m.title AS movie_title
FROM HALL h
         RIGHT JOIN SESSION s ON h.hall_id = s.hall_id
         JOIN MOVIE m ON s.movie_id = m.movie_id
ORDER BY s.session_time;

-- FULL JOIN: Всі клієнти та всі бронювання
SELECT c.name AS customer_name,
       b.booking_date,
       b.total_amount
FROM CUSTOMER c
         FULL JOIN BOOKING b ON c.customer_id = b.customer_id
ORDER BY c.name, b.booking_date;

-- CROSS JOIN: Всі комбінації фільмів та залів
SELECT m.title AS movie_title,
       h.name AS hall_name
FROM MOVIE m
         CROSS JOIN HALL h
ORDER BY m.title, h.name;