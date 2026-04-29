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