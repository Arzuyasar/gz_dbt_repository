with daily_campaigns as (

    select
        date_date,
        sum(ads_cost) as total_ads_cost,
        sum(impression) as total_impression,
        sum(click) as total_click
    from {{ ref('int_campaigns') }}
    group by date_date

)

select
    date_date,
    total_ads_cost,
    total_impression,
    total_click
from daily_campaigns
order by date_date desc
