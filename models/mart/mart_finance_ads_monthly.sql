{{ config(materialized='view') }}

with sales_monthly as (

    select
        format_date('%Y-%m', date_date) as datemonth,
        sum(quantity) as quantity,
        sum(revenue) as revenue,
        sum(purchase_cost) as purchase_cost,
        sum(margin) as margin,
        sum(shipping_fee) as shipping_fee,
        sum(log_cost) as log_cost,
        sum(ship_cost) as ship_cost,
        sum(operational_margin) as operational_margin,
        avg(average_basket) as average_basket
    from {{ ref('int_sales_margin') }}
    group by datemonth

),

ads_monthly as (

    select
        format_date('%Y-%m', date_date) as datemonth,
        sum(ads_cost) as ads_cost,
        sum(impression) as ads_impression,
        sum(click) as ads_clicks
    from {{ ref('int_campaigns') }}
    group by datemonth

)

select
    s.datemonth,

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

from sales_monthly s
left join ads_monthly a
    using (datemonth)
order by datemonth desc
