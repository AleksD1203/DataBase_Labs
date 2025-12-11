const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient(); 

async function main() {
  console.log("--- Перевірка функціоналу Prisma Client ---");

  let testCustomer;
  try {
    testCustomer = await prisma.customer.create({
      data: {
        name: "Test Customer",
        email: "test_lab6@example.com",
        phone_number: "111-222-3333",
      }
    });
    console.log(`[LOG] Створено клієнта: ID ${testCustomer.customer_id}`);
  } catch (e) {
    // Якщо клієнт вже є (UNIQUE constraint violation)
    testCustomer = await prisma.customer.findFirst({ where: { name: "Test Customer" } });
    if (!testCustomer) {
        console.error("[ERROR] Не вдалося створити тестового клієнта.");
        return;
    }
  }


  // 2. Вставка тестового фільму (movie) та використання поля is_active
  let testMovie;
  try {
    testMovie = await prisma.movie.create({
      data: {
        title: "The Migration Test",
        release_date: new Date('2025-01-01'),
        duration: 100,
        // Поле genre видалено!
        is_active: true // Використовуємо нове поле is_active
      }
    });
    console.log(`[LOG] Створено фільм: ID ${testMovie.movie_id}`);
  } catch (e) {
    // Якщо фільм вже є (якщо ID=1)
    testMovie = await prisma.movie.findFirst({ where: { title: "The Migration Test" } });
    if (!testMovie) {
        console.error("[ERROR] Не вдалося створити тестовий фільм.");
        return;
    }
  }

  // 3. Вставка запису в нову таблицю Review
  const newReview = await prisma.review.create({
    data: {
      rating: 5,
      comment: "Схема працює відмінно!",
      movie_id: testMovie.movie_id
    }
  });
  console.log(`[LOG] Створено відгук (Review ID: ${newReview.id})`);

  // 4. Запит даних із зв'язком (використання зв'язку Review та нового поля is_active)
  const result = await prisma.movie.findMany({
    where: { is_active: true },
    include: { reviews: true } // Включаємо нову таблицю
  });
  
  console.log("\n--- Результат фінального запиту (перевірка зв'язків та нових полів): ---");
  console.dir(result, { depth: 4 });
}

main()
  .catch(e => console.error("Критична помилка виконання:", e))
  .finally(async () => await prisma.$disconnect());