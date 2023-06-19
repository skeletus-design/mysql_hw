
-- 1.
select count(movies.title)
from movies 
join companies on companies.id = movies.id_companies
where companies.title like 'Universal Pictures';
-- 2.
select count(movies.title)
from movies
join directors on directors.id = movies.id_directors
where directors.full_name like 'Фрэнсис Форд Коппола';
-- 3.
select count(movies.title) as 'Количество снятых фильмов за последние 20 лет'
from movies
where movies.year < 2023 and movies.year > 2003;
-- 4.
select distinct genres.title
from genres
join movies on genres.id = movies.id_genres
join directors on directors.id = movies.id_directors
where directors.full_name like 'Стивен Спилберг';
-- 5.
select movies.title, genres.title, directors.full_name
from movies
join genres on genres.id = movies.id_genres
join directors on directors.id = movies.id_directors
order by budget desc
limit 5;
-- 6.
select directors.full_name, count(movies.title) 
from movies
join directors on directors.id = movies.id_directors
group by directors.full_name
order by count(movies.id) desc
limit 1;
-- 7.
select movies.title, genres.title
from movies 
join genres on genres.id = movies.id_genres
where id_companies = (
	select companies.id from companies
    join movies on movies.id_companies = companies.id
		group by companies.id
		order by sum(movies.budget) desc
		limit 1)
        ;
-- 8.
select avg(movies.budget)
from movies
join companies on companies.id = movies.id_companies
where companies.title like 'Warner Bros.';
-- 9.
select avg(movies.budget), count(genres.title)
from movies
join genres on genres.id = movies.id_genres
group by genres.id;
-- 10. 
DELETE movies 
FROM movies
JOIN genres ON genres.id = movies.id_genres
WHERE genres.title = 'комедия' AND movies.title = 'Дикие истории' AND movies.year = 2014 AND movies.id > 0
;




