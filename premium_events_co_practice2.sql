START TRANSACTION;

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS venue;

CREATE TABLE venue(
venue_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
venue_name VARCHAR(100),
venue_type VARCHAR(100),
locations VARCHAR(80),
venue_date DATETIME
);

CREATE TABLE customers(
cust_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(40),
last_name VARCHAR(40),
customer_name VARCHAR(50),
email VARCHAR(40),
phone_number VARCHAR (20)
);

CREATE TABLE bookings(
booking_id INT PRIMARY KEY AUTO_INCREMENT,
booking_date DATETIME,
venue_id INT NOT NULL,
FOREIGN KEY (venue_id)  REFERENCES venue(venue_id)
);

CREATE TABLE tickets(
ticket_id INT PRIMARY KEY AUTO_INCREMENT,
ticket_price INT,
ticket_purch_date DATETIME,
discount_on_sales DECIMAL (5,2),
customer_id INT NOT NULL,
venue_id INT NOT NULL,
FOREIGN KEY (customer_id)  REFERENCES customers(cust_id),
FOREIGN KEY (venue_id) REFERENCES venue(venue_id)
);

-- ROLLBACK;
COMMIT;

-----Queries-----
INSERT INTO venue (venue_name, venue_type, locations, venue_date)
VALUES
('Grand Music Hall', 'Concert', 'Downtown', '2026-03-15 19:00:00'),
('City Expo Center', 'Conference', 'Midtown', '2026-04-10 09:00:00'),
('Sunset Arena', 'Sports Event', 'West Side', '2026-05-22 17:30:00');

INSERT INTO customers(first_name, last_name, customer_name, email, phone_number)
VALUES
('John', 'Doe', NULL, 'john.doe@example.com', '555-123-4567'),
('Emily', 'Clark', NULL,  'emily.clark@example.com', '555-987-6543'),
(NULL, NULL, 'Tech Innovations LLC', 'info@techinnovations.com', '555-444-2222');


INSERT INTO bookings(booking_date, venue_id)
VALUES
('2026-02-01 10:00:00', 1),
('2026-02-05 14:30:00', 2),
('2026-02-10 9:15:00', 3);

INSERT INTO tickets(ticket_price, ticket_purch_date, discount_on_sales, customer_id, venue_id)
VALUES
(100, '2026-02-01 10:05:00', NULL, 1, 1),
(80, '2026-02-05 14:35:00', 10, 2, 2),
(150, '2026-02-10 9:20:00', 5, 3, 3);

SELECT * FROM venue;
SELECT * FROM customers;
SELECT * FROM bookings;
SELECT * FROM tickets;

-- Inserting  new customer - customer_name set to NULL)--
INSERT INTO customers(first_name, last_name, customer_name, email, phone_number)
VALUES
('Tucker', 'John', NULL, 'tucker.john@example.com', '333-222-9999');

-- Update customer_name for all customers with first & last names--
UPDATE customers
SET customer_name = concat(first_name," ", last_name)
WHERE first_name IS NOT NULL AND last_name IS NOT NULL;

SELECT * FROM customers;

SELECT ticket_price, discount_on_sales,
(ticket_price - COALESCE(discount_on_sales, 0)) AS final_price
FROM tickets;

