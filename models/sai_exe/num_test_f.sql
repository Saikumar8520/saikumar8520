
{{
    config(
        materialized='table'
    )
}}
with recursive numbers as (
    select 1 as num
    union all
    select num + 1
    from numbers
    where num < 1000  -- Adjust this limit as needed
)
select num
from numbers