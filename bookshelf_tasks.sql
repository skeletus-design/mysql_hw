-- 1.
select authors.name,authors.id
from authors
join authors_books on authors_books.authors_id = authors.id
group by authors_books.authors_id
order by count(authors_books.authors_id) desc
limit 1;
-- 2.
select *
from books
where books.year is not null
order by books.year asc
limit 5;
-- 3.
select count(*) as "Книги на полке в кабинете"
from books
join shelves on books.shelves_id = shelves.id
where shelves.title like 'Полка в кабинете';
-- 4.
select books.title, authors.name, books.year
from books
join authors
join shelves on books.shelves_id = shelves_id
where shelves.title like 'Полка в спальне';
-- 5.
select books.title, books.year
from books 
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id
where authors.name like 'Лев Толстой';
-- 6.
select books.title
from books
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors_id
where authors.name like '% А';
-- 7.
select books.title, authors.name
from books
join authors_books on authors_books.books_id = books.id
join authors on authors_books.authors_id = authors.id 
join shelves on shelves.id = books.shelves_id
where shelves.title like 'верхняя%' or 'нижняя%';
-- 8.  
UPDATE books
JOIN authors_books ON authors_books.books_id = books.id
JOIN authors ON authors_books.authors_id = authors.id
SET books.friends_id = (SELECT friends.id FROM friends WHERE friends.name = 'Иванов Иван')
WHERE authors.name = 'Данте Алигьери' AND books.title = 'Божественная комедия'
AND books.id > 0;
-- 9.
insert into authors 
(name)
values
(
"Стивен Хокинг"
 );

insert into books 
(title, year, shelves_id)
values (
	"Краткие ответы на большие вопросы", 
     2020, 
     (select shelves.id from shelves where shelves.title = "Полка в кабинете" limit 1)
 );

 insert into authors_books
 (books_id, authors_id)
 values 
 (
 	(select books.id from books where books.title = "Краткие ответы на большие вопросы" and books.year = 2020 limit 1),
 	(select authors.id from authors where authors.name = "Стивен Хокинг" limit 1)
 );







