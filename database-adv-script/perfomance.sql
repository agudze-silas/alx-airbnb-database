-- ======================================
-- Initial Query: Retrieve Bookings with User, Property, and Payment Details
-- ======================================

SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
INNER JOIN User u 
    ON b.user_id = u.user_id
INNER JOIN Property p 
    ON b.property_id = p.property_id
LEFT JOIN Payment pay 
    ON b.booking_id = pay.booking_id;


EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM Booking b
INNER JOIN User u 
    ON b.user_id = u.user_id
INNER JOIN Property p 
    ON b.property_id = p.property_id
LEFT JOIN Payment pay 
    ON b.booking_id = pay.booking_id;


-- Optimized query: Retrieve bookings with essential user, property, and payment details
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    u.first_name || ' ' || u.last_name AS user_full_name,
    u.email,
    p.name AS property_name,
    p.location,
    pay.amount,
    pay.payment_method
FROM Booking b
JOIN User u 
    ON b.user_id = u.user_id
JOIN Property p 
    ON b.property_id = p.property_id
LEFT JOIN Payment pay 
    ON b.booking_id = pay.booking_id;
