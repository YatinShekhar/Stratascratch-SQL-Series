-- https://platform.stratascratch.com/coding/10353-workers-with-the-highest-salaries?code_type=3

select worker_title
from worker w inner join title t
on w.worker_id = t.worker_ref_id
where salary = (select max(salary) from worker)