-- 4. Find distinct names of the planets visited by rebels-affiliated human.

SELECT DISTINCT Planet_Name 
    FROM TimeTable T, Characters C 
    WHERE C.Name = T.Character_Name AND C.Affiliation = 'rebels';