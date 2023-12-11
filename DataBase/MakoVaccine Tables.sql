--	...MLB_11.01_06...	--

-- Creating the MakoVaccines database
CREATE DATABASE MakoVaccines;
GO
-- Switching to the MakoVaccines database
USE MakoVaccines;
GO

-- Creating Tables

-- Employee Table
CREATE TABLE Employee (
  EmpId INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Age INT,
  Email VARCHAR(255),
  Address VARCHAR(255),
  CONSTRAINT PK_Employee PRIMARY KEY (EmpId)
);

-- Doctor Table
CREATE TABLE Doctor (
  DocId INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  CONSTRAINT PK_Doctor PRIMARY KEY(DocId)
);

-- Patient Table
CREATE TABLE Patient (
  PId INT,
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  EmpID INT,
  DocID INT,
  CONSTRAINT PK_Patient PRIMARY KEY(PId),
  CONSTRAINT FK_Patient_Employee FOREIGN KEY (EmpID) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Patient_Doctor FOREIGN KEY (DocID) REFERENCES Doctor (DocId)
);

-- Payment Table
CREATE TABLE Payment (
  PaymentId INT,
  PayAmount DECIMAL(10, 2),
  PayDate DATE,
  DebitCard VARCHAR(16),
  CreditCard VARCHAR(16),
  CONSTRAINT PK_Payment PRIMARY KEY (PaymentId)
);

-- Orders Table
CREATE TABLE Orders (
  OrderId INT,
  Price DECIMAL(10, 2),
  Quantity INT,
  PId INT,
  PaymentId INT,
  CONSTRAINT PK_Orders PRIMARY KEY (OrderId),
  CONSTRAINT FK_Orders_Product FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Orders_Payment FOREIGN KEY (PaymentId) REFERENCES Payment (PaymentId)
);

-- Vaccines Table
CREATE TABLE Vaccines (
  VaccineId INT,
  Name VARCHAR(255),
  Quantity INT,
  Dosage VARCHAR(50),
  CONSTRAINT PK_Vaccines PRIMARY KEY (VaccineId)
);

-- Supplier Table
CREATE TABLE Supplier (
  SupplierId INT,
  SupplierName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  EmpID INT,
  CONSTRAINT PK_Supplier PRIMARY KEY (SupplierId),
  CONSTRAINT FK_Supplier_Employee FOREIGN KEY (EmpID) REFERENCES Employee (EmpId)
);

-- Booking Table
CREATE TABLE Booking (
  BookId INT,
  Date DATE,
  Time TIME,
  Dosage VARCHAR(50),
  EmpId INT,
  CONSTRAINT PK_Booking PRIMARY KEY(BookId),
  CONSTRAINT FK_Booking_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId)
);

-- OrderRequest Table
CREATE TABLE OrderRequest (
  RequestId INT,
  VaccineName VARCHAR(255),
  Qty INT,
  Emp_Id INT,
  CONSTRAINT PK_OrderRequest PRIMARY KEY (RequestId),
  CONSTRAINT FK_OrderRequest_Employee FOREIGN KEY (Emp_Id) REFERENCES Employee (EmpId)
);

-- CustomerSupport Table
CREATE TABLE CustomerSupport (
  Id INT,
  Date DATE,
  Massage VARCHAR(255),
  PId INT,
  CONSTRAINT PK_CustomerSupport PRIMARY KEY (Id),
  CONSTRAINT FK_CustomerSupport_Patient FOREIGN KEY (PId) REFERENCES Patient (PId)
);

-- Feedback Table
CREATE TABLE Feedback (
  FeedbackId INT,
  FeedbackRating INT,
  EmpId INT,
  PId INT,
  CONSTRAINT PK_Feedback PRIMARY KEY (FeedbackId),
  CONSTRAINT FK_Feedback_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Feedback_Patient FOREIGN KEY (PId) REFERENCES Patient (PId)
);

-- Emp_Con Table
CREATE TABLE Emp_Con (
  EmpId INT,
  ContactNo CHAR(10),
  CONSTRAINT PK_Emp_Con PRIMARY KEY (EmpId, ContactNo),
  CONSTRAINT FK_Emp_Con_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId)
);

-- Doc_Con Table
CREATE TABLE Doc_Con (
  DocId INT,
  ContactNo CHAR(10),
  CONSTRAINT PK_Doc_Con PRIMARY KEY (DocId, ContactNo),
  CONSTRAINT FK_Doc_Con_Doctor FOREIGN KEY (DocId) REFERENCES Doctor (DocId)
);

-- Supplier_Contact Table
CREATE TABLE Supplier_Contact (
  SupplierId INT,
  ContactNo CHAR(10),
  CONSTRAINT PK_Supplier_Contact PRIMARY KEY (SupplierId, ContactNo),
  CONSTRAINT FK_Supplier_Contact_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId)
);

-- Patient_Vaccine Table
CREATE TABLE Patient_Vaccine (
  PId INT,
  VaccineId INT,
  CONSTRAINT PK_Patient_Vaccine PRIMARY KEY (PId, VaccineId),
  CONSTRAINT FK_Patient_Vaccine_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Vaccine_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Order_vaccine Table
CREATE TABLE Order_vaccine (
  OrderId INT,
  VaccineId INT,
  CONSTRAINT PK_Order_vaccine PRIMARY KEY (OrderId, VaccineId),
  CONSTRAINT FK_Order_vaccine_Orders FOREIGN KEY (OrderId) REFERENCES Orders (OrderId),
  CONSTRAINT FK_Order_vaccine_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Patient_Booking Table
CREATE TABLE Patient_Booking (
  PId INT,
  BookId INT,
  VaccineId INT,
  CONSTRAINT PK_Patient_Booking PRIMARY KEY (PId, BookId),
  CONSTRAINT FK_Patient_Booking_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Booking_Booking FOREIGN KEY (BookId) REFERENCES Booking (BookID),
  CONSTRAINT FK_Patient_Booking_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Doctor_booking Table
CREATE TABLE Doctor_booking (
  BookId INT,
  DocId INT,
  CONSTRAINT PK_Doctor_booking PRIMARY KEY (BookId, DocId),
  CONSTRAINT FK_Doctor_booking_Booking FOREIGN KEY (BookId) REFERENCES Booking (BookId),
  CONSTRAINT FK_Doctor_booking_Doctor FOREIGN KEY (DocId) REFERENCES Doctor (DocId)
);

-- Supplier_OrderRequest Table
CREATE TABLE Supplier_OrderRequest (
  SupplierId INT,
  RequestId INT,
  CONSTRAINT PK_Supplier_OrderRequest PRIMARY KEY (SupplierId, RequestId),
  CONSTRAINT FK_Supplier_OrderRequest_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId),
  CONSTRAINT FK_Supplier_OrderRequest_Order_Request FOREIGN KEY (RequestId) REFERENCES OrderRequest (RequestId)
);

-- Vaccine_Supplier Table
CREATE TABLE Vaccine_Supplier (
  VaccineId INT,
  SupplierId INT,
  CONSTRAINT PK_Vaccine_Supplier PRIMARY KEY (VaccineId, SupplierId),
  CONSTRAINT FK_Vaccine_Supplier_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId),
  CONSTRAINT FK_Vaccine_Supplier_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId)
);

-- Patient_Searches Table
CREATE TABLE Patient_Searches (
  PId INT,
  VaccineId INT,
  CONSTRAINT PK_Patient_Searches PRIMARY KEY (PId, VaccineId),
  CONSTRAINT FK_Patient_Searches_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Searches_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Vaccine_Employee Table
CREATE TABLE Vaccine_Employee (
  EmpId INT,
  VaccineId INT,
  CONSTRAINT PK_Vaccine_Employee PRIMARY KEY (EmpId, VaccineId),
  CONSTRAINT FK_Vaccine_Employee_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Vaccine_Employee_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);


--	Inserting Data	--

--Payment Table
