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
order by pc1.model