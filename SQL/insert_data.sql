-- First disable foreign key checks to avoid constraint errors
SET FOREIGN_KEY_CHECKS=0;

-- Clear all tables
TRUNCATE TABLE `LittleLemon`.`Customers`;
TRUNCATE TABLE `LittleLemon`.`Orders`;
TRUNCATE TABLE `LittleLemon`.`Bookings`;
TRUNCATE TABLE `LittleLemon`.`Menu`;
TRUNCATE TABLE `LittleLemon`.`MenuItem`;
TRUNCATE TABLE `LittleLemon`.`Delivery`;
TRUNCATE TABLE `LittleLemon`.`Staff`;

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS=1;


-- Insert data into CustomerDetails
INSERT INTO `LittleLemon`.`Customers` (`CustomerID`, `CustomerName`, `Email`)
VALUES
	(1, 'John Doe', 'john.doe@example.com'),
	(2, 'Jane Doe', 'jane.doe@example.com'),
	(3, 'Alice', 'alice@example.com'),
	(4, 'Bob', 'bob@example.com'),
	(5, 'Charlie', 'charlie@example.com'),
	(6, 'David', 'david@example.com'),
	(7, 'Emily', 'emily@example.com'),
	(8, 'Frank', 'frank@example.com'),
	(9, 'Grace', 'grace@example.com'),
	(10, 'Hannah', 'hannah@example.com');

-- Insert data into StaffInformation
INSERT INTO `LittleLemon`.`Staff` (`StaffID`, `Role`, `Salary`, `FullName`, `Email`)
VALUES
    (1, 'Manager', 65000.00, 'John Smith', 'john.smith@littlelemon.com'),
    (2, 'Head Chef', 55000.00, 'Maria Garcia', 'maria.garcia@littlelemon.com'),
    (3, 'Server', 35000.00, 'James Wilson', 'james.wilson@littlelemon.com'),
    (4, 'Sous Chef', 45000.00, 'Sarah Johnson', 'sarah.johnson@littlelemon.com'),
    (5, 'Host', 32000.00, 'Michael Brown', 'michael.brown@littlelemon.com'),
    (6, 'Server', 35000.00, 'Emily Davis', 'emily.davis@littlelemon.com'),
    (7, 'Bartender', 40000.00, 'David Martinez', 'david.martinez@littlelemon.com'),
    (8, 'Kitchen Staff', 32000.00, 'Lisa Anderson', 'lisa.anderson@littlelemon.com'),
    (9, 'Server', 35000.00, 'Robert Taylor', 'robert.taylor@littlelemon.com'),
    (10, 'Cleaner', 30000.00, 'Anna White', 'anna.white@littlelemon.com');

-- Insert data into MenuItems
INSERT INTO `LittleLemon`.`MenuItem` (`MenuItemID`, `Item`, `Cuisine`, `Course`, `Cost`)
VALUES
    (1, 'Margherita Pizza', 'Italian', 'Main', 15.99),
    (2, 'Greek Salad', 'Mediterranean', 'Starter', 12.99),
    (3, 'Moussaka', 'Greek', 'Main', 18.99),
    (4, 'Spaghetti Carbonara', 'Italian', 'Main', 16.99),
    (5, 'Kebab Platter', 'Turkish', 'Main', 22.99),
    (6, 'Hummus with Pita', 'Mediterranean', 'Starter', 8.99),
    (7, 'Spanakopita', 'Greek', 'Starter', 10.99),
    (8, 'Tiramisu', 'Italian', 'Dessert', 8.99),
    (9, 'Baklava', 'Mediterranean', 'Dessert', 7.99),
    (10, 'Turkish Coffee', 'Turkish', 'Beverage', 4.99);

-- Insert data into Menu
INSERT INTO `LittleLemon`.`Menu` (`MenuID`, `Cuisine`, `MenuItemID`)
VALUES
    (1, 'Italian', 1),
    (2, 'Mediterranean', 2),
    (3, 'Greek', 3),
    (4, 'Italian', 4),
    (5, 'Turkish', 5),
    (6, 'Mediterranean', 6),
    (7, 'Greek', 7),
    (8, 'Italian', 8),
    (9, 'Mediterranean', 9),
    (10, 'Turkish', 10);

-- Insert data into Bookings
INSERT INTO `LittleLemon`.`Bookings` (`BookingID`, `BookingDate`, `TableNum`, `CustomerID`)
VALUES
    (1, '2024-03-15 18:00:00', 5, 1),
    (2, '2024-03-15 19:00:00', 3, 1),
    (3, '2024-03-16 17:30:00', 2, 3),
    (4, '2024-03-16 18:30:00', 4, 2),
    (5, '2024-03-17 19:00:00', 6, 2),
    (6, '2024-03-17 19:30:00', 1, 4),
    (7, '2024-03-18 18:00:00', 3, 1),
    (8, '2024-03-18 20:00:00', 5, 3),
    (9, '2024-03-19 17:00:00', 2, 5),
    (10, '2024-03-19 19:00:00', 4, 2);

-- Insert data into Delivery
INSERT INTO `LittleLemon`.`Delivery` (`DeliveryID`, `DeliveryDate`, `DeliveryStatus`)
VALUES
    (1, '2024-03-15 18:30:00', 'Delivered'),
    (2, '2024-03-15 19:15:00', 'In Progress'),
    (3, '2024-03-16 18:00:00', 'Delivered'),
    (4, '2024-03-16 19:00:00', 'Preparing'),
    (5, '2024-03-17 17:45:00', 'Delivered'),
    (6, '2024-03-17 20:00:00', 'In Progress'),
    (7, '2024-03-18 18:30:00', 'Cancelled'),
    (8, '2024-03-18 19:45:00', 'Delivered'),
    (9, '2024-03-19 17:30:00', 'Preparing'),
    (10, '2024-03-19 19:30:00', 'In Progress');

-- Insert data into Orders
INSERT INTO `LittleLemon`.`Orders` (`OrderID`, `OrderDate`, `Quantity`, `TotalCost`, `CustomerID`, `StaffID`, `BookingID`, `MenuItemID`, `DeliveryID`)
VALUES
    (1, '2024-03-15 18:15:00', 2, 31.98, 1, 3, 1, 1, 1),    -- 2 Margherita Pizzas
    (2, '2024-03-15 19:00:00', 1, 18.99, 1, 6, 2, 3, 2),    -- 1 Moussaka
    (3, '2024-03-16 17:45:00', 3, 38.97, 3, 3, 3, 2, 3),    -- 3 Greek Salads
    (4, '2024-03-16 18:30:00', 2, 33.98, 2, 9, 4, 4, 4),    -- 2 Spaghetti Carbonara
    (5, '2024-03-17 19:15:00', 4, 91.96, 2, 6, 5, 5, 5),    -- 4 Kebab Platters
    (6, '2024-03-17 19:45:00', 2, 17.98, 4, 3, 6, 6, 6),    -- 2 Hummus with Pita
    (7, '2024-03-18 18:20:00', 1, 10.99, 1, 9, 7, 7, 7),    -- 1 Spanakopita
    (8, '2024-03-18 20:15:00', 3, 26.97, 3, 6, 8, 8, 8),    -- 3 Tiramisu
    (9, '2024-03-19 17:15:00', 2, 15.98, 5, 3, 9, 9, 9),    -- 2 Baklava
    (10, '2024-03-19 19:20:00', 5, 24.95, 2, 9, 10, 10, 10);-- 5 Turkish Coffees
