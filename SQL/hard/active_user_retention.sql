SELECT EXTRACT(month from event_date) as month, count(distinct user_id) as monthly_active_users
from user_actions 
where to_char(event_date,'YYYY-MM')='2022-07' and user_id in
(select user_id
from user_actions
where to_char(event_date,'YYYY-MM')='2022-06') 
group by EXTRACT(month from event_date) 
