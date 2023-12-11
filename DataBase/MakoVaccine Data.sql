

--	Inserting Data	--

-- Inserting data into Employees table
INSERT INTO Employee (EmpId, FirstName, LastName, Age, Email, Address)
VALUES
  (1, 'John', 'Doe', 25, 'john.doe@example.com', '123 Main St'),
  (2, 'Jane', 'Smith', 28, 'jane.smith@example.com', '456 Elm St'),
  (3, 'David', 'Johnson', 32, 'david.johnson@example.com', '789 Oak St'),
  (4, 'Sarah', 'Williams', 30, 'sarah.williams@example.com', '321 Pine St'),
  (5, 'Michael', 'Brown', 27, 'michael.brown@example.com', '654 Cedar St');


-- Inserting data into Doctors table
INSERT INTO Doctor (DocId, FirstName, LastName, Email, Address)
VALUES
  (1, 'Dr. Emily', 'Jones', 'emily.jones@example.com', '123 Medical Ave'),
  (2, 'Dr. Daniel', 'Wilson', 'daniel.wilson@example.com', '456 Health St'),
  (3, 'Dr. Olivia', 'Davis', 'olivia.davis@example.com', '789 Wellness Rd'),
  (4, 'Dr. Ethan', 'Anderson', 'ethan.anderson@example.com', '321 Care Blvd'),
  (5, 'Dr. Sophia', 'Taylor', 'sophia.taylor@example.com', '654 Hospital Dr');

   
  -- Inserting data into Patients table
INSERT INTO Patient (PId, FirstName, LastName, Email, Address, EmpID, DocID)
VALUES
  (1, 'Alice', 'Johnson', 'alice.johnson@example.com', '123 Elm St', 1, 1),
  (2, 'Bob', 'Smith', 'bob.smith@example.com', '456 Oak St', 2, 2),
  (3, 'Emma', 'Wilson', 'emma.wilson@example.com', '789 Maple Ave', 3, 3),
  (4, 'James', 'Brown', 'james.brown@example.com', '321 Pine St', 4, 4),
  (5, 'Olivia', 'Davis', 'olivia.davis@example.com', '654 Cedar St', 5, 5),
  (6, 'Sophia', 'Jones', 'sophia.jones@example.com', '123 Medical Ave', 1, 1),
  (7, 'Daniel', 'Williams', 'daniel.williams@example.com', '456 Health St', 2, 2),
  (8, 'Ethan', 'Taylor', 'ethan.taylor@example.com', '789 Wellness Rd', 3, 3),
  (9, 'Emily', 'Anderson', 'emily.anderson@example.com', '321 Care Blvd', 4, 4),
  (10, 'Michael', 'Smith', 'michael.smith@example.com', '654 Hospital Dr', 5, 5);


  -- Inserting data into Payment table
INSERT INTO Payment (PaymentId, PayAmount, PayDate, DebitCard, CreditCard)
VALUES
  (1, 100.50, '2023-05-01', '1234567890123456', NULL),
  (2, 50.25, '2023-05-02', NULL, '9876543210987654'),
  (3, 75.75, '2023-05-03', '1111222233334444', NULL),
  (4, 120.99, '2023-05-04', NULL, '5555666677778888'),
  (5, 89.50, '2023-05-05', '9999888877776666', NULL);

  
-- Inserting data into Orders table
INSERT INTO Orders (OrderId, Price, Quantity, PId, PaymentId)
VALUES
  (1, 10.99, 2, 1, 1),
  (2, 15.99, 1, 2, 2),
  (3, 20.99, 3, 3, 3),
  (4, 8.99, 5, 4, 4),
  (5, 12.99, 4, 5, 5);
   

-- Inserting data into Vaccines table
INSERT INTO Vaccines (VaccineId, Name, Quantity, Dosage)
VALUES
  (1, 'Vaccine A', 100, '2 doses'),
  (2, 'Vaccine B', 200, '2 doses'),
  (3, 'Vaccine C', 150, '1 dose'),
  (4, 'Vaccine D', 300, '2 doses'),
  (5, 'Vaccine E', 250, '1 dose'),
  (6, 'Vaccine F', 100, '2 doses'),
  (7, 'Vaccine G', 200, '2 doses'),
  (8, 'Vaccine H', 150, '1 dose'),
  (9, 'Vaccine I', 300, '2 doses'),
  (10, 'Vaccine J', 250, '1 dose');
 

  -- Inserting data into Suppliers table
INSERT INTO Supplier (SupplierId, SupplierName, Email, Address, EmpID)
VALUES
  (1, 'Supplier 1', 'supplier1@example.com', '123 Supplier St', 1),
  (2, 'Supplier 2', 'supplier2@example.com', '456 Supplier Ave', 2),
  (3, 'Supplier 3', 'supplier3@example.com', '789 Supplier Rd', 3),
  (4, 'Supplier 4', 'supplier4@example.com', '321 Supplier Blvd', 4),
  (5, 'Supplier 5', 'supplier5@example.com', '654 Supplier Dr', 5),
  (6, 'Supplier 6', 'supplier6@example.com', '123 Supplier St', 1),
  (7, 'Supplier 7', 'supplier7@example.com', '456 Supplier Ave', 2),
  (8, 'Supplier 8', 'supplier8@example.com', '789 Supplier Rd', 3),
  (9, 'Supplier 9', 'supplier9@example.com', '321 Supplier Blvd', 4),
  (10, 'Supplier 10', 'supplier10@example.com', '654 Supplier Dr', 5);

  
-- Inserting data into Booking table
INSERT INTO Booking (BookId, Date, Time, Dosage, EmpId)
VALUES
  (1, '2023-05-27', '09:00:00', '2 doses', 1),
  (2, '2023-05-28', '10:00:00', '2 doses', 2),
  (3, '2023-05-29', '11:00:00', '2 doses', 3),
  (4, '2023-05-30', '12:00:00', '2 doses', 4),
  (5, '2023-06-01', '13:00:00', '2 doses', 5);


-- Inserting data into OrderRequest table
INSERT INTO OrderRequest (RequestId, VaccineName, Qty, Emp_Id)
VALUES
  (1, 'Vaccine A', 100, 1),
  (2, 'Vaccine B', 200, 2),
  (3, 'Vaccine C', 150, 3),
  (4, 'Vaccine D', 300, 4),
  (5, 'Vaccine E', 250, 5);


-- Inserting data into CustomerSupport table
INSERT INTO CustomerSupport (Id, Date, Massage, PId)
VALUES
  (1, '2023-05-01', 'Issue 1', 1),
  (2, '2023-05-02', 'Issue 2', 2),
  (3, '2023-05-03', 'Issue 3', 3),
  (4, '2023-05-04', 'Issue 4', 4),
  (5, '2023-05-05', 'Issue 5', 5);


-- Inserting data into Feedback table
INSERT INTO Feedback (FeedbackId, FeedbackRating, EmpId, PId)
VALUES
  (1, 5, 1, 1),
  (2, 4, 2, 2),
  (3, 3, 3, 3),
  (4, 2, 4, 4),
  (5, 1, 5, 5);


-- Inserting data into Emp_Con table
INSERT INTO Emp_Con (EmpId, ContactNo)
VALUES
  (1, '1234567890'),
  (2, '2345678901'),
  (3, '3456789012'),
  (4, '4567890123'),
  (5, '5678901234');


-- Inserting data into Doc_Con table
INSERT INTO Doc_Con (DocId, ContactNo)
VALUES
  (1, '1111111111'),
  (2, '2222222222'),
  (3, '3333333333'),
  (4, '4444444444'),
  (5, '5555555555');


  -- Inserting data into Supplier_Contact table
INSERT INTO Supplier_Contact (SupplierId, ContactNo)
VALUES
  (1, '1234567890'),
  (2, '2345678901'),
  (3, '3456789012'),
  (4, '4567890123'),
  (5, '5678901234'),
  (6, '6789012345'),
  (7, '7890123456'),
  (8, '8901234567'),
  (9, '9012345678'),
  (10, '0123456789');


-- Inserting data into Patient_Vaccine table
INSERT INTO Patient_Vaccine (PId, VaccineId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 10);


-- Inserting data into Order_vaccine table
INSERT INTO Order_vaccine (OrderId, VaccineId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserting data into Patient_Booking table
INSERT INTO Patient_Booking (PId, BookId, VaccineId)
VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 3),
  (4, 4, 4),
  (5, 5, 5);


-- Inserting data into Doctor_booking table
INSERT INTO Doctor_booking (BookId, DocId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserting data into Supplier_OrderRequest table
INSERT INTO Supplier_OrderRequest (SupplierId, RequestId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserting data into Vaccine_Supplier table
INSERT INTO Vaccine_Supplier (VaccineId, SupplierId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserting data into Patient_Searches table
INSERT INTO Patient_Searches (PId, VaccineId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);


-- Inserting data into Vaccine_Employee table
INSERT INTO Vaccine_Employee (EmpId, VaccineId)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5);
