{{
    config(
        materialized='table'
    )
}}

select
TYPE::VARCHAR as TYPE,
CODE::VARCHAR(20) as CODE,
FULLNAME:: VARCHAR as FULLNAME,
CURRENT_DATE() AS CREATED_DATE,
'ETL' AS CREATED_BY
from {{ source('HOCKEYDB', 'ABBREV') }}
where type in ('Division','Playoffs')