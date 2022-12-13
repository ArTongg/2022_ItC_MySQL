-- 3. Show the characters names and the total time they spent in each planet among the movies.

SELECT Character_Name, SUM(Time_of_Departure - Time_of_arrival) AS Total_Time 
    FROM TimeTable 
    GROUP BY Character_Name;