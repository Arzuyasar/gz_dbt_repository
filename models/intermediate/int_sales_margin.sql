SELECT
    s.pdt_id AS products_id,
    s.date_date,
    s.orders_id,
    s.revenue,
    s.quantity,
    CAST(p.purchase_price AS FLOAT64) AS purchase_price,
    ROUND(s.quantity * CAST(p.purchase_price AS FLOAT64), 2) AS purchase_cost,
    ROUND(s.revenue - (s.quantity * CAST(p.purchase_price AS FLOAT64)), 2) AS margin
FROM {{ ref("stg_gz_raw_data__raw_gz_sales") }} s
LEFT JOIN {{ ref("stg_gz_raw_data__raw_gz_product") }} p
    ON s.pdt_id = p.products_id
