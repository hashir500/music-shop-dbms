-- DML COMMANDS
use db_project

-- inserting data into tbl_customers
insert into tbl_customers 
values
(1, 'Hashir Hassan', 'hashir@email.com', '0300-1111111', 'DHA Phase 5, Lahore'),
(2, 'Hassan Irfan', 'hassan@email.com', '0333-2222222', 'NFC, Lahore'),
(3, 'Mani', 'mani.t@email.com', '0321-3333333', 'Sheikhupura'),
(4, 'Ayesha Malik', 'ayesha.m@email.com', '0345-4444444', 'Gulberg III, Lahore'),
(5, 'Bilal Qureshi', 'bilal.q@email.com', '0301-5555555', 'Bahria Town, Rawalpindi'),
(6, 'Sana Raza', 'sana.r@email.com', '0311-6666666', 'Bahria Town, Karachi'),
(7, 'Zainab Shah', 'zainab.s@email.com', '0302-7777777', 'FAST, Peshawar'),
(8, 'Omar Farooq', 'omar.f@email.com', '0332-8888888', 'Namak Town, Quetta');

-- inserting data into tbl_categories
insert into tbl_category
values
(1, 'Guitars'),
(2, 'Keyboards'),
(3, 'Drums'),
(4, 'Wind Instruments'),
(5, 'String Instruments'),
(6, 'Percussion Instruments'),
(7, 'Electronic Instruments'),
(8, 'Violin')

-- inserting data into tbl_shop_instruments
insert into tbl_shop_instruments
values
(1, 'Standard Acoustic', 'FG800', 1500, 'Yamaha', 'Available', 1),
(2, 'Stratocaster', 'Player Series', 3000, 'Fender', 'Rented', 2),
(3, 'Precision Bass', 'Standard', 2500, 'Fender', 'Available', 3),
(4, '5-Piece Drum Set', 'Export', 5000, 'Pearl', 'Available', 4),
(5, 'Digital Piano', 'P-125', 4000, 'Yamaha', 'Rented', 5),
(6, 'Student Violin', 'Prelude', 1200, 'Stentor', 'In Repair', 6),
(7, 'Alto Sax', 'YAS-280', 3500, 'Yamaha', 'Available', 7),
(8, 'Professional Rabab', 'Peshawari', 2000, 'Local Artisan', 'Available', 8);

-- inserting data into tbl_rentals
insert into tbl_rentals
values
(1, 1, 1, '2024-04-01', '2024-04-05', '2024-04-05', 6000),
(2, 2, 2, '2024-04-10', '2024-04-12', NULL, 6000),                    -- Still rented out
(3, 3, 4, '2024-04-15', '2024-04-20', '2024-04-20', 25000),
(4, 4, 5, '2024-04-18', '2024-04-25', '2024-04-27', 10000), 
(5, 5, 3, '2024-04-02', '2024-04-04', '2024-04-04', 5000),
(6, 6, 7, '2024-04-05', '2024-04-10', '2024-04-10', 17500),
(7, 7, 8, '2024-04-11', '2024-04-15', '2024-04-16', 10000),          -- Returned 1 day late
(8, 8, 1, '2024-04-20', '2024-04-22', '2024-04-22', 3000);

-- inserting data into tbl_customer_instruments
insert into tbl_customer_instrument
values
(1, 1, 1, 'Vintage Acoustic', 'Hummingbird', 'Gibson'),
(2, 2, 2, 'Custom Electric', 'Les Paul', 'Gibson'),
(3, 3, 4, 'Snare Drum', 'Supraphonic', 'Ludwig'),
(4, 4, 6, 'Antique Violin', 'Stradivari Copy', 'Unknown'),
(5, 5, 2, 'Metal Guitar', 'RG550', 'Ibanez'),
(6, 6, 7, 'Tenor Sax', 'Mark VI', 'Selmer'),
(7, 7, 3, 'Jazz Bass', 'American Pro', 'Fender'),
(8, 8, 8, 'Concert Sitar', 'Ravi Shankar Style', 'Rikhi Ram');

-- inserting data into tbl_employee_types 
INSERT INTO tbl_employee_types
VALUES 
(1, 'Store Manager'),
(2, 'Repair Technician'),
(3, 'Cashier')

-- inserting data into tbl_employees
INSERT INTO tbl_employees 
VALUES 
(1, 'Hassan Irfan', 85000, 1),
(2, 'Mani', 45000, 2),
(3, 'Ali Raza', 60000, 2),
(4, 'Kamran Javed', 70000, 2),
(5, 'Sadia Jamil', 40000, 2),
(6, 'Tariq Mehmood', 45000, 3)

-- inserting data into tbl_expenses
INSERT INTO tbl_expenses
VALUES
(1, 'Initial Register Cash', 50000, '2024-04-01', 50000, 50000, 0, 1),
(2, 'Rental Income (Hashir)', 6000, '2024-04-01', 56000, 6000, 0, 5),
(3, 'Bought Guitar Strings', 4000, '2024-04-02', 52000, 0, 4000, 2),
(4, 'Rental Income (Bilal)', 5000, '2024-04-02', 57000, 5000, 0, 5),
(5, 'Store Cleaning Supplies', 2000, '2024-04-03', 55000, 0, 2000, 6),
(6, 'Rental Income (Sana)', 17500, '2024-04-05', 72500, 17500, 0, 5),
(7, 'Repair Violin', 3000, '2024-04-06', 69500, 0, 3000, 2),
(8, 'Rental Income (Omar)', 3000, '2024-04-20', 72500, 3000, 0, 5)

insert into tbl_temp
VALUES
(1, 1, 1, '2024-04-01',1200, 18),
(2, 2, 2, '2024-04-10',6000, 20),
(3, 3, 3, '2024-04-15',25000, 29),
(4, 4, 4, '2024-04-01',1200, 19),
(5, 5, 5, '2024-04-10',6000, 22),
(6, 6, 6, '2024-04-15',25000, 39),
(7, 7, 7, '2024-04-01',1200, 18),
(8, 8, 8, '2024-04-10',6000, 20)
