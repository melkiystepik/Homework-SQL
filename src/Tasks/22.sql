select speed, avg(cast(price as numeric)) from pc where speed > 600 group by speed