/*
Показать всех должников (чей товар доставлен, а сумма по договору не совпадает с суммой по платежам)
по договорам с сортировкой по максимальному долгу
*/

select o.name, t.debt
from organization o
    join (
      select
        c."organizationId",
        max(c.amount) - sum(p.amount) debt
      from contract c
        join payment p on p."contractId" = c.id
      where c."organizationId" not in (select "organisationId"
                                       from shipment
                                       where "realDeliveryDate" is null)
      group by 1
      having max(c.amount) <> sum(p.amount)
    ) t on t."organizationId" = o.id
order by 2 desc
