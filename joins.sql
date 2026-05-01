-- select statements with joins
use db_project

-- Inner Join
-- Show a simple receipt log of customers and the dates they rented an instrument.
SELECT
c.Customer_Name, r.Rental_Date, r.Return_Date
from tbl_customers as c
INNER JOIN tbl_rentals as r
ON c.Customer_ID = r.Customer_ID

-- Left Join
--Get a list of all registered customers, and show their rental dates. If a customer has never rented anything, their rental date will just show as NULL.
SELECT 
c.Customer_Name,r.Rental_Date
from tbl_customers as c
LEFT JOIN tbl_rentals as r
on c.Customer_ID = r.Customer_ID

-- Right Join
-- Look at the ledger to see all financial expenses, and show the name of the employee who processed it
SELECT
e.Employee_Name, ex.Description, ex.Amount
from tbl_employees as e
RIGHT JOIN tbl_expenses as ex
on e.Employee_ID = ex.employee_id

-- Full Outer Join
-- A total system audit. Show all instruments and all rentals
SELECT
si.S_Instrument_Name, r.Rental_Date, r.Return_Date, r.Due_date, r.Total_Cost
from tbl_shop_instruments as si
FULL OUTER JOIN tbl_rentals as r
on si.Instrument_ID = r.Instrument_ID

-- self join
-- Find pairs of employees who earn the exact same salary.
select e1.Employee_Name as Employee1, e2.Employee_Name as Employee2, e1.Salary
from tbl_employees as e1
inner join tbl_employees as e2
on e1.Salary = e2.Salary
where e1.Employee_ID < e2.Employee_ID

-- cross join
-- Show all possible combinations of customers and instruments to find potential matches for marketing campaigns.
SELECT c.Customer_Name, si.S_Instrument_Name
from tbl_customers as c
CROSS JOIN tbl_shop_instruments as si

