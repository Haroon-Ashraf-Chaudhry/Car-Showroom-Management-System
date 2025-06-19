-- AssignCarToCustomer - Inserts a new sale entry for a customer
CREATE OR REPLACE PROCEDURE AssignCarToCustomer (
  p_sale_id        NUMBER,
  p_customer_id    NUMBER,
  p_car_id         NUMBER,
  p_salesperson_id NUMBER,
  p_final_price    NUMBER,
  p_payment_method VARCHAR2
) IS
BEGIN
  INSERT INTO Sale (
    SaleID, CustomerID, CarID, SalespersonID, FinalPrice, PaymentMethod, DateOfSale
  ) VALUES (
    p_sale_id, p_customer_id, p_car_id, p_salesperson_id, p_final_price, p_payment_method, SYSDATE
  );
END;

-- UpdateCarStatusOnSale - Updates car status to 'Sold' after a sale
CREATE OR REPLACE PROCEDURE UpdateCarStatusOnSale (
  p_car_id NUMBER
) IS
BEGIN
  UPDATE Car
  SET Status = 'Sold'
  WHERE CarID = p_car_id;
END;

-- AssignWarrantyToCar - Assign warranty entry to a car
CREATE OR REPLACE PROCEDURE AssignWarrantyToCar (
  p_warranty_id NUMBER,
  p_car_id NUMBER,
  p_start_date DATE,
  p_end_date DATE,
  p_details VARCHAR2
) IS
BEGIN
  INSERT INTO Warranty (
    WarrantyID, CarID, WarrantyStartDate, WarrantyEndDate, CoverageDetails
  ) VALUES (
    p_warranty_id, p_car_id, p_start_date, p_end_date, p_details
  );
END;

-- CreateBooking - Handles booking logic in one procedure call
CREATE OR REPLACE PROCEDURE CreateBooking (
  p_booking_id NUMBER,
  p_customer_id NUMBER,
  p_car_id NUMBER,
  p_advance NUMBER,
  p_status VARCHAR2
) IS
BEGIN
  INSERT INTO Booking (
    BookingID, CustomerID, CarID, BookingDate, AdvanceAmount, BookingStatus
  ) VALUES (
    p_booking_id, p_customer_id, p_car_id, SYSDATE, p_advance, p_status
  );
END;