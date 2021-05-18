drop table hospital;
drop table patient;
drop table appointment;
drop table staff;
drop table doctor;
drop table department;

CREATE TABLE hospital(
	hospital_id NUMERIC(9,0) PRIMARY KEY,
	hname name(30),
    
);

CREATE TABLE patient(
	patient_id NUMERIC(9,0) PRIMARY KEY,
	pname name(30),
    pgender char(1),
    page NUMERIC(5,0),
    paddress CHAR(40),
    num_appointments NUMERIC(9,0),

);

CREATE TABLE appointment(
	appnt_id NUMERIC(9,0) PRIMARY KEY,
	timeslot NUMERIC(3,0),
    adate DATE,

);

CREATE TABLE doctor(
	doctor_id NUMERIC(9,0) PRIMARY KEY,
	dname char(30),
    speciality CHAR(25),

);

CREATE TABLE staff(
    stuff_id NUMERIC(9,0) PRIMARY KEY,
    sname char(30),

);

--relationship between appointment and doctor many to many
CREATE TABLE has(
    appnt_id NUMERIC(9,0),
    doctor_id NUMERIC(3,0),
    PRIMARY KEY(appnt_id, doctor_id),
    FOREIGN KEY (appnt_id) REFERENCES appointment(appnt_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);
