# ✅ Normalization Case Studies – Instructor Solutions (1NF → 3NF)

Below are detailed, instructor-level solutions for each of the five normalization case studies. Each includes table redesigns, explanations, and example SQL queries.

---

## 🧠 Case Study 1 – School Enrollment System

### Original Table
```text
Enrollment(
    StudentID,
    StudentName,
    StudentPhone,
    CourseList,
    InstructorName,
    InstructorEmail,
    Grade
)
```

**Example:**
```text
S101 | Emily Carter | 416-555-8834 | "Math101, Bio201" | "Mr. Lewis, Dr. Brown" | "lewis@school.ca, brown@school.ca" | "A, B+"
```

### Problems
- ❌ 1NF: Lists in `CourseList`, `InstructorName`, `InstructorEmail`, `Grade`.
- ❌ 2NF: `StudentName`, `StudentPhone` depend only on `StudentID`.
- ❌ 3NF: `InstructorEmail` depends on `InstructorName`, not key.

### ✅ 1NF
One row per student-course pair:
```text
StudentID | StudentName  | StudentPhone | CourseCode | InstructorName | InstructorEmail | Grade
S101      | Emily Carter | 416-555-8834 | Math101    | Mr. Lewis      | lewis@school.ca | A
S101      | Emily Carter | 416-555-8834 | Bio201     | Dr. Brown      | brown@school.ca | B+
```

### ✅ 2NF
Split into multiple tables:

#### `Students`
```text
Students(StudentID PK, StudentName, StudentPhone)
S101 | Emily Carter | 416-555-8834
```

#### `Instructors`
```text
Instructors(InstructorID PK, InstructorName, InstructorEmail)
I10 | Mr. Lewis | lewis@school.ca
I11 | Dr. Brown | brown@school.ca
```

#### `Courses`
```text
Courses(CourseCode PK, CourseName, InstructorID FK)
Math101 | Mathematics | I10
Bio201  | Biology     | I11
```

#### `Enrollments`
```text
Enrollments(StudentID FK, CourseCode FK, Grade, PRIMARY KEY (StudentID, CourseCode))
S101 | Math101 | A
S101 | Bio201  | B+
```

### ✅ 3NF
All tables depend directly on their primary key only. No transitive dependencies remain.

### Example Query
```sql
SELECT s.StudentName, c.CourseName, i.InstructorName, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseCode = c.CourseCode
JOIN Instructors i ON c.InstructorID = i.InstructorID
WHERE s.StudentName = 'Emily Carter';
```

### Table Structure

- Create the Database SchoolDB

```
create database schooldb;
go;

use schooldb;
go;

```


- Step 1 (1NF staging)

```
-- 1NF staging: one row per student–course (still denormalized attributes kept)

IF OBJECT_ID('dbo.Enrollment_1NF','U') IS NOT NULL DROP TABLE dbo.Enrollment_1NF;
CREATE TABLE dbo.Enrollment_1NF
(
    StudentID     varchar(20) NOT NULL,
    StudentName   varchar(100) NOT NULL,
    StudentPhone  varchar(25)  NULL,
    CourseCode    varchar(20)  NOT NULL,
    InstructorName  varchar(100) NOT NULL,
    InstructorEmail varchar(200) NOT NULL,
    Grade         varchar(5)   NULL
);

INSERT INTO dbo.Enrollment_1NF (StudentID,StudentName,StudentPhone,CourseCode,InstructorName,InstructorEmail,Grade)
VALUES
('S101','Emily Carter','416-555-8834','Math101','Mr. Lewis','lewis@school.ca','A'),
('S101','Emily Carter','416-555-8834','Bio201','Dr. Brown','brown@school.ca','B+');

```
- Steps 2–3 (2NF → 3NF final schema)

```
-- Drop if rerun
IF OBJECT_ID('dbo.Enrollments','U') IS NOT NULL DROP TABLE dbo.Enrollments;
IF OBJECT_ID('dbo.Courses','U')    IS NOT NULL DROP TABLE dbo.Courses;
IF OBJECT_ID('dbo.Instructors','U') IS NOT NULL DROP TABLE dbo.Instructors;
IF OBJECT_ID('dbo.Students','U')   IS NOT NULL DROP TABLE dbo.Students;

CREATE TABLE dbo.Students
(
    StudentID     varchar(20)  NOT NULL PRIMARY KEY,
    StudentName   varchar(100) NOT NULL,
    StudentPhone  varchar(25)  NULL
);

CREATE TABLE dbo.Instructors
(
    InstructorID    int IDENTITY(1,1) PRIMARY KEY,
    InstructorName  varchar(100) NOT NULL,
    InstructorEmail varchar(200) NOT NULL UNIQUE
);

CREATE TABLE dbo.Courses
(
    CourseCode    varchar(20)  NOT NULL PRIMARY KEY,
    CourseName    varchar(100) NOT NULL,
    InstructorID  int          NOT NULL
        CONSTRAINT FK_Courses_Instructor
        REFERENCES dbo.Instructors(InstructorID)
);

CREATE TABLE dbo.Enrollments
(
    StudentID   varchar(20) NOT NULL
        CONSTRAINT FK_Enroll_Student REFERENCES dbo.Students(StudentID),
    CourseCode  varchar(20) NOT NULL
        CONSTRAINT FK_Enroll_Course  REFERENCES dbo.Courses(CourseCode),
    Grade       varchar(5)  NULL,
    CONSTRAINT PK_Enrollments PRIMARY KEY (StudentID, CourseCode)
);

```

- Sample data

```
INSERT INTO dbo.Students (StudentID, StudentName, StudentPhone) VALUES
('S101','Emily Carter','416-555-8834'),
('S102','Liam Johnson','647-555-7711');

INSERT INTO dbo.Instructors (InstructorName, InstructorEmail) VALUES
('Mr. Lewis','lewis@school.ca'),
('Dr. Brown','brown@school.ca');

INSERT INTO dbo.Courses (CourseCode, CourseName, InstructorID) VALUES
('Math101','Mathematics', 1),
('Bio201' ,'Biology',     2);

INSERT INTO dbo.Enrollments (StudentID,CourseCode,Grade) VALUES
('S101','Math101','A'),
('S101','Bio201','B+'),
('S102','Math101','B');

```

---

## 🏢 Case Study 2 – Employee Project Tracking

### Original Table
```text
ProjectSheet(EmpID, EmpName, Department, ProjectName, ProjectManager, ProjectBudget, HoursWorked, TotalPay)
```

**Example:**
```text
E44 | Daniel Green | IT | "Website Revamp" | "Olivia Turner" | 15000 | 25 | 1000
E44 | Daniel Green | IT | "App Migration"  | "Olivia Turner" | 9000  | 10 | 400
```

### Problems
- ❌ 1NF: Fine.
- ❌ 2NF: `Department` depends only on `EmpID`.
- ❌ 3NF: `ProjectManager` may have its own attributes → transitive dependency.

### ✅ 2NF
Split logically:

#### `Employees`
```text
Employees(EmpID PK, EmpName, DepartmentID FK)
E44 | Daniel Green | D10
```

#### `Departments`
```text
Departments(DepartmentID PK, DepartmentName)
D10 | IT
```

#### `Projects`
```text
Projects(ProjectID PK, ProjectName, ProjectManager, ProjectBudget)
P01 | Website Revamp | Olivia Turner | 15000
P02 | App Migration  | Olivia Turner | 9000
```

#### `Assignments`
```text
Assignments(EmpID FK, ProjectID FK, HoursWorked, TotalPay, PRIMARY KEY (EmpID, ProjectID))
E44 | P01 | 25 | 1000
E44 | P02 | 10 | 400
```

### ✅ 3NF
Separate manager details.

#### `Managers`
```text
Managers(ManagerID PK, ManagerName)
M01 | Olivia Turner
```

#### `Projects` updated
```text
Projects(ProjectID PK, ProjectName, ManagerID FK, ProjectBudget)
P01 | Website Revamp | M01 | 15000
P02 | App Migration  | M01 | 9000
```

---

## 🏬 Case Study 3 – Retail Inventory & Sales

### Original Table
```text
Sales(SaleID, Date, CustomerName, CustomerPhone, ProductList, QuantityList, PriceList, Total)
```

**Example:**
```text
S9001 | 2025-10-20 | Sarah Johnson | 905-333-4455 | "P10,P22" | "2,1" | "10.99,45.00" | 66.98
```

### ✅ 1NF
```text
SaleID | Date | CustomerName | ProductCode | Quantity | UnitPrice | LineTotal
S9001  | 2025-10-20 | Sarah Johnson | P10 | 2 | 10.99 | 21.98
S9001  | 2025-10-20 | Sarah Johnson | P22 | 1 | 45.00 | 45.00
```

### ✅ 2NF
Split tables:

#### `Customers`
```text
Customers(CustomerID PK, CustomerName, CustomerPhone)
C100 | Sarah Johnson | 905-333-4455
```

#### `Sales`
```text
Sales(SaleID PK, Date, CustomerID FK, Total)
S9001 | 2025-10-20 | C100 | 66.98
```

#### `Products`
```text
Products(ProductCode PK, ProductName, CurrentPrice)
P10 | USB-C Cable | 10.99
P22 | Laptop Stand | 45.00
```

#### `SaleItems`
```text
SaleItems(SaleID FK, ProductCode FK, Quantity, SoldPrice, LineTotal, PRIMARY KEY (SaleID, ProductCode))
S9001 | P10 | 2 | 10.99 | 21.98
S9001 | P22 | 1 | 45.00 | 45.00
```

### ✅ 3NF
Remove derived `LineTotal` if enforcing strict 3NF.

### Query Example
```sql
SELECT s.SaleID, c.CustomerName, p.ProductName, si.Quantity, si.SoldPrice
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN SaleItems si ON s.SaleID = si.SaleID
JOIN Products p ON si.ProductCode = p.ProductCode;
```

---

## 🏥 Case Study 4 – Hospital Patient Visits

### Original Table
```text
Visits(VisitID, PatientName, PatientDOB, DoctorName, DoctorSpecialty, Medications, Dosages, VisitDate, BillAmount)
```

### ✅ 1NF
Each medication as separate row:
```text
VisitID | PatientName | DoctorName | MedicationName | Dosage | VisitDate | BillAmount
V300 | John Miller | Dr. Olivia White | Aspirin | 75mg | 2025-09-12 | 220
V300 | John Miller | Dr. Olivia White | Lipitor | 10mg | 2025-09-12 | 220
```

### ✅ 2NF
Separate entities:

#### `Patients`
```text
Patients(PatientID PK, PatientName, PatientDOB)
P200 | John Miller | 1988-05-16
```

#### `Doctors`
```text
Doctors(DoctorID PK, DoctorName, DoctorSpecialty)
D50 | Dr. Olivia White | Cardiology
```

#### `Visits`
```text
Visits(VisitID PK, PatientID FK, DoctorID FK, VisitDate, BillAmount)
V300 | P200 | D50 | 2025-09-12 | 220
```

#### `Medications`
```text
Medications(MedicationID PK, MedicationName)
M10 | Aspirin
M11 | Lipitor
```

#### `VisitPrescriptions`
```text
VisitPrescriptions(VisitID FK, MedicationID FK, Dosage, PRIMARY KEY (VisitID, MedicationID))
V300 | M10 | 75mg
V300 | M11 | 10mg
```

### ✅ 3NF
No transitive dependencies remain.

### Query Example
```sql
SELECT p.PatientName, d.DoctorName, v.VisitDate, m.MedicationName, vp.Dosage
FROM VisitPrescriptions vp
JOIN Visits v ON vp.VisitID = v.VisitID
JOIN Patients p ON v.PatientID = p.PatientID
JOIN Doctors d ON v.DoctorID = d.DoctorID
JOIN Medications m ON vp.MedicationID = m.MedicationID;
```

---

## ✈️ Case Study 5 – Airline Flight Bookings (Toronto–London)

### Original Table
```text
Bookings(BookingID, PassengerName, PassengerEmail, FlightNo, Route, DepartureTime, SeatNo, Fare, PaymentCard, CardHolderName)
```

### ✅ 2NF
Separate entities:

#### `Passengers`
```text
Passengers(PassengerID PK, PassengerName, PassengerEmail)
P900 | James Walker | james.walker@gmail.com
```

#### `Flights`
```text
Flights(FlightID PK, FlightNo, OriginCity, DestinationCity, DepartureTime)
F702-2025-11-02 | AC702 | Toronto | London | 2025-11-02 09:30
```

#### `Bookings`
```text
Bookings(BookingID PK, PassengerID FK, FlightID FK, SeatNo, Fare)
B555 | P900 | F702-2025-11-02 | 22A | 1250
```

#### `Payments`
```text
Payments(PaymentID PK, BookingID FK, CardMasked, CardHolderName)
Pay777 | B555 | 4444-****-9876 | James Walker
```

### ✅ 3NF
No transitive dependencies. Passenger info, flight info, and payment info live in separate entities.

### Query Example
```sql
SELECT p.PassengerName, p.PassengerEmail, f.FlightNo, f.OriginCity, f.DestinationCity,
       f.DepartureTime, b.SeatNo, b.Fare, pay.CardMasked
FROM Bookings b
JOIN Passengers p ON b.PassengerID = p.PassengerID
JOIN Flights f ON b.FlightID = f.FlightID
LEFT JOIN Payments pay ON b.BookingID = pay.BookingID
WHERE f.OriginCity = 'Toronto' AND f.DestinationCity = 'London';
```

---

## 🧾 Summary Table
| Normal Form | Description | Goal |
|--------------|-------------|------|
| **1NF** | Remove repeating groups; each cell holds one value. | Structural integrity |
| **2NF** | Remove partial dependencies; every column depends on the whole key. | Logical integrity |
| **3NF** | Remove transitive dependencies; each attribute depends directly on the key. | Semantic integrity |

