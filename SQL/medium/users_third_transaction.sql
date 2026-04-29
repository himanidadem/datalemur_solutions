select user_id,spend,transaction_date from
(SELECT *,dense_rank() over(partition by user_id order by transaction_date) as rk
from transactions)t
where rk=3
