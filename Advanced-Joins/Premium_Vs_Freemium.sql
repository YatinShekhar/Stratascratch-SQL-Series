-- https://platform.stratascratch.com/coding/10300-premium-vs-freemium?code_type=3

select date, sum(case when paying_customer = 'no' then downloads end) as non_paying_users , 
sum(case when paying_customer = 'yes' then downloads end) as paying_users
from ms_download_facts mdf inner join ms_user_dimension mud
using(user_id) inner join ms_acc_dimension 
using(acc_id)
group by 1
having non_paying_users > paying_users
order by 1