{{
    config(
        materialized='table'
    )
}}

select * from {{ source('HOCKEYDB', 'AWARDSCOACHES') }}
