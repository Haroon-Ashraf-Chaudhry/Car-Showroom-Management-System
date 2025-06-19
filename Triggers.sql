-- PreventDuplicateVIN - Prevents duplicate VIN entries in Car table
CREATE OR REPLACE TRIGGER PreventDuplicateVIN
BEFORE INSERT ON Car
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM Car
  WHERE VIN = :NEW.VIN;

  IF v_count > 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Duplicate VIN not allowed.');
  END IF;
END;

-- CheckBookingLimit - Prevents a customer from making more than 3 active bookings
CREATE OR REPLACE TRIGGER CheckBookingLimit
BEFORE INSERT ON Booking
FOR EACH ROW
DECLARE
  v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM Booking
  WHERE CustomerID = :NEW.CustomerID AND BookingStatus = 'Pending';

  IF v_count >= 3 THEN
    RAISE_APPLICATION_ERROR(-20002, 'Customer cannot have more than 3 pending bookings.');
  END IF;
END;

-- AuditSalesInsert - Logs insert time and sale details into a separate log table
CREATE TABLE Sales_Audit (
  AuditID NUMBER GENERATED ALWAYS AS IDENTITY,
  SaleID NUMBER,
  InsertedAt TIMESTAMP DEFAULT SYSTIMESTAMP
);
CREATE OR REPLACE TRIGGER AuditSalesInsert
AFTER INSERT ON Sale
FOR EACH ROW
BEGIN
  INSERT INTO Sales_Audit(SaleID)
  VALUES (:NEW.SaleID);
END;