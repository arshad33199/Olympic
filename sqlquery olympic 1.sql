select * from athlete_events
select * from noc_regions


with summer as(
select distinct Games as total_summer_games 
from athlete_events
where Season= 'summer'),
--select * from summer
games as (
select  games as sport,count( distinct Sport) as count_of_sports from athlete_events
where Season='summer'
group by games),

--select * from games

sport as(
select Sport, count(Games) as no_of_games from athlete_events 
group by Sport)
select * from sport


select top 5  Name , Medal from athlete_events
where Medal='gold'
 


 with gold as (
 select distinct city,Medal as gold_medel from athlete_events
where Medal='gold'),
silver as
(select distinct city,Medal as silver_medal from athlete_events
where Medal='silver'),
bronze as (
select distinct city,Medal as bronze_medal from athlete_events
where Medal='bronze')

select g.*,s.silver_medal,b.bronze_medal from
gold g join silver s
on g.city= s.city
join bronze b
on g.city= b.city



select * from (select city,
sum(case when Medal='Gold' then 1 end) as gold_count,
sum(case when Medal='Silver' then 1 end) as silver_count,
sum(case when Medal='Bronze' then 1 end) as bronze_count
from athlete_events
group by city) a
order by gold_count desc ,silver_count desc, bronze_count desc


select team , season , Medal from athlete_events
where Season in ( 'summer' , 'winter') 



select * from(select Name,
count(case when Medal='gold' then 1 end) as gold_medal,
count(case when Medal='Siver' then 1 end) as silver_medal,
count(case when Medal='bronze' then 1 end) as bronze_medal
from athlete_events
group by Name) a



select top 5 name, Medal as gold_medal from athlete_events
where  Medal='gold'


select *from athlete_events as A
full outer join noc_regions as N
on A.NOC=N.NOC
 

SELECT MAX(AGE) AS max_age FROM athlete_events 


 select name , age ,medal from athlete_events
 where age between 25 and 30  