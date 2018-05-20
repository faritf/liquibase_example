/* Показать самый популярный город доставки */

select l.city
from shipment s
      join location l on l.id = s."toLocationId"
group by l.city
order by count(s.id) desc
fetch first 1 rows only