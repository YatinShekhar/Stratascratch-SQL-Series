-- https://platform.stratascratch.com/coding/10128-count-the-number-of-movies-that-abigail-breslin-nominated-for-oscar?code_type=3

select count(*) as nominated_movies from oscar_nominees where nominee = 'Abigail Breslin'