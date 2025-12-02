-- 1. Оновити email клієнта
SELECT * FROM CUSTOMER WHERE name = 'Олександр Дудник';
UPDATE CUSTOMER SET email = 'oleksandr.new@example.com' WHERE name = 'Олександр Дудник';
SELECT * FROM CUSTOMER WHERE name = 'Олександр Дудник';

-- 2. Оновити тривалість фільму
SELECT title, duration FROM MOVIE WHERE title = 'Аватар: Шлях води';
UPDATE MOVIE SET duration = 195 WHERE title = 'Аватар: Шлях води';
SELECT title, duration FROM MOVIE WHERE title = 'Аватар: Шлях води';

-- 3. Оновити кількість місць у залі
SELECT name, total_seats FROM HALL WHERE name = 'Червоний Зал';
UPDATE HALL SET total_seats = 55 WHERE name = 'Червоний Зал';
SELECT name, total_seats FROM HALL WHERE name = 'Червоний Зал';

-- 4. Оновити суму бронювання
SELECT booking_id, total_amount FROM BOOKING WHERE booking_id = 1;
UPDATE BOOKING SET total_amount = 400.00 WHERE booking_id = 1;
SELECT booking_id, total_amount FROM BOOKING WHERE booking_id = 1;

-- 5. Оновити ціну квитка
SELECT ticket_id, price FROM TICKET WHERE ticket_id = 1;
UPDATE TICKET SET price = 130.00 WHERE ticket_id = 1;
SELECT ticket_id, price FROM TICKET WHERE ticket_id = 1;
