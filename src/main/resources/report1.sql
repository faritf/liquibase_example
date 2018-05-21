/*
Показать всех должников (чей товар доставлен, а сумма по договору не совпадает с суммой по платежам)
по договорам с сортировкой по максимальному долгу
*/

select o.name, t.debt
from organization o
  join (
         select c.organization_id, max(c.amount) - sum(p.amount) debt
         from contract c
           join payment p using(contract_id)
         where c.organization_id not in (select organisation_id
                                         from shipment
                                         where real_delivery_date is null)
         group by 1
         having max(c.amount) <> sum(p.amount)
       ) t using(organization_id)
order by 2 desc