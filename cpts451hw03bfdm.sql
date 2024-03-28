-- Question 1 finish crow's foot notation and relationship between data
create database if not exists CptS451_VetClinic_BFDM;
use CptS451_VetClinic_BFDM;
create table if not exists person (
perID varchar(100) primary key,
perLname  varchar(100),
perFname varchar(100),
perName varchar(200) as (concat(perFname, ' ', perLname)) stored,
perPhone varchar(16),
perStreet varchar(50),
perCity varchar(176),
perState varchar(2),
perZip varchar(10),
perAddress varchar(238) as (concat(perStreet, ' ', perCity, ' ', perState, ' ', perZip)) stored
);

create table if not exists Owner (
ownCharity bool
-- sponPOC connection here
);

CREATE TABLE IF NOT EXISTS Sponsor (
    sponID VARCHAR(100) PRIMARY KEY,
    sponName VARCHAR(50),
    sponWebSite VARCHAR(100),
    sponPhone VARCHAR(16)
    -- add relationship to client and donation
);

create table if not exists Donation (
donNum varchar(100),
-- work on making donNum derived from the relationship with Sponsor
donAmount float,
donDate Date
);

CREATE TABLE IF NOT EXISTS Event (
    eventID VARCHAR(100) PRIMARY KEY,
    eventLocation VARCHAR(30),
    eventDate DATE,
    eventTime TIMESTAMP,
    eventDuration INTEGER(11)
);
create table if not exists VendorType (
vtID varchar(100) primary key,
vtCategory varchar(20)
-- add relationship to vendHasType
);
create table if not exists Vendor (
vendID varchar(100) primary key,
vendBizOwner varchar(100),
vendBizName varchar(100),
vendPhone varchar(16),
vendStreet varchar(50),
vendCity varchar(30),
vendState varchar(2),
vendZip varchar(10),
vendAddress varchar(102) as (concat(vendStreet, ' ', vendCity, ' ', vendState, ' ', vendZip)) stored);
-- finish up relationship between Vendor and Event


-- Question 2 finish crow's foot notation and relationship between data
create database if not exists CptS451_RepairShop_BFDM;
use CptS451_RepairShop_BFDM;
CREATE TABLE IF NOT EXISTS Vehicle (
    vehLicNum VARCHAR(8) PRIMARY KEY,
    vehMake VARCHAR(50),
    vehModel VARCHAR(50),
    vehYear VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Boats (
    CabinType VARCHAR(50),
    NumEng INT,
    Displacement INT
);
CREATE TABLE IF NOT EXISTS Trucks (
    AxleNum INT,
    LoadCap FLOAT
);
CREATE TABLE IF NOT EXISTS Motorcycles (
    NumWheels INT,
    EngType VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS Automobiles (
    EngCyl INT,
    FuelType VARCHAR(10)
);

CREATE TABLE IF NOT EXISTS RepairTask (
    rtID VARCHAR(100) PRIMARY KEY,
    rtTitleDes VARCHAR(255),
    rtRepairProc VARCHAR(255)
);




-- Question 3 finish crow's foot notation and relationship between data
create database if not exists CptS451_CellPhone_BFDM;
use CptS451_CellPhone_BFDM;
create table if not exists Contact(
ctcID varchar(100) primary key,
ctcFirstName varchar(100),
ctcLastName varchar(100),
ctcName varchar(200) as (concat(ctcFirstName, ' ', ctcLastName)) stored,
ctcPhonePrime varchar(15) not null,
ctcPhoneAlt varchar(15),
ctcPhone varchar(30) generated always as (concat(ctcPhonePrime, ' ', ctcPhoneAlt),
constraint ctcPhoneCheck check (ctcPhonePrime is not null),
ctcEmail varchar(100),
ctcBirthDate date,
ctcAdStreet varchar(30),
ctcAdCity varchar(30),
ctcAdState varchar(2),
ctcAdZip varchar(10),
ctcAddress varchar(72) as (concat(ctcAdStreet, ' ', ctcAdCity, ' ', ctcAdState, ' ', ctcAdZip)) stored

);

-- Question 4 finish crow's foot notation and relationship between data
create database if not exists CptS451_Vidiians_BFDM;

use CptS451_Vidiians_BFDM;

CREATE TABLE IF NOT EXISTS DinklarFeature (
    dfID VARCHAR(100) PRIMARY KEY,
    dfDesc VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS HoofCovering (
    hcID VARCHAR(100) PRIMARY KEY,
    hcSize int,
    hcSize FLOAT,
    hcALRV FLOAT,
    hcKleptarRatio FLOAT
);
CREATE TABLE IF NOT EXISTS Blungil (
    bgID VARCHAR(100) PRIMARY KEY,
    bglYCnum INT,
    bglTAnum INT,
    bglIngTemp FLOAT,
    bglLKlocation VARCHAR(100),
    bglSobriquet VARCHAR(100)
);


-- Question 5, finish  crow's foot notation and relationship between data 
CREATE DATABASE IF NOT EXISTS CptS451_ABA_SciPapers_BFDM;

USE CptS451_ABA_SciPapers_BFDM;
CREATE TABLE IF NOT EXISTS Author (
    authID VARCHAR(100) PRIMARY KEY,
    authEmail VARCHAR(100),
    authFname varchar(70),
    authLname varchar(70),
    authHonorific varchar(10),
    authName varchar(150) as (concat(authHonorific, ' ', authFname, ' ', authLname)) stored,
    authDegType varchar(20),
    authDegreeTitle varchar(50),
    authDegreeDate date,
    authDegree varchar(100) as (concat(authDegType, ' ',authDegreeTitle, ' ', authDegreeDate)) stored
);

CREATE TABLE IF NOT EXISTS ScientificPaper (
    spID VARCHAR(100) PRIMARY KEY,
    spTitle varchar(100),
    spArticleTitle varchar(100),
    spPubDate varchar(50),
    spPubVolNum varchar(50),
    spPages int generated always as (spEndPageNum - spStartPageNum + 1) stored
);

CREATE TABLE IF NOT EXISTS Publisher (
pubID varchar(100) primary key,
pubLocation varchar(150),
pubTitle varchar(100)
);