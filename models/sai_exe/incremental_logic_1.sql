
{{
    config(
        materialized='incremental',
        unique_key=['coachid', 'year', 'stint']
    )
}}

with source_data as (
    select *
    from {{ source('HOCKEYDB', 'COACHES') }}
),

incremental_data as (
    select
        s.*
    from source_data s
    {% if is_incremental() %}
    left join {{ this }} t
    on s.coachid = t.coachid and s.year = t.year and s.stint = t.stint
    where t.coachid is null
    {% endif %}
)

select *
from incremental_data
