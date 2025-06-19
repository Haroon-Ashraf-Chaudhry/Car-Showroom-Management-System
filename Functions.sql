-- GetCarWarrantyEndDate - Returns warranty end date for a given car ID
CREATE OR REPLACE FUNCTION GetCarWarrantyEndDate (p_car_id NUMBER)
RETURN DATE IS
  v_end_date DATE;
BEGIN
  SELECT WarrantyEndDate INTO v_end_date
  FROM Warranty
  WHERE CarID = p_car_id;

  RETURN v_end_date;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN NULL;
END;

-- CalculateAdvancePercent - Returns advance % paid for a booking based on final price (from Sale)
CREATE OR REPLACE FUNCTION CalculateAdvancePercent (
  p_booking_id NUMBER
) RETURN NUMBER IS
  v_advance NUMBER;
  v_final_price NUMBER;
  v_car_id NUMBER;
BEGIN
  SELECT AdvanceAmount, CarID INTO v_advance, v_car_id
  FROM Booking WHERE BookingID = p_booking_id;

  SELECT FinalPrice INTO v_final_price
  FROM Sale WHERE CarID = v_car_id;

  RETURN ROUND((v_advance / v_final_price) * 100, 2);
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;

-- GetCustomerBookingCount - Returns number of bookings for a given customer
CREATE OR REPLACE FUNCTION GetCustomerBookingCount (
  p_customer_id NUMBER
) RETURN NUMBER IS
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM Booking
  WHERE CustomerID = p_customer_id;

  RETURN v_count;
END;

-- GetCarSalePrice - Returns final sale price for a car (or NULL if unsold)
CREATE OR REPLACE FUNCTION GetCarSalePrice (
  p_car_id NUMBER
) RETURN NUMBER IS
  v_price NUMBER;
BEGIN
  SELECT FinalPrice INTO v_price
  FROM Sale
  WHERE CarID = p_car_id;

  RETURN v_price;
EXCEPTION
  WHEN NO_DATA_FOUND THEN RETURN NULL;
END;