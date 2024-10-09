{{
    config(
        materialized='table'
    )
}}

select * from {{ source('TRAINING', 'CUSTOMERS_DATA') }}