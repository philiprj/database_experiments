DROP PROCEDURE IF EXISTS GetMaxQuantity;

DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
    SELECT MAX(Quantity) AS MaxQuantityOrdered
    FROM Orders;
END //

DELIMITER ;

-- To test the procedure:
CALL GetMaxQuantity();
