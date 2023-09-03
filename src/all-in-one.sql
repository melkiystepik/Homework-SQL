---1
select model, speed, hd from pc where price < cast(500 as money);
---2
-- may be too easy?)))
-- select maker from printer;
select distinct maker from printer where type = 'printer';
---3
select model, ram, screen from laptop where price > cast(1000 as money);
---4
select * from printer where color =  'y';
---5
select model, speed, hd from pc where (cd = '12x' or cd = '24x') and price < cast(600 as money);
---6
select maker, speed from laptop where hd >= 100;
---7
select model, price from pc where maker = 'Sony'
union
select model, price from laptop where maker = 'Sony'
union
select model, price from printer where maker = 'Sony';
---8
select distinct pc.maker from pc where pc.maker not in (select maker from laptop);
---9
select distinct maker from pc where speed >= 450;
---10
select model, price from printer where price = (select MAX(price) from printer);
---11
select AVG(pc.speed) from pc;
---12
select avg(laptop.speed) from laptop where price > cast(1000 as money);
---13
select avg(speed) from pc where maker = 'Asus';
---14
select pc1.speed, avg(cast(pc1.price as numeric)) as avgprice from pc as pc1 join pc as pc2 on pc1.speed = pc2.speed group by pc1.speed;
---15
SELECT hd FROM pc GROUP BY hd HAVING count(hd)>1;
---16
--here I had some difficalties
--select pc1.model, pc2.model, pc1.speed, pc1.ram
--from pc as pc1 left join pc as pc2 on pc1.model != pc2.model
--where pc1.speed=pc2.speed and pc1.ram = pc2.ram
--group by pc1.model, pc2.model, pc1.speed, pc1.ram
--order by pc1.model
--and later I was prompted for very elegant solution
select pc1.model, pc2.model, pc1.speed, pc1.ram
from pc as pc1
join pc as pc2 on pc1.model > pc2.model
where pc1.speed=pc2.speed and pc1.ram = pc2.ram
order by pc1.model;
---17
select distinct laptop.type, laptop.model, laptop.speed from laptop, pc where laptop.speed < pc.speed;
---18
select maker, price from printer where price = (select MIN(price) from printer);
---19
select maker, avg(screen) from laptop group by maker;
---20
select maker, count(maker) from pc group by maker having count(maker) >= 3;
---21
select maker, max(price) from pc group by maker;
---22
select speed, avg(cast(price as numeric)) from pc where speed > 600 group by speed;
---23
select Distinct pc.maker from pc join laptop on pc.maker = laptop.maker where laptop.speed >= 750 and pc.speed > 750;
---24
select produkt.model from produkt
join pc on produkt.model = pc.model
where pc.price = (select max(pc.price) from pc)
union
select produkt.model from produkt
join printer on produkt.model = printer.model
where printer.price = (select max(printer.price) from printer)
union
select produkt.model from produkt
join laptop on produkt.model = laptop.model
where laptop.price = (select max(laptop.price) from laptop);
---25
select printer.maker from printer
join pc on printer.maker = pc.maker
where pc.ram = (select min(pc.ram) from pc)
group by printer.maker, pc.speed
having pc.speed = max(pc.speed);