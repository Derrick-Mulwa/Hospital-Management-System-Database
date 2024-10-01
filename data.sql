USE hospitaldb;

INSERT INTO physician (name, specialty, contactInformation, address, dateStarted) VALUES
('Madelyn Rose', 'Cardiologist', 'madelyn.rose@saveliveshospital.com', 'San Vitus Blvd', '2022-01-05'),
('Hayden Harmon', 'Pediatrician', 'hayden.harmon@saveliveshospital.com', 'Senora Rd', '2021-11-15'),
('Maren McCullough', 'Dermatologist', 'maren.mccullough@saveliveshospital.com', 'Alta St', '2020-07-20'),
('Briar Cole', 'Neurologist', 'briar.cole@saveliveshospital.com', 'Mirror Park Blvd', '2023-02-10'),
('Margaret Cuevas', 'Psychiatrist', 'margaret.cuevas@saveliveshospital.com', 'Innocence Blvd', '2022-09-30'),
('Brecken Fitzgerald', 'Orthopedic Surgeon', 'brecken.fitzgerald@saveliveshospital.com', 'Elgin Ave', '2023-04-25'),
('Marlee Harrison', 'Ophthalmologist', 'marlee.harrison@saveliveshospital.com', 'Amarillo Vista', '2021-03-12'),
('Gavin Stanton', 'Gastroenterologist', 'gavin.stanton@saveliveshospital.com', 'Clinton Ave', '2020-12-18'),
('Jaycee Reeves', 'Otolaryngologist', 'jaycee.reeves@saveliveshospital.com', 'Grove St', '2019-10-05'),
('Clark Walker', 'Urologist', 'clark.walker@saveliveshospital.com', 'Magellan Ave', '2024-01-30');

INSERT INTO patient (name, dateOfBirth, gender, contactInformation, paymentMethod, address, dateStarted) VALUES
('Hazel Lynch', '1995-08-20', 'Female', 'hazel.lynch@patientmail.com', 'Insurance', 'Senora Rd', '2022-05-15'),
('Zane Robertson', '1980-04-10', 'Male', 'zane.robertson@patientmail.com', 'Cash', 'Vinewood Park Dr', '2023-09-28'),
('Harmony Sherman', '1973-12-05', 'Female', 'harmony.sherman@patientmail.com', 'Insurance', 'Del Perro Fwy', '2020-11-10'),
('Adan White', '2000-06-15', 'Male', 'adan.white@patientmail.com', 'Insurance', 'Strawberry Ave', '2021-08-02'),
('Layla Byrd', '1998-03-25', 'Female', 'layla.byrd@patientmail.com', 'Insurance', 'Dorset Dr', '2024-02-15'),
('Cristian Fischer', '1978-09-08', 'Male', 'cristian.fischer@patientmail.com', 'Credit Card', 'Eclipse Blvd', '2023-06-30'),
('Maci Randall', '1993-07-12', 'Female', 'maci.randall@patientmail.com', 'Insurance', 'Mad Wayne Thunder Dr', '2021-01-20'),
('Trenton Kelley', '1985-01-30', 'Male', 'trenton.kelley@patientmail.com', 'Insurance', 'Bay City Ave', '2020-03-18'),
('Rosalie Bradley', '1982-11-17', 'Female', 'rosalie.bradley@patientmail.com', 'Cash', 'Ginger St', '2022-08-10'),
('Richard Cameron', '1970-05-22', 'Male', 'richard.cameron@patientmail.com', 'Insurance', 'San Andreas Ave', '2024-04-05');

INSERT INTO labTechnician (name, expertise, contactInformation, address, dateStarted) VALUES
('Julie Conner', 'Microbiology', 'julie.conner@saveliveshospital.com', 'Tongva Dr', '2023-07-18'),
('Phillip Hughes', 'Hematology', 'phillip.hughes@saveliveshospital.com', 'Calais Ave', '2022-03-12'),
('Samantha Meza', 'Chemistry', 'samantha.meza@saveliveshospital.com', 'Boulevard Del Perro', '2021-10-28'),
('Lucian Sherman', 'Immunology', 'lucian.sherman@saveliveshospital.com', 'Spanish Ave', '2020-04-15'),
('Addilyn Dickerson', 'Genetics', 'addilyn.dickerson@saveliveshospital.com', 'Dutch London St', '2024-02-02'),
('Flynn Burton', 'Pathology', 'flynn.burton@saveliveshospital.com', 'Marathon Ave', '2023-05-09'),
('Miriam Castaneda', 'Biochemistry', 'miriam.castaneda@saveliveshospital.com', 'Laguna Pl', '2022-09-14'),
('Collin Faulkner', 'Pharmacology', 'collin.faulkner@saveliveshospital.com', 'Procopio Dr', '2021-12-30'),
('Ansley Cisneros', 'Toxicology', 'ansley.cisneros@saveliveshospital.com', 'Roy Lowenstein Blvd', '2020-08-25'),
('Alden Dawson', 'Virology', 'alden.dawson@saveliveshospital.com', 'El Rancho Blvd', '2023-01-17');

INSERT INTO administrator (name, role, contactInformation, address, dateStarted) VALUES
('Veronica Vaughan', 'Chief Executive Officer', 'veronica.vaughan@saveliveshospital.com', 'Vespucci Blvd', '2022-06-20'),
('Castiel Reid', 'Chief Operating Officer', 'castiel.reid@saveliveshospital.com', 'Grapeseed Main St', '2021-11-05'),
('Charlee Atkins', 'Chief Financial Officer', 'charlee.atkins@saveliveshospital.com', 'Senora Way', '2020-04-30'),
('Cason Waller', 'Human Resources Director', 'cason.waller@saveliveshospital.com', 'Cassidy Trail', '2023-08-15'),
('Whitley Dawson', 'Quality Assurance Director', 'whitley.dawson@saveliveshospital.com', 'Panorama Dr', '2022-03-02');

INSERT INTO nurse (name, role, contactInformation, address, dateStarted) VALUES
('Iker Gutierrez', 'Critical Care Nurse', 'iker.gutierrez@saveliveshospital.com', 'Great Ocean Hwy', '2021-09-12'),
('Savannah Best', 'Emergency Room Nurse', 'savannah.best@saveliveshospital.com', 'North Conker Ave', '2020-05-30'),
('Harlem Wheeler', 'Pediatric Nurse', 'harlem.wheeler@saveliveshospital.com', 'Baytree Canyon Rd', '2023-02-15'),
('Sydney Hines', 'Surgical Nurse', 'sydney.hines@saveliveshospital.com', 'Procopio Promenade', '2022-11-20'),
('Uriel English', 'Intensive Care Unit Nurse', 'uriel.english@saveliveshospital.com', 'Paleto Blvd', '2021-07-08');

INSERT INTO room (occupancyStatus, admissionDate, dischargeDate, patientID) VALUES
('Occupied', '2024-03-01', '2024-03-10', 1),
('Occupied', '2024-02-20', '2024-03-05', 2),
('Occupied', '2024-03-10', '2024-03-25', 3),
('Occupied', '2024-03-05', '2024-03-30', 4),
('Occupied', '2024-03-15', '2024-04-3', 5),
('Vacant', NULL, NULL, NULL),
('Vacant', NULL, NULL, NULL),
('Vacant', NULL, NULL, NULL),
('Vacant', NULL, NULL, NULL),
('Vacant', NULL, NULL, NULL);

INSERT INTO labTest (patientID, labTechnicianID, date, result) VALUES
(1, 1, '2024-03-02', 'Normal'),
(2, 2, '2024-02-25', 'Abnormal'),
(3, 3, '2024-03-08', 'Normal'),
(4, 4, '2024-03-12', 'Abnormal'),
(5, 5, '2024-03-14', 'Normal'),
(6, 6, '2024-03-05', 'Normal'),
(7, 7, '2024-03-09', 'Abnormal'),
(8, 8, '2024-03-07', 'Normal'),
(9, 9, '2024-03-11', 'Abnormal'),
(10, 10, '2024-03-15', 'Normal');

INSERT INTO medication (patientID, physicianID, medicationName, quantity, expiryDate, cost) VALUES
(1, 1, 'Aspirin', 30, '2024-12-01', 25.00),
(2, 2, 'Amoxicillin', 20, '2024-11-01', 30.00),
(3, 3, 'Lisinopril', 15, '2024-10-01', 20.00),
(4, 4, 'Metformin', 30, '2024-09-01', 35.00),
(5, 5, 'Atorvastatin', 30, '2024-08-01', 40.00),
(6, 6, 'Levothyroxine', 30, '2024-07-01', 45.00),
(7, 7, 'Metoprolol', 15, '2024-06-01', 30.00),
(8, 8, 'Amlodipine', 15, '2024-05-01', 35.00),
(9, 9, 'Simvastatin', 30, '2024-04-01', 40.00),
(10, 10, 'Losartan', 20, '2024-03-01', 25.00);

INSERT INTO diagnosis (patientID, physicianID, diagnosisDate, description, diagnosis) VALUES
(1, 1, '2024-03-02', 'Routine checkup', 'Healthy'),
(2, 2, '2024-02-25', 'Fever and cough', 'Respiratory infection'),
(3, 3, '2024-03-08', 'High blood pressure', 'Hypertension'),
(4, 4, '2024-03-12', 'Diabetes management', 'Type 2 Diabetes'),
(5, 5, '2024-03-14', 'Cholesterol screening', 'High cholesterol'),
(6, 6, '2024-03-05', 'Thyroid disorder', 'Hypothyroidism'),
(7, 7, '2024-03-09', 'Heart condition', 'Arrhythmia'),
(8, 8, '2024-03-07', 'High blood pressure', 'Hypertension'),
(9, 9, '2024-03-11', 'Cholesterol screening', 'High cholesterol'),
(10, 10, '2024-03-15', 'High blood pressure', 'Hypertension');

INSERT INTO appointment (date, time, description, patientID, physicianID) VALUES
('2024-03-02', '10:00:00', 'Routine checkup', 1, 1),
('2024-02-25', '11:00:00', 'Fever and cough', 2, 2),
('2024-03-08', '09:00:00', 'High blood pressure', 3, 3),
('2024-03-12', '14:00:00', 'Diabetes management', 4, 4),
('2024-03-14', '15:00:00', 'Cholesterol screening', 5, 5),
('2024-03-05', '13:00:00', 'Thyroid disorder', 6, 6),
('2024-03-09', '10:00:00', 'Heart condition', 7, 7),
('2024-03-07', '11:00:00', 'High blood pressure', 8, 8),
('2024-03-11', '12:00:00', 'Cholesterol screening', 9, 9),
('2024-03-15', '14:00:00', 'High blood pressure', 10, 10);

INSERT INTO billing (appointmentID, totalAmount, paymentStatus) VALUES
(1, 50.00, 'Paid'),
(2, 60.00, 'Pending'),
(3, 45.00, 'Paid'),
(4, 70.00, 'Pending'),
(5, 80.00, 'Paid'),
(6, 85.00, 'Pending'),
(7, 65.00, 'Paid'),
(8, 70.00, 'Pending'),
(9, 75.00, 'Paid'),
(10, 55.00, 'Pending');

INSERT INTO payment (billingID, amountPaid, paymentDate) VALUES
(1, 50.00, '2024-03-02'),
(3, 45.00, '2024-03-08'),
(5, 80.00, '2024-03-14'),
(7, 65.00, '2024-03-09'),
(9, 75.00, '2024-03-11');

INSERT INTO logindetails (userID, username, password)
VALUES 
    (1, 'doctor1', 'password123'),
    (2, 'nurse1', 'securepass'),
    (3, 'admin1', 'admin123'),
    (4, 'labtech1', 'labpassword'),
    (5, 'receptionist1', 'recep123');
