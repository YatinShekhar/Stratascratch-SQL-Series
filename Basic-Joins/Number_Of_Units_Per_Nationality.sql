-- https://platform.stratascratch.com/coding/10156-number-of-units-per-nationality?code_type=3

select ah.nationality, count(distinct unit_id ) as no_of_apartments
from airbnb_units au inner join airbnb_hosts ah
using(host_id)
where unit_type = 'Apartment' and age < 30
group by 1