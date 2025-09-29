-- 1. Routes (no dependencies)
CREATE TABLE Routes (
    route_id NUMBER(10) PRIMARY KEY,
    origin VARCHAR2(50),
    destination VARCHAR2(50)
);

-- 2. Customers (no dependencies)  
CREATE TABLE Customers (
    customer_id NUMBER(10) PRIMARY KEY,
    name VARCHAR2(100),
    total_spent NUMBER(10,2)
);


-- 3. Flights (depends on Routes)
CREATE TABLE Flights (
    flight_id NUMBER(10) PRIMARY KEY,
    route_id NUMBER(10),
    flight_date DATE,
    passenger_count NUMBER(6),
    revenue NUMBER(10,2),
    FOREIGN KEY (route_id) REFERENCES Routes(route_id)
);

-- 4. Tickets (depends on Customers and Flights)
CREATE TABLE Tickets (
    ticket_id NUMBER(10) PRIMARY KEY,
    customer_id NUMBER(10),
    flight_id NUMBER(10),
    ticket_price NUMBER(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

-- Insert Routes (RwandaAir destinations)
INSERT INTO Routes VALUES (1, 'Kigali', 'Brussels');
INSERT INTO Routes VALUES (2, 'Kigali', 'London');
INSERT INTO Routes VALUES (3, 'Kigali', 'Dubai');
INSERT INTO Routes VALUES (4, 'Kigali', 'Nairobi');
INSERT INTO Routes VALUES (5, 'Kigali', 'Kampala');

-- Insert Customers (UCI participants and fans)
INSERT INTO Customers VALUES (1, 'Team Belgium Cycling', 15000.00);
INSERT INTO Customers VALUES (2, 'John Smith', 2500.00);
INSERT INTO Customers VALUES (3, 'Maria Garcia', 3200.00);
INSERT INTO Customers VALUES (4, 'UCI Media Group', 8500.00);
INSERT INTO Customers VALUES (5, 'Rwanda Tourism Board', 12000.00);

-- Insert Flights (during UCI Championship period)
INSERT INTO Flights VALUES (101, 1, DATE '2024-09-20', 180, 45000.00);
INSERT INTO Flights VALUES (102, 2, DATE '2024-09-21', 200, 60000.00);
INSERT INTO Flights VALUES (103, 3, DATE '2024-09-22', 150, 75000.00);
INSERT INTO Flights VALUES (104, 4, DATE '2024-09-23', 120, 24000.00);
INSERT INTO Flights VALUES (105, 5, DATE '2024-09-24', 100, 18000.00);

-- Insert Tickets
INSERT INTO Tickets VALUES (1001, 1, 101, 750.00);
INSERT INTO Tickets VALUES (1002, 2, 102, 1200.00);
INSERT INTO Tickets VALUES (1003, 3, 103, 1500.00);
INSERT INTO Tickets VALUES (1004, 4, 104, 800.00);
INSERT INTO Tickets VALUES (1005, 5, 105, 600.00);

-- Save all changes
COMMIT;