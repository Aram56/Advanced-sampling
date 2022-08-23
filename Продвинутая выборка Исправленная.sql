--1. количество исполнителей в каждом жанре;

SELECT name_genre, COUNT(name_performer) FROM Genre g 
JOIN GenrePerformer s ON g.id = s.genre_id
JOIN Performer p ON s.performer_id = p.id 
GROUP BY name_genre
ORDER BY COUNT(name_performer);

--2.количество треков, вошедших в альбомы 2019-2020 годов;

SELECT COUNT(name_track) FROM TRACK t
JOIN Album a ON t.album_id = a.id
WHERE release_year_album BETWEEN 2019 AND 2020
ORDER BY Count(name_track);

--3. средняя продолжительность треков по каждому альбому;

SELECT name_album, AVG(duration_track) FROM Album a
JOIN Track t ON a.id = t.album_id
GROUP BY name_album
ORDER BY AVG(duration_track);

--4. все исполнители, которые не выпустили альбомы в 2020 году;

SELECT name_performer FROM Performer
WHERE name_performer NOT IN (SELECT DISTINCT name_performer FROM Performer p
							JOIN AlbumPerformer ap ON p.id = ap.performer_id
							JOIN Album a ON ap.album_id = a.id
							WHERE a.release_year_album = 2020);

	
--5. названия сборников, в которых присутствует конкретный исполнитель (выберите сами);

SELECT DISTINCT name_compilation FROM Compilation c
JOIN TrackCompilation tc ON c.id = tc.compilation_id 
JOIN Track t ON tc.track_id = t.id 
JOIN Album a ON t.album_id = a.id 
JOIN AlbumPerformer ap ON a.id = ap.album_id
JOIN Performer p ON ap.performer_id = p.id
WHERE name_performer = 'Король и Шут';


--6. название альбомов, в которых присутствуют исполнители более 1 жанра;

SELECT name_album FROM Album a
JOIN AlbumPerformer ap ON a.id = ap.album_id
JOIN Performer p ON ap.performer_id = p.id 
JOIN GenrePerformer gp ON p.id = gp.performer_id
JOIN Genre g ON gp.genre_id = g.id
GROUP BY name_album
HAVING COUNT(g.id) >1;

--7. наименование треков, которые не входят в сборники;

SELECT name_track FROM Track t
LEFT JOIN TrackCompilation tc ON t.id = tc.track_id
LEFT JOIN Compilation c ON tc.compilation_id = c.id 
WHERE c.id IS NULL;


--8. исполнителя(-ей), написавшего самый короткий по продолжительности трек 
--(теоретически таких треков может быть несколько);

SELECT name_performer FROM Performer p
JOIN AlbumPerformer ap ON p.id = ap.performer_id
JOIN Album a ON ap.album_id = a.id
JOIN Track t ON a.id = t.album_id
WHERE duration_track = (SELECT MIN(duration_track) FROM Track);


--9. название альбомов, содержащих наименьшее количество треков.

SELECT name_album FROM album a
JOIN track t ON a.id = t.album_id
GROUP BY name_album
HAVING COUNT(name_track) = (SELECT COUNT(name_track) c FROM album a
                   INNER JOIN track t ON a.id = t.album_id
                   GROUP BY name_album
                   ORDER BY c LIMIT 1);














