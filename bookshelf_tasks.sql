-- 1.
select authors.name,authors.id
from authors
join authors_books on authors_books.authors_id = authors.id
group by authors_books.authors_id
order by count(authors_books.authors_id) desc
limit 1;
-- 2.
select books.title
from books
group by books.title
order by count(books.year) asc
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
update books
set books.friends_id = 1
where id = 9
limit 1;
-- 9.
insert books(title, year, shelves_id)
value ('Краткие ответы на большие вопросы', '2020', '1');

insert authors(name)
value('Стивен Хокинг'); 

insert authors_books(books_id, authors_id)
value('176','145')








