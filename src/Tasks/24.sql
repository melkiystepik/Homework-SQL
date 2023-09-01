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
where laptop.price = (select max(laptop.price) from laptop)