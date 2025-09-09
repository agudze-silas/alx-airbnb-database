-- ======================================
-- Partitioning the Booking Table by start_date
-- ======================================

-- 1. Drop existing Booking table if it exists
DROP TABLE IF EXISTS Booking CASCADE;

-- 2. Create the parent table with PARTITION BY
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);

-- 3. Create partitions (example: yearly partitions)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- 4. Default partition for future/unexpected dates
CREATE TABLE Booking_default PARTITION OF Booking
    DEFAULT;

-- 5. (Optional) Indexes on partitions
CREATE INDEX idx_booking2023_user_id ON Booking_2023(user_id);
CREATE INDEX idx_booking2024_user_id ON Booking_2024(user_id);
CREATE INDEX idx_booking2025_user_id ON Booking_2025(user_id);

-- 6. Example query to test performance
EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30'
  AND status = 'confirmed';
