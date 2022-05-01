/* 
Analysing Data in SQL

Stakeholder question: Is revenue growing year-on-year?

*/

--------------------------------------------------------------------------------------------

--Collating hotel data for 2018, 2019 and 2020 into a single table called "Hotel"

with Hotel as (
select * from dbo.[2018]
union
select * from dbo.['2019$']
union 
select * from dbo.['2020$'])

-----------------------------------------------------------------------------------------------------

--Here we combine the total number of stays in nights  


select stays_in_week_nights + stays_in_weekend_nights as Revenue
from Hotel;
-----------------------------------------------------------------------------------------------------

/* Here we derive the total revenue generated by the hotel by mulitplying the total number
of stays by the Average Daily Rate (adr) */

select 
(stays_in_week_nights + stays_in_weekend_nights)*adr) as Revenue 
from Hotel;

-----------------------------------------------------------------------------------------------------

--We now determine the aggregate revenue generated by the business and group it by year (2018-2020)

select 
arrival_date_year as Year,
sum((stays_in_week_nights + stays_in_weekend_nights)*adr)) as Revenue
from Hotel
group by arrival_date_year;

-----------------------------------------------------------------------------------------------------

--We can also go further and determine the revenue generated grouped by year (2018-2020) and hotel type 

select 
arrival_date_year as Year,
hotel as Hotel_Type,
sum((stays_in_week_nights + stays_in_weekend_nights)*adr)) as Revenue
from Hotel
group by arrival_date_year, hotel;

-----------------------------------------------------------------------------------------------------

/* 

To analyse another stakeholder question: "Is there a need to increase the capacity for parking spaces?" 
we perform similar analysis

*/

-----------------------------------------------------------------------------------------------------

select 
sum(required_car_parking_spaces) as Parking,
arrival_date_year as Year,
hotel as Hotel_Type,
from Hotel 
group by arrival_date_year, hotel;

--However, we must note further analysis is needed to answer the above and need to perform EDA










