
-- Float correction for latitude
SELECT
	CASE
		WHEN Latitude IS NULL THEN 0.0
		ELSE CAST(Latitude AS FLOAT)
	END
FROM DimLocation;

-- Float correction for longitude
SELECT
	CASE
		WHEN Longitude IS NULL THEN 0.0
		ELSE CAST(Longitude AS FLOAT)
	END
FROM DimLocation;

-- age range
SELECT
	CASE
		WHEN Age BETWEEN 0 AND 11 THEN 'Poni¿ej 12'
		WHEN Age BETWEEN 12 AND 17 THEN '12 - 17'
		WHEN Age BETWEEN 18 AND 24 THEN '18 - 24'
		WHEN Age BETWEEN 25 AND 34 THEN '25 - 34'
		WHEN Age BETWEEN 35 AND 44 THEN '35 - 44'
		WHEN Age BETWEEN 45 AND 54 THEN '45 - 54'
		WHEN Age BETWEEN 55 AND 64 THEN '55 - 64'
		WHEN Age BETWEEN 65 AND 74 THEN '65 - 74'
		WHEN Age > 74 THEN '75 i starsi'
	END
FROM DimVictim;

SELECT CAST(Latitude AS float) FROM DimLocation WHERE Latitude IS NULL