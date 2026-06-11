CREATE DATABASE hospital_db;
USE hospital_db;

CREATE TABLE patients (
 patient_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 age INT,
 gender VARCHAR(10),
 phone VARCHAR(15) UNIQUE
);

CREATE TABLE doctors (
 doctor_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 specialization VARCHAR(100),
 consultation_fee DECIMAL(10,2)
);

CREATE TABLE appointments (
 appointment_id INT PRIMARY KEY AUTO_INCREMENT,
 patient_id INT,
 doctor_id INT,
 appointment_date DATE,
 status VARCHAR(20),
 FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
 FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE treatments (
 treatment_id INT PRIMARY KEY AUTO_INCREMENT,
 appointment_id INT,
 description TEXT,
 cost DECIMAL(10,2),
 FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

CREATE TABLE bills (
 bill_id INT PRIMARY KEY AUTO_INCREMENT,
 patient_id INT,
 total_amount DECIMAL(10,2),
 bill_date DATE,
 FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


