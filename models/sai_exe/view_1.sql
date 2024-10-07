{{
    config(
        materialized='view'
    )
}}

select * from {{ source('HOCKEYDB', 'ABBREV') }}
