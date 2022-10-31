--Create the Database and switch to use it
create database IF NOT EXISTS EUManagementsystem;
use EUManagementsystem;
--Create table countries;
create table IF NOT EXISTS Countries(CountryName varchar(30) NOT NULL,CountryID integer,JoinDate DATE NOT NULL,Capital varchar(30) NOT NULL,HeadOfGovernment varchar(30),GDPpercapita double NOT NULL,PRIMARY KEY(CountryName,CountryID));
--Department table creation;
create table IF NOT EXISTS Department(DepartmentNumber integer,DepartmentName varchar(30),HeadOfDepartmentID integer,Budget integer,PRIMARY KEY(DepartmentNumber));
--Staff table creation;
create table IF NOT EXISTS Staff(StaffID integer NOT NULL,Fname varchar(30),Lname varchar(30),Designation varchar(30) NOT NULL,DepartmentNumber integer NOT NULL,CountryName varchar(30) NOT NULL,Salary integer,AccessLevel integer,PRIMARY KEY(StaffID),Foreign KEY(CountryName) REFERENCES Countries(CountryName),FOREIGN KEY(DepartmentNumber) REFERENCES Department(DepartmentNumber));
--Contributions table creation;
create table IF NOT EXISTS Contributions(ContributionID integer,CountryName varchar(30),Type varchar(30),Amount integer,PRIMARY KEY(ContributionID),FOREIGN KEY(CountryName) references Countries(CountryName));
--Treaties table creation;
create table IF NOT EXISTS Treaties(TreatyNumber integer,TreatyName varchar(30) NOT NULL,DepartmentNumber integer,PRIMARY KEY(TreatyNumber),FOREIGN KEY(DepartmentNumber) REFERENCES Department(DepartmentNumber));
--TreatyMake table creation;
create table IF NOT EXISTS TreatyMake(TreatyNumber integer,CountryName varchar(30),FOREIGN KEY(TreatyNumber) references Treaties(TreatyNumber),FOREIGN KEY(CountryName) references Countries(CountryName));