SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.TotalCost,
    m.Cuisine as MenuName,
    mi.Course,
    mi.Item as StarterName
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
INNER JOIN Menu m ON o.MenuItemID = m.MenuItemID
INNER JOIN MenuItem mi ON m.MenuItemID = mi.MenuItemID
WHERE o.TotalCost > 15	-- Changed as my data would return no results
ORDER BY o.TotalCost ASC;
