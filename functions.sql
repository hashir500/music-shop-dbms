use db_project
-- functions

-- aggregate function
-- Manager wants to evaluate his repair technicians (Ali Raza and Kamran Javed). He needs to know how many jobs they've completed, how much revenue they generated for the shop, and a consolidated list of the specific issues they fixed.

SELECT 
    e.Employee_Name AS Technician,
    COUNT(rep.Repair_ID) AS Total_Jobs_Assigned,
    SUM(rep.cost) AS Total_Repair_Revenue_PKR,
    STRING_AGG(rep.description, ' | ') AS Types_Of_Repairs_Handled
FROM tbl_employees e
INNER JOIN tbl_repairs rep ON e.Employee_ID = rep.Emp_ID
GROUP BY e.Employee_Name;

-- Scalar function
-- This function takes a Rental ID, checks if it is past the due date, and calculates a 500 PKR penalty for every day it is late.
CREATE FUNCTION fn_CalculateLateFee (@RentalID INT)
RETURNS INT
AS
BEGIN
    DECLARE @LateDays INT;
    DECLARE @PenaltyFee INT = 0;
    DECLARE @DailyRate INT = 500; 

    
    SELECT @LateDays = DATEDIFF(day, Due_date, ISNULL(Return_Date, GETDATE()))
    FROM tbl_rentals
    WHERE Rental_ID = @RentalID;

    
    IF @LateDays > 0
        SET @PenaltyFee = @LateDays * @DailyRate;

    RETURN @PenaltyFee;
END



SELECT Rental_ID, Due_date, Return_Date, dbo.fn_CalculateLateFee(Rental_ID) AS Late_Fee_PKR 
FROM tbl_rentals;

-- Table-valued function
-- This function takes a Customer ID and returns a table of their active rentals.

CREATE FUNCTION fn_GetPendingRentals (@CustomerID INT)
RETURNS TABLE
AS
RETURN (
    SELECT r.Rental_ID, i.S_Instrument_Name, r.Rental_Date, r.Due_date
    FROM tbl_rentals r
    INNER JOIN tbl_shop_instruments i ON r.Instrument_ID = i.Instrument_ID
    WHERE r.Customer_ID = @CustomerID AND r.Return_Date IS NULL
);



SELECT * FROM dbo.fn_GetPendingRentals(2);