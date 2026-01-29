with orders_per_day as (SELECT
    date_date,
    Count(distinct orders_id) as nb_transaction,
    ROUND(Sum(revenue),2) as revenue,
    ROUND(Sum(margin),2) as margin,
    ROUND(Sum(operational_margin),2) as operational_margin,
    ROUND(Sum(maliyet),2) as purchase_cost,
    ROUND(Sum(shipping_fee),2) as shipping_fee,
    ROUND(Sum(ship_cost),2) as ship_cost,
    ROUND(Sum(log_cost),2) as log_cost,
    Sum(quantity) as quantity
from {{ref("int_orders_operational")}}
group by date_date
order by date_date
)

SELECT
    date_date,revenue,margin,operational_margin,purchase_cost,shipping_fee,ship_cost,log_cost,quantity,
    ROUND(revenue/NULLIF(nb_transaction,0),2) as avg_basket
from orders_per_day
