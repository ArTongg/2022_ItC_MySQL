-- 10. Which planet(s) has been visited by more than three different characters?

SELECT Planet_Name
    FROM TimeTable
    GROUP BY Planet_Name
    HAVING COUNT(DISTINCT Character_Name) > 3;