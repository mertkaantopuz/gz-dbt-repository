SELECT
    date_date,
    ROUND((operational_margin - IFNULL(ads_cost,0)),2) AS ads_margin,
    ROUND(avg_basket,2) AS avg_basket,
    operational_margin,
    ads_cost,
    impression,
    click,
    quantity,
    revenue,
    purchase_cost,
    margin,
    shipping_fee,
    log_cost,
    ship_cost
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_days') }}
USING (date_date)
ORDER BY date_date DESC