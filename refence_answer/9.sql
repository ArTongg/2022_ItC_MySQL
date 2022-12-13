-- 9. For each race, find the character that travels the most (number of time slots) in each movie. (movie, race, character_name

SELECT SP.Race, SP.Movie, SP.Character_Name
    FROM (
        SELECT C.Race, T.Movie, T.Character_Name, SUM(T.Time_of_Departure - T.Time_of_Arrival) AS Spent_Time
        FROM TimeTable T
            INNER JOIN Characters C
            ON T.Character_Name = C.Name
        GROUP BY C.Race, T.Movie, T.Character_Name
    ) SP
    INNER JOIN (
        SELECT Tmp.Race, Tmp.Movie, Max(Tmp.Spent_Time) AS Max_Spent_Time
        FROM (
            SELECT Race, Movie, Character_Name, SUM(Time_of_Departure - Time_of_Arrival) AS Spent_Time
            FROM TimeTable
                INNER JOIN Characters C
                ON Character_Name = Name
            GROUP BY Race, Movie, Character_Name
        ) Tmp
            INNER JOIN Characters C
        ON Character_Name = C.Name
        GROUP BY Tmp.Race, Tmp.Movie
    ) MSP
    ON SP.Race = MSP.Race AND SP.Movie = MSP.Movie AND SP.Spent_Time = MSP.Max_Spent_Time
    ORDER BY SP.Race, SP.Movie;