
# Hospital Management System Database

## 1. **Introduction**
The Hospital Management System database was designed to manage various aspects of hospital operations, including patient management, physician management, appointments, room allocation, and billing. This documentation provides an overview of the database schema, the tables, views, functions, procedures, and triggers implemented to support efficient data management within the hospital.

## 2. **Database Schema**
The database schema, named `hospitaldb`, includes the following key components:
- Tables
- Views
- Functions
- Stored Procedures
- Triggers

## 3. **Tables**
The system comprises several tables to manage hospital operations, including patient records, physician details, appointments, room allocations, and billing information. Below is an overview of the key tables:

### 3.1 **Physician Table**
- **Table Name**: `physician`
- **Primary Key**: `physicianID`
- **Fields**:
  - `physicianID`: Unique identifier for the physician (Auto-increment).
  - `name`: Name of the physician.
  - `specialty`: Physician's area of specialty.
  - `contactInformation`: Contact details of the physician.
  - `address`: Physical address of the physician.
  - `dateStarted`: Date the physician started practicing at the hospital.

### 3.2 **Patient Table**
- **Table Name**: `patient`
- **Primary Key**: `patientID`
- **Fields**:
  - `patientID`: Unique identifier for the patient (Auto-increment).
  - `name`: Name of the patient.
  - `dateOfBirth`: Patient's date of birth.
  - `gender`: Gender of the patient.
  - `contactInformation`: Contact details of the patient.
  - `paymentMethod`: Preferred payment method.
  - `address`: Physical address of the patient.
  - `dateStarted`: Date the patient was first registered in the system.

### 3.3 **Appointment Table**
- **Table Name**: `appointment`
- **Primary Key**: `appointmentID`
- **Fields**:
  - `appointmentID`: Unique identifier for the appointment (Auto-increment).
  - `date`: Date of the appointment.
  - `time`: Time of the appointment.
  - `description`: Detailed description of the appointment.

### 3.4 **Room Table**
- **Table Name**: `room`
- **Primary Key**: `roomID`
- **Fields**:
  - `roomID`: Unique identifier for each room.
  - `roomNumber`: Number assigned to the room.
  - `occupancyStatus`: Indicates whether the room is occupied (`Occupied` or `Vacant`).
  - `admissionDate`: Date the room was occupied by a patient.
  - `dischargeDate`: Date the patient was discharged and the room became vacant.

### 3.5 **Billing Table**
- **Table Name**: `billing`
- **Primary Key**: `billingID`
- **Fields**:
  - `billingID`: Unique identifier for the billing entry.
  - `patientID`: Reference to the patient.
  - `totalAmount`: Total amount billed.
  - `billingDate`: Date of the billing.

## 4. **Views**
Views provide a simplified and aggregated way to access data. Two key views are defined in the system:

### 4.1 **Patient Details View**
- **View Name**: `patient_details`
- **Description**: Provides detailed information on patients, including their age calculated based on the date of birth.
- **Fields**:
  - `patientID`: Unique identifier for the patient.
  - `patient_name`: Patient's name.
  - `dateOfBirth`: Patient's date of birth.
  - `gender`: Patient's gender.
  - `contact_info`: Contact details.
  - `address`: Patient's address.
  - `age`: Patient's age, calculated using the `calculate_age` function.
  - `dob_formatted`: Date of birth in a formatted string.

### 4.2 **Room Occupancy View**
- **View Name**: `room_occupancy`
- **Description**: Displays the occupancy status of rooms, showing whether a room is currently occupied.
- **Fields**:
  - `roomID`: Unique identifier for the room.
  - `occupancyStatus`: Current status (`Occupied` or `Vacant`).
  - `admissionDate`: Date the room was last occupied.
  - `dischargeDate`: Date the room was vacated.
  - `is_occupied`: A computed field that indicates if the room is currently occupied (`Yes` or `No`).

## 5. **Functions**
Two user-defined functions are included to handle specific calculations.

### 5.1 **calculate_age Function**
- **Function Name**: `calculate_age`
- **Description**: Calculates a patient's age based on their date of birth.
- **Input**: `dateOfBirth` (DATE)
- **Output**: `age` (INT)

### 5.2 **calculate_total_cost Function**
- **Function Name**: `calculate_total_cost`
- **Description**: Computes the total cost for a billing record.
- **Input**: `billingID` (INT)
- **Output**: `total` (DECIMAL)

## 6. **Stored Procedures**
The system includes stored procedures for updating and adding patient information.

### 6.1 **update_patient_info Procedure**
- **Procedure Name**: `update_patient_info`
- **Description**: Updates the contact information and address for a patient based on their ID.
- **Input**: `patientID` (INT), `newAddress` (VARCHAR), `newContactInfo` (VARCHAR)

### 6.2 **add_new_patient Procedure**
- **Procedure Name**: `add_new_patient`
- **Description**: Adds a new patient record to the database.
- **Input**: `name` (VARCHAR), `dateOfBirth` (DATE), `gender` (VARCHAR), `contactInfo` (VARCHAR), `paymentMethod` (VARCHAR), `address` (VARCHAR)

## 7. **Triggers**
Triggers automate specific actions when certain events occur.

### 7.1 **insert_trigger**
- **Trigger Name**: `insert_trigger`
- **Description**: Automatically fires when a new record is inserted into a specified table (details omitted in the provided SQL).

### 7.2 **password_changed_trigger**
- **Trigger Name**: `password_changed_trigger`
- **Description**: Fires when a password change occurs, tracking the date of the change.

## 8. **Conclusion**
This Hospital Management System database facilitates the seamless management of hospital operations, from patient data handling to room management and billing processes. The use of functions, procedures, and triggers enhances automation and ensures data integrity.
