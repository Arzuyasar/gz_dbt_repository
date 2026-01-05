with campaigns as (

    select
       
    from {{ ref('stg_gz_raw_data__raw_gz_adwords') }}

    union all

    select
      
    from {{ ref('stg_gz_raw_data__raw_gz_bing') }}

    union all

    select
      
    from {{ ref('stg_gz_raw_data__raw_gz_facebook') }}

    union all

    select
       
    from {{ ref('stg_gz_raw_data__raw_gz_criteo') }}

)

select *
from campaigns
