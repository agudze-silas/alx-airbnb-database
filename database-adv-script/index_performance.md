## User Table

- **email**: Frequently used for login/lookup.
- **user_id**: Already indexed (Primary Key).

## Property Table

- **host_id**: Used in joins with User.
- **location**: Often filtered in searches.
- **property_id**: Already indexed (Primary Key).

## Booking Table

- **user_id**: Used in joins with User.
- **property_id**: Used in joins with Property.
- **status**: Often filtered (e.g., confirmed/pending bookings).
- **booking_id**: Already indexed (Primary Key).
