CREATE TABLE Member (
   MemberID INT PRIMARY KEY,
   PlanID INT NOT NULL,

   FirstName VARCHAR(30) NOT NULL,
   LastName VARCHAR(30) NOT NULL,

   Email VARCHAR(50) UNIQUE,
   Phone VARCHAR(20),
   JoinDate DATE,

   FOREIGN KEY (PlanID)
      REFERENCES Membership_Plan(PlanID)
);

CREATE TABLE Membership_Plan (
   PlanID INT PRIMARY KEY,
   PlanName VARCHAR(50) NOT NULL,
   MonthlyPrice DECIMAL(8,2) CHECK (MonthlyPrice > 0)
);

CREATE TABLE Staff (
   StaffID INT PRIMARY KEY,
   FirstName VARCHAR(30) NOT NULL,
   LastName VARCHAR(30) NOT NULL,
   Role VARCHAR(30) NOT NULL
);

CREATE TABLE Class_Catalog (
   ClassID INT PRIMARY KEY,
   ClassName VARCHAR(50) NOT NULL,
   Capacity INT CHECK (Capacity > 0),
   DurationMinutes INT CHECK (DurationMinutes > 0)
);

CREATE TABLE Class_Session (
   SessionID INT PRIMARY KEY,

   ClassID INT NOT NULL,
   StaffID INT NOT NULL,

   SessionDate DATE,
   StartTime TIME,

   FOREIGN KEY (ClassID)
      REFERENCES Class_Catalog(ClassID),

   FOREIGN KEY (StaffID)
      REFERENCES Staff(StaffID)
);

CREATE TABLE Class_Roster (

   SessionID INT,
   MemberID INT,

   AttendanceStatus VARCHAR(20),

   PRIMARY KEY (SessionID, MemberID),

   FOREIGN KEY (SessionID)
      REFERENCES Class_Session(SessionID),

   FOREIGN KEY (MemberID)
      REFERENCES Member(MemberID)
);

CREATE TABLE Spa_Service (
   ServiceID INT PRIMARY KEY,
   ServiceName VARCHAR(50),
   DurationMinutes INT,
   AdditionalCost DECIMAL(8,2)
);

CREATE TABLE Spa_Booking (
   BookingID INT PRIMARY KEY,

   MemberID INT NOT NULL,
   ServiceID INT NOT NULL,
   StaffID INT NOT NULL,

   AppointmentDate DATE,
   AppointmentTime TIME,

   Status VARCHAR(20),

   FOREIGN KEY (MemberID)
      REFERENCES Member(MemberID),

   FOREIGN KEY (ServiceID)
      REFERENCES Spa_Service(ServiceID),

   FOREIGN KEY (StaffID)
      REFERENCES Staff(StaffID)
);

CREATE TABLE Payment (
   PaymentID INT PRIMARY KEY,

   MemberID INT NOT NULL,
   PlanID INT,
   BookingID INT,

   Amount DECIMAL(8,2) CHECK (Amount > 0),

   PaymentDate DATE,
   PaymentTime TIME,

   PaymentStatus VARCHAR(20),

   FOREIGN KEY (MemberID)
      REFERENCES Member(MemberID),

   FOREIGN KEY (PlanID)
      REFERENCES Membership_Plan(PlanID),

   FOREIGN KEY (BookingID)
      REFERENCES Spa_Booking(BookingID)
);