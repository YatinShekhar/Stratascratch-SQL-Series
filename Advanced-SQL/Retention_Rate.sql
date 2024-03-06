-- https://platform.stratascratch.com/coding/2053-retention-rate?code_type=3

with cte as 
(select account_id, user_id, date_format(date, '%Y-%m') as yr_mon
from sf_events
group by 1,2,3)
, cte2 as 
(select *, lead(yr_mon) over(partition by account_id, user_id order by yr_mon) as ld 
from cte)
, cte3 as (
select account_id, sum(case when yr_mon = '2020-12' and ld is not null then 1 end)/
sum(case when yr_mon = '2020-12' then 1 end) as dec_retention,
sum(case when yr_mon = '2021-01' and ld is not null then 1 end)/
sum(case when yr_mon = '2021-01' then 1 end) as jan_retention
from cte2
group by 1)
select account_id, coalesce(jan_retention/dec_retention,0)
from cte3