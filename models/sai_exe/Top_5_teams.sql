{{
    config(
        materialized='table'
    )
}}

with sql1 as (
select 
    b.year  year,
    a.name Team_name,
    sum(b.g) as No_of_goals 
from  {{ source('HOCKEYDB', 'TEAMS') }} a
join   {{ source('HOCKEYDB', 'SCORING') }} b
on a.tmid = b.tmid
and a.year=b.year
where b.year=2011
group by 1,2
)
select 
    Team_name::varchar  as Team_name,
    year::int as year ,
    No_of_goals ::int No_of_goals
 from sql1
qualify  row_number()over(partition by year order by No_of_goals desc) <=5
order by No_of_goals desc