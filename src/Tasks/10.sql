select model, price from printer where price = (select MAX(price) from printer)