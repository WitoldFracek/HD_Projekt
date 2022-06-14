

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

SELECT
	DATEPART(YEAR, PK_Date)
FROM DimDate;

SELECT
	DATEPART(MONTH, PK_Date)
FROM DimDate;

SELECT
	DATEPART(HOUR, Time)
FROM DimTime;

SELECT * FROM DimCrimeDescription
ORDER BY CrimeDescription;

SELECT * FROM FactCrime FC
JOIN DimCoegzistingCrime CC ON FC.CaseFK = CC.CoegzistingCrimeID
JOIN DimCrimeDescription CD ON CC.CrimeCode1 = CD.CrimeDescriptionID

SELECT * FROM FactCrime FC
JOIN DimWeapon W ON FC.WeaponFK = W.WeaponID;