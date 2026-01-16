/* datepart Values (syntax: interval)
year     (yyyy, yy)
month    (mm, m)
day      (dd, d)
hour     (hh)
second   (ss, s)
*/

--Current Date Offset by Month
--Syntax: DATEADD(interval, number, date)
SELECT GETDATE() AS "Current Date";
SELECT DATEADD(month, 2, GETDATE());

--Example of applying functions to entire table
--Calculate New Date from a Table
SELECT 
  user_id, 
  DATEADD(month, 1, start_date) 
  AS "Renewal Date"
FROM subscriptions;

--Difference between two dates  
--Syntax: DATEDIFF(interval, date1, date2)
SELECT DATEDIFF(hour, '2026/01/25 07:00', '2026/01/25 12:45') AS "Difference Between Dates";

--Return part of a date as a string
--Syntax:  DATENAME(interval, date)
 SELECT DATENAME(month, '2026/01/25') AS "Month"; 

--Return part of a date as an integer
--Syntax:  DATEPART(interval, date)
 SELECT DATEPART(day, '2026/01/25') AS "Day";

--Change the formatting of a date with string
--Syntax: SELECT FORMAT(date, DateFormatCode)
SELECT FORMAT(GETDATE(), 'yyyy-MM-dd') AS YYYY_MM_DD;

--Change the formatting of a date with numeric style
--Syntax: SELECT CONVERT (data_type(length)),Date, DateFormatCode)
--NOTE: Date uses varchar as the data_type
Select CONVERT(varchar,GETDATE(),1) as [MM/DD/YY];

--Convert DATE and TIME datatypes to TIMESTAMP
--Syntax: CAST(date AS TIMESTAMP)
SELECT CAST(CONCAT('2026/01/25', ' ', '12:45') AS TIMESTAMP) AS CombinedTimestamp;
--SQL Server Example (TIMESTAMP is a legacy data type)
SELECT CAST('2026/01/25' AS DATETIME2) + CAST('12:45' AS DATETIME2) AS CombinedDateTime;

--Convert TIMESTAMP to DATE and TIME
--Syntax: CAST(timestamp AS DATE/TIME/DATETIME)
SELECT CAST(CURRENT_TIMESTAMP AS DATE) AS extracted_date,
       CAST(CURRENT_TIMESTAMP AS TIME) AS extracted_time,
       CAST(CURRENT_TIMESTAMP AS DATETIME) AS date_and_time;

--Select all events that happened between specified times
SELECT * FROM event_logs
WHERE created_at >= '2025-01-15 00:00:00' AND created_at < '2025-01-16 00:00:00';
