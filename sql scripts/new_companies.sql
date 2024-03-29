/*
SQL Project Planning

Amber's conglomerate corporation just acquired some new companies. Each of the companies follows this hierarchy: founder > lead_manager > senior manager > manager > employee
Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.
Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For example, if the company_codes are C_1, C_2, and C_10, then the ascending company_codes will be C_1, C_10, and C_2.

*/

select c.company_code
    , c.founder
    , count(distinct l.lead_manager_code)
    , count(distinct s.senior_manager_code)
    , count(distinct m.manager_code)
    , count(distinct e.employee_code)
from company c
left join lead_manager l on l.company_code = c.company_code
left join senior_manager s on s.lead_manager_code = l.lead_manager_code
left join manager m on m.senior_manager_code = s.senior_manager_code
left join employee e on e.manager_code = m.manager_code
group by c.company_code, c.founder
order by c.company_code
;