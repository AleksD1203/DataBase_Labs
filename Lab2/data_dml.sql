-- 1. Додати клієнтів (email має містити @)
INSERT INTO CUSTOMER (name, email, phone_number) VALUES
('Олександр Дудник', 'aleksandr.dudnik1@example.com', '380971112233'),
('Дмитро Нечай', 'dmitro.nechay@example.com', '380504445566'),
('Олег Алєнін', 'oleg.alenin@example.com', '380637778899');

-- 2. Додати зали
INSERT INTO HALL (name, total_seats) VALUES
('Червоний Зал', 50),
('Синій Зал', 75),
('VIP Зал', 20);

-- 3. Додати фільми (Жанри мають бути зі списку: Фантастика, Драма, Бойовик...)
INSERT INTO MOVIE (title, release_date, duration, genre) VALUES
('Аватар: Шлях води', '2022-12-15', 192, 'Фантастика'),
('Хижак: Дикі Землі', '2025-11-07', 107, 'Драма'),
('Месники: Фінал', '2019-04-26', 181, 'Бойовик');

-- 4. Додати місця (для Червоного залу, ID=1)
INSERT INTO SEAT (seat_id, hall_id, row_number, seat_number) VALUES
(1, 1, 1, 'A1'),
(2, 1, 1, 'A2'),
(3, 1, 2, 'B1'),
(4, 1, 2, 'B2');

-- Додати місця (для Синього залу, ID=2)
INSERT INTO SEAT (seat_id, hall_id, row_number, seat_number) VALUES
(1, 2, 1, 'C1'),
(2, 2, 1, 'C2');

-- 5. Додати сеанси
INSERT INTO SESSION (movie_id, hall_id, session_time) VALUES
(1, 1, '2025-12-01 18:00:00'),
(2, 2, '2025-12-01 20:30:00'),
(1, 1, '2025-12-02 16:00:00'); 

-- 6. Додати бронювання
INSERT INTO BOOKING (customer_id, booking_date, total_amount) VALUES
(1, '2025-11-02', 250.00),
(2, '2025-11-06', 300.50);

-- 7. Додати квитки
INSERT INTO TICKET (booking_id, session_id, hall_id, seat_id, price) VALUES
(1, 1, 1, 1, 125.00),
(1, 1, 1, 2, 125.00),
(2, 2, 2, 1, 150.25),
(2, 2, 2, 2, 150.25);