-- https://platform.stratascratch.com/coding/10303-top-percentile-fraud?code_type=3

with cte as (
select *, 
row_number() over(partition by state order by fraud_score desc) as rn,
count(*) over(partition by state) as total_claims
from fraud_score)
select policy_num, state, claim_cost, fraud_score
from cte where floor((rn/total_claims)*100) <= 5