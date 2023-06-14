USE db_2938b3;
-- 1. Вывести суммарное количество единиц техники на складе (не товарных позиций, а товаров!)
 select SUM(hardware.amount) AS "Сумма товаров на складе" 
 from hardware ;

-- 2.
select id, title, price, amount as "Товары которые закончились"
from hardware where hardware.amount = 0;

-- 3.
select avg(hardware.price) as "Средняя стоимость монитора"
from hardware where hardware.title like "Монитор%";

-- 4. 
select * 
from hardware where hardware.title like "Клавиатура%"
order by hardware.price asc;

-- 5.
select count(*), hardware.tag
from hardware group by tag 
order by hardware.tag asc;

-- 6.
select count(*), hardware.tag
from hardware where hardware.tag = 'discount';

-- 7.
select title, price
from hardware where hardware.tag = 'new'
order by hardware.tag asc limit 1;

-- 8.
insert into hardware(title, price, amount, tag)
value ('Ноутбук Lenovo 2BXKQ7E9XD', 54500, 1, 'new');

-- 9. 
delete from hardware
where title = "Очки PS VR 2"
limit 1
















