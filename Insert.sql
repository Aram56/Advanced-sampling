CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name_genre VARCHAR(40) NOT NULL);
    
INSERT INTO Genre 
VALUES (1, 'ROCK'),
       (2, 'POP'),
       (3, 'RAP'),
       (4, 'JAZZ'),
       (5, 'METAL');

   
CREATE TABLE IF NOT EXISTS Performer (
    id SERIAL PRIMARY KEY,
    name_performer VARCHAR(80) NOT NULL);

INSERT INTO Performer 
VALUES (11, 'Пикник'),
       (12, 'Король и Шут'),
       (13, 'The beatles'),
       (14, 'Eminem'),
       (15, 'Мот'),
       (16, 'Louis Armstrong'),
       (17, 'Metallica'),
       (18, 'Pink');
 
      
CREATE TABLE IF NOT EXISTS GenrePerformer (
    genre_id INTEGER REFERENCES Genre(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT gp PRIMARY KEY (genre_id, performer_id));
   
INSERT INTO GenrePerformer(genre_id, performer_id) 
VALUES (1, 11),
       (1, 12),
       (2, 13),
       (2, 18),
       (3, 14),
       (3, 15),
       (4, 16),
       (5, 17);

    
CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY, 
    name_album VARCHAR(80) NOT NULL,
    release_year_album INTEGER NOT NULL);
   
INSERT INTO Album 
VALUES (21, 'В Руках Великана', 2019),
       (22, 'Трибьют', 2014),
       (23, 'Help!', 1965),
       (24, 'Music to Be Murdered By', 2020),
       (25, 'Какие Люди В Голливуде', 2018),
       (26, 'Ella and Louis again', 2003),
       (27, 'Kill Em All', 2011),
       (28, 'Hurts 2B Human', 2019),
       (29, 'Klaz', 2021),
       (30, 'I am Not Dead', 2009);   
   
    
CREATE TABLE IF NOT EXISTS AlbumPerformer (
    album_id INTEGER REFERENCES Album(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT ap PRIMARY KEY (album_id, performer_id));
   
INSERT INTO AlbumPerformer(album_id, performer_id) 
VALUES (21, 11),
       (22, 12),
       (23, 13),
       (24, 14),
       (25, 15),
       (26, 16),
       (27, 17),
       (28, 18),
       (29, 11),
       (29, 15),
       (30, 18);

    
CREATE TABLE IF NOT EXISTS Track (
    id INTEGER PRIMARY KEY, 
    name_track VARCHAR(80) NOT NULL,
    duration_track INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Album(id));
   
INSERT INTO Track 
VALUES (211, 'Сияние', 310, 21),
       (212, 'Душа самурая-меч', 254, 21),
       (221, 'Охотник', 155, 22),
       (222, 'На краю', 173, 22),
       (231, 'Free As a Bird', 265, 23),
       (232, 'Hello Goodbye', 211, 23),
       (241, 'Darkness', 337, 24),
       (242, 'Farewell', 247, 24),
       (251, 'Ча-ча лэнд', 152, 25),
       (252, 'Карты. Деньги. Две тарелки', 121, 25),
       (261, 'Makin Whoopee', 236, 26),
       (262, 'Stompin at the Savoy', 312, 26),
       (271, 'Metal Militia', 311, 27),
       (272, 'Jump In The Fire', 280, 27),
       (281, 'Circle Game', 294, 28),
       (282, 'My Attic', 182, 28),
       (291, 'Трэш', 250, 29),
       (292, 'Никогда', 240, 29),
       (301, 'Nobody Knows', 239, 28);

   
CREATE TABLE IF NOT EXISTS Compilation (
    id SERIAL PRIMARY KEY, 
    name_compilation VARCHAR(80) NOT NULL,
    release_year_compilation INTEGER NOT NULL);
   
INSERT INTO Compilation 
VALUES (31, 'Ретро хиты', 2017),
       (32, 'Классный рок', 2021),
       (33, 'Hit cool', 2022),
       (34, 'Real music', 2020),
       (35, 'Speed song', 2022),
       (36, 'A happy life', 2017),
       (37, 'Blood and ball', 2015),
       (38, 'Go to up', 2019);
      
    
CREATE TABLE IF NOT EXISTS TrackCompilation (
    track_id INTEGER REFERENCES track(id),
    compilation_id INTEGER REFERENCES Compilation(id),
    CONSTRAINT tc PRIMARY KEY (track_id, compilation_id));
    
INSERT INTO TrackCompilation (track_id, compilation_id) 
VALUES (211, 32),
       (212, 32),
       (221, 32),
       (222, 32),
       (271, 31),
       (272, 31),
       (231, 31),
       (232, 31),
       (282, 33),
       (272, 33),
       (271, 33),
       (251, 33),
       (251, 34),
       (252, 34),
       (241, 34),
       (242, 34),
       (232, 35),
       (272, 35),
       (262, 36),
       (281, 36),
       (252, 36),
       (271, 37),
       (221, 37),
       (272, 37),
       (211, 38),
       (241, 38),
       (242, 38);
       
       

      
      
--DROP TABLE GenrePerformer, 
--           Genre, 
--           Performer, 
--           Album, 
--           AlbumPerformer,
--           Track,
--           Compilation,
--           TrackCompilation;      
          
          
          
          
          
