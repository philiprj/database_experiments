DROP PROCEDURE IF EXISTS AddValidBooking;

DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    -- Declare variable to track booking status
    DECLARE bookingCount INT;

    -- Start the transaction
    START TRANSACTION;

    -- Check if table is already booked
    SELECT COUNT(*) INTO bookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate
    AND TableNum = tableNumber;

    -- Insert new booking
    INSERT INTO Bookings (BookingDate, TableNum, CustomerID)
    VALUES (bookingDate, tableNumber, 1);  -- Using CustomerID 1 as default

    -- Check if table is already booked
    IF bookingCount > 0 THEN
        -- Table is already booked - rollback
        ROLLBACK;
        SELECT CONCAT('Table ', tableNumber, ' is already booked on ', bookingDate, ' - booking cancelled') AS 'Booking Status';
    ELSE
        -- Table is available - commit
        COMMIT;
        SELECT CONCAT('Table ', tableNumber, ' is successfully booked on ', bookingDate) AS 'Booking Status';
    END IF;
END //

DELIMITER ;

CALL AddValidBooking("2022-12-17", 6)
