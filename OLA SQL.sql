CREATE database ola;
USE ola;
SELECT COUNT(*) FROM bookings;

#1.	Retrieve all successful bookings:
create view Successfull_Bookings AS
SELECT * FROM bookings WHERE Booking_status='Success';
SELECT * FROM Successfull_Bookings;

#2.	Find the average ride distance for each vehicle type:
create view average_ride_distance_for_each_vehicle as
SELECT Vehicle_Type, AVG(Ride_Distance)
as avg_distance FROM bookings 
GROUP BY Vehicle_Type;
SELECT * FROM average_ride_distance_for_each_vehicle;

#3.	Get the total number of cancelled rides by customers:
create view canceled_ride_by_customers as
SELECT COUNT(*) FROM bookings 
WHERE Booking_Status = 'Canceled by Customer';
SELECT * FROM canceled_ride_by_customers;

#4.	List the top 5 customers who booked the highest number of rides:
create view top5_customers as
SELECT Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings 
GROUP BY Customer_ID
ORDER BY total_rides DESC LIMIT 5;
SELECT * FROM top5_customers;

#5.	Get the number of rides cancelled by drivers due to personal and car-related issues:
create view rides_cancelled_by_drivers_pnc as
SELECT COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver ='Personal & Car related issue';
SELECT * FROM rides_cancelled_by_drivers_pnc;

#6.	Find the maximum and minimum driver ratings for Prime Sedan bookings:
create view max_min_rating_prime_sedan as
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type='Prime sedan';
SELECT * FROM max_min_rating_prime_sedan;

#7.	Retrieve all rides where payment was made using UPI: 
create view payment_method_UPI as
SELECT * FROM bookings 
WHERE Payment_Method='UPI';
SELECT * FROM payment_method_UPI;

#8.	Find the average customer rating per vehicle type:
create view avg_rating_by_vehicle_type as
SELECT Vehicle_Type, avg(Customer_Rating)
FROM bookings
GROUP BY Vehicle_Type;
 SELECT * FROM avg_rating_by_vehicle_type;
  
#9.	Calculate the total booking value of rides completed successfully:
create view booking_value_of_successful_rides as
SELECT SUM(Booking_Value) as total_successful_value
FROM bookings 
WHERE Booking_Status='Success';
SELECT * FROM booking_value_of_successful_rides;

#10.List all incomplete rides along with the reason:
create view incomplete_rides_with_reason as
SELECT Booking_ID,Incomplete_Rides_Reason
FROM bookings
WHERE Incomplete_Rides='Yes';
SELECT * FROM incomplete_rides_with_reason;