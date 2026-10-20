-- Name / student ID: Arnould Leveque de Vilmorin

-- Q1. Write one SELECT below.

-- Q2. Write one SELECT below.

-- Q3. Corrected SELECT below; explanation in submission/answers.md.

-- Q4. Corrected SELECT below; explanation in submission/answers.md.

-- Q5A. Corrected SELECT below; explanation in submission/answers.md.

-- Q5B. Corrected SELECT below; explanation in submission/answers.md.

-- Q5C. Proposed DDL, if applicable, below; reasoning in answers.md.

-- BONUS (optional). ALTER the existing subscriptions_bonus table below.
-- Do not reset or replace the table. Run the bonus separately from your SELECTs.

--Q1. September audience
-- How many distinct registered users had at least one session 
-- **starting on or after 1 September 2026 and before 1 October 2026**? 
-- Activity is defined by session start, not event time.
-- Return one row with column `active_users`. Write the query in `sql/student_answers.sql`.
select count (distinct u.user_id) as active_users
from users as u
join sessions as s
on u.user_id = s.user_id
where s.session_start >= DATE '2026-09-01' 
and s.session_start <= date '2026-10-01';

-- Q2. Category engagement
-- For interactions with `event_time` 
-- **on or after 1 January 2026 and before 1 January 2027**, 
-- return content categories with **strictly more than 100,000 total watched seconds**, highest total first. 
-- Include all event types; sum their recorded `watch_seconds`.
-- Return `category`, `total_watch_seconds`. Write the query in the SQL answers file.

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



select sum(watch_seconds) as total_watch_seconds
					from events)



