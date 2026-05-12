INSERT INTO Membership_Plan VALUES
(1,'Basic',300),
(2,'Standard',500),
(3,'VIP',800);

INSERT INTO Member VALUES
(101,1,'Ali','Ahmed','ali@gmail.com','01001','2026-04-01'),
(102,2,'Sara','Mohamed','sara@gmail.com','01002','2026-04-03'),
(103,3,'Mona','Hassan','mona@gmail.com','01003','2026-04-05');

INSERT INTO Staff VALUES
(201,'Omar','Salem','Trainer'),
(202,'Nour','Ibrahim','Instructor'),
(203,'Lina','Adel','Spa Specialist');

INSERT INTO Class_Catalog VALUES
(301,'Yoga',20,60),
(302,'Zumba',25,45),
(303,'CrossFit',15,90);

INSERT INTO Class_Session VALUES
(401,301,202,'2026-04-10','10:00:00'),
(402,302,202,'2026-04-11','12:00:00'),
(403,303,201,'2026-04-12','08:00:00');

INSERT INTO Class_Roster VALUES
(401,101,'Present'),
(401,102,'Absent'),
(402,103,'Present');

INSERT INTO Spa_Service VALUES
(501,'Massage',60,150),
(502,'Sauna',30,100),
(503,'Facial',45,120);

INSERT INTO Spa_Booking VALUES
(601,101,501,203,'2026-04-15','14:00:00','Confirmed'),
(602,102,502,203,'2026-04-16','15:30:00','Pending');

INSERT INTO Payment VALUES
(701,101,1,601,300,'2026-04-01','09:00:00','Paid'),
(702,102,2,602,500,'2026-04-03','10:30:00','Paid');

SELECT * FROM Member;
SELECT * FROM Membership_Plan;
SELECT * FROM Payment;