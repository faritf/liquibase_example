/* Показать самый популярный продукт доставки и количество за месяц */

select p.name, sum(si.quantity) total_amount
from shipment s
  join shipment_item si using(shipment_id)
  join product p using(product_id)
where trim(to_char(s.real_shipment_date, 'MONTH')) = 'MAY'
group by p.name
order by 2 desc
fetch first 1 rows only