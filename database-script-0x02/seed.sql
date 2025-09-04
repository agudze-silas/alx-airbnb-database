
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hashed_pw2', '2345678901', 'host'),
('33333333-3333-3333-3333-333333333333', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_pw3', '3456789012', 'guest'),
('44444444-4444-4444-4444-444444444444', 'Diana', 'Williams', 'diana@example.com', 'hashed_pw4', '4567890123', 'admin');


INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
('aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Apartment', 'A modern apartment in the city center.', 'Accra, Ghana', 75.00),
('bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '22222222-2222-2222-2222-222222222222', 'Beach House', 'Beautiful house by the beach with sea view.', 'Cape Coast, Ghana', 150.00);


INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status)
VALUES
('cccc1111-cccc-cccc-cccc-cccccccccccc', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-09-10', '2025-09-15', 'confirmed'),
('dddd2222-dddd-dddd-dddd-dddddddddddd', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', '2025-09-20', '2025-09-25', 'pending');


INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
('eeee1111-eeee-eeee-eeee-eeeeeeeeeeee', 'cccc1111-cccc-cccc-cccc-cccccccccccc', 375.00, 'credit_card'),
('ffff2222-ffff-ffff-ffff-ffffffffffff', 'dddd2222-dddd-dddd-dddd-dddddddddddd', 750.00, 'paypal');


INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
('gggg1111-gggg-gggg-gggg-gggggggggggg', 'aaaa1111-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Amazing place, very clean and comfortable!'),
('hhhh2222-hhhh-hhhh-hhhh-hhhhhhhhhhhh', 'bbbb2222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '33333333-3333-3333-3333-333333333333', 4, 'Great location but a bit noisy.');


INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
('iiii1111-iiii-iiii-iiii-iiiiiiiiiiii', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi Bob, I would like to confirm my booking.'),
('jjjj2222-jjjj-jjjj-jjjj-jjjjjjjjjjjj', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Sure Alice, your booking is confirmed!');
