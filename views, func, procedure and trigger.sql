DROP VIEW IF EXISTS patient_details; 
DROP VIEW IF EXISTS room_occupancy; 
DROP FUNCTION IF EXISTS calculate_total_cost; 
DROP FUNCTION IF EXISTS calculate_age; 
DROP PROCEDURE IF EXISTS update_patient_info; 
DROP PROCEDURE IF EXISTS add_new_patient; 
DROP TRIGGER IF EXISTS insert_trigger; 
DROP TRIGGER IF EXISTS password_changed_trigger;

 
-- Functions
-- This section creates a function to calculate the age based on the date of birth provided.

DELIMITER //
CREATE FUNCTION calculate_age(dateOfBirth DATE) RETURNS INT READS SQL DATA
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, dateOfBirth, CURDATE());
    RETURN age;
END//


CREATE FUNCTION calculate_total_cost(billingID INT) RETURNS DECIMAL(8,2)
 READS SQL DATA
 BEGIN
     DECLARE total DECIMAL(8,2);
     SELECT SUM(totalAmount)
     INTO total
     FROM billing
     WHERE billingID = billingID;
     RETURN total;
 END;
//

DELIMITER ;

-- Views
-- This section creates two views:
-- 1. 'patient_details': Provides details of patients including age calculated from date of birth.
-- 2. 'room_occupancy': Displays the occupancy status of rooms and whether they are currently occupied.

CREATE VIEW patient_details AS
SELECT p.patientID, p.name AS patient_name, p.dateOfBirth, p.gender, p.contactInformation AS contact_info, p.address,
       TIMESTAMPDIFF(YEAR, p.dateOfBirth, CURDATE()) AS age,
       CONCAT(DAY(p.dateOfBirth), '/', MONTH(p.dateOfBirth), '/', YEAR(p.dateOfBirth)) AS dob_formatted
FROM patient p;

CREATE VIEW room_occupancy AS
SELECT roomID, occupancyStatus, admissionDate, dischargeDate, 
       IF(occupancyStatus = 'Occupied', 'Yes', 'No') AS is_occupied
FROM room;

-- Stored Procedures
-- This section creates two stored procedures:
-- 1. 'update_patient_info': Updates the address and contact information of a patient based on their ID.
-- 2. 'add_new_patient': Adds a new patient record to the database.

DELIMITER //
CREATE PROCEDURE update_patient_info(IN patient_id INT, IN new_address VARCHAR(100), IN new_contact_info VARCHAR(100))
BEGIN
    UPDATE patient SET address = new_address, contactInformation = new_contact_info WHERE patientID = patient_id;
END //

CREATE PROCEDURE add_new_patient(IN patient_name VARCHAR(100), IN dob DATE, IN gender VARCHAR(10), 
                                  IN contact_info VARCHAR(100), IN payment_method VARCHAR(45), IN address VARCHAR(100))
                                  
                                  
BEGIN
    INSERT INTO patient (name, dateOfBirth, gender, contactInformation, paymentMethod, address, dateStarted)
    VALUES (patient_name, dob, gender, contact_info, payment_method, address, CURDATE());
END //
DELIMITER ;

-- Triggers
-- This section creates two triggers:

-- 1. password_changed_trigger: updates password_last_changed column to current timestamp when a user changes their password
-- 2. insert_trigger: updates date_added column to current timestamp when a new record is inserted

-- First, clreate the two columns in the logindetails table
ALTER TABLE logindetails
ADD COLUMN password_last_changed TIMESTAMP,
ADD COLUMN date_added TIMESTAMP;

Create a trigger to update password_last_changed when a user changes their password
DELIMITER //
CREATE TRIGGER password_changed_trigger BEFORE UPDATE ON logindetails
FOR EACH ROW
BEGIN
    IF OLD.password != NEW.password THEN
        SET NEW.password_last_changed = CURRENT_TIMESTAMP;
    END IF;
END;
//
DELIMITER ;


-- Create a trigger to update date_added when a new record is inserted
DELIMITER //
CREATE TRIGGER insert_trigger BEFORE INSERT ON logindetails
FOR EACH ROW
BEGIN
    SET NEW.date_added = CURRENT_TIMESTAMP;
END;
//
DELIMITER ;
