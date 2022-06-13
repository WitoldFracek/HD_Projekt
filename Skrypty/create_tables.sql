
-- DimTime
CREATE TABLE [dbo].[DimTime](
	TimeID INT IDENTITY(1, 1) PRIMARY KEY,
	[Time] TIME UNIQUE
);


-- DROP TABLE DimTime;

-- DimDate stworzony w MS Visual Studio ---------------------------


-- DimVictim
CREATE TABLE DimVictim(
	VictimID INT IDENTITY(1, 1) PRIMARY KEY,
	Age INT NULL,
	Sex NCHAR(1) NULL,
	Descent NVARCHAR(40) NULL,
	DescentSymbol NCHAR(1) NULL,
	CONSTRAINT all_u_v UNIQUE(Age, Sex, Descent, DescentSymbol),
	CONSTRAINT age_betw CHECK(Age BETWEEN 1 AND 120),
	CONSTRAINT sex_in CHECK(Sex IN ('M', 'F'))
);

-- DimWeapon
CREATE TABLE DimWeapon(
	WeaponID INT IDENTITY(1, 1) PRIMARY KEY,
	[Description] NVARCHAR(100) UNIQUE NULL,
);

-- DimCase
CREATE TABLE DimCase(
	CaseID INT IDENTITY(1, 1) PRIMARY KEY,
	CaseStatus NCHAR(2) NULL UNIQUE,
	StatusDescription NVARCHAR(50) NULL UNIQUE,
	CONSTRAINT all_u_c UNIQUE(CaseStatus, StatusDescription)
);

-- DimCrimeDescription
CREATE TABLE DimCrimeDescription(
	CrimeDescriptionID INT IDENTITY(1, 1) PRIMARY KEY,
	CrimeCode INT UNIQUE CHECK(CrimeCode >= 0),
	CrimeDescription NVARCHAR(100) NULL UNIQUE
);

-- DimCoegzistingCrime
CREATE TABLE DimCoegzistingCrime(
	CoegzistingCrimeID INT IDENTITY(1, 1) PRIMARY KEY,
	CrimeCode1 INT REFERENCES DimCrimeDescription(CrimeDescriptionID) NULL,
	CrimeCode2 INT REFERENCES DimCrimeDescription(CrimeDescriptionID) NULL,
	CrimeCode3 INT REFERENCES DimCrimeDescription(CrimeDescriptionID) NULL,
	CrimeCode4 INT REFERENCES DimCrimeDescription(CrimeDescriptionID) NULL,
	CONSTRAINT all_u_cc UNIQUE(CrimeCode1, CrimeCode2, CrimeCode3, CrimeCode4)
);

-- DimLocation
CREATE TABLE DimLocation(
	LocationID INT IDENTITY(1, 1) PRIMARY KEY,
	AreaCode INT,
	AreaName NVARCHAR(20),
	SubareaCode INT NULL,
	Latitude REAL NULL,
	Longitude REAL NULL,
	CONSTRAINT all_u_l UNIQUE(AreaCode, AreaName, SubareaCode, Latitude, Longitude),
	CONSTRAINT lon_range CHECK(Longitude BETWEEN -120 AND -100),
	CONSTRAINT lat_range CHECK(Latitude BETWEEN 30 AND 40),
	CONSTRAINT area_code_gt CHECK(AreaCode > 0),
	CONSTRAINT subarea_code_gt CHECK(SubareaCode > 0)
);

-- DimPremis
CREATE TABLE DimPremis(
	PremisID INT IDENTITY(1, 1) PRIMARY KEY,
	[Description] NVARCHAR(100) UNIQUE
);

-- DimMetroLine
CREATE TABLE DimMetroLine(
	MetroLineID INT IDENTITY(1, 1) PRIMARY KEY,
	Line NVARCHAR(10) UNIQUE
);

-- FactCrime
CREATE TABLE FactCrime(
	OfficialFileNumber INT UNIQUE NOT NULL,
	OccurenceTimeFK INT FOREIGN KEY REFERENCES DimTime(TimeID) NOT NULL,
	OccurenceDateFK DATETIME FOREIGN KEY REFERENCES DimDate(PK_Date) NOT NULL,
	ReportedDateFK DATETIME FOREIGN KEY REFERENCES DimDate(PK_Date) NOT NULL,
	LocationFK INT FOREIGN KEY REFERENCES DimLocation(LocationID),
	PremisFK INT FOREIGN KEY REFERENCES DimPremis(PremisID),
	WeaponFK INT FOREIGN KEY REFERENCES DimWeapon(WeaponID),
	VictimFK INT FOREIGN KEY REFERENCES DimVictim(VictimID),
	CaseFK INT FOREIGN KEY REFERENCES DimCase(CaseID),
	CoegzistingCrimeFK INT FOREIGN KEY REFERENCES DimCoegzistingCrime(CoegzistingCrimeID),
	MetroLineFK INT FOREIGN KEY REFERENCES DimMetroLine(MetroLineID),
	CONSTRAINT od_le_rd_fact_crime CHECK(OccurenceDateFK <= ReportedDateFK),
	CONSTRAINT rd_le_today_fact_crime CHECK(ReportedDateFK <= GETDATE())
);

SELECT TOP 100 * FROM DimDate;
SELECT * FROM FactCrime;

DROP TABLE IF EXISTS FactCrime;
DROP TABLE IF EXISTS DimVictim;
DROP TABLE IF EXISTS DimMetroLine;
DROP TABLE IF EXISTS DimWeapon;
DROP TABLE IF EXISTS DimCase;
DROP TABLE IF EXISTS DimCoegzistingCrime;
DROP TABLE IF EXISTS DimLocation;
DROP TABLE IF EXISTS DimPremis;
DROP TABLE IF EXISTS DimCrimeDescription;

DROP TABLE IF EXISTS AllowedAreas;
DROP TABLE IF EXISTS AllowedCase;
DROP TABLE IF EXISTS AllowedCrimeDescription;
DROP TABLE IF EXISTS AllowedDescent;
DROP TABLE IF EXISTS AllowedMetroLine;
DROP TABLE IF EXISTS AllowedPremis;
DROP TABLE IF EXISTS AllowedSubareaCode;
DROP TABLE IF EXISTS AllowedWeapon;

DROP TABLE TempDescent;
SELECT * FROM TempLocation;

DELETE FROM FactCrime;
DELETE FROM DimVictim;
DELETE FROM DimMetroLine;
DELETE FROM DimWeapon;
DELETE FROM DimCase;
DELETE FROM DimCoegzistingCrime;
DELETE FROM DimLocation;
DELETE FROM DimPremis;
DELETE FROM DimCrimeDescription;


DROP TABLE IF EXISTS TempAllCrime;

CREATE TABLE [TempAllCrime] (
    [OfficialFileNumber] int,
    [ReportedDate] datetime,
    [OccurenceDate] datetime,
    [AreaCode] int,
    [AreaName] nvarchar(20),
    [SubareaCode] int,
    [CrimeCode] int,
    [CrimeDescription] nvarchar(100),
    [VictimAge] int,
    [VictimSex] nvarchar(1),
    [VictimDescent] nvarchar(1),
    [PremisCode] int,
    [PremisDescription] nvarchar(100),
    [WeaponUsedCode] int,
    [WeaponDescription] nvarchar(100),
    [CaseStatus] nvarchar(2),
    [StatusDescription] nvarchar(20),
    [CrimeCode1] int,
    [CrimeCode2] int,
    [CrimeCode3] int,
    [CrimeCode4] int,
    [Location] nvarchar(50),
    [CrossStreet] nvarchar(50),
    [Latitude] real,
    [Longitude] real,
    [Hour] int,
    [Minute] int,
    [CorrectedTime] time
);

DROP TABLE IF EXISTS TempLocation;
CREATE TABLE TempLocation(
	LocationID INT,
	AreaCode INT NULL,
	AreaName NVARCHAR(20),
	SubareaCode INT NULL,
	Latitude INT NULL,
	Longitude INT NULL,
	CONSTRAINT all_u_tl UNIQUE(AreaCode, AreaName, SubareaCode, Latitude, Longitude)
);


-- Dimentions
SELECT * FROM DimPremis;
SELECT * FROM DimVictim;
SELECT * FROM DimMetroLine;
SELECT * FROM DimWeapon;
SELECT * FROM DimCase;
SELECT * FROM DimCrimeDescription ORDER BY CrimeCode;
SELECT * FROM DimLocation;
SELECT * FROM DimCoegzistingCrime;
SELECT * FROM FactCrime WHERE LocationFK IS NOT NULL;
SELECT * FROM FactCrime WHERE VictimFK IS NOT NULL;

SELECT TOP 1 * FROM DimDate;
