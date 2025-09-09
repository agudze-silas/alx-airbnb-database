# 📊 Query Optimization Report

## 1. Objective
The purpose of this task was to **optimize a query** that retrieves all bookings with related user, property, and payment details.  
The original query was correct but inefficient due to unnecessary joins, wide row selection, and missing indexes.

---

## 2. Original Query
The initial query joined **Booking**, **User**, **Property**, and **Payment** tables and returned many columns, including redundant keys.

**Problems identified:**
- Sequential scans on all tables.
- High query cost (~60,000).
- Inclusion of unnecessary columns increased row width.

---

## 3. Refactored Query
We optimized the query by:
1. **Reducing selected columns** (kept only essential details).
2. **Combining first and last name** into `user_full_name`.
3. **Using indexes** on frequently joined columns.