-- https://platform.stratascratch.com/coding/10319-monthly-percentage-difference?code_type=3

with cte as (
select date_format(created_at, '%Y-%m') as yr_mon, sum(value) as cur_mon_rev
from sf_transactions
group by 1
order by 1)
, cte2 as (
select * , lag(cur_mon_rev,1) over(order by yr_mon) as prev_mon_rev
from cte)
select yr_mon, ((cur_mon_rev-prev_mon_rev)/prev_mon_rev)*100.00 as per_change
from cte2
order by 1

