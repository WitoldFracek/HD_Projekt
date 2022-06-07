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

DROP TABLE IF EXISTS AllowedAreas;
CREATE TABLE AllowedAreas (
	AreaCode INT NULL,
	AreaName NVARCHAR(20)
);

DROP TABLE IF EXISTS AllowedCase;
CREATE TABLE AllowedCase (
	CaseStatus NCHAR(2),
	StatusDescription NVARCHAR(50)
);

DROP TABLE IF EXISTS AllowedCrimeDescription;
CREATE TABLE AllowedCrimeDescription(
	CrimeCode INT,
	CrimeDescription NVARCHAR(100)
);

DROP TABLE IF EXISTS AllowedDescent;
CREATE TABLE AllowedDescent(
	Descent NVARCHAR(40),
	DescentSymbol NCHAR(1)
);

DROP TABLE IF EXISTS AllowedMetroLine;
CREATE TABLE AllowedMetroLine(
	Line NVARCHAR(10)
);

DROP TABLE IF EXISTS AllowedPremis;
CREATE TABLE AllowedPremis(
	PremisDescription NVARCHAR(100)
);

DROP TABLE IF EXISTS AllowedSubareaCode;
CREATE TABLE AllowedSubareaCode(
	SubareaCode INT
);

DROP TABLE IF EXISTS AllowedWeapon;
CREATE TABLE AllowedWeapon(
	Weapon NVARCHAR(100)
);