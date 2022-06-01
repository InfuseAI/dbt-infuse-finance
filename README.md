# dbt-infuse-finance
This existed dbt demo project will help you explore `piperider-cli` journey.

1. fork the dbt demo project
2. install `dbt` project requirement
    
    ```bash
    pip install -r requirements.txt
    ```
    
3. run following `dbt` command
    
    ```bash
    init # fill out data warehouse credential
    run
    docs generate
    ```
    
4. install `piperider-cli`
    
    ```bash
    pip install piperider-cli
    ```
    
5. install `snowflake-sqlalchemy` to connect to snowflake
    ```bash
    pip install snowflake-sqlalchemy
    ```
    
6. run following `piperider-cli` command in order
    
    ```bash
    init # based on the current dbt project and no config required
    debug
    run
    generate-report
    ```
    
7. adjust modeling
    
    original version
    ```sql
    {{ config(materialized='table') }}
    
    select * from {{ source('PUBLIC', 'PRICE') }} where PRICE.DATE >= '2021-01-01' and PRICE.DATE < '2022-04-01'
    ```
    
    new version
    ```sql
    {{ config(materialized='table') }}
    
    select * from {{ source('PUBLIC', 'PRICE') }} where PRICE.DATE >= '2021-01-01'
    ```
    
8. update our new model
    ```bash
    dbt run --select PRICE_PRESENT
    
    piperider-cli run --table PRICE_PRESENT --generate-report
    ```
    
10. compare two report locally
    ```bash
    piperider-cli compare-report  
    ```
11. create a PR
12. CI will be triggered
