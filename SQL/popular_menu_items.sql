SELECT DISTINCT
    mi.Item as MenuItem
FROM MenuItem mi
WHERE mi.MenuItemID = ANY (
    SELECT MenuItemID
    FROM Orders
    WHERE Quantity > 2
);
