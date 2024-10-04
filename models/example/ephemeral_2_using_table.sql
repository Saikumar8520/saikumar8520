{{
    config(
        materialized='table'
    )
}}
WITH aggregated_data AS (
    SELECT
        TYPE,
        max(CODE) AS avg_metric
    FROM {{ ref('ephemeral_model') }}
    GROUP BY TYPE
)

SELECT *
FROM aggregated_data