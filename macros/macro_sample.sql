-- models/sample_model.sql

with source_data as (
    select *
    from {{ source('HOCKEYDB', 'TEAMS') }}
)

select 
    *, 
    '{{ get_database_schema('my_schema') }}' as database_schema  -- Using the extended macro
from source_data
