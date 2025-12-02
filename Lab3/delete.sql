-- 1. Видалити конкретний квиток
SELECT * FROM TICKET WHERE ticket_id = 6;
DELETE FROM TICKET WHERE ticket_id = 6;
SELECT * FROM TICKET WHERE ticket_id = 6;

-- 2. Видалити тестове бронювання
SELECT * FROM BOOKING WHERE booking_id = 4;
DELETE FROM BOOKING WHERE booking_id = 4;
SELECT * FROM BOOKING WHERE booking_id = 4;

-- 3. Видалити тестового клієнта
SELECT * FROM CUSTOMER WHERE name = 'Юрій Савицький';
DELETE FROM CUSTOMER WHERE name = 'Юрій Савицький';
SELECT * FROM CUSTOMER WHERE name = 'Юрій Савицький';

-- 4. Спроба видалити фільм (має видати помилку FOREIGN KEY)
DELETE FROM MOVIE WHERE movie_id = 4;
