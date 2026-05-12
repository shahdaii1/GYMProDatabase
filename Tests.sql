EXEC UpdateMember 
    @MemberID = 104, 
    @NewEmail = 'huda.ali_new@gmail.com', 
    @NewPhone = '0109999', 
    @NewPlanID = 3;

SELECT * FROM Member WHERE MemberID = 104;


EXEC GetMembersByPlan @PlanName = 'VIP';


EXEC CancelBooking @BookingID = 602;

SELECT * FROM Spa_Booking WHERE BookingID = 602;


EXEC ProcessPayment @PaymentID = 703, @MemberID = 103;

SELECT * FROM Payment WHERE PaymentID = 703;

SELECT 
    M.MemberID,
    M.FirstName + ' ' + M.LastName AS [Member Name],
    P.PlanName AS [Plan Type],
    C.ClassName AS [Class Attended],
    S.FirstName + ' ' + S.LastName AS [Coach Name],
    R.AttendanceStatus AS [Status],
    CS.SessionDate,
    CS.StartTime
FROM Member M
JOIN Membership_Plan P ON M.PlanID = P.PlanID
JOIN Class_Roster R ON M.MemberID = R.MemberID
JOIN Class_Session CS ON R.SessionID = CS.SessionID
JOIN Class_Catalog C ON CS.ClassID = C.ClassID
JOIN Staff S ON CS.StaffID = S.StaffID
ORDER BY CS.SessionDate DESC;

SELECT 
    M.FirstName + ' ' + M.LastName AS [Member],
    Pay.Amount AS [Paid Amount],
    Pay.PaymentStatus,
    Pay.PaymentDate,
    COALESCE(SS.ServiceName, 'Monthly Membership') AS [Service Description]
FROM Payment Pay
JOIN Member M ON Pay.MemberID = M.MemberID
LEFT JOIN Spa_Booking SB ON Pay.BookingID = SB.BookingID
LEFT JOIN Spa_Service SS ON SB.ServiceID = SS.ServiceID;

INSERT INTO Payment (PaymentID, MemberID, Amount, PaymentStatus)
VALUES (999, 101, -50, 'Paid');


INSERT INTO Payment (PaymentID, MemberID, PlanID, Amount, PaymentDate, PaymentStatus) 
VALUES (750, 101, 1, 300.00, GETDATE(), 'Paid');