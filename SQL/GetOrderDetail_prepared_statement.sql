PREPARE GetOrderDetail FROM '
    SELECT OrderID, Quantity, TotalCost
    FROM Orders
    WHERE CustomerID = ?';

-- Create and set the variable
SET @id = 1;

-- Execute the prepared statement
EXECUTE GetOrderDetail USING @id;
