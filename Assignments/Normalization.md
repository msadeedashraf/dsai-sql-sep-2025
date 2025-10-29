# 🤩 Database Normalization – Case Study Assignments (1NF → 3NF)

**Goal:**
Understand how to transform messy real-world data into a properly structured relational model using **First (1NF)**, **Second (2NF)**, and **Third Normal Form (3NF)**.

Each case starts with a poorly designed table.
Your job is to:

1. Identify normalization issues.
2. Normalize step-by-step (1NF → 2NF → 3NF).
3. Create the final tables and relationships.
4. Explain your design and reasoning.

---

## 🧠 Case Study 1 – School Enrollment System

### Problem Statement

A high school keeps course enrollments in one giant spreadsheet:

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

### Tasks

1. Identify the violations of 1NF, 2NF, and 3NF.
2. Normalize step-by-step up to 3NF.
3. Create separate tables for `Students`, `Courses`, `Instructors`, and `Enrollments`.
4. Explain the dependencies you eliminated at each stage.
5. Write a query to list all courses taken by **Emily Carter**.

---

## 🏢 Case Study 2 – Employee Project Tracking

### Problem Statement

A small software company stores employee project data like this:

```text
ProjectSheet(
    EmpID,
    EmpName,
    Department,
    ProjectName,
    ProjectManager,
    ProjectBudget,
    HoursWorked,
    TotalPay
)
```

**Example:**

```text
E44 | Daniel Green | IT | "Website Revamp" | "Olivia Turner" | 15000 | 25 | 1000
E44 | Daniel Green | IT | "App Migration"  | "Olivia Turner" | 9000  | 10 | 400
```

### Tasks

1. Identify columns that repeat across rows or depend on only part of the key.
2. Normalize this table up to 3NF.
3. Create logical tables such as `Employees`, `Departments`, `Projects`, and `Assignments`.
4. Explain how you resolved partial and transitive dependencies.
5. Optional: Add a `DepartmentHead` column and discuss whether it creates new dependencies.

---

## 🏪 Case Study 3 – Retail Inventory & Sales

### Problem Statement

A Toronto shop records all sales in a single worksheet:

```text
Sales(
    SaleID,
    Date,
    CustomerName,
    CustomerPhone,
    ProductList,
    QuantityList,
    PriceList,
    Total
)
```

**Example:**

```text
S9001 | 2025-10-20 | Sarah Johnson | 905-333-4455 | "P10,P22" | "2,1" | "10.99,45.00" | 66.98
```

### Tasks

1. Explain why this table violates **1NF**.
2. Normalize step-by-step into:

   * `Customers`
   * `Sales`
   * `Products`
   * `SaleItems`
3. Decide whether `Total` should remain stored or be derived dynamically.
4. Write SQL joins to rebuild the full sales report.
5. Draw a mini ER diagram showing all relationships.

---

## 🏥 Case Study 4 – Hospital Patient Visits

### Problem Statement

A clinic records patient visits in a flat file:

```text
Visits(
    VisitID,
    PatientName,
    PatientDOB,
    DoctorName,
    DoctorSpecialty,
    Medications,
    Dosages,
    VisitDate,
    BillAmount
)
```

**Example:**

```text
V300 | "John Miller" | 1988-05-16 | "Dr. Olivia White" | "Cardiology" | "Aspirin, Lipitor" | "75mg, 10mg" | 2025-09-12 | 220
```

### Tasks

1. Normalize this table up to **3NF**, showing each step clearly.
2. Identify and remove transitive dependencies (e.g., DoctorSpecialty).
3. Create final entities such as `Patients`, `Doctors`, `Visits`, and `Prescriptions`.
4. Explain how normalization helps with data consistency and analytics.
5. Write a sample query: *“List all cardiology patients treated in September 2025.”*

---

## ✈️ Case Study 5 – Airline Flight Bookings (Toronto–London)

### Problem Statement

An airline records passenger bookings for its **Toronto ⇄ London** route like this:

```text
Bookings(
    BookingID,
    PassengerName,
    PassengerEmail,
    FlightNo,
    Route,
    DepartureTime,
    SeatNo,
    Fare,
    PaymentCard,
    CardHolderName
)
```

**Example:**

```text
B555 | "James Walker" | james.walker@gmail.com | AC702 | "Toronto–London" | 2025-11-02 09:30 | 22A | 1250 | 4444-****-9876 | "James Walker"
```

### Tasks

1. Identify repeating or derived fields (e.g., `Route` = combination of airports).
2. Normalize up to **3NF**, creating tables like:

   * `Passengers`
   * `Flights`
   * `Bookings`
   * `Payments`
3. Clarify which attributes depend on which key.
4. Discuss what happens if a passenger books multiple flights — where should contact info live?
5. Write a query joining all tables to show passenger, flight, and payment details.

---


