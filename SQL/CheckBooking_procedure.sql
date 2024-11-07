DROP PROCEDURE IF EXISTS CheckBooking;

DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus VARCHAR(100);

    -- Check if table is already booked
    SELECT COUNT(*) INTO @bookingCount
    FROM Bookings
    WHERE BookingDate = bookingDate
    AND TableNum = tableNumber;

    -- Set message based on availability
    IF @bookingCount > 0 THEN
        SET tableStatus = CONCAT('Table ', tableNumber, ' is already booked on ', bookingDate);
    ELSE
        SET tableStatus = CONCAT('Table ', tableNumber, ' is available on ', bookingDate);
    END IF;

    -- Return result
    SELECT tableStatus AS 'Booking Status';
END //

DELIMITER ;

CALL CheckBooking("2022-11-12", 3)
