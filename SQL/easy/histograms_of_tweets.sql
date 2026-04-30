with counts as (SELECT user_id, count(*) as tweet_bucket
FROM tweets
where EXTRACT(YEAR FROM tweet_date)='2022'
GROUP BY user_id)

select tweet_bucket, count(*) as users_num
from count
group by tweet_bucket
