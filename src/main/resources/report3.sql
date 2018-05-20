/* Показать самый популярный продукт доставки и количество за месяц */

select p.name, sum(si.quantity) total_amount
from shipment s
      join shipment_item si on si."shipmentId" = s.id
      join product p on p.id = si."productId"
where trim(to_char(s."realShipmentDate", 'MONTH')) = 'MAY'
group by p.name
order by 2
fetch first 1 rows only