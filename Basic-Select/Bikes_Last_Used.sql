-- https://platform.stratascratch.com/coding/10176-bikes-last-used?code_type=3

select bike_number , max(end_time) as last_use
from dc_bikeshare_q1_2012
group by 1
order by 2 desc