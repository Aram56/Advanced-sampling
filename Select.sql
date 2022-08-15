SELECT * FROM Album
WHERE release_year_album = 2018;


SELECT name_track, duration_track FROM Track
ORDER BY duration_track DESC 
LIMIT 1;


SELECT name_track FROM Track
WHERE duration_track > 210;


SELECT name_compilation FROM Compilation
WHERE release_year_compilation BETWEEN 2018 AND 2020;


SELECT name_performer FROM Performer
WHERE name_performer NOT LIKE '% %';


SELECT name_track FROM Track
WHERE name_track LIKE '% My'
OR name_track LIKE 'My %'
OR name_track LIKE '% My %'
OR name_track LIKE '% мой'
OR name_track LIKE 'мой %'
OR name_track LIKE '% мой %';

