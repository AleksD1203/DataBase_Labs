-- 1. Всі клієнти
SELECT * FROM CUSTOMER;

-- 2. Імена та email клієнтів
SELECT name, email FROM CUSTOMER;

-- 3. Фільми тривалістю більше 150 хвилин
SELECT title, duration, genre FROM MOVIE WHERE duration > 150;

-- 4. Зали з кількістю місць більше 50
SELECT name, total_seats FROM HALL WHERE total_seats > 50;

-- 5. Сеанси на 1 грудня 2025 року
SELECT * FROM SESSION WHERE DATE(session_time) = '2025-12-01';

-- 6. Бронювання з сумою більше 200 грн
SELECT booking_id, customer_id, total_amount FROM BOOKING WHERE total_amount > 200;

-- 7. Квитки вартістю рівно 125.00 грн
SELECT * FROM TICKET WHERE price = 125.00;