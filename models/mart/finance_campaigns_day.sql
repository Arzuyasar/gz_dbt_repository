{{ config(materialized='view') }}

with sales_margin as (

    select
        date_date,
        quantity,
        revenue,
        purchase_cost,
        margin,
        shipping_fee,
        log_cost,
        ship_cost,
        operational_margin,
        average_basket
    from {{ ref('int_sales_margin') }}

),

ads_daily as (

    select
        date_date,
        sum(ads_cost) as ads_cost,
        sum(impression) as ads_impression,
        sum(click) as ads_clicks
    from {{ ref('int_campaigns') }}
    group by date_date

)

select
    s.date_date as date,

    s.operational_margin - a.ads_cost as ads_margin,

    s.average_basket,
    s.operational_margin,
    a.ads_cost,
    a.ads_impression,
    a.ads_clicks,
    s.quantity,
    s.revenue,
    s.purchase_cost,
    s.margin,
    s.shipping_fee,
    s.log_cost,
    s.ship_cost

from sales_margin s
left join ads_daily a
    on s.date_date = a.date_date
order by date desc
