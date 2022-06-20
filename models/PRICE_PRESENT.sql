{{ config(materialized='table') }}

select * from {{ source('PUBLIC', 'PRICE') }} where PRICE.DATE >= '2021-01-01'

