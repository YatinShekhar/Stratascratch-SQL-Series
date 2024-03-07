-- https://platform.stratascratch.com/coding/10285-acceptance-rate-by-date?code_type=3

with cte as 
(select fb1.*, fb2.date as receive_date, fb2.action as act 
from fb_friend_requests fb1 
left join fb_friend_requests fb2 
on fb1.user_id_sender = fb2.user_id_sender
and fb1.user_id_receiver = fb2.user_id_receiver and fb1.date < fb2.date
where fb1.action = 'sent')
select date, count(act)/count(action) as fr_acc_rate
from cte
group by 1
order by 1