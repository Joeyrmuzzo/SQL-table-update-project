-- Joey Muzzo 
-- CIS 336 Course Project

DROP TABLE IF EXISTS SERVICE;
DROP TABLE IF EXISTS PRODUCT;
DROP TABLE IF EXISTS INVOICE;
DROP TABLE IF EXISTS VEHICLE;
DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS GARAGE_LOG;
DROP TABLE IF EXISTS GARAGE;
DROP TABLE IF EXISTS TECHNICIAN;
DROP TABLE IF EXISTS CUSTOMER;

CREATE TABLE CUSTOMER
(
	CUSTOMER_ID VARCHAR(25),
    FIRST_NAME VARCHAR(25) NOT NULL,
    LAST_NAME VARCHAR(25) NOT NULL,
    ADDRESS VARCHAR(25) NOT NULL,
    CITY VARCHAR(25) NOT NULL,
    STATE VARCHAR(25) NOT NULL,
    PHONE_NUMBER VARCHAR(15) NOT NULL,
    CUSTOMER_NUMBER VARCHAR(25),
    PRIMARY KEY (CUSTOMER_ID)
);

CREATE TABLE TECHNICIAN
(
	TECHNICIAN_ID VARCHAR(25),
    TECHNICIAN_TYPE_DESC VARCHAR(50) NOT NULL,
    HOURLY_BILLING_RATE DECIMAL(9,2) NOT NULL,
    PRIMARY KEY (TECHNICIAN_ID)
);

CREATE TABLE GARAGE 
(
	GARAGE_ID VARCHAR(25),
    GARAGE_LOCATION VARCHAR(25) NOT NULL,
    PRIMARY KEY(GARAGE_ID)
);

CREATE TABLE GARAGE_LOG
(
	GARAGE_LOG_ID VARCHAR(25),
    GARAGE_ID VARCHAR(25) NOT NULL,
    CLOCK_IN DATETIME NOT NULL,
    CLOCK_OUT DATETIME NOT NULL,
    PRIMARY KEY (GARAGE_LOG_ID),
    FOREIGN KEY (GARAGE_ID) REFERENCES GARAGE_LOG(GARAGE_LOG_ID)
);

CREATE TABLE EMPLOYEE
(
	EMPLOYEE_ID VARCHAR(25),
    FIRST_NAME VARCHAR(25) NOT NULL,
    LAST_NAME VARCHAR(25) NOT NULL,
    TECHNICIAN_ID VARCHAR(25) NOT NULL,
    GARAGE_LOG_ID VARCHAR(25) NOT NULL,
    PRIMARY KEY (EMPLOYEE_ID),
    FOREIGN KEY (TECHNICIAN_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID),
    FOREIGN KEY (GARAGE_LOG_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE VEHICLE
(
	VEHICLE_ID VARCHAR(25),
    VEHICLE_MODEL VARCHAR(25) NOT NULL,
    VEHICLE_MAKE VARCHAR(25) NOT NULL,
    CUSTOMER_ID VARCHAR(25) NOT NULL,
    MILLAGE INTEGER(25) NOT NULL,
    PRIMARY KEY(VEHICLE_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES VEHICLE(VEHICLE_ID)
);

CREATE TABLE INVOICE
( 
	INVOICE_ID VARCHAR(25),
    CUSTOMER_ID VARCHAR(25) NOT NULL,
    TECHNICIAN_ID VARCHAR(25) NOT NULL,
    INVOICE_TOTAL DECIMAL(9,2) NOT NULL,
    INVOICE_NUMBER INTEGER(25) NOT NULL,
    PRIMARY KEY (INVOICE_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES INVOICE(INVOICE_ID),
    FOREIGN KEY (TECHNICIAN_ID) REFERENCES INVOICE(INVOICE_ID)
);

CREATE TABLE PRODUCT
(
	PRODUCT_ID VARCHAR(25),
    PRODUCT_NUMBER INTEGER(25) NOT NULL,
    PRODUCT_COST DECIMAL(9,2) NOT NULL,
    PRODUCT_DESC VARCHAR(50) NOT NULL,
    INVOICE_ID VARCHAR(25) NOT NULL,
    PRIMARY KEY (PRODUCT_ID),
    FOREIGN KEY (INVOICE_ID) REFERENCES PRODUCT(PRODUCT_ID)
);

CREATE TABLE SERVICE
(
	SERVICE_ID VARCHAR(25),
    INVOICE_ID VARCHAR(25) NOT NULL,
    SERVICE_DESC VARCHAR(100) NOT NULL,
    SERVICE_NUMBER INTEGER(25) NOT NULL,
    SERVICE_COST DECIMAL(9,2) NOT NULL,
    PRIMARY KEY (SERVICE_ID),
    FOREIGN KEY (INVOICE_ID) REFERENCES SERVICE(SERVICE_ID)
);

INSERT INTO `CUSTOMER` VALUES 
('01', 'Bruce', 'Banner', '1111 Broad Street', 'Columbus', 'Ohio', '(555) 555-1111', '001'),
('02', 'Bruce', 'Wayne', '2222 Broad Street', 'Columbus', 'Ohio', '(555) 555-2222', '002'), 
('03', 'Peter', 'Parker', '3333 Broad Street', 'Columbus', 'Ohio', '(555) 555-3333', '003'),
('04', 'Steve', 'Rodgers', '4444 Broad Street', 'Columbus', 'Ohio', '(555) 555-4444', '004'),
('05', 'Tony', 'Stark', '5555 Broad Street', 'Columbus', 'Ohio', '(555) 555-5555', '005');

INSERT INTO `TECHNICIAN` VALUES 
('01', 'Tire repair and replacement', '10.00'),
('02', 'Tire rotaion and replacement', '10.00'),
('03', 'Tire disposal and replacement', '10.00'),
('04', 'Tire evaluation and replacement', '10.00'),
('05', 'Tire exchange and replacement', '10.00');

INSERT INTO `GARAGE` VALUES 
('01', '1111 Main Street'),
('02', '2222 Main Street'),
('03', '3333 Main Street'),
('04', '4444 Main Street'),
('05', '5555 Main Street'); 

INSERT INTO `GARAGE_LOG` VALUES
('01', '01', '2018-7-24 1:30', '2018-7-24 9:30'),
('02', '02', '2018-7-24 1:30', '2018-7-24 9:30'),
('03', '03', '2018-7-24 1:30', '2018-7-24 9:30'),
('04', '04', '2018-7-24 1:30', '2018-7-24 9:30'),
('05', '05', '2018-7-24 1:30', '2018-7-24 9:30');

INSERT INTO `EMPLOYEE` VALUES
('01', 'Clark', 'Kent', '01', '01'),
('02', 'Hal', 'Jordan', '02', '02'),
('03', 'Luke', 'Cage', '03', '03'),
('04', 'Reed', 'Richards', '04', '04'),
('05', 'Steven', 'Strange', '05', '05');

INSERT INTO `VEHICLE` VALUES
('01', 'Audi', 'R8', '01', '11111'),
('02', 'BMW', 'i8', '02', '22222'),
('03', 'Bugatti', 'Veyron', '03', '33333'),
('04', 'Ferrari', '488 Spider', '04', '44444'),
('05', 'Lamborghini', 'Aventador', '05', '55555');

INSERT INTO `INVOICE` VALUES
('01', '01', '01', '200.00', '01'),
('02', '02', '02', '200.00', '02'),
('03', '03', '03', '200.00', '03'),
('04', '04', '04', '200.00', '04'),
('05', '05', '05', '200.00', '05');

INSERT INTO `PRODUCT` VALUES
('01', '001', '100.00', 'New Audi Tires', '01'),
('02', '002', '100.00', 'New BMW Tires', '02'),
('03', '003', '100.00', 'New Bugatti Tires', '03'),
('04', '004', '100.00', 'New Ferrari Tires', '04'),
('05', '005', '100.00', 'New Lamborghini Tires', '05');

INSERT INTO `SERVICE` VALUES
('01', '01', 'Tire repair', '001', '100.00'),
('02', '02', 'Tire rotation', '002', '100.00'),
('03', '03', 'Tire disposal', '003', '100.00'),
('04', '04', 'Tire evaluation', '004', '100.00'),
('05', '05', 'Tire exchange', '005', '100.00');

SELECT * FROM CUSTOMER;
SELECT * FROM TECHNICIAN;
SELECT * FROM GARAGE;
SELECT * FROM GARAGE_LOG;
SELECT * FROM EMPLOYEE;
SELECT * FROM VEHICLE;
SELECT * FROM INVOICE;
SELECT * FROM PRODUCT;
SELECT * FROM SERVICE;

UPDATE TECHNICIAN T, INVOICE I
SET T.HOURLY_BILLING_RATE = 15, I.INVOICE_TOTAL = 250
WHERE T.TECHNICIAN_ID IN 
(SELECT TID
FROM
(SELECT TECHNICIAN_ID AS TID
FROM INVOICE I
WHERE I.TECHNICIAN_ID = 05 ) AS C);

UPDATE TECHNICIAN
 SET HOURLY_BILLING_RATE = 15
 WHERE TECHNICIAN_ID = 
 (SELECT TECHNICIAN_ID 
 FROM INVOICE
WHERE TECHNICIAN_ID = 05);




CREATE OR REPLACE VIEW CUSTOMER_NEW AS
SELECT CUSTOMER_ID AS "CUSTOMER ID", CONCAT(last_name,', ',first_name) AS CUSTOMER, ADDRESS, CITY, STATE, PHONE_NUMBER AS "PHONE NUMBER", CUSTOMER_NUMBER AS "CUSTOMER NUMBER"
FROM CUSTOMER;
SELECT * FROM CUSTOMER_NEW;

CREATE OR REPLACE VIEW CUSTOMER_INVOICES AS
SELECT C.CUSTOMER_ID AS "CUSTOMER ID", CONCAT(C.last_name,', ',C.first_name) AS CUSTOMER, C.CUSTOMER_NUMBER AS "CUSTOMER NUMBER", I.INVOICE_ID AS "INVOICE ID", I.INVOICE_TOTAL AS "INVOICE TOTAL", I.INVOICE_NUMBER AS "INVOICE NUMBER"
FROM CUSTOMER C JOIN INVOICE I ON
C.CUSTOMER_ID = I.CUSTOMER_ID;
SELECT * FROM CUSTOMER_INVOICES;

CREATE OR REPLACE VIEW CUSTOMER_INVOICES1 AS
SELECT C.CUSTOMER_ID AS "CUSTOMER ID", CONCAT(C.last_name,', ',C.first_name) AS CUSTOMER, CONCAT(C.CITY, ', ',C.STATE) AS LOCATION, C.PHONE_NUMBER
FROM CUSTOMER C 
WHERE  CUSTOMER_ID IN (SELECT distinct CUSTOMER_ID FROM INVOICE);
SELECT * FROM CUSTOMER_INVOICES1;

CREATE OR REPLACE VIEW INVOICE_SUM AS  
SELECT SUM(INVOICE_TOTAL) AS "INVOICE SUM"
FROM INVOICE
WHERE INVOICE_ID >= 1
ORDER BY INVOICE_ID;

SELECT * FROM INVOICE_SUM;



