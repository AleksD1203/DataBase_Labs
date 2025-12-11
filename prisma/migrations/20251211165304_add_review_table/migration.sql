-- CreateTable
CREATE TABLE "booking" (
    "booking_id" SERIAL NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "booking_date" DATE NOT NULL,

    CONSTRAINT "booking_pkey" PRIMARY KEY ("booking_id")
);

-- CreateTable
CREATE TABLE "customer" (
    "customer_id" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "phone_number" VARCHAR(15) NOT NULL,

    CONSTRAINT "customer_pkey" PRIMARY KEY ("customer_id")
);

-- CreateTable
CREATE TABLE "hall" (
    "hall_id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "total_seats" INTEGER NOT NULL,

    CONSTRAINT "hall_pkey" PRIMARY KEY ("hall_id")
);

-- CreateTable
CREATE TABLE "movie" (
    "movie_id" SERIAL NOT NULL,
    "title" VARCHAR(200) NOT NULL,
    "release_date" DATE NOT NULL,
    "duration" INTEGER NOT NULL,
    "genre" VARCHAR(50) NOT NULL,

    CONSTRAINT "movie_pkey" PRIMARY KEY ("movie_id")
);

-- CreateTable
CREATE TABLE "seat" (
    "seat_id" SERIAL NOT NULL,
    "original_seat_id" INTEGER NOT NULL,
    "hall_id" INTEGER NOT NULL,
    "row_number" INTEGER NOT NULL,
    "seat_number" VARCHAR(10) NOT NULL,

    CONSTRAINT "seat_pkey" PRIMARY KEY ("seat_id")
);

-- CreateTable
CREATE TABLE "session" (
    "session_id" SERIAL NOT NULL,
    "movie_id" INTEGER NOT NULL,
    "hall_id" INTEGER NOT NULL,
    "session_time" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "session_pkey" PRIMARY KEY ("session_id")
);

-- CreateTable
CREATE TABLE "ticket" (
    "ticket_id" SERIAL NOT NULL,
    "booking_id" INTEGER NOT NULL,
    "session_id" INTEGER NOT NULL,
    "seat_id" INTEGER NOT NULL,
    "price" DECIMAL(5,2) NOT NULL,

    CONSTRAINT "ticket_pkey" PRIMARY KEY ("ticket_id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "rating" INTEGER NOT NULL,
    "comment" TEXT,
    "movie_id" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "idx_booking_customer" ON "booking"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "customer_email_key" ON "customer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "customer_phone_number_key" ON "customer"("phone_number");

-- CreateIndex
CREATE UNIQUE INDEX "hall_name_key" ON "hall"("name");

-- CreateIndex
CREATE INDEX "idx_seat_hall" ON "seat"("hall_id");

-- CreateIndex
CREATE UNIQUE INDEX "seat_hall_id_row_number_seat_number_key" ON "seat"("hall_id", "row_number", "seat_number");

-- CreateIndex
CREATE UNIQUE INDEX "seat_original_seat_id_hall_id_key" ON "seat"("original_seat_id", "hall_id");

-- CreateIndex
CREATE INDEX "idx_session_hall" ON "session"("hall_id");

-- CreateIndex
CREATE INDEX "idx_session_movie" ON "session"("movie_id");

-- CreateIndex
CREATE UNIQUE INDEX "session_hall_id_session_time_key" ON "session"("hall_id", "session_time");

-- CreateIndex
CREATE INDEX "idx_ticket_booking" ON "ticket"("booking_id");

-- CreateIndex
CREATE INDEX "idx_ticket_session" ON "ticket"("session_id");

-- CreateIndex
CREATE UNIQUE INDEX "ticket_session_id_seat_id_key" ON "ticket"("session_id", "seat_id");

-- AddForeignKey
ALTER TABLE "booking" ADD CONSTRAINT "booking_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "seat" ADD CONSTRAINT "seat_hall_id_fkey" FOREIGN KEY ("hall_id") REFERENCES "hall"("hall_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_hall_id_fkey" FOREIGN KEY ("hall_id") REFERENCES "hall"("hall_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "session" ADD CONSTRAINT "session_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_booking_id_fkey" FOREIGN KEY ("booking_id") REFERENCES "booking"("booking_id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_seat_id_fkey" FOREIGN KEY ("seat_id") REFERENCES "seat"("seat_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "session"("session_id") ON DELETE RESTRICT ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_movie_id_fkey" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id") ON DELETE RESTRICT ON UPDATE CASCADE;
