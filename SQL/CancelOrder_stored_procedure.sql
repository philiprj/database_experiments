DROP PROCEDURE IF EXISTS CancelOrder;

DELIMITER //

CREATE PROCEDURE CancelOrder(IN orderIDToCancel INT)
BEGIN
    -- Declare variable to check if order exists
    DECLARE orderExists INT;

    -- Check if order exists
    SELECT COUNT(*) INTO orderExists
    FROM Orders
    WHERE OrderID = orderIDToCancel;

    -- If order exists, delete it and confirm. If not, show error message
    IF orderExists > 0 THEN
        DELETE FROM Orders WHERE OrderID = orderIDToCancel;
        SELECT CONCAT('Order ', orderIDToCancel, ' is cancelled') AS Confirmation;
    ELSE
        SELECT CONCAT('Order ', orderIDToCancel, ' does not exist') AS Confirmation;
    END IF;
END //

DELIMITER ;

-- Test with existing order
CALL CancelOrder(5);

-- Test with non-existent order
CALL CancelOrder(999);
