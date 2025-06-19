-- List all customers with their purchased cars
SELECT 
  c.Name AS CustomerName,
  c.Phone,
  ca.Make,
  ca.Model,
  s.DateOfSale,
  s.FinalPrice
FROM 
  Customer c
JOIN Sale s ON c.CustomerID = s.CustomerID
JOIN Car ca ON s.CarID = ca.CarID;

-- Find test drives taken for a specific car model using a subquery
SELECT 
  td.TestDriveID,
  td.ScheduledDate,
  td.Duration,
  td.Feedback,
  c.Name AS CustomerName
FROM 
  TestDrive td
JOIN Customer c ON td.CustomerID = c.CustomerID
WHERE 
  td.CarID = (
    SELECT CarID FROM Car WHERE Model = 'Civic'
  );

-- List all cars and their warranty coverage period
SELECT 
  ca.Make,
  ca.Model,
  w.WarrantyStartDate,
  w.WarrantyEndDate,
  w.CoverageDetails
FROM 
  Car ca
LEFT JOIN Warranty w ON ca.CarID = w.CarID;

-- List salespersons with total number of sales they've made
SELECT 
  sp.Name AS SalespersonName,
  sp.Position,
  COUNT(s.SaleID) AS TotalSales
FROM 
  Salesperson sp
LEFT JOIN Sale s ON sp.SalespersonID = s.SalespersonID
GROUP BY 
  sp.Name, sp.Position;
  
-- Show rooms and their total inventory items count
SELECT 
  sh.Name AS ShowroomName,
  sh.Location,
  COUNT(i.InventoryID) AS TotalItems
FROM 
  Showroom sh
LEFT JOIN Inventory i ON sh.ShowroomID = i.ShowroomID
GROUP BY 
  sh.Name, sh.Location;