/* Показать информацию по самым долгим, в плане доставки, направлениям */

select l.city, l.address, avg(s.real_delivery_date - s.real_shipment_date) average_shipment_period
from shipment s
  join location l on l.location_id = s.to_location_id
where s.real_shipment_date is not null and s.real_delivery_date is not null
group by l.location_id
order by 2 desc