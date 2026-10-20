# Investigation and corrections

Name / student ID: Arnould Leveque de Vilmorin

## Q3 — Subscription snapshot

Problem identified: A join that had to be more specific 

Explanation: We asked for the subscriptions monthly and integrate the users who had no sessions. We thus had to do a left join on users so that we can see all the users, even with the one who had no sessions

Correction and reasoning: did a left join between users and sessions (also a left join with subscriptions but result did not change  + added a  line in which the subscription had to be active on the specified date => "and su.status = 'active' " 

## Q4 — Signup population

Problem identified and explanation:

Correction and reasoning:

## Q5A — Counting

Problem identified and explanation: With the use of count(*), if a user do not have any sessions, it counts as NULL which doesn't give us the result we want.

Correction and reasoning:
 I changed inside the the count into a count (user_id), that will also count the users with 0 sessions.
## Q5B — Previous session

Problem identified and explanation: The dates were not correctly placed and that's why the LAG did not indicate what we wanted. It was missing an order by inside the lab function which did not segment it well inside the group with the partition by 

Correction and reasoning: add a order by session_id inside the lag()

## Q5C — Design recommendation

Change and concrete SQL (or reference to my SQL file):

Reasoning: I would create either a view or a function to help us see more about a specific row even if data is constently changing

Cost or limitation:

## Q6 — Visual critique

| Issue (exactly three) | Consequence for interpretation | Proposed correction |
|---|---|---|
| 1 We do not particularaly see the change  
of the users | | |I would use a diagramm where we see the impact per month that follows a line
| 2 | | |
| 3 | | |


Changes made in the saved workbook:

## Q7 — Metric and grain

Source row grain:

Problem identified and explanation:

Corrected calculation:

One-sentence interpretation of my corrected value, with unit, population and period:

## Bonus — Optional

Why user_id must permit multiple subscription rows:

## Submission check

- [ ] SQL saved in sql/student_answers.sql.
- [ ] Explanations above completed.
- [ ] submission/corrected_workbook.twbx saved and reopened.
