-- Clear existing data
DELETE FROM Bookings
WHERE BookingID IN (1,2,3,4);

-- Insert new data provided
INSERT INTO Bookings (BookingID, BookingDate, TableNum, CustomerID)
VALUES
    (1, '2022-10-10', 5, 1),
    (2, '2022-11-12', 3, 3),
    (3, '2022-10-11', 2, 2),
    (4, '2022-10-13', 2, 1);

-- Confirm data inserted as expected
SELECT * FROM Bookings
WHERE BookingID IN (1,2,3,4)
ORDER BY BookingID;
