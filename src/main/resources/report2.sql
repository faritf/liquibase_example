/* Показать самых лучших клиентов (принесших большую прибыль) */

select o.name, t.income
from organization o
  join (
         select c.organization_id, max(c.amount) income
         from contract c
           join payment p using(contract_id)
         group by 1
         having max(c.amount) = sum(p.amount)
       ) t using(organization_id)
order by 2 desc