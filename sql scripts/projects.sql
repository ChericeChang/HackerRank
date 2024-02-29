/*
SQL Project Planning

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day for each row in the table.
If the End_Date of the tasks are consecutive, then they are part of the same project. Samantha is interested in finding the total number of different projects completed.
Write a query to output the start and end dates of projects listed by the number of days it took to complete the project in ascending order. If there is more than one project that have the same number of completion days, then order by the start date of the project.

*/
select t1.start_date, t2.end_date
from 
    (select distinct start_date
     , rank() over (order by start_date) ranker
     from projects where start_date not in (select distinct end_date from projects) order by start_date) t1
left join(
    select distinct end_date 
    , rank() over (order by end_date) ranker
     from projects where end_date not in (select distinct start_date from projects) order by end_date) t2 on t2.ranker = t1.ranker
order by datediff(t2.end_date, t1.start_date), t1.start_date
;