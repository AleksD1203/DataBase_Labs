CREATE TABLE IF NOT EXISTS CUSTOMER (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS HALL (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE,
    total_seats INT NOT NULL CHECK (total_seats > 0)
);

CREATE TABLE IF NOT EXISTS MOVIE (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    release_date DATE NOT NULL,
    duration INT NOT NULL CHECK (duration > 0),
    genre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS SEAT (
    seat_id INT NOT NULL,
    hall_id INT NOT NULL REFERENCES HALL(hall_id) ON DELETE CASCADE,
    row_number INT NOT NULL CHECK (row_number > 0),
    seat_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (seat_id, hall_id),
    UNIQUE (hall_id, seat_number)
);

CREATE TABLE IF NOT EXISTS SESSION (
    session_id SERIAL PRIMARY KEY,
    movie_id INT NOT NULL REFERENCES MOVIE(movie_id) ON DELETE RESTRICT,
    hall_id INT NOT NULL REFERENCES HALL(hall_id) ON DELETE RESTRICT,
    session_time TIMESTAMP NOT NULL,
    UNIQUE (hall_id, session_time)
);

CREATE TABLE IF NOT EXISTS BOOKING (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES CUSTOMER(customer_id) ON DELETE RESTRICT,
    booking_date DATE NOT NULL,
    total_amount NUMERIC(8,2) NOT NULL CHECK (total_amount >= 0)
);

CREATE TABLE IF NOT EXISTS TICKET (
    ticket_id SERIAL PRIMARY KEY,
    booking_id INT NOT NULL REFERENCES BOOKING(booking_id) ON DELETE CASCADE,
    session_id INT NOT NULL REFERENCES SESSION(session_id) ON DELETE RESTRICT,
    hall_id INT NOT NULL,
    seat_id INT NOT NULL,
    price NUMERIC(5,2) NOT NULL CHECK (price > 0),
    FOREIGN KEY (seat_id, hall_id) REFERENCES SEAT(seat_id, hall_id) ON DELETE RESTRICT,
    UNIQUE (session_id, seat_id, hall_id)
);