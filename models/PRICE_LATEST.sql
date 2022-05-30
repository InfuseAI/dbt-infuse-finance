{{ config(materialized='table') }}

with A as (
    select max(DATE) as DATE,SYMBOL from {{ source('PUBLIC', 'PRICE') }} GROUP BY SYMBOL
)

select PRICE.* from A
join PRICE on A.DATE = PRICE.DATE and A.SYMBOL = PRICE.SYMBOL