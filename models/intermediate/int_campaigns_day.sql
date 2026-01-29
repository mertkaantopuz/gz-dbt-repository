SELECT
    date_date,
    Sum(ads_cost) as ads_cost,
    Sum(impression) as impression,
    Sum(click) as click,   
from {{ref("int_campaigns")}}
group by date_date
order by date_date desc