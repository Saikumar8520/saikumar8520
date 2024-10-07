{{
    config(
        materialized='ephemeral'
    )
}}
WITH source_data AS (
    SELECT
        TYPE::VARCHAR as type,
        CODE::VARCHAR(20) as code,
        FULLNAME::VARCHAR FULLNAME
    FROM {{ source('HOCKEYDB', 'ABBREV') }}
    WHERE TYPE IN ('Division', 'Playoffs')
)

SELECT *
FROM source_data

