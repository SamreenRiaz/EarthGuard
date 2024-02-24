USE wastemanagement
CREATE TABLE Driver (
    driverID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) NOT NULL,
    PASSWORD VARCHAR(15) NOT NULL,
    address VARCHAR(40) NOT NULL,
    phoneNumber VARCHAR(11) NOT NULL,
    ranking INT,
    truckID INT,
    email VARCHAR(20) NOT NULL
);

ALTER TABLE Driver
ADD CONSTRAINT fk_dusername
FOREIGN KEY (username) REFERENCES Users(username);

CREATE TABLE Clients (
    id INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(20),
    email VARCHAR(20),
    phone VARCHAR(11),
    username VARCHAR(20),
    PASSWORD VARCHAR (15),
    address VARCHAR (40),
    FOREIGN KEY (username) REFERENCES Users(username)
);

CREATE TABLE Users (
    id INT PRIMARY KEY AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    PASSWORD VARCHAR (15),
    TYPE VARCHAR (15),
    phone VARCHAR(11),
    email VARCHAR(20)
);
SELECT* FROM USERS
CREATE TABLE Bill (
    billID INT PRIMARY KEY,
    clientID INT,
    pickupID INT,
    amountDue DECIMAL(10, 2),
    dueDate DATE,
    FOREIGN KEY (clientID) REFERENCES Clients(id)
);

CREATE TABLE Job (
    jobID INT PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    permanentAddress VARCHAR(255),
    phoneNumber VARCHAR(15),
    email VARCHAR(255) UNIQUE NOT NULL,
	details VARCHAR(300)
    -- Add other attributes specific to Job
);

CREATE TABLE Hiring (
    applicantID INT PRIMARY KEY,
    applicantName VARCHAR(255) NOT NULL,
    astatus VARCHAR(50) NOT NULL,
    details VARCHAR(300)
    -- Add other attributes specific to Hiring
);
SELECT* FROM wastemanagement.Driver`wastemanagement`
ALTER TABLE Hiring
MODIFY COLUMN applicantID INT AUTO_INCREMENT;

ALTER TABLE Bill
MODIFY COLUMN billID INT AUTO_INCREMENT;


CREATE TABLE Timetable (
    pickupID INT PRIMARY KEY,
    pickuptime TIME,
    clientID INT,
    FOREIGN KEY (clientID) REFERENCES Clients(id)
    -- truckID INT, -- Commented out for now
    -- driverID INT,
    -- FOREIGN KEY (truckID) REFERENCES Trucks(truckID),
    -- FOREIGN KEY (driverID) REFERENCES Drivers(driverID)
);
ALTER TABLE TimeTable
MODIFY COLUMN pickupID INT AUTO_INCREMENT;

CREATE TABLE Admin (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20),
    PASSWORD VARCHAR(15)
);

ALTER TABLE Admin
ADD CONSTRAINT fk_ausername
FOREIGN KEY (username) REFERENCES Users(username);

CREATE TABLE ScheduleChangeRequest (
    requestID INT PRIMARY KEY AUTO_INCREMENT,
    clientID INT,
    newScheduletime TIME,
    STATUS INT,
    FOREIGN KEY (clientID) REFERENCES Clients(id)
);

CREATE TABLE BIN (
    binID INT PRIMARY KEY AUTO_INCREMENT,
    STATUS INT,
    location VARCHAR(255),
    binType VARCHAR(255),
    capacity FLOAT
);

CREATE TABLE Complaints (
    complaintID INT PRIMARY KEY AUTO_INCREMENT,
    clientID INT,
    description VARCHAR(255),
    STATUS VARCHAR(50),
    FOREIGN KEY (clientID) REFERENCES Clients(id)
);
CREATE TABLE Dumpster (
    dumpsterId INT PRIMARY KEY AUTO_INCREMENT,
    STATUS INT
);

-- RecyclingBin table
CREATE TABLE RecyclingBin (
    recyclingBinId INT PRIMARY KEY AUTO_INCREMENT,
    STATUS INT
);

-- Inventory table
CREATE TABLE Inventory (
    itemID INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT,
    category VARCHAR(255)
);
DROP TABLE AVAILSERVICE
CREATE TABLE AvailService (
	id INT PRIMARY KEY AUTO_INCREMENT,
	serviceId INT,
	username VARCHAR(20),
	billId INT,
	pickupId INT,
	subscriptionId INT,
	email VARCHAR(20),
	phone VARCHAR(11),
	billingAdd VARCHAR(40),
	permAdd VARCHAR(40)
);
SELECT* FROM CLIENTS
SELECT* FROM wms.AVAILSERVICE
SELECT* FROM SERVICE
CREATE TABLE Services (
	serviceId INT PRIMARY KEY AUTO_INCREMENT,
	serviceName VARCHAR(40)
);

ALTER TABLE AvailService
ADD CONSTRAINT fk_serviceId
FOREIGN KEY (serviceId) REFERENCES Services(serviceId);


ALTER TABLE AvailService
ADD CONSTRAINT fk_billId
FOREIGN KEY (billId) REFERENCES Bill(billId);


ALTER TABLE AvailService
ADD CONSTRAINT fk_pickupId
FOREIGN KEY (pickupId) REFERENCES Timetable(pickupId);


ALTER TABLE AvailService
ADD CONSTRAINT fk_subscriptionId
FOREIGN KEY (subscriptionId) REFERENCES Subscriptions(subscriptionId);

CREATE TABLE Subscriptions(
	subscriptionId INT PRIMARY KEY AUTO_INCREMENT,
	duration INT,
	price FLOAT
);
INSERT INTO USERS (id,username,PASSWORD,TYPE,phone,email) VALUES (1,'Admin','admin123','admin','02030203020','admin@gmail.com')
INSERT INTO ADMIN (id,username,PASSWORD) VALUES (1,'Admin','admin123')
SELECT* FROM SUBSCRIPTIONS
INSERT INTO SUBSCRIPTIONS (subscriptionId,duration,price)
VALUES(1, 12,666.67),(2,5,300.34), (3,6,333.33),(4,4,220.99)
SELECT* FROM AVAILSERVICE
SELECT* FROM BILL
SELECT* FROM TIMETABLE
INSERT INTO Services (serviceId, serviceName)
VALUES (1,'Recycling'),(2,'Home Trash Pickup'),(3,'Business Waste Pickup'),(4,'Bulk Waste Pickup'),(5,'Yard Waste Pickup'),(6,'Special Waste Pickup')

INSERT INTO INVENTORY (itemId,quantity,category) VALUES (1,2,'Bin'),(2,3,'Recycling Bin'),(3,3,'Dumpster')
SELECT* FROM INVENTORY
SELECT* FROM Clients
SELECT * FROM Complaints
SELECT * FROM Driver
SELECT * FROM ScheduleChangeRequest
SELECT * FROM AvailService
SELECT * FROM bill
SELECT * FROM RecyclingBin
USE wastemanagement
INSERT INTO BIN (binID, STATUS, location, binType, capacity)
VALUES
    (1, 1, 'Location_A', 'Type_A', 50.5)


-- Inserting dummy values into the Dumpster table
INSERT INTO Dumpster (dumpsterId, STATUS) VALUES
(1, 1)

-- Inserting dummy values into the RecyclingBin table
INSERT INTO RecyclingBin (recyclingBinId, STATUS) VALUES
(1, 1)

SELECT* FROM USERS