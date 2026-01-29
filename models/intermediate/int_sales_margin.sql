SELECT 
  s.date_date,
  s.orders_id,
  s.pdt_id,s.revenue,
  s.quantity,
  p.purchase_price,
  Round(CAST(p.purchase_price as FLOAT64)*s.quantity,2) as maliyet,
  ROUND(s.revenue-(CAST(p.purchase_price as FLOAT64)*s.quantity),2) as margin
FROM {{ref("stg_raw__sales")}} as s
left join {{ref("stg_raw__product")}} as p
on s.pdt_id=p.products_id