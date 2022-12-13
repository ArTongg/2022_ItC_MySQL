-- 1. How many planets did Luke Skywalker visit in movie 2? 

SELECT COUNT(DISTINCT Planet_Name) 
    FROM TimeTable T 
    WHERE T.Character_Name = 'Luke Skywalker' AND Movie = 2;