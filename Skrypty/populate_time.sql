
DECLARE
	@TimeKey int,
	@Hour int,
	@Minute int,
	@Temp time,
	@Date datetime

SET @TimeKey = 0
SET @Hour = 0
SET @Minute = 0

WHILE @TimeKey < (60 * 24)
BEGIN
	SET @TimeKey = @TimeKey + 1
	SET @Date = DATEADD(MINUTE, @TimeKey, CONVERT(DATETIME, '1/1/2009'))
	SET @Hour = DATEPART(HOUR, @Date)
	SET @Minute = DATEPART(MINUTE, @Date)
	INSERT INTO DimTime VALUES(TIMEFROMPARTS(@Hour, @Minute, 0, 0, 0))
END
