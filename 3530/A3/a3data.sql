
-- create a table
CREATE TABLE V (
  Vno CHAR(5),
  Vname CHAR(20),
  City CHAR(20),
  Vbalance NUMERIC(10,2),
  PRIMARY KEY (Vno)
);


-- create a table
CREATE TABLE C (
  Account CHAR(5),
  Cname CHAR(20),
  Province CHAR(3),
  Cbalance NUMERIC(10,2),
  Crlimit INTEGER,
  PRIMARY KEY (Account)
);


-- create a table
CREATE TABLE T (
  Tno CHAR(5),
  Vno CHAR(5),
  Account CHAR(5),
  T_date DATE,
  Amount NUMERIC(10,2),
  FOREIGN KEY(Account) REFERENCES C(Account),
  FOREIGN KEY(Vno) REFERENCES V(Vno),
  PRIMARY KEY (Tno) 
);

--insert values
INSERT INTO V VALUES('V1','IKEA','Toronto',200.00);
INSERT INTO V VALUES('V2','Walmart','Waterloo',671.05);
INSERT INTO V VALUES('V3','Esso','Windsor',0.00);
INSERT INTO V VALUES('V4','Esso','Waterloo',225.00);


--insert values
INSERT INTO C VALUES('A1','Smith','ONT',2515.00,2000);
INSERT INTO C VALUES('A2','Jones','BC',2014.00,2500);
INSERT INTO C VALUES('A3','Doc','ONT',150.00,1000);


--insert values
INSERT INTO T VALUES('T1','V2','A1','2022-07-15',1325.00);
INSERT INTO T VALUES('T2','V2','A3','2022-12-16',1900.00);
INSERT INTO T VALUES('T3','V3','A1','2022-09-01',2500.00);
INSERT INTO T VALUES('T4','V4','A2','2022-03-20',1613.00);
INSERT INTO T VALUES('T5','V4','A3','2022-07-31',2212.00);
