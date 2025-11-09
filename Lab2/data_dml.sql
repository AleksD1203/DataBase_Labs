INSERT INTO CUSTOMER (name, email, phone_number) VALUES
('Олександр Дудник', 'aleksandr.dudnik1@example.com', '380971112233'),
('Дмитро Нечай', 'aleksandr.dudnik2@example.com', '380504445566'),
('Олег Алєнін', 'aleksandr.dudnik3@example.com', '380637778899');

INSERT INTO HALL (name, total_seats) VALUES
('Червоний Зал', 50),
('Синій Зал', 75),
('VIP Зал', 20);

INSERT INTO MOVIE (title, release_date, duration, genre) VALUES
('Аватар: Шлях води', '2022-12-15', 192, 'Фантастика'),
('Хижак: Дикі Землі', '2025-11-07', 107, 'Драма'),
('Месники:Війна Нескінечності', '2018-04-23', 149, 'Бойовик');

INSERT INTO SEAT (seat_id, hall_id, row_number, seat_number) VALUES
(1, 1, 1, 'A1'),
(2, 1, 1, 'A2'),
(3, 1, 2, 'B1'),
(4, 1, 2, 'B2'),
(1, 2, 1, 'C1'),
(2, 2, 1, 'C2'),
(3, 2, 2, 'D1');

INSERT INTO SESSION (movie_id, hall_id, session_time) VALUES
(1, 1, '2025-12-01 18:00:00'),
(2, 2, '2025-12-01 20:30:00'),
(1, 1, '2025-12-02 16:00:00');

INSERT INTO BOOKING (customer_id, booking_date, total_amount) VALUES
(1, '2025-11-02', 250.00),
(2, '2025-11-06', 300.50),
(3, '2025-11-10', 125.00);

INSERT INTO TICKET (booking_id, session_id, hall_id, seat_id, price) VALUES
(1, 1, 1, 1, 125.00),
(1, 1, 1, 2, 125.00),
(2, 2, 2, 1, 150.25),
(2, 2, 2, 2, 150.25),
(3, 3, 1, 3, 125.00);