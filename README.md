# dbt-infuse-finance

1. Install dependency
```
cd dbt/
pip install -r requirements.txt
```

2. Setup dbt environment in the folder
```
dbt init
```

configure below settings
```
account:
type:
user:
password:
database:
role:
schema:
warehouse:
threads:
```
the configuration will be written into the `~/.dbt/profiles.yml` by default

3. Run the dbt project
```
dbt run
```

4. Test the source freshness and run test
```
dbt source freshness
dbt test
```

5. Generate the document
```
dbt docs generate
dbt docs serve
```
