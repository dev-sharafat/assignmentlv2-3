# Vehicle Rental System – Database Design & SQL Queries

## Project Overview
The Vehicle Rental System is a database-focused project designed to demonstrate relational database design and SQL querying techniques. This project simulates a real-world vehicle rental platform where users can book vehicles for a specific period of time.

The system manages three core entities:
- Users
- Vehicles
- Bookings

It highlights how data can be structured, related, and queried efficiently using SQL.

---

## Project Objectives
The main objectives of this project are:

- Design a relational database using proper normalization
- Implement Primary Keys and Foreign Keys
- Demonstrate One-to-Many and Many-to-One relationships
- Write SQL queries using JOIN, EXISTS, WHERE, GROUP BY, and HAVING clauses
- Apply real-world business logic through SQL queries

---

## Database Structure

### 1. Users Table
The Users table stores information about system users such as customers and administrators.

Key attributes:
- user_id (Primary Key)
- name
- email (Unique)
- role (customer/admin)

A user can create multiple bookings, but each booking belongs to only one user.

---

### 2. Vehicles Table
The Vehicles table stores details about vehicles available for rent.

Key attributes:
- vehicle_id (Primary Key)
- name
- type (car, bike, truck, etc.)
- registration_number (Unique)
- status (available, booked, maintenance)

Each vehicle can be booked multiple times across different dates.

---

### 3. Bookings Table
The Bookings table represents rental transactions and connects users with vehicles.

Key attributes:
- booking_id (Primary Key)
- user_id (Foreign Key → Users)
- vehicle_id (Foreign Key → Vehicles)
- start_date
- end_date
- status (confirmed, completed, canceled)

This table acts as a junction table that resolves the many-to-many relationship between users and vehicles.

---

## Entity Relationships

- Users → Bookings : One-to-Many
- Vehicles → Bookings : One-to-Many
- Users ↔ Vehicles : Many-to-Many (via Bookings)

---

## SQL Queries Explanation

### Query 1: INNER JOIN
```sql
SELECT 
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```
Explanation:

Combines data from bookings, users, and vehicles tables

INNER JOIN ensures only matching records are returned

Displays booking details along with customer and vehicle names

Use Case:

Viewing complete booking history

Admin reporting and dashboards

```sql Query 2: NOT EXISTS
sql
Copy code
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);
```
Explanation:

Uses NOT EXISTS to find vehicles with no booking records

Efficiently checks for vehicles that were never rented

Use Case:

Identifying unused or underutilized vehicles

Business analysis and inventory optimization
```sql
Query 3: WHERE Clause
sql
Copy code
SELECT *
FROM vehicles
WHERE status = 'available'
AND type = 'car';
```
Explanation:

Filters vehicles based on availability and type

Returns only available cars

Use Case:

Showing available cars to customers during booking

Real-time availability filtering
```sql
Query 4: GROUP BY and HAVING
sql
Copy code
SELECT 
  v.name AS vehicle_name,
  COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
```
Explanation:

GROUP BY groups bookings by vehicle

COUNT() calculates total bookings per vehicle

HAVING filters aggregated results

Difference Between WHERE and HAVING:

WHERE filters rows before grouping

HAVING filters groups after aggregation

Use Case:

Identifying popular vehicles

Analyzing customer demand trends

Project Files
README.md – Project documentation

queries.sql – Contains all SQL queries



Conclusion
This project demonstrates a solid understanding of relational database concepts and practical SQL usage. It reflects real-world business logic and provides a strong foundation for advanced database-driven applications.
---






