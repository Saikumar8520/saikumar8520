{{
    config(
        materialized='view'
    )
}}
select
COACHID::varchar as COACHID,
AWARD:: varchar as AWARD,
YEAR:: varchar as YEAR,
LGID :: varchar(3) LGID
from {{ source('HOCKEYDB', 'AWARDSCOACHES') }}
where year>2000

