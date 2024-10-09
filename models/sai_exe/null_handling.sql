{{
    config(
        materialized='table'
    )
}}

select  
playerid :: VARCHAR AS PLAYERID, 
year :: INT AS YEAR, 
(nvl(POS,'NA'))::VARCHAR POS,
(nvl(GP,'0')):: INT GP
 from  {{ source('HOCKEYDB', 'SCORING') }}
 where pos is null or gp is null