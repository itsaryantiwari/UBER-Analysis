Create Database UBER;
Use UBER;
RENAME TABLE `bookings - july` TO bookings;

#In this Database of UBER, we are solving the 10 problems in SQL query.

#Q1 - Retrieve all Successful Bookings
Create view Successful_Bookings as
Select * from Bookings
Where Booking_Status = 'Success';

#A1 - To Create all successful bookings
Select * From Successful_Bookings;


#Q2 Find the average ride distance for each vehicle type.
Create view average_ride_distance_for_each_vehicle_type as
Select Vehicle_Type, AVG(Ride_Distance) as
avg_distance FROM Bookings
group by Vehicle_Type;

#A2 To find the average ride distance for each vehicle type.
Select * from average_ride_distance_for_each_vehicle_type;


#Q3 Get the total number of canceled rides by customer.
Create view total_number_of_canceled_rides_by_customer as
Select COUNT(*) from bookings
Where Booking_Status = 'Canceled by Customer';

#A3 To Get the total number of canceled rides by customer.
Select * from total_number_of_canceled_rides_by_customer;


#Q4 List the top 5 customer who booked highest number of rides.
Create view top_5_customers as 
Select Customer_ID, Count(Booking_ID) as total_rides 
From bookings
group by Customer_ID
Order by total_rides Desc Limit 5;

#A4 The top 5 customer who booked highest number of rides are.
Select * from top_5_customers;


#Q5 Get the number of rides cancelled by drivers due to personal and car-related issues.
Create view rides_cancelled_by_drivers as
Select Count(*) from Bookings
Where Canceled_Rides_by_Driver = 'Personal & Car related issue';

#A5 The number of rides cancelled by drivers due to personal and car-related issues are.
Select * from rides_cancelled_by_drivers;


#Q6 Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Maximum_Minimum_Driver_Rating As 
SELECT MAX(Driver_Ratings) as max_rating, MIN(Driver_Ratings) as min_rating FROM bookings 
WHERE Vehicle_Type = 'Prime Sedan';

#A6 The maximum and minimum driver ratings for Prime Sedan bookings are:
Select * from Maximum_Minimum_Driver_Rating;


#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
Select * from Bookings
Where Payment_Method = 'UPI';

#A7 Tp retrieve the all rides where payment was made using UPI are:
Select * from UPI_Payment;


#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating 
FROM bookings 
GROUP BY Vehicle_Type;

#A8 The average customer rating per vehicle type is:
Select * from AVG_Cust_Rating;


#Q9 Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
Select Sum(Booking_Value) from Bookings as total_successful_ride_value
Where Booking_Status='Success';

#A9 The sum of total booking value of successful rides are:
Select * from total_successful_ride_value;


#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
Select Booking_ID, Incomplete_Rides, Incomplete_Rides_Reason 
from bookings 
Where Incomplete_Rides='Yes';

#A10 All incomplete rides of customer along with the reason:
Select * from Incomplete_Rides_Reason;