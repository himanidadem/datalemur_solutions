SELECT salary as second_highest_salary
FROM employee
group by salary
order by salary desc
limit 1 offset 1
