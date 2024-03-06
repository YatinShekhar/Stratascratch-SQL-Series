-- https://platform.stratascratch.com/coding/10304-risky-projects?code_type=3

with cte as (
select lp.title, lp.budget, 
ceiling(sum((salary/365) * datediff(end_date,start_date))) as emp_exp 
from linkedin_projects lp
inner join linkedin_emp_projects lep on lp.id = lep.project_id
inner join linkedin_employees le on lep.emp_id = le.id
group by lp.id, lp.title, lp.budget)
select * from cte where emp_exp > budget