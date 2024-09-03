{{
  config(
    materialized='table'
  )
}}


select transaction_id
  , contract_id
  , client_id
  , timestamp_seconds(transaction_date) as transaction_date 
  , CONCAT('$',ROUND(SAFE_DIVIDE(payment_amt, 100),2)) as payment_amt  
  , payment_code
from {{source('demo_bronze','payments')}}


