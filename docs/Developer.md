# dbt-infuse-finance
1. clone our dbt demo project

2. install project requirements, including `dbt-snowflake`, `snowflake-sqlalchemy` and `piperider` itself.
    
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
    piperider init # based on the current dbt project and no config required
    piperider debug
    piperider run
    piperider generate-report
    ```

5. edit dbt modeling as your requirement

6. profile and generate report for our new model
    ```bash
    dbt run --select PRICE_PRESENT
    
    piperider run --table PRICE_PRESENT --generate-report
    ```
    
7. compare two reports locally with interactive terminal UI
    ```bash
    piperider compare-report  
    ```