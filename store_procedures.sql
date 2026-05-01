use db_project

-- Non parameterized stored procedure
-- A daily report the staff runs to see exactly who they need to call to get late instruments back.

CREATE PROCEDURE sp_AuditOverdueRentals
AS
BEGIN
    SELECT 
        c.Customer_Name, 
        c.Phone, 
        i.S_Instrument_Name, 
        r.Due_date,
        DATEDIFF(day, r.Due_date, GETDATE()) AS Days_Late
    FROM tbl_rentals r
    INNER JOIN tbl_customers c ON r.Customer_ID = c.Customer_ID
    INNER JOIN tbl_shop_instruments i ON r.Instrument_ID = i.Instrument_ID
    WHERE r.Return_Date IS NULL AND r.Due_date < GETDATE();
END;


EXEC sp_AuditOverdueRentals;

-- Parameterized stored procedure
--  When a customer rents an item, this procedure safely logs the rental, but only if the instrument is currently marked as 'Available'.

CREATE PROCEDURE sp_ProcessNewRental
    @CustID INT,
    @InstID INT,
    @RentDays INT,
    @TotalCost INT
AS
BEGIN
    DECLARE @CurrentStatus VARCHAR(20);
    DECLARE @NextID INT;

    SELECT @CurrentStatus = status FROM tbl_shop_instruments WHERE Instrument_ID = @InstID;

    IF @CurrentStatus = 'Available'
    BEGIN
        -- Manually get the next ID number
        SELECT @NextID = ISNULL(MAX(Rental_ID), 0) + 1 FROM tbl_rentals;

        INSERT INTO tbl_rentals (Rental_ID, Customer_ID, Instrument_ID, Rental_Date, Due_date, Total_Cost)
        VALUES (@NextID, @CustID, @InstID, GETDATE(), DATEADD(day, @RentDays, GETDATE()), @TotalCost);

        UPDATE tbl_shop_instruments SET status = 'Rented' WHERE Instrument_ID = @InstID;
        
        PRINT 'Rental processed successfully!';
    END
    ELSE
    BEGIN
        PRINT 'Error: Instrument is Rented'
    END
END;

UPDATE tbl_shop_instruments SET status = 'Available' WHERE Instrument_ID = 2;

EXEC sp_ProcessNewRental @CustID = 1, @InstID = 2, @RentDays = 5, @TotalCost = 2500;

select* from tbl_rentals
SELECT* from tbl_shop_instruments



