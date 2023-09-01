select printer.maker from printer
join pc on printer.maker = pc.maker
where pc.ram = (select min(pc.ram) from pc)
group by printer.maker, pc.speed
having pc.speed = max(pc.speed)
