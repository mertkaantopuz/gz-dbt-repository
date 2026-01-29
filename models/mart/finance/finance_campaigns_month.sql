SELECT
    EXTRACT(MONTH FROM date_date) as datemonth
    ,Sum(margin) as ads_margin
    ,Sum(avg_basket) avg_basket
    ,Sum(operational_margin) as operational_margin
    ,Sum(ads_cost) as ads_cost
    ,Sum(impression) as impression
    ,Sum(click) as click
    ,Sum(quantity) as quantity
    ,Sum(revenue) as revenue
    ,Sum(purchase_cost) as purchase_cost
    ,Sum(margin) as margin
    ,Sum(shipping_fee) as shipping_fee
    ,Sum(log_cost) as log_cost
    ,Sum(ship_cost) as ship_cost
FROM {{ ref('int_campaigns_day') }}
FULL OUTER JOIN {{ ref('finance_days') }}
USING (date_date)
group by datemonth

