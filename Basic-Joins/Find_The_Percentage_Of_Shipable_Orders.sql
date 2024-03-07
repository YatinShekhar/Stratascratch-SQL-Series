-- https://platform.stratascratch.com/coding/10090-find-the-percentage-of-shipable-orders?code_type=3

select sum(case when address is not null then 1 end)*100/count(*) as shipable_orders from orders o
inner join customers c 
on o.cust_id = c.id