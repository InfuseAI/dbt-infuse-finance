# Continuous Integration


This section is going to share how we integrate PipeRider action into a dbt project.
[PipeRider-Action](https://github.com/marketplace/actions/piperider-cli-action) is our 
CI tool based on GitHub actions.

Here is our CI workflow arrangement in this project:
https://github.com/InfuseAI/dbt-infuse-finance/blob/main/.github/workflows/ci.yml

Because we would like to integrate with a dbt project, we need a few steps before we run PiperRider Action.

1. We need to provide a dbt 
[profiles.yml](https://github.com/InfuseAI/dbt-infuse-finance/blob/main/profiles.yml), which lists the credential we need.
**Be cautious, please don't put your real credential into source control.**
We can just leverage GitHub [encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).
Also, it's required to provide the `profiles-dir` when executing dbt.

2. Running `dbt docs generate` in advance is essential for PipeRider.
PipeRider would refer artifacts from dbt.

3. (Optional) We can also integrate a Slack notification with [Webhook](https://github.com/slackapi/slack-github-action).
PipeRider outputs its exit status and execution result.


Here you're all set now! Then creating a PR will trigger the CI workflow, and you will get a result similar as
this example [PR](https://github.com/InfuseAI/dbt-infuse-finance/pull/10).

1. clone the dbt demo project

2. adjust dbt modeling `models/PRICE_PRESENT.sql`

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

3. create a PR to this repo and the CI workflow, `piperider-action`, will be triggered:
    - the profiling result will be attached to PR comment.
   ![image info](./assets/piperider-action-comment.png)
    - reports will be uploaded as CI's artifacts.
   ![image info](./assets/piperider-action-artifacts.png)
