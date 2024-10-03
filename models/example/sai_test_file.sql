{{config(materialized='table')}}


select a.coachid,a.year,g,w,l,t,b.year award_year from  {{source('HOCKEYDB_S','COACHES')}} a
join {{source('HOCKEYDB_S','AWARDSCOACHES')}} b
on a.coachid=b.coachid