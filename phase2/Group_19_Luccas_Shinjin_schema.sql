drop table hospital cascade;
drop table patient cascade;
drop table appointment cascade;
drop table staff cascade;
drop table doctor cascade;
drop table department cascade;

drop table has cascade;
drop table request_maintenance cascade;
drop table schedule cascade;

CREATE TABLE hospital(
	hospital_id NUMERIC(9,0) PRIMARY KEY,
	hname char(30)    
);

CREATE TABLE patient(
	patient_id NUMERIC(9,0) PRIMARY KEY,
	pname char(30),
    pgender char(1),
    page NUMERIC(5,0),
    paddress CHAR(40),
    num_appointments NUMERIC(9,0)
);

CREATE TABLE appointment(
	appnt_id NUMERIC(9,0) PRIMARY KEY,
	timeslot NUMERIC(3,0),
    adate DATE
);

CREATE TABLE staff(
    staff_id NUMERIC(9,0) PRIMARY KEY,
    sname char(30),
	hospital_id NUMERIC(9,0),
	foreign key (hospital_id) references hospital(hospital_id) 
);

create table department (
	dept_id numeric(9,0) primary key,
	name char(20),
	part_of numeric(9,0),
	foreign key (part_of) references hospital(hospital_id)
);

CREATE TABLE doctor(
        doctor_id NUMERIC(9,0) PRIMARY KEY,
        dname char(30),
    speciality CHAR(25),
        work_dept numeric(9,0),
        foreign key (work_dept) references department(dept_id)
);


--relationship between appointment and doctor many to many
CREATE TABLE has(
    appnt_id NUMERIC(9,0),
    doctor_id NUMERIC(3,0),
    PRIMARY KEY(appnt_id, doctor_id),
    FOREIGN KEY (appnt_id) REFERENCES appointment(appnt_id),
    FOREIGN KEY (doctor_id) REFERENCES doctor(doctor_id)
);

create table request_maintenance (
	doctor_id NUMERIC(9,0),
	staff_id NUMERIC(9,0),
	patient_per_hour integer,
	dept_name char(20),
	time_slot timestamp,
	primary key (doctor_id, staff_id),
	foreign key (doctor_id) REFERENCES doctor(doctor_id),
	foreign key (staff_id) references staff(staff_id)
);

create table schedule (
	staff_id numeric(9,0),
	appnt_id numeric(9,0),
	primary key (staff_id, appnt_id),
	foreign key (staff_id) references staff(staff_id),
	foreign key (appnt_id) references appointment(appnt_id)
);
