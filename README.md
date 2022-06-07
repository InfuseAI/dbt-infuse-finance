# dbt-infuse-finance
This existed dbt demo project will help you explore `piperider-cli` journey.

1. fork the dbt demo project

2. install project requirements, including `dbt-snowflake`, `snowflake-sqlalchemy` and `piperider-cli` itself.
    
    ```bash
    pip install -r requirements.txt
    ```
    
3. run following `dbt` commands
    
    ```bash
    dbt init # fill out data warehouse credential
    dbt run
    dbt docs generate
    ```
    
4. run following `piperider-cli` command in order
    
    ```bash
    piperider-cli init # based on the current dbt project and no config required
    piperider-cli debug
    piperider-cli run
    piperider-cli generate-report
    ```
    
5. adjust dbt modeling `models/PRICE_PRESENT.sql`
    
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
    
6. profile and generate report for our new model
    ```bash
    dbt run --select PRICE_PRESENT
    
    piperider-cli run --table PRICE_PRESENT --generate-report
    ```
    
7. compare two reports locally with interactive termianl UI
    ```bash
    piperider-cli compare-report  
    ```
    
8. create a PR to this repo to trigger the CI workflow
    - the profiling result will be attached to PR comment.
    - reports will be uploaded as CI's artifaces.
