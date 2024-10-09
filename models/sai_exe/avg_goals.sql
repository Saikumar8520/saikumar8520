
select a.name Team_name,
       round(avg(b.g),2) as No_of_goals 
    from  {{ source('HOCKEYDB', 'TEAMS') }} a
    join   {{ source('HOCKEYDB', 'SCORING') }} b
    on a.tmid = b.tmid
    group by 1