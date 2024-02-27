-- https://platform.stratascratch.com/coding/10351-activity-rank?code_type=3s

with cte as (
select from_user, count(*) as total_emails 
from google_gmail_emails
group by from_user)
select from_user, total_emails, row_number() over(order by total_emails desc, from_user) as rn
from cte 