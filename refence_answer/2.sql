-- 2. Find all characters that never visited any empire planets. 

SELECT DISTINCT C.Name 
    FROM Characters C 
    WHERE NOT EXISTS (
        SELECT * 
        FROM Planets P, TimeTable T 
        WHERE T.Planet_Name = P.Name AND P.Affiliation = 'empire' AND C.Name = T.Character_Name
    );