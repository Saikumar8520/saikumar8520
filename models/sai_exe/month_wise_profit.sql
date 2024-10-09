{{
    config(
        materialized='table'
    )
}}
with dummy_data as (
    SELECT 1 AS product_id, 'Product A' AS product_name, '2023-01-01' AS month_year, -2000 AS sales, 200 AS            quantity, 50 AS unit_price, 2000 AS profit
    UNION ALL
    SELECT  2, 'Product A', '2023-02-01', 18000, 300, 50, 3000
    UNION ALL
    SELECT  3, 'Product B', '2023-01-01', 22000, 400, 50, 8000
    UNION ALL
    SELECT 4, 'Product B', '2023-02-01', 19000, 360, 50, 7200
    UNION ALL
    SELECT  5, 'Product C', '2023-01-01', 26000, 500, 50, 5000
    UNION ALL
    SELECT 6, 'Product C', '2023-02-01', 24000, 460, 50, 4600
) 
select
product_id :: varchar as product_id , 
product_name :: varchar product_name, 
to_char((to_date(month_year)),'MMMM')::varchar month_year,
sales ::int sales,
quantity :: int quantity,
unit_price :: int unit_price,
 round((((sales - (quantity * unit_price)) / sales) * 100 ),2) :: int AS  profit
from dummy_data