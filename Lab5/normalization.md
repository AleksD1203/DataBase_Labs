# Звіт з нормалізації бази даних кінотеатру #

## Оригінальний та перероблений дизайн таблиць ##

### Таблиця BOOKING ###

**Оригінальна структура:**
```sql
CREATE TABLE BOOKING (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES CUSTOMER(customer_id),
    booking_date DATE NOT NULL,
    total_amount NUMERIC(8,2) NOT NULL CHECK (total_amount >= 0)
);
Команда ALTER TABLE:

sql
ALTER TABLE BOOKING DROP COLUMN total_amount;
Таблиця SEAT
Оригінальна структура:

sql
CREATE TABLE SEAT (
    seat_id INT NOT NULL,
    hall_id INT NOT NULL REFERENCES HALL(hall_id),
    row_number INT NOT NULL CHECK (row_number > 0),
    seat_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (seat_id, hall_id)
);
Команди ALTER TABLE:

sql
-- Створення нової таблиці
CREATE TABLE SEAT_NEW (seat_id SERIAL PRIMARY KEY, ...);
-- Копіювання даних
INSERT INTO SEAT_NEW SELECT ... FROM SEAT;
-- Видалення старої таблиці
DROP TABLE SEAT CASCADE;
-- Перейменування
ALTER TABLE SEAT_NEW RENAME TO SEAT;

**Функціональні залежності**
CUSTOMER: customer_id → name, email, phone_number

HALL: hall_id → name, total_seats

MOVIE: movie_id → title, release_date, duration, genre

SEAT: seat_id → original_seat_id, hall_id, row_number, seat_number

SESSION: session_id → movie_id, hall_id, session_time

BOOKING: booking_id → customer_id, booking_date

TICKET: ticket_id → booking_id, session_id, seat_id, price

**Покрокове пояснення нормалізації**

Початковий стан: 1NF
Всі таблиці вже в 1NF.

Крок 1: Перехід до 2NF
BOOKING: Видалено total_amount (похідне значення)
SEAT: Додано сурогатний ключ для усунення проблем зі складеним PK

Крок 2: Перехід до 3NF
Після кроку 1 всі таблиці вже в 3NF:
Немає транзитивних залежностей
Усі атрибути залежать тільки від PK

SQL-скрипти:
schema_normalize.sql - повна нормалізована схема
normalization.sql - команди для нормалізації існуючої бази