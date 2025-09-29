-- Using ROW_NUMBER, RANK, DENSE_RANK, PERCENT_RANK
SELECT 
    customer_id,
    name,
    total_spent,
    ROW_NUMBER() OVER (ORDER BY total_spent DESC) AS row_num,
    RANK() OVER (ORDER BY total_spent DESC) AS rank_num,
    DENSE_RANK() OVER (ORDER BY total_spent DESC) AS dense_rank_num,
    PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS percent_rank
FROM Customers;
/*Interpretation : 1. Ranking Functions
These functions assign order to customers based on revenue. ROW_NUMBER gives a unique sequence, RANK and DENSE_RANK handle ties differently, while PERCENT_RANK shows the relative position of a customer compared to others. This helps RwandaAir identify and compare its top spenders.*/


-- Running total revenue and daily average per route
SELECT 
    route_id,
    flight_date,
    revenue,
    SUM(revenue) OVER (
        PARTITION BY route_id ORDER BY flight_date
    ) AS running_total,
    AVG(revenue) OVER (
        PARTITION BY route_id ORDER BY flight_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM Flights;
/*Interpretation : 2. Aggregate Functions
SUM() calculates the running total of revenue, showing how income grows over time per route. AVG() with a frame provides a moving average that smooths out daily fluctuations. Together, they reveal both overall progress and stable performance trends.*/


-- Passenger growth vs previous day
SELECT 
    route_id,
    flight_date,
    passenger_count,
    LAG(passenger_count) OVER (
        PARTITION BY route_id ORDER BY flight_date
    ) AS prev_day,
    (passenger_count - LAG(passenger_count) OVER (
        PARTITION BY route_id ORDER BY flight_date
    )) AS change_in_passengers
FROM Flights;
/* Interpretation : 3. Navigation Functions

LAG() brings in the previous day’s value, making it easy to compare today’s passenger count to yesterday’s. Subtracting the two highlights growth or decline in demand. This allows quick detection of positive or negative trends on each route.*/


-- Segment customers into quartiles and cumulative distribution
SELECT 
    customer_id,
    name,
    total_spent,
    NTILE(4) OVER (ORDER BY total_spent DESC) AS spend_quartile,
    CUME_DIST() OVER (ORDER BY total_spent DESC) AS cumulative_dist
FROM Customers;

/* Interpretation : 4. Distribution Functions

NTILE(4) groups customers into quartiles, separating low, medium, high, and top spenders. CUME_DIST shows the proportion of customers who spent less than or equal to a given customer. This segmentation helps RwandaAir target services and promotions effectively.*/
