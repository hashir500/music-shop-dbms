use db_project

-- adding constranit
ALTER TABLE tbl_temp
add CONSTRAINT check_total_cost CHECK (Total_Cost > 0);

-- drop constraint
ALTER TABLE tbl_temp
drop CONSTRAINT check_total_cost;

-- renaming column
EXEC sp_rename 'dbo.tbl_temp.Customer_ID', 'cust_id', 'COLUMN';

-- adding new column
ALTER TABLE tbl_temp
ADD cust_age int;

-- modify column
ALTER TABLE tbl_temp
ALTER COLUMN cust_age int NOT NULL;

-- change datatype of  column
ALTER TABLE tbl_temp
ALTER COLUMN cust_age varchar(3);

-- change size of column
ALTER TABLE tbl_temp
ALTER COLUMN cust_age varchar(5);

-- dropping column
ALTER TABLE tbl_temp
DROP COLUMN Rental_Date;

-- adding status column in temp table
ALTER TABLE tbl_temp
add status varchar(20);