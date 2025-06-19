CREATE TABLE Customer (
  CustomerID NUMBER CONSTRAINT pk_customer PRIMARY KEY,
  Name VARCHAR2(30) CONSTRAINT nn_customer_name NOT NULL,
  Phone VARCHAR2(15) CONSTRAINT nn_customer_phone NOT NULL,
  Email VARCHAR2(30),
  Address VARCHAR2(50) CONSTRAINT nn_customer_address NOT NULL
);

CREATE TABLE Car (
  CarID NUMBER CONSTRAINT pk_car PRIMARY KEY,
  Make VARCHAR2(20) CONSTRAINT nn_car_make NOT NULL,
  Model VARCHAR2(20) CONSTRAINT nn_car_model NOT NULL,
  Year NUMBER,
  Colour VARCHAR2(10),
  EngineType VARCHAR2(15),
  Transmission VARCHAR2(10),
  Mileage NUMBER,
  Price NUMBER,
  VIN VARCHAR2(17) CONSTRAINT uq_car_vin UNIQUE,
  Status VARCHAR2(10) CONSTRAINT chk_car_status CHECK (Status IN ('Available', 'Sold'))
);

CREATE TABLE Salesperson (
  SalespersonID NUMBER CONSTRAINT pk_salesperson PRIMARY KEY,
  Name VARCHAR2(30) CONSTRAINT nn_sp_name NOT NULL,
  Phone VARCHAR2(15) CONSTRAINT nn_sp_phone NOT NULL,
  Email VARCHAR2(30),
  HireDate DATE DEFAULT SYSDATE,
  Position VARCHAR2(20),
  Salary NUMBER,
  ShowroomID NUMBER,
  CONSTRAINT fk_sp_showroom FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID)
);

CREATE TABLE Sale (
  SaleID NUMBER CONSTRAINT pk_sale PRIMARY KEY,
  DateOfSale DATE DEFAULT SYSDATE,
  FinalPrice NUMBER,
  PaymentMethod VARCHAR2(15),
  CustomerID NUMBER,
  CarID NUMBER,
  SalespersonID NUMBER,
  CONSTRAINT fk_sale_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_sale_car FOREIGN KEY (CarID) REFERENCES Car(CarID),
  CONSTRAINT fk_sale_salesperson FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

CREATE TABLE TestDrive (
  TestDriveID NUMBER CONSTRAINT pk_testdrive PRIMARY KEY,
  ScheduledDate DATE,
  Duration VARCHAR2(5),
  Feedback VARCHAR2(100),
  CarID NUMBER,
  CustomerID NUMBER,
  SalespersonID NUMBER,
  CONSTRAINT fk_td_car FOREIGN KEY (CarID) REFERENCES Car(CarID),
  CONSTRAINT fk_td_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_td_salesperson FOREIGN KEY (SalespersonID) REFERENCES Salesperson(SalespersonID)
);

CREATE TABLE Showroom (
  ShowroomID NUMBER CONSTRAINT pk_showroom PRIMARY KEY,
  Name VARCHAR2(30) CONSTRAINT nn_showroom_name NOT NULL,
  Location VARCHAR2(50) CONSTRAINT nn_showroom_location NOT NULL,
  Phone VARCHAR2(15) CONSTRAINT nn_showroom_phone NOT NULL,
  AdminID NUMBER
);

CREATE TABLE Inventory (
  InventoryID NUMBER CONSTRAINT pk_inventory PRIMARY KEY,
  ItemName VARCHAR2(25) CONSTRAINT nn_inventory_item NOT NULL,
  Quantity NUMBER CONSTRAINT chk_inventory_quantity CHECK (Quantity >= 0),
  Category VARCHAR2(20) CONSTRAINT nn_inventory_category NOT NULL,
  ShowroomID NUMBER,
  CONSTRAINT fk_inventory_showroom FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID)
);

CREATE TABLE Staff (
  StaffID NUMBER CONSTRAINT pk_staff PRIMARY KEY,
  Name VARCHAR2(30) CONSTRAINT nn_staff_name NOT NULL,
  Role VARCHAR2(20) CONSTRAINT nn_staff_role NOT NULL,
  Contact VARCHAR2(15) CONSTRAINT nn_staff_contact NOT NULL,
  ShowroomID NUMBER,
  CONSTRAINT fk_staff_showroom FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID)
);

CREATE TABLE Payroll (
  PayID NUMBER CONSTRAINT pk_payroll PRIMARY KEY,
  SalaryAmount NUMBER,
  PayDate DATE DEFAULT SYSDATE,
  StaffID NUMBER,
  CONSTRAINT fk_payroll_staff FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Administration (
  AdminID NUMBER CONSTRAINT pk_admin PRIMARY KEY,
  Name VARCHAR2(30) CONSTRAINT nn_admin_name NOT NULL,
  Contact VARCHAR2(15) CONSTRAINT nn_admin_contact NOT NULL,
  Role VARCHAR2(20) CONSTRAINT nn_admin_role NOT NULL,
  ShowroomID NUMBER,
  CONSTRAINT fk_admin_showroom FOREIGN KEY (ShowroomID) REFERENCES Showroom(ShowroomID)
);

CREATE TABLE Insurance (
  InsuranceID NUMBER CONSTRAINT pk_insurance PRIMARY KEY,
  InsuranceProvider VARCHAR2(30) CONSTRAINT nn_insurance_provider NOT NULL,
  InsuranceStartDate DATE,
  InsuranceEndDate DATE,
  CoverageAmount NUMBER,
  CarID NUMBER,
  CustomerID NUMBER,
  CONSTRAINT fk_insurance_car FOREIGN KEY (CarID) REFERENCES Car(CarID),
  CONSTRAINT fk_insurance_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Booking (
  BookingID NUMBER CONSTRAINT pk_booking PRIMARY KEY,
  BookingDate DATE DEFAULT SYSDATE,
  BookingStatus VARCHAR2(20) CONSTRAINT chk_booking_status CHECK (BookingStatus IN ('Pending', 'Confirmed', 'Cancelled')),
  AdvanceAmount NUMBER,
  CustomerID NUMBER,
  CarID NUMBER,
  CONSTRAINT fk_booking_customer FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  CONSTRAINT fk_booking_car FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Warranty (
  WarrantyID NUMBER CONSTRAINT pk_warranty PRIMARY KEY,
  WarrantyStartDate DATE,
  WarrantyEndDate DATE,
  CoverageDetails VARCHAR2(100),
  CarID NUMBER,
  CONSTRAINT fk_warranty_car FOREIGN KEY (CarID) REFERENCES Car(CarID)
);