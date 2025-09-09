-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);

-- Indexes for Property table
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    p.name AS property_name
FROM Booking b
INNER JOIN Property p 
    ON b.property_id = p.property_id
WHERE b.user_id = 'user-123'
  AND b.status = 'confirmed';
