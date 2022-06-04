SELECT DISTINCT [Crime code 1], [Crime Description], COUNT(*)
FROM Crimes
GROUP BY [Crime Description], [Crime Code 1]
ORDER BY [Crime Description];

SELECT CAST(CAST([Occurence Time] / 100 AS VARCHAR(2)) + ':' + CAST([Occurence Time] % 100 AS varchar(2)) AS time)
FROM Crimes;