{{ config(materialized='table') }}
with new_table as (
select * from HOCKEYDB.HOCKEY.ABBREV
)
select * from new_table

--where 