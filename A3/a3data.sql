/*
*scsordas 0998149
*create the tables
*/
CREATE TABLE if not exists Customer (Account CHAR(5), Cname CHAR(20), Province CHAR(3), Cbalance NUMERIC(10,2), Crlimit INTEGER, PRIMARY KEY (Account));

CREATE TABLE if not exists Vendor (Vno CHAR(5), Vname CHAR(20), City CHAR(20), Vbalance NUMERIC(10,2), PRIMARY KEY (Vno));

CREATE TABLE if not exists Transaction (Tno CHAR(5), Vno CHAR(5), Account CHAR(5), T_date date, Amount NUMERIC(10,2), PRIMARY KEY (Tno));

/*
*put values in the tables
*/
INSERT INTO Customer
VALUES ('A1', 'Smith', 'ONT', 2515.00, 2000);
INSERT INTO Customer
VALUES ('A2', 'Jones', 'BC', 2014.00, 2500);
INSERT INTO Customer
VALUES ('A3', 'Doc', 'ONT', 150.00, 1000);

INSERT INTO Vendor
VALUES ('V1', 'IKEA', 'Toronto', 200.00);
INSERT INTO Vendor
VALUES ('V2', 'Walmart', 'Waterloo', 671.05);
INSERT INTO Vendor
VALUES ('V3', 'Esso', 'Windsor', 0.00);
INSERT INTO Vendor
VALUES ('V4', 'Esso', 'Waterloo', 225.00);

INSERT INTO Transaction
VALUES ('T1', 'V2', 'A1', '20200715', 1325.00);
INSERT INTO Transaction
VALUES ('T2', 'V2', 'A3', '20191216', 1900.00);
INSERT INTO Transaction
VALUES ('T3', 'V3', 'A1', '20200901', 2500.00);
INSERT INTO Transaction
VALUES ('T4', 'V4', 'A2', '20200320', 1613.00);
INSERT INTO Transaction
VALUES ('T5', 'V4', 'A3', '20200731', 2212.00);
