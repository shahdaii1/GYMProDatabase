CREATE PROCEDURE AddMember
   @MemberID INT,
   @PlanID INT,
   @FirstName VARCHAR(30),
   @LastName VARCHAR(30),
   @Email VARCHAR(50),
   @Phone VARCHAR(20)
AS
BEGIN

INSERT INTO Member
VALUES
(
@MemberID,@PlanID,@FirstName,@LastName,@Email,@Phone,GETDATE()
);

END;


CREATE PROCEDURE UpdateMember
    @MemberID INT,
    @NewEmail VARCHAR(50),
    @NewPhone VARCHAR(20),
    @NewPlanID INT
AS
BEGIN
    UPDATE Member
    SET Email = @NewEmail,
        Phone = @NewPhone,
        PlanID = @NewPlanID
    WHERE MemberID = @MemberID;
    
    PRINT 'Member information updated successfully.';
END;

CREATE PROCEDURE GetMembersByPlan
@PlanName VARCHAR(50)
AS
BEGIN

SELECT
M.FirstName,M.LastName
FROM Member M
JOIN Membership_Plan P
ON M.PlanID=P.PlanID
WHERE P.PlanName=@PlanName;
END;


CREATE PROCEDURE CancelBooking
    @BookingID INT
AS
BEGIN
    UPDATE Spa_Booking
    SET Status = 'Cancelled'
    WHERE BookingID = @BookingID;

    PRINT 'Booking has been cancelled.';
END;


CREATE PROCEDURE ProcessPayment
    @PaymentID INT,
    @MemberID INT
AS
BEGIN
    DECLARE @Amount DECIMAL(8,2);
    DECLARE @PlanID INT;

    --
    SELECT @PlanID = m.PlanID, @Amount = p.MonthlyPrice
    FROM Member m
    JOIN Membership_Plan p ON m.PlanID = p.PlanID
    WHERE m.MemberID = @MemberID;

    -- 
    INSERT INTO Payment (PaymentID, MemberID, PlanID, Amount, PaymentDate, PaymentTime, PaymentStatus)
    VALUES (@PaymentID, @MemberID, @PlanID, @Amount, CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), 'Paid');

    PRINT 'Payment processed successfully for Member ID: ' + CAST(@MemberID AS VARCHAR);
END;

CREATE PROCEDURE MarkAttendance
    @SessionID INT,
    @MemberID INT,
    @Status VARCHAR(20)
AS
BEGIN
    UPDATE Class_Roster
    SET AttendanceStatus = @Status
    WHERE SessionID = @SessionID AND MemberID = @MemberID;
    
    PRINT 'Attendance status updated.';
END;
