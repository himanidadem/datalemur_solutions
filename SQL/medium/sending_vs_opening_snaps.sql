SELECT ag.age_bucket, 
round(sum(case when act.activity_type='send' then act.time_spent else 0 end)*100.0/
NULLIF(sum(case when act.activity_type in ('open','send') then act.time_spent end),0),2) as send_perc,
round(sum(case when act.activity_type='open' then act.time_spent else 0 end)*100.0/
NULLIF(sum(case when act.activity_type in ('open','send') then act.time_spent end),0),2) as open_perc
from activities as act
left join age_breakdown as ag
on act.user_id=ag.user_id
group by ag.age_bucket
