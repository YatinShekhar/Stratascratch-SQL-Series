-- https://platform.stratascratch.com/coding/10308-salaries-differences?code_type=3

select abs(max(case when department = "marketing" then salary end) - 
max(case when department = "engineering" then salary end)) as salary_diff
from db_employee e inner join db_dept d
on e.department_id = d.id