-- https://platform.stratascratch.com/coding/10352-users-by-avg-session-time?code_type=3

with cte as (
select user_id , 
max(case when action = "page_load" then timestamp end) as page_load,
min(case when action = "page_exit" then timestamp end) as page_exit 
from facebook_web_log 
where action in ("page_load", "page_exit")
group by user_id , date_format(timestamp, '%Y-%m-%d'))
select user_id , avg(timestampdiff(second, page_load, page_exit)) as t_diff
from cte 
group by user_id
having t_diff is not null

-- timediff returns the result in its actual format
-- select timediff('2019-08-07 12:23:34', '2019-08-07 13:23:11') = '00:59:37'
-- timestampdiff returns the result in the unit we specify
-- select timestampdiff(second, '2019-08-07 12:23:34', '2019-08-07 13:23:11') = 3577

