INSERT INTO organizations(org_name, org_email, location)
VALUES
('YMCA Community Center', 'contact@ymca.org', 'St. Louis, MO'),
('Arthritis Foundation', 'info@arthritis.org', 'Kansas City, MO'),
('Red Cross Midwest', 'midwest@redcross.org', 'Chicago, IL'),
('Habitat for Humanity', 'info@habitat.org', 'Springfield, IL'),
('Food Bank Network', 'info@foodbank.org', 'St. Louis, MO');

INSERT INTO volunteers(full_name, email, phone)
VALUES
('Christy', 'christy@example.com', '555-1001'),
('John Miller', 'john.miller@example.com', '555-1002'),
('Emily Carter', 'emily.carter@example.com', '555-1003'),
('Michael Brown', 'michael.brown@example.com', '555-1004'),
('Sophia', 'sophia@example.com', '555-1005');

INSERT INTO assignments(volunteer_id, org_id, roles, hours_worked)
VALUES
(1, 1, 'Art Instructor', 5.50),
(1, 2, 'Event Assistant', 4.00),
(2, 1, 'Front Desk Support', 3.25),
(3, 3, 'Logistics Helper', 6.00),
(4, 4, 'Construction Volunteer', 7.50),
(5, 5, 'Food Packing Volunteer', 4.75),
(2, 2, 'Registration Desk', 2.50),
(3, 1, 'Youth Program Helper', 3.00);
