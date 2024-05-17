-- Show Data
SELECT
	*
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]


-- 1. What is the total number of reservations in the dataset?

SELECT
	COUNT (*) AS TotalReservations
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]

-- total number of reservations = 700.


-- 2. Which meal plan is the most popular among guests?

SELECT
	type_of_meal_plan,
	COUNT (type_of_meal_plan) AS CountMeals
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	type_of_meal_plan
ORDER BY
	CountMeals DESC

-- most popular meal plan is "Meal Plan 1".


-- 3. What is the average price per room for reservations involving children?

SELECT
	ROUND(AVG(avg_price_per_room),2) AS ChildrenRoomsAverageprice
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
	no_of_children > 0

-- the average price per room for reservations involving children is "144.57".


-- 4. How many reservations were made for the year 20XX (replace XX with the desired year)?

SELECT
	COUNT(*) AS '2017ReservationsNum'
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
	YEAR(arrival_date) = 2018

-- reservations were made for the year 2017 are "577".


-- 5. What is the most commonly booked room type?

SELECT
	room_type_reserved,
	COUNT (room_type_reserved) AS NumOfRoomTypeReserved
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	room_type_reserved
ORDER BY
	NumOfRoomTypeReserved DESC

-- most commonly booked room type is "Room_Type 1".


-- 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)?

SELECT
	COUNT (no_of_weekend_nights) AS ReservationsFallOnWeekend
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
	no_of_weekend_nights > 0

-- reservations fall on a weekend are "383".


-- 7. What is the highest and lowest lead time for reservations?

SELECT
	Max(lead_time) AS HighestLeadTime,
	MIN(lead_time) AS LowestLeadTime
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]

-- highest lead time is "443", and lowest lead time is "0".


-- 8. What is the most common market segment type for reservations?

SELECT
	market_segment_type,
	COUNT(market_segment_type) AS MarketSegmentTypeCOUNT
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	market_segment_type
ORDER BY
	MarketSegmentTypeCOUNT DESC

-- the most common market segment type for reservations is "Online".


-- 9. How many reservations have a booking status of "Confirmed"?

SELECT
	COUNT(booking_status) AS ConfirmedBooking
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
	booking_status = 'Not_Canceled'

-- Confirmed booking Number "493".


-- 10. What is the total number of adults and children across all reservations?

SELECT
	SUM(no_of_adults) AS adults,
	SUM(no_of_children) AS children
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]

-- total number of adults is "1316", total number of children is "69".


-- 11. What is the average number of weekend nights for reservations involving children?

SELECT
	AVG(no_of_week_nights) AS AvgWeekendNights
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
	no_of_children > 0

-- average number of weekend nights for reservations is "2".


-- 12. How many reservations were made in each month of the year?

SELECT
	YEAR(arrival_date) AS Year,
	MONTH(arrival_date) AS Month,
	COUNT(*) AS TotalReservations
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	YEAR(arrival_date),
	MONTH(arrival_date)
ORDER BY
	YEAR,
	MONTH

-- Check the table.


-- 13. What is the average number of nights (both weekend and weekday) spent by guests for each room type?

SELECT
	room_type_reserved,
	AVG(no_of_weekend_nights) AS AVGWeekendnights,
	AVG(no_of_week_nights) AS AVGWeekNights
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	room_type_reserved

-- Check the table.


-- 14. For reservations involving children, what is the most common room type, and what is the average price for that room type?

SELECT
    room_type_reserved,
	COUNT(room_type_reserved) AS RoomTypeReservedCOUNT,
    ROUND(AVG(avg_price_per_room), 2) AS AVGRoomPrice
FROM
    [Hotel Reservation].[dbo].[Hotel Reservation Dataset]
WHERE
    no_of_children > 0
GROUP BY
    room_type_reserved
ORDER BY
	RoomTypeReservedCOUNT DESC

-- the most common room type ID "Room_Type 1", the average price for that room type is "123.12".


-- 15. Find the market segment type that generates the highest average price per room.

SELECT
	market_segment_type,
	ROUND(AVG(avg_price_per_room), 2) AS AVGRoomPriceFROM
FROM
	[Hotel Reservation].[dbo].[Hotel Reservation Dataset]
GROUP BY
	market_segment_type
ORDER BY
	AVGRoomPriceFROM DESC

-- market segment type that generates the highest average price per room is "112.46".
