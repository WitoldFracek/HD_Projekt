SELECT * FROM DimDate;
SELECT * FROM DimTime;

DROP TABLE DimTime;

SELECT DISTINCT CaseStatus FROM TempCrimeAll;

SELECT * FROM TempCrimeAll;
DELETE TempCrimeAll;
DROP TABLE TempCrimeAll;