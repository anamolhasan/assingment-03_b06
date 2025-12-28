# Vehicle Rental Management System

## Overview

This project demonstrates the database design and SQL operations of a simplified **Vehicle Rental Management System**.  
The assignment covers:

- ERD design with correct relationships
- Primary Key (PK) and Foreign Key (FK) usage
- SQL operations using **JOIN**, **EXISTS**, **WHERE**, **GROUP BY**, and **HAVING**
- Understanding database constraints and entity relationships

---

## Part 1: ERD Design

The system contains 3 main tables:

- **Users**
- **Vehicles**
- **Bookings**

### Relationships

- **One-to-Many:** User ==> Bookings
- **Many-to-One:** Bookings ==> Vehicle
- **Logical One-to-One:** Each Booking is linked to exactly one User and one Vehicle
- Includes all required PK, FK, and status fields

  **ERD Public Link:**  
  *https://drawsql.app/teams/personal-4133/diagrams/vehicle-rental-system*

---

## Part 2: SQL Queries

Below are all required SQL queries based on the designed schema.

### Query 1 — INNER JOIN

Retrieve booking information along with customer name and vehicle name.

```sql
select
    b.booking_id,
    u.name as customer_name,
    v.name as vehicle_name,
    b.start_date,
    b.end_date,
    b.booking_status as status
from Bookings b
join Users u
    on b.user_id = u.user_id
join Vehicles v
    on b.vehicle_id = v.vehicle_id;
```

---

### Query 2 — NOT EXISTS

Find all vehicles that have never been booked.

```sql
select
    v.vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
from Vehicles v
where not exists (
    select 1
    from Bookings b
    where b.vehicle_id = v.vehicle_id
);
```

---

### Query 3 — WHERE Filter

Retrieve all available vehicles of a specific type (example: Car).

```sql
select
    v.vehicle_id,
    v.name,
    v.type,
    v.model,
    v.registration_number,
    v.rental_price,
    v.status
from Vehicles v
where v.status = 'Available'
  and v.type = 'Car';
```

---

### Query 4 — GROUP BY + HAVING

Show vehicles with more than 2 total bookings.

```sql
select
    v.name as vehicle_name,
    count(b.booking_id) as total_bookings
from Bookings b
join Vehicles v
    on b.vehicle_id = v.vehicle_id
group by v.name
having count(b.booking_id) > 2;
```

---

## What You Are Submitting


### 🔹 ERD Link

*https://drawsql.app/teams/personal-4133/diagrams/vehicle-rental-system*

### 🔹 Viva Video Link

**1. What is a foreign key and why is it important in relational databases?**

*https://drive.google.com/file/d/1pSkCDG_5HMwFArhFf1wwfEZkyyhrX_5Q/view?usp=sharing*

**2. What is the difference between WHERE and HAVING clauses in SQL?**
*https://drive.google.com/file/d/1U_2Yg59j21bY5wo6QvGDGpR2J0A14l8o/view?usp=sharing*

**3. What is a primary key and what are its characteristics?**
*https://drive.google.com/file/d/1Ug_YtWshZlv4oAmcR2aUXSlj8m-pClGw/view?usp=sharing*

**4. What is the difference between INNER JOIN and LEFT JOIN in SQL?**
*https://drive.google.com/file/d/1fi9rA4HG9yOjnjG1xvo4ekoQOLlM8SRZ/view?usp=sharing*

---
