/* Показать информацию по самым долгим, в плане доставки, направлениям */

select l.city, l.address, avg(s."realDeliveryDate" - s."realShipmentDate") average_shipment_period
from shipment s
  join location l on l.id = s."toLocationId"
group by l.id
order by 2 desc