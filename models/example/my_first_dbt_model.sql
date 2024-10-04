
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id
    union all
<<<<<<< HEAD
    select null as id
=======
<<<<<<< HEAD
    select null as id
=======
<<<<<<< HEAD
    select 12 as id
=======
<<<<<<< HEAD
    select null as id
=======
<<<<<<< HEAD
    select null as id
=======
    select 2 as id
>>>>>>> d10f8f9ed8368c6b97f75c77f6db872211433d01
>>>>>>> 872123fdf57b38342dc6df28d4a5280a7e8eecb8
>>>>>>> 561ffc99453a3fe28e1ef3e5637b605e66fe4058
>>>>>>> f7e31b89df9bf9e60e0c4b967763491840119062

)

select *
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

<<<<<<< HEAD

=======
-- where id is not null
>>>>>>> f7e31b89df9bf9e60e0c4b967763491840119062
