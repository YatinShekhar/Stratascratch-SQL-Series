-- https://platform.stratascratch.com/coding/9632-host-popularity-rental-prices?code_type=3

with cte as 
(select *, case when number_of_reviews = 0 then 'New'
               when number_of_reviews <= 5 then 'Rising'
               when number_of_reviews <= 15 then 'Trending Up'
               when number_of_reviews <= 40 then 'Popular'
               else 'Hot' end as 'Host_Popularity_Rating'
from airbnb_host_searches)
, cte2 as (
select Host_Popularity_Rating, price, room_type, host_since, number_of_reviews, zipcode, min(price) as minimum_price,
avg(price) as average_price, max(price) as maximum_price
from cte
group by 1, 2, 3, 4, 5, 6)
select Host_Popularity_Rating , min(minimum_price) as min_price, avg(average_price) as avg_price, max(maximum_price) as max_price
from cte2
group by 1