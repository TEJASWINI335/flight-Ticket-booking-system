create database flight;
use flight;
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    FlightName VARCHAR(20),
    DepartureTime DATETIME,
    ArrivalTime DATETIME
);

INSERT INTO Flight (FlightID, FlightNumber, FlightName, DepartureTime, ArrivalTime) VALUES
(1, 'AI202', 'Air India', STR_TO_DATE('2024-11-20 06:00:00', '%Y-%m-%d %H:%i:%s'), STR_TO_DATE('2024-11-20 09:30:00', '%Y-%m-%d %H:%i:%s')),
(2, 'IC405', 'Indian Airlines', STR_TO_DATE('2024-11-21 07:15:00', '%Y-%m-%d %H:%i:%s'), STR_TO_DATE('2024-11-21 10:45:00', '%Y-%m-%d %H:%i:%s')),
(3, 'SP123', 'SpiceJet', STR_TO_DATE('2024-11-22 08:30:00', '%Y-%m-%d %H:%i:%s'), STR_TO_DATE('2024-11-22 12:00:00', '%Y-%m-%d %H:%i:%s')),
(4, 'UK322', 'Vistara', STR_TO_DATE('2024-11-23 09:00:00', '%Y-%m-%d %H:%i:%s'), STR_TO_DATE('2024-11-23 12:30:00', '%Y-%m-%d %H:%i:%s')),
(5, '6E501', 'IndiGo', STR_TO_DATE('2024-11-24 10:45:00', '%Y-%m-%d %H:%i:%s'), STR_TO_DATE('2024-11-24 14:00:00', '%Y-%m-%d %H:%i:%s'));

CREATE TABLE Passenger (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(25),
    LastName VARCHAR(25),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    FlightID INT,
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);
INSERT INTO Passenger (PassengerID, FirstName, LastName, Phone, Email, FlightID) VALUES
(1, 'Rahul', 'Sharma', '9876543210', 'rahul.sharma@gmail.com', 1),
(2, 'Priya', 'Singh', '9876543211', 'priya.singh@gmail.com', 2),
(3, 'Amit', 'Verma', '9876543212', 'amit.verma@gmail.com', 3),
(4, 'Neha', 'Patel', '9876543213', 'neha.patel@gmail.com', 4),
(5, 'Anil', 'Kumar', '9876543214', 'anil.kumar@gmail.com', 5);

CREATE TABLE Booking (
    BookingID INT PRIMARY KEY,
    PassengerID INT,
    BookingDate DATETIME,
    Status VARCHAR(20),
    FOREIGN KEY (PassengerID) REFERENCES Passenger(PassengerID)
);
INSERT INTO Booking (BookingID, PassengerID, BookingDate, Status) VALUES
(1, 1, STR_TO_DATE('2024-11-19 14:00:00', '%Y-%m-%d %H:%i:%s'), 'Confirmed'),
(2, 2, STR_TO_DATE('2024-11-20 15:30:00', '%Y-%m-%d %H:%i:%s'), 'Pending'),
(3, 3, STR_TO_DATE('2024-11-21 16:45:00', '%Y-%m-%d %H:%i:%s'), 'Confirmed'),
(4, 4, STR_TO_DATE('2024-11-22 17:10:00', '%Y-%m-%d %H:%i:%s'), 'Cancelled'),
(5, 5, STR_TO_DATE('2024-11-23 18:20:00', '%Y-%m-%d %H:%i:%s'), 'Confirmed');

CREATE TABLE Ticket (
    TicketID INT PRIMARY KEY,
    BookingID INT,
    TicketNumber VARCHAR(20),
    Price DECIMAL(8,2),
    IssueDate DATETIME,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) );
INSERT INTO Ticket (TicketID, BookingID, TicketNumber, Price, IssueDate) VALUES
(1, 1, 'TCK001', 5000.00, STR_TO_DATE('2024-11-19 15:00:00', '%Y-%m-%d %H:%i:%s')),
(2, 2, 'TCK002', 6000.00, STR_TO_DATE('2024-11-20 16:00:00', '%Y-%m-%d %H:%i:%s')),
(3, 3, 'TCK003', 5500.00, STR_TO_DATE('2024-11-21 17:30:00', '%Y-%m-%d %H:%i:%s')),
(4, 4, 'TCK004', 4800.00, STR_TO_DATE('2024-11-22 18:00:00', '%Y-%m-%d %H:%i:%s')),
(5, 5, 'TCK005', 6200.00, STR_TO_DATE('2024-11-23 19:00:00', '%Y-%m-%d %H:%i:%s'));
CREATE TABLE Airport (
    AirportID INT PRIMARY KEY,
    AirportName VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Airport (AirportID, AirportName, Location) VALUES
(1, 'Indira Gandhi International', 'Delhi'),
(2, 'Chhatrapati Shivaji Maharaj International', 'Mumbai'),
(3, 'Kempegowda International', 'Bangalore'),
(4, 'Netaji Subhas Chandra Bose International', 'Kolkata'),
(5, 'Rajiv Gandhi International', 'Hyderabad');
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    TicketID INT,
    PaymentDate DATETIME,
    Amount DECIMAL(8,2),
    PaymentMethod VARCHAR(15),
    FOREIGN KEY (TicketID) REFERENCES Ticket(TicketID)
);
INSERT INTO Payment (PaymentID, TicketID, PaymentDate, Amount, PaymentMethod) VALUES
(1, 1, STR_TO_DATE('2024-11-20 10:00:00', '%Y-%m-%d %H:%i:%s'), 5000.00, 'Credit Card'),
(2, 2, STR_TO_DATE('2024-11-21 11:00:00', '%Y-%m-%d %H:%i:%s'), 6000.00, 'Debit Card'),
(3, 3, STR_TO_DATE('2024-11-22 12:00:00', '%Y-%m-%d %H:%i:%s'), 5500.00, 'Net Banking'),
(4, 4, STR_TO_DATE('2024-11-23 15:00:00', '%Y-%m-%d %H:%i:%s'), 4800.00, 'Cash'),
(5, 5, STR_TO_DATE('2024-11-24 17:30:00', '%Y-%m-%d %H:%i:%s'), 6200.00, 'Credit Card');

                                                     



