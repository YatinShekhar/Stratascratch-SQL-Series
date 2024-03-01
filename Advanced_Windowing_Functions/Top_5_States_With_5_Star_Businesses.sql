-- https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=3

with cte as (select state, count(*) as 5_star_businesses 
from yelp_business
where stars = 5
group by 1
order by 2 desc, 1
limit 5)
select * from 
(select state, count(*) as 5_star_businesses
from yelp_business
where stars = 5
group by 1
order by 2 desc, 1) a where 5_star_businesses >= (select min(5_star_businesses) from cte)