-- Підзапит у SELECT: Клієнти та кількість їх бронювань
SELECT c.name,
       (SELECT COUNT(*)
        FROM BOOKING b
        WHERE b.customer_id = c.customer_id) AS booking_count
FROM CUSTOMER c;

-- Підзапит у WHERE: Квитки дорожчі за середню ціну
SELECT t.ticket_id,
       t.price
FROM TICKET t
WHERE t.price > (SELECT AVG(price) FROM TICKET)
ORDER BY t.price DESC;

-- Підзапит у HAVING: Жанри з тривалістю вище середньої
SELECT m.genre,
       AVG(m.duration) AS avg_duration
FROM MOVIE m
GROUP BY m.genre
HAVING AVG(m.duration) > (SELECT AVG(duration) FROM MOVIE);

-- Підзапит у FROM: Найпопулярніші фільми (з підзапитом)
SELECT movie_stats.title,
       movie_stats.tickets_sold
FROM (SELECT m.title,
             COUNT(t.ticket_id) AS tickets_sold
      FROM MOVIE m
               JOIN SESSION s ON m.movie_id = s.movie_id
               JOIN TICKET t ON s.session_id = t.session_id
      GROUP BY m.title) AS movie_stats
WHERE movie_stats.tickets_sold > 1;

-- Підзапит з IN: Клієнти, які робили бронювання
SELECT c.name
FROM CUSTOMER c
WHERE c.customer_id IN (SELECT DISTINCT customer_id FROM BOOKING);