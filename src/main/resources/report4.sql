/* Показать самый популярный город доставки */

select l.city
from shipment s
  join location l on l.location_id = s.to_location_id
where s.parent_shipment_id is null
group by l.city
order by count(s.to_location_id) desc
fetch first 1 rows only