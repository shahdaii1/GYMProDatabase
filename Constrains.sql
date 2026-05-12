
ALTER TABLE Member
ADD CONSTRAINT CHK_Member_Email CHECK (Email LIKE '%@%.%');

ALTER TABLE Member
ADD CONSTRAINT CHK_Member_Phone CHECK (LEN(Phone) >= 5);

ALTER TABLE Membership_Plan
ADD CONSTRAINT CHK_Plan_Price CHECK (MonthlyPrice > 0);

ALTER TABLE Payment
ADD CONSTRAINT CHK_Payment_Amount CHECK (Amount > 0);

ALTER TABLE Payment
ADD CONSTRAINT CHK_Payment_Status 
CHECK (PaymentStatus IN ('Paid', 'Pending', 'Failed', 'Refunded'));

ALTER TABLE Class_Roster
ADD CONSTRAINT CHK_Attendance_Status 
CHECK (AttendanceStatus IN ('Present', 'Absent', 'Enrolled', 'Cancelled'));

ALTER TABLE Spa_Booking
ADD CONSTRAINT CHK_Booking_Status 
CHECK (Status IN ('Confirmed', 'Pending', 'Cancelled', 'Completed'));

ALTER TABLE Class_Catalog
ADD CONSTRAINT CHK_Class_Capacity CHECK (Capacity >= 5);

ALTER TABLE Class_Catalog
ADD CONSTRAINT CHK_Class_Duration CHECK (DurationMinutes BETWEEN 15 AND 240);

