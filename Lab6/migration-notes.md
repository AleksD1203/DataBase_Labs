# Звіт до Лабораторної роботи 6: Міграції схем за допомогою Prisma ORM

## Мета
[cite_start]Керування змінами схеми бази даних (з Лабораторної роботи 5) за допомогою інструментів міграції Prisma ORM[cite: 11].

---

## 1. Міграція: add-review-table (Створення таблиці)

**Назва міграції:** `20251211165304_add_review_table` (Ваша міграція №1)

[cite_start]**Опис:** Додано нову модель `Review` для зберігання відгуків про фільми та встановлено зв'язок (One-to-Many) з моделлю `movie` [cite: 27-38].

**Схема Prisma: ДО** (Фрагмент `movie`):
```prisma
model movie {
  // ...
  session session[]
}
**Схема Prisma: ПІСЛЯ** (Фрагменти movie та Review):

model movie {
  // ...
  session session[]
  reviews Review[] // Доданий зв'язок
}

model Review {
  id Int @id @default(autoincrement())
  rating Int
  comment String?
  movie_id Int
  movie movie @relation(fields: [movie_id], references: [movie_id])
}

2. **Міграція: add-movie-is-active** (Зміна таблиці)
Назва міграції: 20251211170457_add_movie_is_active (Ваша міграція №2)

Опис: Додано нове поле is_active типу Boolean до таблиці movie з типовим значенням true.


**Схема Prisma: ДО** (Фрагмент movie без is_active):

model movie {
  // ...
  duration     Int
  genre        String   @db.VarChar(50) 
  session      session[]
}
**Схема Prisma: ПІСЛЯ** (Фрагмент movie з is_active):

model movie {
  // ...
  duration     Int
  genre        String   @db.VarChar(50)
  is_active    Boolean  @default(true) // ДОДАНО ПОЛЕ
  session      session[]
}

3. **Міграція: drop-movie-genre** (Видалення стовпця)
Назва міграції: 20251211170609_drop_movie_genre (Ваша міграція №3)


Опис: Видалено поле genre з таблиці movie, як вимагає завдання (імітація видалення поля опису).

**Схема Prisma: ДО** (Фрагмент movie з genre):

model movie {
  // ...
  duration     Int
  genre        String   @db.VarChar(50) // ПОЛЕ, ЩО ВИДАЛЯЄМО
  is_active    Boolean  @default(true)
  session      session[]
}
**Схема Prisma: ПІСЛЯ** (Фрагмент movie без genre):

model movie {
  // ...
  duration     Int
  is_active    Boolean  @default(true)
  session      session[]
  reviews      Review[]
}