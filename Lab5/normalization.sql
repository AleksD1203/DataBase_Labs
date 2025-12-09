-- 1. Видалення total_amount з BOOKING
ALTER TABLE BOOKING DROP COLUMN total_amount;

-- 2. Перетворення таблиці SEAT
-- Створення нової таблиці з сурогатним ключем
CREATE TABLE SEAT_NEW (
    seat_id SERIAL PRIMARY KEY,
    original_seat_id INT NOT NULL,
    hall_id INT NOT NULL REFERENCES HALL(hall_id) ON DELETE CASCADE,
    row_number INT NOT NULL CHECK (row_number > 0),
    seat_number VARCHAR(10) NOT NULL
);

-- Копіювання даних
INSERT INTO SEAT_NEW (original_seat_id, hall_id, row_number, seat_number)
SELECT seat_id, hall_id, row_number, seat_number FROM SEAT;

-- Видалення старої таблиці
DROP TABLE SEAT CASCADE;

-- Перейменування нової таблиці
ALTER TABLE SEAT_NEW RENAME TO SEAT;

-- Додавання обмежень
ALTER TABLE SEAT ADD UNIQUE (original_seat_id, hall_id);
ALTER TABLE SEAT ADD UNIQUE (hall_id, row_number, seat_number);

-- 3. Оновлення foreign keys в TICKET
-- Видаляємо старий foreign key
ALTER TABLE TICKET DROP CONSTRAINT IF EXISTS ticket_seat_id_hall_id_fkey;

-- Додаємо новий foreign key
ALTER TABLE TICKET ADD FOREIGN KEY (seat_id) 
REFERENCES SEAT(seat_id) ON DELETE RESTRICT;