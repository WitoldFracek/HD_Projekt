

SELECT
	VictimDescent,
	CAST(CASE
		WHEN VictimDescent = 'A' THEN 'Other Asian'
		WHEN VictimDescent = 'B' THEN 'Black'
		WHEN VictimDescent = 'C' THEN 'Chinese'
		WHEN VictimDescent = 'D' THEN 'Cambodian'
		WHEN VictimDescent = 'F' THEN 'Filipino'
		WHEN VictimDescent = 'G' THEN 'Guamanian'
		WHEN VictimDescent = 'H' THEN 'Hispanic/Latin/Mexican'
		WHEN VictimDescent = 'I' THEN 'American Indian/Alaskan Native'
		WHEN VictimDescent = 'J' THEN 'Japanese'
		WHEN VictimDescent = 'K' THEN 'Korean'
		WHEN VictimDescent = 'L' THEN 'Laotian'
		WHEN VictimDescent = 'O' THEN 'Other'
		WHEN VictimDescent = 'P' THEN 'Pacific Islander'
		WHEN VictimDescent = 'S' THEN 'Samoan'
		WHEN VictimDescent = 'U' THEN 'Hawaiian'
		WHEN VictimDescent = 'V' THEN 'Vietnamese'
		WHEN VictimDescent = 'W' THEN 'White'
		WHEN VictimDescent = 'X' THEN 'Unknown'
		WHEN VictimDescent = 'Z' THEN 'Asian Indian'
		ELSE 'Unknown'
	END AS NVARCHAR(40)) AS DescentDescription
FROM TempAllCrime;

SELECT
	PremisDescription,
	CAST(CASE 
		WHEN CHARINDEX('MTA - BLUE LINE', UPPER(PremisDescription)) <> 0 THEN 'Blue'
		WHEN CHARINDEX('MTA - EXPO LINE', UPPER(PremisDescription)) <> 0 THEN 'Expo'
		WHEN CHARINDEX('MTA - GOLD LINE', UPPER(PremisDescription)) <> 0 THEN 'Gold'
		WHEN CHARINDEX('MTA - GREEN LINE', UPPER(PremisDescription)) <> 0 THEN 'Green'
		WHEN CHARINDEX('MTA - ORANGE LINE', UPPER(PremisDescription)) <> 0 THEN 'Orange'
		WHEN CHARINDEX('MTA - PURPLE LINE', UPPER(PremisDescription)) <> 0 THEN 'Purple'
		WHEN CHARINDEX('MTA - RED LINE', UPPER(PremisDescription)) <> 0 THEN 'Red'
		WHEN CHARINDEX('MTA - SILVER LINE', UPPER(PremisDescription)) <> 0 THEN 'Silver'
		ELSE 'No line'
	END AS NVARCHAR(10)) AS Line
FROM TempAllCrime;

SELECT
	LocationID,
	AreaName,
	AreaCode,
	SubareaCode,
	CAST(Latitude * 10000 AS INT) AS LatInt,
	CAST(Longitude * 10000 AS INT) AS LonInt
FROM DimLocation;

INSERT INTO DimLocation VALUES(1, 'a', 2, 9.33546562532, -7.34323415431);
SELECT Latitude FROM TempAllCrime;


SELECT * FROM DimVictim;
DELETE DimVictim;
INSERT INTO DimVictim VALUES(22, 'M', 'White');
INSERT INTO DimVictim VALUES(22, 'F', 'White');
INSERT INTO DimVictim VALUES(22, 'M', 'White');
INSERT INTO DimVictim VALUES(23, 'M', 'White');

DELETE FROM DimVictim WHERE Sex = 'M';

SELECT * FROM DimMetroLine;
SELECT * FROM DimPremis;
