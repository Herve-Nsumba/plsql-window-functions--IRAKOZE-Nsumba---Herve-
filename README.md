**PL/SQL-WINDOW-FUNCTIONS--IRAKOZE-Nsumba---Herve-**

**RWANDAAIR FLIGHT PERFORMANCE AND CUSTOMER INSIGHTS DURING THE UCI WORLD CYCLING CHAMPIONSHIP**

**STEP 1: Problem Definition**

**Company**: RwandaAir

**Industry**: Aviation & Tourism

During the UCI World Cycling Championship, RwandaAir anticipated a surge in international and regional passengers, including teams, fans, and media.

**Data Challenge:**
RwandaAir needed to analyze ticket sales and flight data from the event to determine revenue patterns, passenger trends, and customer spending behaviors.

**Expected Outcome:**

- Identify the most profitable routes.

- Reveal day-to-day passenger and revenue trends.

- Segment customers based on spending patterns.

- Provide insights to guide future strategy, route planning, and customer loyalty programs.

**STEP 2: Success Criteria**

1.Top 5 Flight Routes per Day – RANK() / DENSE_RANK() → Find highest-revenue routes daily.

2.Cumulative Ticket Revenue – SUM() OVER → Track running revenue totals by route.

3.Day-over-Day Passenger Growth – LAG() / LEAD() → Compare demand shifts between days.

4.Customer Spending Quartiles – NTILE(4) → Segment passengers into spend groups.

5.3-Day Moving Average Revenue – AVG() OVER → Smooth daily fluctuations for clearer trends.

**STEP 3: Database Schema**

**Tables & Keys:**
Routes: route_id, origin, destination

Flights: flight_id, route_id, flight_date, passenger_count, revenue, FOREIGN KEY(route_id)

Customers: customer_id, name, total_spent

Tickets: ticket_id, customer_id, flight_id, ticket_price, FOREIGN KEY(customer_id), FOREIGN KEY(flight_id)

Screenshots in the screenshot folder

**Entity-Relationship:**
Its screenshot is shown in the /screenshot/ folder

- Routes define origin–destination pairs.

- Flights are scheduled journeys linked to routes.

- Customers may purchase multiple Tickets.

- Tickets link passengers to flights with purchase details.

**STEP 4: Window Function Implementation**

All the screenshot are in the /screenshot/ folder

- Ranking – Identify top-spending passengers.

- Aggregate – Track cumulative bookings and revenue trends.

- Navigation – Measure month-to-month revenue growth.

- Distribution – Segment customers by total spending.

**STEP 5: Results Analysis**

**Descriptive** – What happened?

1. High spenders were frequent flyers and business travelers.
2. Bookings rose during seasonal peaks and the UCI event.
3. Outliers included bulk or last-minute group bookings.

**Diagnostic** – Why?

1. Loyalty programs and corporate travel drove repeat spending.
2. Tourism cycles and international events shaped booking trends.
3. Outliers linked to irregular booking patterns.

**Prescriptive** – What next?

1. Enhance loyalty incentives for top customers.
2. Adjust pricing and capacity to seasonal demand.
3. Monitor unusual booking spikes for proactive planning.

**STEP 6: References**

1. Mode Analytics – SQL Window Functions Tutorial: https://mode.com/sql-tutorial/sql-window-functions

2. GeeksforGeeks – Window Functions in SQL: https://www.geeksforgeeks.org/sql/window-functions-in-sql/

3. SQLTutorial.org – SQL Window Functions: https://www.sqltutorial.org/sql-window-functions/

4. DataCamp – SQL Window Functions Cheat Sheet: https://www.datacamp.com/cheat-sheet/sql-window-functions-cheat-sheet

5. FreeCodeCamp – How to Use Window Functions in SQL: https://www.freecodecamp.org/news/window-functions-in-sql/

6. Oracle Help Center – Window Function Concepts and Syntax: https://docs.oracle.com/mysql-8.0-en/window-functions.html

7. W3Schools – SQL Window Functions: https://www.w3schools.com/sql/sql_window.asp

8. Mullins, C. Database Administration & SQL Analytics. Academic Press, 2021.

9. GeeksforGeeks – Window Functions in PL/SQL: https://www.geeksforgeeks.org/plsql/window-functions

10. Oracle APEX Documentation – SQL Workshop: https://docs.oracle.com/en/database/oracle/apex/

**Disclaimer:**
All sources were properly cited. Implementations and analysis represent original work. No AI-generated content was copied without attribution or adaptation.
