-- https://platform.stratascratch.com/coding/10061-popularity-of-hack?code_type=3

select location, avg(popularity) as avg_popularity
from facebook_hack_survey fhs inner join facebook_employees fe
on fhs.employee_id = fe.id
group by location