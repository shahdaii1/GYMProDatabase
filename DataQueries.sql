SELECT *  FROM Member;

SELECT M.FirstName,M.LastName,P.PlanName
FROM Member M
JOIN Membership_Plan P
ON M.PlanID = P.PlanID;

SELECT C.ClassName,S.SessionDate,S.StartTime,St.FirstName,St.LastName
FROM Class_Session S
JOIN Class_Catalog C
ON S.ClassID = C.ClassID
JOIN Staff St
ON S.StaffID = St.StaffID;

SELECT PlanID,COUNT(*) AS Members_Count
FROM Member
GROUP BY PlanID;

SELECT SUM(Amount) AS TotalPayments
FROM Payment;

SELECT SessionID,COUNT(MemberID) AS NumberOfMembers
FROM Class_Roster
GROUP BY SessionID;

SELECT FirstName, LastName
FROM Member
WHERE PlanID =
(
SELECT PlanID
FROM Membership_Plan
WHERE PlanName='VIP'
);

SELECT 
M.FirstName,
SV.ServiceName,
B.AppointmentDate,
B.Status
FROM Spa_Booking B
JOIN Member M
ON B.MemberID = M.MemberID
JOIN Spa_Service SV
ON B.ServiceID = SV.ServiceID;

UPDATE Spa_Booking
SET Status='Confirmed'
WHERE BookingID=602;

SELECT SessionID, COUNT(MemberID) AS TotalMembers
FROM Class_Roster
GROUP BY SessionID
HAVING COUNT(MemberID) > 1;

SELECT M.FirstName, M.LastName
FROM Member M
LEFT JOIN Spa_Booking B ON M.MemberID = B.MemberID
WHERE B.BookingID IS NULL;

SELECT TOP 1
    M.FirstName,
    M.LastName,
    SUM(P.Amount) AS TotalSpent
FROM Payment P
JOIN Member M ON P.MemberID = M.MemberID
GROUP BY M.MemberID, M.FirstName, M.LastName
ORDER BY TotalSpent DESC;

SELECT AVG(MonthlyPrice) AS AvgPrice,
       MIN(MonthlyPrice) AS CheapestPlan,
       MAX(MonthlyPrice) AS MostExpensive
FROM Membership_Plan;

SELECT FirstName, LastName,
       CASE
           WHEN DATEDIFF(DAY, JoinDate, GETDATE()) <= 30 THEN 'New'
           WHEN DATEDIFF(DAY, JoinDate, GETDATE()) <= 365 THEN 'Active'
           ELSE 'Inactive'
       END AS MemberStatus
FROM Member;
