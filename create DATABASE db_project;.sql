create DATABASE db_project;
use db_project;

-- Part B: Creating tables and inserting data

create table tbl_customers (
    Customer_ID int PRIMARY KEY,
    Customer_Name varchar(50),
    Email varchar(50),
    Phone varchar(15),
    Address varchar(100)
)

create table tbl_category (
    Category_ID int PRIMARY KEY,
    Category_Name varchar(50)
)

create table tbl_shop_instruments (
    Instrument_ID int PRIMARY KEY,
    S_Instrument_Name varchar(50),
    Model varchar(50),
    DailyRate int,
    Brand varchar(50),
    status varchar(20),
    Category_ID int,
    FOREIGN KEY (Category_ID) REFERENCES tbl_category(Category_ID)
)

create table tbl_rentals (
    Rental_ID int PRIMARY KEY,
    Customer_ID int,
    Instrument_ID int,
    Rental_Date date,
    Due_date date,
    Return_Date date,
    Total_Cost int,
    FOREIGN KEY (Customer_ID) REFERENCES tbl_customers(Customer_ID),
    FOREIGN KEY (Instrument_ID) REFERENCES tbl_shop_instruments(Instrument_ID)
)

create table tbl_customer_instrument (
    Customer_Instrument_ID int PRIMARY KEY,
    Customer_ID int,
    Category_ID int,
    Name varchar(50),
    Model varchar(50),
    Brand varchar(50),
    FOREIGN KEY (Customer_ID) REFERENCES tbl_customers(Customer_ID),
    FOREIGN KEY (Category_ID) REFERENCES tbl_category(Category_ID)
)

create table tbl_employee_types (
    Employee_Type_ID int PRIMARY KEY,
    Employee_Type varchar(50)
)

create table tbl_employees (
    Employee_ID int PRIMARY KEY,
    Employee_Name varchar(50),
    Salary int,
    Employee_Type_ID int,
    FOREIGN KEY (Employee_Type_ID) REFERENCES tbl_employee_types(Employee_Type_ID)
)

create table tbl_expenses (
    Expense_ID int PRIMARY KEY,
    Description varchar(50),
    Amount int,
    Expense_Date date,
    Balance int,
    Cashin int,
    cashout int,
    employee_id int,
    FOREIGN KEY (employee_id) REFERENCES tbl_employees(Employee_ID)
)

create table tbl_repairs(
    Repair_ID int PRIMARY KEY,
    customer_id int,
    Shop_Instrument_ID int,
    Customer_Instrument_ID int,
    description varchar(255),
    Date_in date,
    Date_out date,
    status varchar(20),
    cost int,
    Emp_ID int,
    FOREIGN KEY (customer_id) REFERENCES tbl_customers(Customer_ID),
    FOREIGN KEY (Shop_Instrument_ID) REFERENCES tbl_shop_instruments(Instrument_ID),
    FOREIGN KEY (Customer_Instrument_ID) REFERENCES tbl_customer_instrument(Customer_Instrument_ID),
    FOREIGN KEY (Emp_ID) REFERENCES tbl_employees(Employee_ID)

)