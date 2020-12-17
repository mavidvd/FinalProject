USE FLIGHTS;

CREATE TABLE FLIGHTS19 (
	ROUTE CHAR(7),
    MON INT,
    CARRIER CHAR(2),
    DEP CHAR(3),
    DEPST CHAR(2),
    ARR CHAR(3),
    ARRST CHAR(2),
    DELAY INT,
    FLIGHTS INT,
    DIST INT
);

# SHOW THE TOP 30 AIRPORTS IN US BY NUMBER OF NATIONAL FLIGHTS DEPARTING THROUGHOUT THE YEAR.

SELECT
	DEP AS AIRPORT,
    SUM(FLIGHTS) AS DEP_FL
FROM
	FLIGHTS19
GROUP BY 1
ORDER BY 2 DESC
LIMIT 30;

# 30 BUSIEST AIRPORTS.

SELECT
	DEP
FROM
	FLIGHTS19
GROUP BY 1
ORDER BY SUM(FLIGHTS) DESC
LIMIT 30;

# How many flights are there between each pair of cities, divided by different carriers.
SELECT Origin, OriginCityName, OriginState, Dest, DestCityName, DestState, Carrier, Floor(Avg(Distance)) as Distance, 
	FLOOR(Avg(ActualElapsedTime)) as AvgTime, FLOOR(AVG(ArrDelay)) AS AvgDelay,
	COUNT(*) as Flights
FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY 1, 2, 3, 4, 5, 6, 7
ORDER BY Flights DESC;

# How many flights does each carrier perform, what is the average distance of their flights and the average flight time.
SELECT Carrier, Floor(Avg(Distance)) as Distance, Floor(Avg(ActualElapsedTime)) as AvgTime,
	COUNT(*) as Flights
FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY 1
ORDER BY 4 DESC;

# Total amount of airports in the dataset.
SELECT DISTINCT Origin as 'DepAirport'
FROM Airline.On_Time_On_Time_Performance_2016_1;

# How many flights depart from each airport, how many destinations is each airport connected to and how many carriers provide such routes.
SELECT Origin, COUNT(*) as 'Flights', COUNT(DISTINCT Dest) as Destinations, COUNT(DISTINCT Carrier) as Carriers 
FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY Origin
ORDER BY 2 DESC
LIMIT 100;

# How many airports are there in each State. 
SELECT OriginState, COUNT(DISTINCT Origin) FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY 1
ORDER BY 2 DESC;

# How many flights perform each unique route (in any of both directions), taking all carriers.
SELECT 
	CASE WHEN Origin > Dest THEN Dest
    ELSE Origin END AS City1,
    CASE WHEN Origin < Dest THEN Dest
    ELSE Origin END AS City2,
	COUNT(*) AS 'RouteFlights'
FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY 1, 2
ORDER BY 3 DESC;

# Which routes have many carriers, and which of them is more punctual?
SELECT
	Origin, Dest, Carrier, COUNT(*) AS Flights, AVG(LateAircraftDelay) AS AvgDelay
FROM Airline.On_Time_On_Time_Performance_2016_1
GROUP BY 1, 2, 3
HAVING Flights > 50
ORDER BY 1, 2, 4 DESC;
