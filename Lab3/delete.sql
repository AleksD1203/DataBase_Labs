-- 19. Видалити конкретний квиток
SELECT * FROM TICKET WHERE ticket_id = 6;
DELETE FROM TICKET WHERE ticket_id = 6;
SELECT * FROM TICKET WHERE ticket_id = 6;

-- 20. Видалити тестове бронювання
SELECT * FROM BOOKING WHERE booking_id = 4;
DELETE FROM BOOKING WHERE booking_id = 4;
SELECT * FROM BOOKING WHERE booking_id = 4;

-- 21. Видалити тестового клієнта
SELECT * FROM CUSTOMER WHERE name = 'Іван Коваленко';
DELETE FROM CUSTOMER WHERE name = 'Іван Коваленко';
SELECT * FROM CUSTOMER WHERE name = 'Іван Коваленко';

-- 22. Спроба видалити фільм (має видати помилку FOREIGN KEY)
DELETE FROM MOVIE WHERE movie_id = 4;