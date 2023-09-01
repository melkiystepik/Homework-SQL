select pc1.speed, avg(cast(pc1.price as numeric)) as avgprice from pc as pc1 join pc as pc2 on pc1.speed = pc2.speed group by pc1.speed
