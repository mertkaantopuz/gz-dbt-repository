SELECT
    orders_id,
    date_date,
    round(Sum(revenue),2) as revenue,
    round(Sum(quantity),2) as quantity,
    round(Sum(maliyet),2) as maliyet,
    round(Sum(margin),2) as margin
from {{ref("int_sales_margin")}}
group by orders_id,date_date
order by date_date desc