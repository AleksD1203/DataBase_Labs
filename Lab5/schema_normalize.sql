-- Видалення старих таблиць
DROP TABLE IF EXISTS TICKET CASCADE;
DROP TABLE IF EXISTS BOOKING CASCADE;
DROP TABLE IF EXISTS SESSION CASCADE;
DROP TABLE IF EXISTS SEAT CASCADE;
DROP TABLE IF EXISTS MOVIE CASCADE;
DROP TABLE IF EXISTS HALL CASCADE;
DROP TABLE IF EXISTS CUSTOMER CASCADE;

-- 1. Клієнти
CREATE TABLE CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

-- 2. Кінозали
CREATE TABLE HALL (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    total_seats INT NOT NULL CHECK (total_seats > 0)
);

-- 3. Фільми
CREATE TABLE MOVIE (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_date DATE NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    genre VARCHAR(50) NOT NULL
);

-- 4. Місця (нормалізована)
CREATE TABLE SEAT (
    seat_id SERIAL PRIMARY KEY,
    original_seat_id INT NOT NULL,
    hall_id INT NOT NULL REFERENCES HALL(hall_id) ON DELETE CASCADE,
    row_number INT NOT NULL CHECK (row_number > 0),
    seat_number VARCHAR(10) NOT NULL,
    UNIQUE (original_seat_id, hall_id),
    UNIQUE (hall_id, row_number, seat_number)
);

-- 5. Сеанси
CREATE TABLE SESSION (
    session_id SERIAL PRIMARY KEY,
    movie_id INT NOT NULL REFERENCES MOVIE(movie_id) ON DELETE RESTRICT,
    hall_id INT NOT NULL REFERENCES HALL(hall_id) ON DELETE RESTRICT,
    session_time TIMESTAMP NOT NULL,
    UNIQUE (hall_id, session_time)
);

-- 6. Бронювання (нормалізована - без total_amount)
CREATE TABLE BOOKING (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES CUSTOMER(customer_id) ON DELETE RESTRICT,
    booking_date DATE NOT NULL
);

-- 7. Квитки
CREATE TABLE TICKET (
    ticket_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES BOOKING(booking_id) ON DELETE CASCADE,
    session_id INT NOT NULL REFERENCES SESSION(session_id) ON DELETE RESTRICT,
    seat_id INT NOT NULL REFERENCES SEAT(seat_id) ON DELETE RESTRICT,
    price NUMERIC(5,2) NOT NULL CHECK (price > 0),
    UNIQUE (session_id, seat_id)
);

-- Індекси
CREATE INDEX idx_booking_customer ON BOOKING(customer_id);
CREATE INDEX idx_ticket_booking ON TICKET(booking_id);
CREATE INDEX idx_ticket_session ON TICKET(session_id);
CREATE INDEX idx_session_movie ON SESSION(movie_id);
CREATE INDEX idx_session_hall ON SESSION(hall_id);
CREATE INDEX idx_seat_hall ON SEAT(hall_id);