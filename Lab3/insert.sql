-- 8. Додати нового клієнта
INSERT INTO CUSTOMER (name, email, phone_number) 
VALUES ('Іван Коваленко', 'ivan.kovalenko@example.com', '380661112233');

-- Перевірка:
SELECT * FROM CUSTOMER WHERE name = 'Іван Коваленко';

-- 9. Додати новий фільм
INSERT INTO MOVIE (title, release_date, duration, genre)
VALUES ('Термінатор 7', '2025-08-15', 135, 'Фантастика');

-- Перевірка:
SELECT * FROM MOVIE WHERE title = 'Термінатор 7';

-- 10. Додати новий зал
INSERT INTO HALL (name, total_seats)
VALUES ('Зелений Зал', 60);

-- Перевірка:
SELECT * FROM HALL WHERE name = 'Зелений Зал';

-- 11. Додати новий сеанс
INSERT INTO SESSION (movie_id, hall_id, session_time)
VALUES (4, 3, '2025-12-03 19:30:00');

-- Перевірка:
SELECT * FROM SESSION WHERE session_time = '2025-12-03 19:30:00';

-- 12. Додати нове бронювання
INSERT INTO BOOKING (customer_id, booking_date, total_amount)
VALUES (4, '2025-11-15', 375.50);

-- Перевірка:
SELECT * FROM BOOKING WHERE customer_id = 4;

-- 13. Додати новий квиток
INSERT INTO TICKET (booking_id, session_id, hall_id, seat_id, price)
VALUES (4, 4, 3, 1, 187.75);

-- Перевірка:
SELECT * FROM TICKET WHERE booking_id = 4;