select distinct pc.maker from pc where pc.maker not in (select maker from laptop)