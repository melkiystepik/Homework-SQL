---1
select model, speed, hd from pc where price < 500;
---2
select distinct maker from product where type = 'printer';
---3
select model, ram, screen from laptop where price > 1000;
---4
select * from printer where color =  'y';
---5
select model, speed, hd from pc where (cd = '12x' or cd = '24x') and price < 600;
---6
select distinct product.maker, laptop.speed from laptop
join product on product.model = laptop.model
where (laptop.hd >= 100);
---7
select product.model, laptop.price from product
join laptop on product.model = laptop.model
where product.maker = 'Sony'
union
select product.model, pc.price from product
join pc on product.model = pc.model
where product.maker = 'Sony'
union
select product.model, printer.price from product
join printer on product.model = printer.model
where product.maker = 'Sony';
---8
select distinct pcs.maker from (select maker from product where type = 'pc') as pcs
where pcs.maker not in (select maker from product where type = 'laptop');
---9
select distinct maker from product
join pc on product.model = pc.model
where speed >= 450;
---10
select model, price from printer where price = (select MAX(price) from printer);
---11
select AVG(pc.speed) from pc;
---12
select avg(laptop.speed) from laptop where price > 1000;
---13
select avg(speed) from pc
join product on pc.model = product.model
where maker = 'Asus';
---14
select distinct pc1.speed, avg(pc1.price) as avgprice from pc as pc1 join pc as pc2 on pc1.speed = pc2.speed group by pc1.speed;
---15
SELECT hd FROM pc GROUP BY hd HAVING count(hd)>1;
---16
select pc1.model, pc2.model, pc1.speed, pc1.ram
from pc as pc1
join pc as pc2 on pc1.model > pc2.model
where pc1.speed=pc2.speed and pc1.ram = pc2.ram
order by pc1.model;
---17
SELECT product.type, laptop.model, speed
FROM laptop JOIN product ON product.model = laptop.model
WHERE speed < (SELECT MIN(speed) FROM pc);
---18
SELECT distinct product.maker, colprinter.price FROM printer AS colprinter
JOIN product ON colprinter.model = product.model
WHERE colprinter.color = 'y'
  AND colprinter.price = (SELECT MIN(price) FROM printer WHERE color = 'y')
ORDER BY colprinter.price
---19
select product.maker, avg(laptop.screen) from laptop
join product on laptop.model = product.model
group by product.maker;
---20
select maker, count(maker) from product where type = 'pc' group by maker having count(maker) >= 3;
---21
select product.maker, max(pc.price) from pc
join product on pc.model = product.model group by maker;
---22
select speed, avg(price) from pc where speed > 600 group by speed;
---23
SELECT DISTINCT product.maker FROM product
JOIN laptop ON product.model = laptop.model
WHERE laptop.speed >= 750
INTERSECT
SELECT DISTINCT product.maker FROM product
JOIN pc ON product.model = pc.model
WHERE pc.speed >= 750;
---24
SELECT product.model FROM product
JOIN (SELECT MAX(price) AS max_price FROM (
SELECT price FROM pc
UNION ALL
SELECT price FROM printer
UNION ALL
SELECT price FROM laptop) AS prices) AS max_prices
ON product.model IN (
SELECT model FROM pc WHERE price = max_prices.max_price
UNION ALL
SELECT model FROM printer WHERE price = max_prices.max_price
UNION ALL
SELECT model FROM laptop WHERE price = max_prices.max_price);
---25
select distinct printers.maker from (select * from product where product.type = 'printer') as printers
join (select * from product where product.type = 'pc') as pcs on printers.maker = pcs.maker
join pc on pc.model=pcs.model
where  pc.speed = (select max(pc.speed) from pc)
group by printers.maker, pc.ram
having pc.ram = min(pc.ram);