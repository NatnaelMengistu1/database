DROP TABLE IF EXISTS Approval;
DROP TABLE IF EXISTS Location;
DROP TABLE IF EXISTS Availability;
DROP TABLE IF EXISTS Slot;
DROP TABLE IF EXISTS Logic;
DROP TABLE IF EXISTS Schedule;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS StudentEmployee;

CREATE TABLE studentEmployee (
  ST_CWID  char(10)  PRIMARY KEY ,
  Name   text,
  Email   char(50),
  PhoneNum int,
  Level  text
);

CREATE TABLE  Supervisor(
  AD_CWID char(10)  PRIMARY KEY,
  Name  text,
  Email char(50),
  PhoneNum int
);

CREATE TABLE  Schedule(
SCid char(10) PRIMARY KEY,
Availabilityid char(10),
Lid char(10),
LogicID char(10)
);

CREATE TABLE  Slot(
Slot_ID char(10) PRIMARY KEY
);

CREATE TABLE  Logic(
LogicID char(10) PRIMARY KEY,
Lid  char(10) not null references Location(Lid),
Day text,
Maxhours int CHECK (Maxhours <= 8),
Totalhours int CHECK (Totalhours <= 40)
);


CREATE TABLE  Location(
Lid text PRIMARY KEY,
Name text,
MaxNumStaff int,
MinNumStaff  int
);

CREATE TABLE  Availability(
Availabilityid char(10) PRIMARY KEY,
DesiredHours  int CHECK (DesiredHours < 20),
ST_CWID char(10) not null references StudentEmployee(ST_CWID),
Slot_ID char(10) not null references Slot(Slot_ID),
Season text
);

CREATE TABLE Approval(
 APid  char(10) PRIMARY KEY ,
 AD_CWID char(10) not null references Supervisor(AD_CWID),
 SCid char(10) not null references Schedule(SCid),
    Date  DATE
);    


-- Loading example data 

-- Employees--
INSERT INTO StudentEmployee(  ST_CWID, Name,Email,PhoneNum,Level)
 VALUES ('S79878909','MIKE','mike123@gmail.com',845545656,'Trainee');

INSERT INTO StudentEmployee(  ST_CWID, Name,Email,PhoneNum,Level)
 VALUES ('S11122233','Frank','frankyboy@gmail.com',656237242,'Experienced');

INSERT INTO StudentEmployee(ST_CWID, Name,Email,PhoneNum,Level)
 VALUES ('S51434365','Joey','jman@hotmail.com', 2134564568,'Experienced');

INSERT INTO StudentEmployee(ST_CWID, Name,Email,PhoneNum,Level)
 VALUES ('S09337890','Mary','themary442@yahoo.com', 845213202,'Trainee');

INSERT INTO StudentEmployee(  ST_CWID, Name,Email,PhoneNum,Level)
 VALUES ('S79668919','Nora','nora.lee1@marist.edu',848787877,'Experienced');

-- select*from StudentEmployee

-- Supervisor

 INSERT INTO Supervisor ( AD_CWID ,Name,Email,PhoneNum)
 VALUES ('AD001','Alan','Labouseur@marist.edu', 516652556 );
 INSERT INTO Supervisor ( AD_CWID ,Name,Email,PhoneNum)
 VALUES ('AD002','Kathy','kathy1@marist.edu', 845789465 );
 
-- Select * from Supervisor
 
 -- Slot
  INSERT INTO Slot ( Slot_ID)
 VALUES ('SL333');
 INSERT INTO Slot ( Slot_ID)
 VALUES ('SL334');
 INSERT INTO Slot ( Slot_ID)
 VALUES ('SL335');
 INSERT INTO Slot ( Slot_ID )
 VALUES ('SL336'); 
 INSERT INTO Slot ( Slot_ID )
 VALUES ('SL337');
 INSERT INTO Slot ( Slot_ID)
 VALUES ('SL338');
 
 -- select * from Slot
 
 -- Location
 INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('DN558', 'Lobby' , 2 , 1);
 INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('LT9898', 'Raised floor',3 ,2 );
  INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('LT4948', 'Lounge', 2,1);
  INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('ST3093', 'gym' ,4 ,2  );
  INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('SC87','Library', 2 ,1);
  INSERT INTO Location ( Lid , Name , MaxNumStaff ,MinNumStaff)
 VALUES ('DY3092' , 'Cafe' , 1 ,0 );
 
 -- SELECT * from Location
  
  -- Logic
  
  INSERT INTO Logic ( LogicID , Lid , Day, Maxhours,Totalhours)
 VALUES ( 'L0001','SC87','Monday',8,40 );
  INSERT INTO Logic ( LogicID , Lid ,Day, Maxhours,Totalhours)
 VALUES ( 'L0003','ST3093','Wednesday',8,40);
 INSERT INTO Logic (LogicID , Lid , Day , Maxhours , Totalhours)
 VALUES ('L0005','DN558','Saturday' ,4,8);

 
-- select * FROM Logic


-- Availability

INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES ('A001', 6 ,'S79878909', 'SL333', 'Fall' );
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES ('A002', 3 ,'S11122233','SL334','Spring');
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES  ('A003', 5 ,'S51434365','SL335','Fall');
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season)
VALUES  ('A004', 2 ,'S09337890' ,'SL336','Spring');
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES ('A005', 1 ,'S79878909', 'SL338', 'Fall' );
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES ('A006', 3 ,'S11122233','SL333','Spring');
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season )
VALUES  ('A007', 5 ,'S51434365','SL335','Fall');
INSERT INTO Availability (Availabilityid,DesiredHours,ST_CWID,Slot_ID,Season)
VALUES  ('A008', 2 ,'S09337890' ,'SL336','Spring');

-- 
-- select * from Availability

-- Schedule
 INSERT INTO Schedule ( SCid ,Availabilityid ,Lid ,LogicID )
 VALUES ('S001','AV4867738','ST3093','L0001'),
 ('S002','AV1645238','DY3092','L0003'),
 ('S003','AV7849874','DN558','L0001'),
 ('S004','AV0293589','LT4948','L0005');
 
 -- select * from Schedule

-- Approval table-
INSERT INTO Approval(APid , AD_CWID , SCid ,Date)
VALUES ('AP001','AD001','S001','20150107' );
INSERT INTO Approval(APid , AD_CWID , SCid ,Date)
VALUES ('AP002','AD002','S002','20140906' );
INSERT INTO Approval(APid , AD_CWID , SCid ,Date)
VALUES ('AP003','AD002','S004','20161211' );
INSERT INTO Approval(APid , AD_CWID , SCid ,Date)
VALUES ('AP004','AD001','S003','20171005' ); 

-- select *from Approval

-- View

CREATE VIEW View_Name AS
SELECT Name
FROM StudentEmployee, Availability 
WHERE StudentEmployee.ST_CWID = Availability.ST_CWID 
AND Desiredhours > 5 ;

SELECT * FROM View_Name

------------------
-- CREATE TRIGGER MaxhourTrigger
--  BEFORE UPDATE DesiredHours ON Availability
-- REFERENCING 
  --  OLD ROW AS OLDTuple
   -- NEW ROW AS NEWTuple 
-- FOR EACH ROW
-- WHEN ( 40 < (select DesiredHours from Availability))
-- INSERT INTO Availability 
-- END;

-=
-- CREATE FUNCTION  ChangeNum(
 --   IN OldPhoneNum INT,
  --  IN NewPhoneNum INT
   -- )
-- UPDATE StudentEmployee
-- SET PhoneNum= NewPhoneNum
-- WHERE PhoneNum= OldPhoneNum;