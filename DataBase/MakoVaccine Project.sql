--	...MLB_11.01_06...	--

-- Creating the MakoVaccines database
CREATE DATABASE MakoVaccines;
GO
-- Switching to the MakoVaccines database
USE MakoVaccines;
GO

--	Creating Tables

-- Employee Table
CREATE TABLE Employee (
  EmpId VARCHAR(20),
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Age INT,
  Email VARCHAR(255),
  Address VARCHAR(255),
  CONSTRAINT PK_Employee PRIMARY KEY (EmpId)
);

-- Doctor Table
CREATE TABLE Doctor (
  DocId VARCHAR(20),
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  CONSTRAINT PK_Doctor PRIMARY KEY(DocId)
);

-- Patient Table
CREATE TABLE Patient (
  PId VARCHAR(20),
  FirstName VARCHAR(255),
  LastName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  EmpID VARCHAR(20),
  DocID VARCHAR(20),
  CONSTRAINT PK_Patient PRIMARY KEY(PId),
  CONSTRAINT FK_Patient_Employee FOREIGN KEY (EmpID) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Patient_Doctor FOREIGN KEY (DocID) REFERENCES Doctor (DocId)
);

-- Payment Table
CREATE TABLE Payment (
  PaymentId VARCHAR(20),
  PayAmount DECIMAL(10, 2),
  PayDate DATE,
  DebitCard VARCHAR(16),
  CreditCard VARCHAR(16),
  CONSTRAINT PK_Payment PRIMARY KEY (PaymentId)
);

-- Orders Table
CREATE TABLE Orders (
  OrderId VARCHAR(20),
  Price DECIMAL(10, 2),
  Quantity INT,
  PId VARCHAR(20),
  PaymentId VARCHAR(20),
  CONSTRAINT PK_Orders PRIMARY KEY (OrderId),
  CONSTRAINT FK_Orders_Product FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Orders_Payment FOREIGN KEY (PaymentId) REFERENCES Payment (PaymentId)
);

-- Vaccines Table
CREATE TABLE Vaccines (
  VaccineId VARCHAR(20),
  Name VARCHAR(255),
  Quantity INT,
  Dosage VARCHAR(50),
  CONSTRAINT PK_Vaccines PRIMARY KEY (VaccineId)
);

-- Supplier Table
CREATE TABLE Supplier (
  SupplierId VARCHAR(20),
  SupplierName VARCHAR(255),
  Email VARCHAR(255),
  Address VARCHAR(255),
  EmpID VARCHAR(20),
  CONSTRAINT PK_Supplier PRIMARY KEY (SupplierId),
  CONSTRAINT FK_Supplier_Employee FOREIGN KEY (EmpID) REFERENCES Employee (EmpId)
);

-- Booking Table
CREATE TABLE Booking (
  BookId VARCHAR(20),
  Date DATE,
  Time TIME,
  Dosage VARCHAR(50),
  EmpId VARCHAR(20),
  CONSTRAINT PK_Booking PRIMARY KEY(BookId),
  CONSTRAINT FK_Booking_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId)
);

-- OrderRequest Table
CREATE TABLE OrderRequest (
  RequestId VARCHAR(20),
  VaccineName VARCHAR(255),
  Qty INT,
  Emp_Id VARCHAR(20),
  CONSTRAINT PK_OrderRequest PRIMARY KEY (RequestId),
  CONSTRAINT FK_OrderRequest_Employee FOREIGN KEY (Emp_Id) REFERENCES Employee (EmpId)
);

-- CustomerSupport Table
CREATE TABLE CustomerSupport (
  Id VARCHAR(20),
  Date DATE,
  Massage VARCHAR(255),
  PId VARCHAR(20),
  CONSTRAINT PK_CustomerSupport PRIMARY KEY (Id),
  CONSTRAINT FK_CustomerSupport_Patient FOREIGN KEY (PId) REFERENCES Patient (PId)
);

-- Feedback Table
CREATE TABLE Feedback (
  FeedbackId VARCHAR(20),
  FeedbackRating INT,
  EmpId VARCHAR(20),
  PId VARCHAR(20),
  CONSTRAINT PK_Feedback PRIMARY KEY (FeedbackId),
  CONSTRAINT FK_Feedback_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Feedback_Patient FOREIGN KEY (PId) REFERENCES Patient (PId)
);

-- Emp_Con Table
CREATE TABLE Emp_Con (
  EmpId VARCHAR(20),
  ContactNo CHAR(10),
  CONSTRAINT PK_Emp_Con PRIMARY KEY (EmpId, ContactNo),
  CONSTRAINT FK_Emp_Con_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId)
);

-- Doc_Con Table
CREATE TABLE Doc_Con (
  DocId VARCHAR(20),
  ContactNo CHAR(10),
  CONSTRAINT PK_Doc_Con PRIMARY KEY (DocId, ContactNo),
  CONSTRAINT FK_Doc_Con_Doctor FOREIGN KEY (DocId) REFERENCES Doctor (DocId)
);

-- Supplier_Contact Table
CREATE TABLE Supplier_Contact (
  SupplierId VARCHAR(20),
  ContactNo CHAR(10),
  CONSTRAINT PK_Supplier_Contact PRIMARY KEY (SupplierId, ContactNo),
  CONSTRAINT FK_Supplier_Contact_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId)
);

-- Patient_Vaccine Table
CREATE TABLE Patient_Vaccine (
  PId VARCHAR(20),
  VaccineId VARCHAR(20),
  CONSTRAINT PK_Patient_Vaccine PRIMARY KEY (PId, VaccineId),
  CONSTRAINT FK_Patient_Vaccine_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Vaccine_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Order_vaccine Table
CREATE TABLE Order_vaccine (
  OrderId VARCHAR(20),
  VaccineId VARCHAR(20),
  CONSTRAINT PK_Order_vaccine PRIMARY KEY (OrderId, VaccineId),
  CONSTRAINT FK_Order_vaccine_Orders FOREIGN KEY (OrderId) REFERENCES Orders (OrderId),
  CONSTRAINT FK_Order_vaccine_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Patient_Booking Table
CREATE TABLE Patient_Booking (
  PId VARCHAR(20),
  BookId VARCHAR(20),
  VaccineId VARCHAR(20),
  CONSTRAINT PK_Patient_Booking PRIMARY KEY (PId, BookId),
  CONSTRAINT FK_Patient_Booking_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Booking_Booking FOREIGN KEY (BookId) REFERENCES Booking (BookID),
  CONSTRAINT FK_Patient_Booking_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Doctor_booking Table
CREATE TABLE Doctor_booking (
  BookId VARCHAR(20),
  DocId VARCHAR(20),
  CONSTRAINT PK_Doctor_booking PRIMARY KEY (BookId, DocId),
  CONSTRAINT FK_Doctor_booking_Booking FOREIGN KEY (BookId) REFERENCES Booking (BookId),
  CONSTRAINT FK_Doctor_booking_Doctor FOREIGN KEY (DocId) REFERENCES Doctor (DocId)
);

-- Supplier_OrderRequest Table
CREATE TABLE Supplier_OrderRequest (
  SupplierId VARCHAR(20),
  RequestId VARCHAR(20),
  CONSTRAINT PK_Supplier_OrderRequest PRIMARY KEY (SupplierId, RequestId),
  CONSTRAINT FK_Supplier_OrderRequest_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId),
  CONSTRAINT FK_Supplier_OrderRequest_Order_Request FOREIGN KEY (RequestId) REFERENCES OrderRequest (RequestId)
);

-- Vaccine_Supplier Table
CREATE TABLE Vaccine_Supplier (
  VaccineId VARCHAR(20),
  SupplierId VARCHAR(20),
  CONSTRAINT PK_Vaccine_Supplier PRIMARY KEY (VaccineId, SupplierId),
  CONSTRAINT FK_Vaccine_Supplier_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId),
  CONSTRAINT FK_Vaccine_Supplier_Supplier FOREIGN KEY (SupplierId) REFERENCES Supplier (SupplierId)
);

-- Patient_Searches Table
CREATE TABLE Patient_Searches (
  PId VARCHAR(20),
  VaccineId VARCHAR(20),
  CONSTRAINT PK_Patient_Searches PRIMARY KEY (PId, VaccineId),
  CONSTRAINT FK_Patient_Searches_Patient FOREIGN KEY (PId) REFERENCES Patient (PId),
  CONSTRAINT FK_Patient_Searches_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);

-- Vaccine_Employee Table
CREATE TABLE Vaccine_Employee (
  EmpId VARCHAR(20),
  VaccineId VARCHAR(20),
  CONSTRAINT PK_Vaccine_Employee PRIMARY KEY (EmpId, VaccineId),
  CONSTRAINT FK_Vaccine_Employee_Employee FOREIGN KEY (EmpId) REFERENCES Employee (EmpId),
  CONSTRAINT FK_Vaccine_Employee_Vaccines FOREIGN KEY (VaccineId) REFERENCES Vaccines (VaccineId)
);



--	Inserting Data

--Employees table
INSERT INTO Employee (EmpId, FirstName, LastName, Age, Email, Address)
VALUES
  (Emp1, 'Shanaka', 'Perera', 25, 'shanaka.perera@gmail.com', ' 231/10/D Panchikawatta Road, 10'),
  (Emp2, 'Kumara', 'Anthony', 28, 'kumara.perera@gmail.com', '87, Horton Place'),
  (Emp3, 'Dammika', 'Prasad', 32, 'dammika.prasad@gmail.com', '4 Independence Avenue, 07'),
  (Emp4, 'Sarath', 'Delgoda', 30, 'sarath.delgoda@gmail.com', '179/1, Hospital Road'),
  (Emp5, 'Manilka', 'Samith', 27, 'manilka.samith@gmail.com', '610, Galle Road, Kollpitty');


--Doctors table
INSERT INTO Doctor (DocId, FirstName, LastName, Email, Address)
VALUES
  (D1, 'Dr. Wasantha', 'Rathnayaka', 'wasantha.rathnayaka@gmail.com', '198/1, Asoka Gardens'),
  (D2, 'Dr. Damayanthi', 'Pieris', 'damayanthi.pieris@gmail.com', 'No 103/1, D.S.Senanayaka Street'),
  (D3, 'Dr. Kanthi', 'Perera', 'kanthi.perera@gmail.com', 'No 7, Jaya Mw'),
  (D4, 'Dr. Mahendra', 'Nagoda', 'mahendra.nagoda@gmail.com', '57/3 2nd Cross Street, 11'),
  (D5, 'Dr. Lakshmen', 'Obeysekara', 'lakshmen.obeysekara@gmail.com', '16A, Watapotha Road');

   
--Patients table
INSERT INTO Patient (PId, FirstName, LastName, Email, Address, EmpID, DocID)
VALUES
  (P1, 'Thilina', 'Kasun', 'thilina.kasun@gmail.com', ' 148, Vauxhall Street', Emp1, D1),
  (P2, 'Sugath', ' Hettige', 'Sugath.Hettige@gmail.com', '22 Kirula Place, 05', Emp2, D2),
  (P3, 'Samaraweera', 'Gunewardena', 'Samaraweera.Gune@gmail.com', '107 Colombo 111 3A 3B 2nd Cross Street, 11', Emp3, D3),
  (P4, 'Gnanathilaka', 'Silva', 'Gnanathilaka.Silva@gmail.com', ' 92 Church Street, 02', Emp4, D4),
  (P5, 'Nelaka', 'Gunasekara', 'Nelaka.Gunasekara@gmail.com', '144/D 1/1, Anderson Road', Emp5, D5),
  (P6, 'Sandeepa', 'Gunewardene', 'Sandeepa.Gunewardene@gmail.com', '48A Dickmans Road, 05', Emp1, D1),
  (P7, 'Jayaneth', 'Maitreya', 'Jayaneth.Maitreya@gmail.com', '73/3 Maliban Street, 11', Emp2, D2),
  (P8, 'Geeth', 'Weerasekara', 'Geeth.Weerasekara@gmail.com', '108 New Moor Street, 12', Emp3, D3),
  (P9, 'Nanayakkara', 'Tilakaratna', 'Nanayakkara.Tilakaratna@gmail.com', ' 33 2/8 Plaza Complex Galle Road, 06', Emp4, D4),
  (P10, 'Ranathunga', 'Samaranayake', 'Ranathunga.Samaranayake@gmail.com', ' 85 Bankshall Street, 11', Emp5, D5);


--Payment table
INSERT INTO Payment (PaymentId, PayAmount, PayDate, DebitCard, CreditCard)
VALUES
  (Pay1, 1000.00, '2023-05-01', '1234567890123456', NULL),
  (Pay2, 5000.00, '2023-05-02', NULL, '9876543210987654'),
  (Pay3, 7500.00, '2023-05-03', '1111222233334444', NULL),
  (Pay4, 12000.00, '2023-05-04', NULL, '5555666677778888'),
  (Pay5, 8900.00, '2023-05-05', '9999888877776666', NULL);


--Orders table
INSERT INTO Orders (OrderId, Price, Quantity, PId, PaymentId)
VALUES
  (ORD1, 10000.00, 2, P1, Pay1),
  (ORD2, 15000.00, 1, P2, Pay2),
  (ORD3, 20000.00, 3, P3, Pay3),
  (ORD4, 80000.00, 5, P4, Pay4),
  (ORD5, 12000.00, 4, P5, Pay5);
   
  
--Vaccines table
INSERT INTO Vaccines (VaccineId, Name, Quantity, Dosage)
VALUES
  (V1, 'Vaccine A', 100, '2 doses'),
  (V2, 'Vaccine B', 200, '2 doses'),
  (V3, 'Vaccine C', 150, '1 dose'),
  (V4, 'Vaccine D', 300, '2 doses'),
  (V5, 'Vaccine E', 250, '1 dose'),
  (V6, 'Vaccine F', 100, '2 doses'),
  (V7, 'Vaccine G', 200, '2 doses'),
  (V8, 'Vaccine H', 150, '1 dose'),
  (V9, 'Vaccine I', 300, '2 doses'),
  (V10, 'Vaccine J', 250, '1 dose');
 
   
--Suppliers table
INSERT INTO Supplier (SupplierId, SupplierName, Email, Address, EmpID)
VALUES
  (Sup1, 'Lahiru', 'Lahiru.Sangakkara@gmail.com', ' 2/1 2nd Flr 96 Prince Street, 11', Emp1),
  (Sup2, 'Upali', 'Upali.Obeysekera@gmail.com', '22/4,Thunmodar, Pahalakottaramulla', Emp2),
  (Sup3, 'Nuwanga', 'Nuwanga.Goonatilake@gmail.com', '363 Serpentine Road, 08', Emp3),
  (Sup4, 'Ranasinghe', 'Ranasinghe.Nanananda@gmail.com', '425, THIMBIRIGASYAYA ROAD', Emp4),
  (Sup5, 'Samarathna', 'Samarathna.Paranavithana@gmail.com', 'icarage 21 Street, Lawrance Road', Emp5),
  (Sup6, 'Soraj', 'Soraj.Vimukthi@gmail.com', '2 Mile Post Avenue, 03', 1),
  (Sup7, 'Wellala', 'Wellala.Dharmagunawardhana@gmail.com', ' 353 Kollupitiya Road, 03', Emp2),
  (Sup8, 'Maddumahewage', 'Maddumahewage.Jayatilleke@gmail.com', ' 238 Grandpass Road, 14', Emp3),
  (Sup9, 'Muditha', 'Muditha.Banda@gmail.com', '219/4, Galendanda', Emp4),
  (Sup10, 'Ariyarathne', 'Ariyarathne.Premaratne@gmail.com', ' 424 Old Moor Street, 12', Emp5);
  
  
--Booking table
INSERT INTO Booking (BookId, Date, Time, Dosage, EmpId)
VALUES
  (BK1, '2023-05-27', '09:00:00', '2 doses', Emp1),
  (BK2, '2023-05-28', '10:00:00', '2 doses', Emp2),
  (BK3, '2023-05-29', '11:00:00', '2 doses', Emp3),
  (BK4, '2023-05-30', '12:00:00', '2 doses', Emp4),
  (BK5, '2023-06-01', '13:00:00', '2 doses', Emp5);
  

--OrderRequest table
INSERT INTO OrderRequest (RequestId, VaccineName, Qty, Emp_Id)
VALUES
  (Rq1, 'Vaccine A', 100, Emp1),
  (Rq2, 'Vaccine B', 200, Emp2),
  (Rq3, 'Vaccine C', 150, Emp3),
  (Rq4, 'Vaccine D', 300, Emp4),
  (Rq5, 'Vaccine E', 250, Emp5);
  

--CustomerSupport table
INSERT INTO CustomerSupport (Id, Date, Massage, PId)
VALUES
  (CuSup1, '2023-05-01', 'Issue 1', P1),
  (CuSup2, '2023-05-02', 'Issue 2', P2),
  (CuSup3, '2023-05-03', 'Issue 3', P3),
  (CuSup4, '2023-05-04', 'Issue 4', P4),
  (CuSup5, '2023-05-05', 'Issue 5', P5);
 

--Feedback table
INSERT INTO Feedback (FeedbackId, FeedbackRating, EmpId, PId)
VALUES
  (FB1, 5, Emp1, P1),
  (FB2, 4, Emp2, P2),
  (FB3, 3, Emp3, P3),
  (FB4, 2, Emp4, P4),
  (FB5, 1, Emp5, P5);
  

--Emp_Con table
INSERT INTO Emp_Con (EmpId, ContactNo)
VALUES
  (Emp1, '0754567890'),
  (Emp2, '0775678901'),
  (Emp3, '0726789012'),
  (Emp4, '0747890123'),
  (Emp5, '0718901234');
 

--Doc_Con table
INSERT INTO Doc_Con (DocId, ContactNo)
VALUES
  (D1, '0756754862'),
  (D2, '0779631548'),
  (D3, '0718526424'),
  (D4, '0721584986'),
  (D5, '0745896746');
    

--Supplier_Contact table
INSERT INTO Supplier_Contact (SupplierId, ContactNo)
VALUES
  (Sup1, '0778529632'),
  (Sup2, '0718524569'),
  (Sup3, '0756847182'),
  (Sup4, '0727894563'),
  (Sup5, '0741245671'),
  (Sup6, '0779012345'),
  (Sup7, '0750123456'),
  (Sup8, '0701234567'),
  (Sup9, '0772345678'),
  (Sup10, '0723456789');
  

--Patient_Vaccine table
INSERT INTO Patient_Vaccine (PId, VaccineId)
VALUES
  (P1, V1),
  (P2, V2),
  (P3, V3),
  (P4, V4),
  (P5, V5),
  (P6, V6),
  (P7, V7),
  (P8, V8),
  (P9, V9),
  (P10, V10);
  

--Order_vaccine table
INSERT INTO Order_vaccine (OrderId, VaccineId)
VALUES
  (ORD1, V1),
  (ORD2, V2),
  (ORD3, V3),
  (ORD4, V4),
  (ORD5, V5);
  

--Patient_Booking table
INSERT INTO Patient_Booking (PId, BookId, VaccineId)
VALUES
  (P1, BK1, V1),
  (P2, BK2, V2),
  (P3, BK3, V3),
  (P4, BK4, V4),
  (P5, BK5, V5);


--Doctor_booking table
INSERT INTO Doctor_booking (BookId, DocId)
VALUES
  (BK1, D1),
  (BK2, D2),
  (BK3, D3),
  (BK4, D4),
  (BK5, D5);
  

--Supplier_OrderRequest table
INSERT INTO Supplier_OrderRequest (SupplierId, RequestId)
VALUES
  (Sup1, Rq1),
  (Sup2, Rq2),
  (Sup3, Rq3),
  (Sup4, Rq4),
  (Sup5, Rq5);
  

--Vaccine_Supplier table
INSERT INTO Vaccine_Supplier (VaccineId, SupplierId)
VALUES
  (V1, Sup1),
  (V2, Sup2),
  (V3, Sup3),
  (V4, Sup4),
  (V5, Sup5);
  

--Patient_Searches table
INSERT INTO Patient_Searches (PId, VaccineId)
VALUES
  (P1, V1),
  (P2, V2),
  (P3, V3),
  (P4, V4),
  (P5, V5);
  

--Vaccine_Employee table
INSERT INTO Vaccine_Employee (EmpId, VaccineId)
VALUES
  (Emp1, V1),
  (Emp2, V2),
  (Emp3, V3),
  (Emp4, V4),
  (Emp5, V5);
