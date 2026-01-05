with source as (

    select *
    from {{ source('gz_raw_data', 'raw_gz_adwords') }}

),

cleaned as (

    select
        date_date,
        paid_source,
        campaign_key,
        camPGN_name as campaign_name,

        cast(
            regexp_replace(ads_cost, r'[^0-9.]', '')
            as float64
        ) as ads_cost,

        cast(impression as int64) as impression,
        cast(click as int64) as click

    from source

)

select * from cleaned