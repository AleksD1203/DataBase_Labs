-- Загальний дохід від кожного фільму
SELECT m.title,
       SUM(t.price) AS total_revenue
FROM MOVIE m
         JOIN SESSION s ON m.movie_id = s.movie_id
         JOIN TICKET t ON s.session_id = t.session_id
GROUP BY m.title
ORDER BY total_revenue DESC;

-- Кількість проданих квитків на кожен сеанс
SELECT s.session_id,
       m.title,
       s.session_time,
       h.name AS hall_name,
       COUNT(t.ticket_id) AS tickets_sold
FROM SESSION s
         JOIN MOVIE m ON s.movie_id = m.movie_id
         JOIN HALL h ON s.hall_id = h.hall_id
         LEFT JOIN TICKET t ON s.session_id = t.session_id
GROUP BY s.session_id, m.title, s.session_time, h.name
ORDER BY s.session_time;

-- Загальна виручка по залах
SELECT h.name AS hall_name,
       SUM(t.price) AS total_revenue
FROM HALL h
         JOIN SESSION s ON h.hall_id = s.hall_id
         JOIN TICKET t ON s.session_id = t.session_id
GROUP BY h.name
ORDER BY total_revenue DESC;

-- Доход по днях з деталізацією
SELECT DATE(s.session_time) AS session_date,
       m.title,
       COUNT(t.ticket_id) AS tickets_sold,
       SUM(t.price) AS daily_revenue
FROM SESSION s
         JOIN MOVIE m ON s.movie_id = m.movie_id
         LEFT JOIN TICKET t ON s.session_id = t.session_id
GROUP BY DATE(s.session_time), m.title
ORDER BY session_date, daily_revenue DESC;

-- Статистика по клієнтах з деталізацією
SELECT c.name,
       COUNT(b.booking_id) AS total_bookings,
       SUM(b.total_amount) AS total_spent,
       COUNT(t.ticket_id) AS total_tickets
FROM CUSTOMER c
         LEFT JOIN BOOKING b ON c.customer_id = b.customer_id
         LEFT JOIN TICKET t ON b.booking_id = t.booking_id
GROUP BY c.name
ORDER BY total_spent DESC;