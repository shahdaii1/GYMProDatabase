INSERT INTO Member (MemberID, PlanID, FirstName, LastName, Email, Phone, JoinDate) VALUES
(109, 2, 'Tarek', 'Nabil', 'tarek@gmail.com', '01009', '2026-04-20'),
(110, 3, 'Dina', 'Anwar', 'dina@gmail.com', '01010', '2026-04-21'),
(111, 1, 'Mostafa', 'Ali', 'mostafa@gmail.com', '01011', '2026-04-22'),
(112, 2, 'Reem', 'Hassan', 'reem@gmail.com', '01012', '2026-04-22'),
(113, 3, 'Samy', 'Ibrahim', 'samy@gmail.com', '01013', '2026-04-23'),
(114, 1, 'Amira', 'Kamal', 'amira@gmail.com', '01014', '2026-04-24'),
(115, 2, 'Omar', 'Farouk', 'omar.f@gmail.com', '01015', '2026-04-24');

INSERT INTO Staff (StaffID, FirstName, LastName, Role) VALUES
(204, 'Ahmed', 'Samy', 'Trainer'),
(205, 'Mona', 'Zaki', 'Yoga Instructor'),
(206, 'Kareem', 'Fuad', 'Nutritionist'),
(207, 'Soha', 'Magdy', 'Receptionist'),
(208, 'Hany', 'Ehab', 'Spa Specialist');


INSERT INTO Class_Catalog (ClassID, ClassName, Capacity, DurationMinutes) VALUES
(304, 'Spinning', 10, 50),
(305, 'Pilates', 12, 60),
(306, 'Boxing', 8, 90);

INSERT INTO Class_Session (SessionID, ClassID, StaffID, SessionDate, StartTime) VALUES
(407, 304, 204, '2026-04-25', '16:00:00'),
(408, 305, 205, '2026-04-25', '18:00:00'),
(409, 306, 201, '2026-04-26', '19:00:00'),
(410, 301, 205, '2026-04-26', '08:00:00'),
(411, 302, 202, '2026-04-27', '10:00:00');

INSERT INTO Spa_Booking (BookingID, MemberID, ServiceID, StaffID, AppointmentDate, AppointmentTime, Status) VALUES
(606, 110, 501, 208, '2026-04-25', '11:00:00', 'Confirmed'),
(607, 112, 502, 203, '2026-04-25', '13:00:00', 'Confirmed'),
(608, 113, 503, 208, '2026-04-26', '15:00:00', 'Pending'),
(609, 115, 501, 203, '2026-04-27', '10:00:00', 'Confirmed');


INSERT INTO Payment (PaymentID, MemberID, PlanID, BookingID, Amount, PaymentDate, PaymentTime, PaymentStatus) VALUES
(707, 109, 2, NULL, 500, '2026-04-20', '09:00:00', 'Paid'),
(708, 110, 3, 606, 950, '2026-04-21', '10:00:00', 'Paid'),
(709, 111, 1, NULL, 300, '2026-04-22', '11:00:00', 'Paid'),
(710, 112, 2, 607, 600, '2026-04-22', '12:00:00', 'Paid'),
(711, 113, 3, NULL, 800, '2026-04-23', '14:00:00', 'Pending'),
(712, 114, 1, NULL, 300, '2026-04-24', '15:00:00', 'Paid'),
(713, 115, 2, 609, 650, '2026-04-24', '16:00:00', 'Paid');

