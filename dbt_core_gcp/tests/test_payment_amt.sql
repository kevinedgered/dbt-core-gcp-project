Select * 
From {{ref('silver_payments')}}
Where CAST(REPLACE(payment_amt, '$', '') AS FLOAT64) < 0