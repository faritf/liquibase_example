/* Показать самых лучших клиентов (принесших большую прибыль) */

select o.name, t.income
from organization o
    join (
      select c."organizationId", max(c.amount) income
      from contract c
            join payment p on p."contractId" = c.id
      group by 1
      having max(c.amount) = sum(p.amount)
    ) t on t."organizationId" = o.id
order by 2