select model, price from pc where maker = 'Sony'
union
select model, price from laptop where maker = 'Sony'
union
select model, price from printer where maker = 'Sony';
