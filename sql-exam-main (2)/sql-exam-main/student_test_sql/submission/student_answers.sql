-- Name / student ID: Arnould Leveque de Vilmorin

-- Q1. Write one SELECT below.
select count (distinct u.user_id) as active_users
from users as u
join sessions as s
on u.user_id = s.user_id
where s.session_start >= DATE '2026-09-01' 
and s.session_start <= date '2026-10-01';

-- Q2. Write one SELECT below.
with watch_time as (select c.category, sum(e.watch_seconds) as total_watch_seconds
					from events as e
					join content as c
					on e.content_id = c.content_id
					where e.event_time >= DATE '2026-01-01'
					and e.event_time <= DATE '2027-01-01'
					group by c.category)
select category, total_watch_seconds
from watch_time
where total_watch_seconds > 100000
order by total_watch_seconds desc;

-- Q3. Corrected SELECT below; explanation in submission/answers.md.
SELECT u.country, SUM(su.monthly_price) AS monthly_subscription_value
FROM users u
left JOIN subscriptions su ON su.user_id = u.user_id
left JOIN sessions s ON s.user_id = u.user_id
WHERE su.start_date = DATE '2026-09-01'
  AND (su.end_date IS NULL OR su.end_date > DATE '2026-09-01')
and su.status = 'active'
GROUP BY u.country
ORDER BY u.country;

-- Q4. Corrected SELECT below; explanation in submission/answers.md.

-- Q5A. Corrected SELECT below; explanation in submission/answers.md.
SELECT u.user_id, COUNT(u.user_id) AS session_count
FROM users u left JOIN sessions s ON s.user_id = u.user_id
GROUP BY u.user_id
ORDER BY u.user_id;
-- Q5B. Corrected SELECT below; explanation in submission/answers.md.
SELECT session_id, user_id, session_start,
       LAG(session_start) OVER (PARTITION BY user_id order by session_id) AS previous_session
FROM sessions;

-- Q5C. Proposed DDL, if applicable, below; reasoning in answers.md.
create SELECT * 
FROM sessions 
WHERE user_id = '18432';
-- BONUS (optional). ALTER the existing subscriptions_bonus table below.
-- Do not reset or replace the table. Run the bonus separately from your SELECTs.

