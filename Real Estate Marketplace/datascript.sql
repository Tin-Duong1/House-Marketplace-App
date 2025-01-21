USE HOUSEAPP;

INSERT INTO Customers (Password, FName, LName, Email, AccountType) VALUES
('passworddd', 'Steve', 'Jobs', 'sj44@gmail.com', 'Buyer'),
('pwsd', 'Jeff', 'Racket', 'JR@gmail.com', 'Seller'),
('mypsd', 'Alice', 'Wonderland', 'alice.W@example.com', 'Buyer');

INSERT INTO Properties (Owner, Description, Address) VALUES
('Steve Jobs', 'Two bedroom apartment', '123 Apple St, Columbia'),
('Jeff Racket', 'Four bedroom home', '456 Santa Mary, Santa Ana'),
('Alice Wonderland', 'City apartment', '789 Downtown St, Chicago');

INSERT INTO RealEstateAgents (AgentName, Company) VALUES
('Rob Lucci', 'CP Company'),
('Nami', 'Fishman Corp');

INSERT INTO Listings (Price, Date, Status, PropertyNum, Agent_ID, Customer_ID) VALUES
(250000.00, '2024-05-01', 'Available', 1, 1, 987656),
(475000.00, '2024-05-02', 'Sold', 2, 2, 987657);

INSERT INTO BuySell (Listing_Num, Customer_Number) VALUES
(6, 987656),
(7, 987657);

INSERT INTO Appointments (Time, Listing_ID) VALUES
('2024-05-11 14:00:00', 6),
('2024-05-12 15:00:00', 7);

INSERT INTO Contracts (Price, InterestRate, AgentInfo, PropertyInfo, CustomerInfo, Date, Mortgage) VALUES
(250000.00, 3.5, 1, 1, 987655, '2023-05-01', '30 year payment'),
(475000.00, 3.75, 2, 2, 987656, '2023-05-02', '15 year payment');

INSERT INTO Creations (Property_number, ContactInfo, Agent_ID, Customer_ID) VALUES
(1, 'sj44@gmail.com', 1, 987655),
(2, 'JR@gmail.com', 2, 987656);
