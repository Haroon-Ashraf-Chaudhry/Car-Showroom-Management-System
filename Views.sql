-- Customer_Purchase_Info - Lists customer details with cars they've bought
CREATE OR REPLACE VIEW Customer_Purchase_Info AS
SELECT 
  c.CustomerID,
  c.Name AS CustomerName,
  c.Phone,
  ca.Make,
  ca.Model,
  s.FinalPrice,
  s.DateOfSale
FROM 
  Customer c
JOIN Sale s ON c.CustomerID = s.CustomerID
JOIN Car ca ON s.CarID = ca.CarID;

-- Showroom_Staff_Payroll - Summarizes staff, their showroom, and payroll details
CREATE OR REPLACE VIEW Showroom_Staff_Payroll AS
SELECT 
  s.Name AS StaffName,
  s.Role,
  sr.Name AS ShowroomName,
  p.SalaryAmount,
  p.PayDate
FROM 
  Staff s
JOIN Payroll p ON s.StaffID = p.StaffID
JOIN Showroom sr ON s.ShowroomID = sr.ShowroomID;

-- Upcoming_TestDrives - Shows all scheduled test drives with customer and car info
CREATE OR REPLACE VIEW Upcoming_TestDrives AS
SELECT 
  td.TestDriveID,
  td.ScheduledDate,
  c.Name AS CustomerName,
  car.Make,
  car.Model,
  sp.Name AS Salesperson
FROM 
  TestDrive td
JOIN Customer c ON td.CustomerID = c.CustomerID
JOIN Car car ON td.CarID = car.CarID
JOIN Salesperson sp ON td.SalespersonID = sp.SalespersonID
WHERE 
  td.ScheduledDate >= SYSDATE;

-- Available_Cars_With_Showroom - Shows all unsold cars and their corresponding showroom
CREATE OR REPLACE VIEW Available_Cars_With_Showroom AS
SELECT 
  c.CarID,
  c.Make,
  c.Model,
  c.Price,
  s.Name AS ShowroomName,
  s.Location
FROM 
  Car c
JOIN Sale sa ON c.CarID = sa.CarID (+)
JOIN Salesperson sp ON sa.SalespersonID = sp.SalespersonID (+)
JOIN Showroom s ON sp.ShowroomID = s.ShowroomID
WHERE 
  c.Status = 'Available';