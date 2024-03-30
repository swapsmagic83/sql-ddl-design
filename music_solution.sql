DROP DATABASE IF EXISTS music_solution;

CREATE DATABASE music_solution;

\c music_solution;

CREATE TABLE artists
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL);

INSERT INTO artists(name)
VALUES
('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'),('Lady Gaga'),('Bradley Cooper'),('Nickelback'),
('Jay Z'),('Alicia Keys'),('Katy Perry'), ('Juicy J'),('Maroon 5'),('Christina Aguilera'),('Avril Lavigne'),
('Destiny`s Child');

CREATE TABLE songs
(id SERIAL PRIMARY KEY,
title TEXT NOT NULL,
duration INTEGER NOT NULL,
release_date DATE NOT NULL);

INSERT INTO songs(title,duration,release_date)
VALUES
('MMMBop',238,'1997-04-15'),
('Bohemian Rhapsody',355,'1975-10-31'),
('One Sweet Day',282,'1995-11-14'),
('Shallow',216,'2018-09-27'),
('How You Remind Me',223,'2001-08-21'),
('New York State of Mind',276,'2009-10-20'),
('Dark Horse',215,'2013-12-17'),
('Moves Like Jagger',201,'2011-06-21'),
('Complicated',244,'2002-05-14'),
('Say My Name',240,'1999-11-07');




CREATE TABLE albums
(id SERIAL PRIMARY KEY,
name VARCHAR);

INSERT INTO albums(name)
VALUES
('Middle of Nowhere'),('A Night at the Opera'),('Daydream'),('A Star Is Born'),('Silver Side Up'),
('The Blueprint 3'),('Prism'),('Hands All Over'),('Let Go'),('The Writing`s on the Wall');

CREATE TABLE producer_album
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
album_id INTEGER REFERENCES albums);

INSERT INTO producer_album(name,album_id)
VALUES
('Dust Brothers',(select id from albums where name = 'Middle of Nowhere')),
('Stephen Lironi',(select id from albums where name = 'Middle of Nowhere')),
('Roy Thomas Baker',(select id from albums where name = 'A Night at the Opera')),
('Walter Afanasieff',(select id from albums where name = 'Daydream')),
('Benjamin Rice',(select id from albums where name = 'A Star Is Born')),
('Rick Parashar',(select id from albums where name = 'Silver Side Up')),
('Al Shux',(select id from albums where name = 'The Blueprint 3')),
('Max Martin',(select id from albums where name = 'Prism')),
('Cirkut',(select id from albums where name = 'Prism')),
('Shellback',(select id from albums where name = 'Hands All Over')),
('Benny Blanco',(select id from albums where name = 'Hands All Over')),
('The Matrix',(select id from albums where name = 'Let Go')),
('Darkchild',(select id from albums where name = 'The Writing`s on the Wall'));



CREATE table song_info
(id SERIAL PRIMARY KEY,
artist_id INTEGER REFERENCES artists,
song_id INTEGER REFERENCES songs,
album_id INTEGER REFERENCES albums);

INSERT INTO song_info(artist_id,song_id,album_id)
VALUES
((select id from artists where name = 'Hanson'),(select id from songs where title = 'MMMBop'),(select id from albums where name = 'Middle of Nowhere')),
((select id from artists where name = 'Queen'),(select id from songs where title ='Bohemian Rhapsody'),(select id from albums where name = 'A Night at the Opera')),
((select id from artists where name = 'Mariah Cary'),(select id from songs where title = 'One Sweet Day'),(select id from albums where name = 'Daydream')),
((select id from artists where name = 'Boyz II Men'),(select id from songs where title = 'One Sweet Day'),(select id from albums where name = 'Daydream')),
((select id from artists where name = 'Lady Gaga'),(select id from songs where title = 'Shallow'),(select id from albums where name = 'A Star Is Born')),
((select id from artists where name = 'Bradley Cooper'),(select id from songs where title = 'Shallow'),(select id from albums where name = 'A Star Is Born')),
((select id from artists where name = 'Nickelback'),(select id from songs where title = 'How You Remind Me'),(select id from albums where name = 'Silver Side Up')),
((select id from artists where name = 'Jay Z'),(select id from songs where title = 'New York State of Mind'),(select id from albums where name = 'The Blueprint 3')),
((select id from artists where name = 'Alicia Keys'),(select id from songs where title = 'New York State of Mind'),(select id from albums where name = 'The Blueprint 3')),
((select id from artists where name = 'Katy Perry'),(select id from songs where title = 'Dark Horse'),(select id from albums where name = 'Prism')),
((select id from artists where name = 'Juicy J'),(select id from songs where title = 'Dark Horse'),(select id from albums where name = 'Prism')),
((select id from artists where name = 'Maroon 5'),(select id from songs where title = 'Moves Like Jagger'),(select id from albums where name = 'Hands All Over')),
((select id from artists where name = 'Christina Aguilera'),(select id from songs where title = 'Moves Like Jagger'),(select id from albums where name = 'Hands All Over')),
((select id from artists where name = 'Avril Lavigne'),(select id from songs where title = 'Complicated'),(select id from albums where name = 'Let Go')),
((select id from artists where name = 'Destiny`s Child'),(select id from songs where title = 'Say My Name'),(select id from albums where name = 'The Writing`s on the Wall'));



