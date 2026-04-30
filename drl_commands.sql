-- DRL commands
-- select with clauses
use db_project

-- Query no 1: A customer walks in and want to know aboutt the instruments available in the store.
SELECT si.S_Instrument_Name, si.Model, si.Brand, si.DailyRate 
from tbl_shop_instruments as si
where si.status = 'Available'
order by si.DailyRate desc

-- Query no 2: Find out customers who have spent more than 10000 in store
select r.Customer_ID,
sum(r.Total_Cost) as total_spent,
count(r.Rental_ID) as total_rentals
from tbl_rentals as r
group by r.Customer_ID
having sum(r.Total_Cost) > 10000
order by total_spent desc

-- Query no 3: expense summary
SELECT
Expense_Date,
sum(Cashin) as Total_income,
sum(cashout) as Total_expenses,
sum(Cashin) - sum(cashout) as Net_Income
from tbl_expenses
group by Expense_Date
order by Expense_Date


-- select with subqueries

-- Quert no 1: the manager wants to see the details of customer who have never rented any instrument from the store to offer them discount

select c.Customer_ID, c.Customer_Name, c.Phone, c.Email
from tbl_customers as c
where c.Customer_ID not in (
select  r.Customer_ID
from tbl_rentals as r
)


-- Query no 2: For payroll auditing, the manager needs to see which staff members are earning more than the average salary of the entire team.

select e1.Employee_ID,e1.Employee_Name,e1.Salary
from tbl_employees as e1
where e1.Salary > (
select avg(e.Salary) as Average_Salary
from tbl_employees as e
)

-- Query no 3: the manager want to see the instruments that are rented out

SELECT si.S_Instrument_Name,si.Brand, si.Model, si.DailyRate
from tbl_shop_instruments as si
where si.Instrument_ID in (

SELECT Instrument_ID
from tbl_rentals as r
where r.Return_Date is NULL
)

-- Select with aggreate functions (Numeric)
-- Query no 1: Your accountant, needs to prepare the monthly payroll report. He wants to see the total amount of money spent on salaries, as well as the average salary across the whole shop.

select 
count(Employee_ID) as Total_Employees,
sum(Salary) as Total_Salary_Expense,
avg(Salary) as Average_Salary
from tbl_employees

-- Query no 2: Manageris analyzing the shop's pricing strategy. He wants to know the cheapest and most expensive daily rental rates available within each instrument category.
SELECT 
c.Category_Name, 
COUNT(i.Instrument_ID) as Instruments_In_Stock,
MIN(i.DailyRate) as Cheapest_Rate_PKR,
MAX(i.DailyRate) as Premium_Rate_PKR
FROM tbl_shop_instruments i
INNER JOIN tbl_category c on i.Category_ID = c.Category_ID
GROUP BY c.Category_Name;

-- Query no 3: The repair team wants to see exactly how many repair jobs are in each phase (Completed, In Progress, Pending Parts)
SELECT
status,
count(Repair_ID) as Total_Repairs,
sum(Cost) as Total_Cost
from tbl_repairs
group by status
order by Total_Repairs desc

