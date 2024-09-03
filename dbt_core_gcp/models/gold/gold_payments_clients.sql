{{
  config(
    materialized='table',
  )
}}


with clients as (
  select * from {{source('demo_bronze', 'clients')}}
),
payments as (
  select * from {{ref('silver_payments')}}
),
final as (
    select p.transaction_id
    , p.contract_id
    , p.client_id 
    , p.transaction_date  
    , p.payment_amt  
    , p.payment_code
    , c.entity_type
    , c.entity_year_established
  from payments p 
  LEFT JOIN clients c on p.client_id = c.client_id
)
select * from final

