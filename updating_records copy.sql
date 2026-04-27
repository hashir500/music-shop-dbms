use db_project

-- selecting temp table to see the data before update
select * 
from tbl_temp

-- updating records
update tbl_temp
set Total_Cost = 2000
where Temp_ID = 1

-- updating multiple records
update tbl_temp
set Total_Cost = Total_Cost + 500
where Total_Cost < 10000

update tbl_temp
set Due_date = NULL
where cust_age BETWEEN 18 AND 25

-- deleting single record
delete from tbl_temp
where Temp_ID = 8

-- deleting multiple records
delete from tbl_temp
where Temp_ID IN (6, 7)

-- setiing up status column
update tbl_temp
set status = 'Active'
where Temp_ID in (1,2,3,4,5,6,7)

-- setting some status to inactive
update tbl_temp
set status = 'Inactive'
where Temp_ID in (2,4,6)

-- checking active records
select *
from tbl_temp
where status = 'Active'

-- checking inactive records
select *
from tbl_temp
where status = 'Inactive'