
# Airbnb Database Normalization (to 3NF)

## 1. First Normal Form (1NF)
**Requirement:**  
- Eliminate repeating groups.  
- Ensure each attribute is atomic (no multi-valued fields).  

**Check:**  
- All attributes (names, emails, phone numbers, price, etc.) are atomic.  
- No repeating groups or arrays in a single column.  

✅ **The schema already satisfies 1NF.**

---

## 2. Second Normal Form (2NF)
**Requirement:**  
- Be in 1NF.  
- All non-key attributes must depend on the whole primary key (not just part of it).  

**Check:**  
- All tables use a **single-column primary key** (UUIDs), so there are no partial dependencies.  
- Attributes like `total_price` in **Booking** are functionally dependent on `booking_id`, not part of a composite key.  

✅ **The schema already satisfies 2NF.**

---

## 3. Third Normal Form (3NF)
**Requirement:**  
- Be in 2NF.  
- Remove transitive dependencies (non-key attributes depending on other non-key attributes).  

**Check:**  
- **User**: `email` is unique and depends only on `user_id`. No transitive dependencies.  
- **Property**: Attributes (name, description, location, price) depend only on `property_id`.  
- **Booking**: `total_price` might raise a question — it can be derived from `pricepernight * (end_date - start_date)`.  
  - To avoid redundancy, we could **remove `total_price`** and calculate it dynamically.  
- **Payment**: Attributes depend only on `payment_id`. No issue.  
- **Review**: All attributes depend on `review_id`.  
- **Message**: All attributes depend on `message_id`.  

🔎 **Adjustment for 3NF:**  
- Remove `total_price` from **Booking**, since it is **derivable** from `Property.pricepernight` and `Booking.start_date / end_date`.  

✅ With this adjustment, the schema is now in **3NF**.  

---

# ✅ Final 3NF Schema (Adjustments Only)
- **Booking Table**: Remove `total_price`.  
```sql
CREATE TABLE Booking (
  booking_id UUID PRIMARY KEY,
  property_id UUID REFERENCES Property(property_id),
  user_id UUID REFERENCES User(user_id),
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

# 📖 Normalization Steps Summary
1. **1NF:** All attributes are atomic — no repeating groups.  
2. **2NF:** No partial dependencies because primary keys are simple.  
3. **3NF:** Removed transitive dependency (`total_price` in Booking).  
