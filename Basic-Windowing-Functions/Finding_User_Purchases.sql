-- https://platform.stratascratch.com/coding/10322-finding-user-purchases?code_type=3

with cte as (
select *, datediff(created_at, lag(created_at, 1) over(partition by user_id order by created_at)) as last_trans  
from amazon_transactions)
select distinct user_id from cte where last_trans <=7