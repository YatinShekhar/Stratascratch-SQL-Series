-- https://platform.stratascratch.com/coding/10284-popularity-percentage?code_type=3

with cte as (
select user1 as user from facebook_friends 
union all
select user2 from facebook_friends)
select user , count(*)* 100/(select count(distinct(user)) from cte) 
from cte 
group by 1
order by 1