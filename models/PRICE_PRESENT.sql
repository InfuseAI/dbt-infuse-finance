{{ config(materialized='table') }}

select * from {{ source('PUBLIC', 'PRICE') }} where PRICE.DATE >= '2021-01-01' and PRICE.DATE < '2022-04-01'

