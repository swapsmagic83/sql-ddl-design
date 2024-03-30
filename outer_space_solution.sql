DROP DATABASE IF EXISTS outer_space_solution;

CREATE DATABASE outer_space_solution;
 
\c outer_space_solution;

CREATE TABLE planets
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
moons TEXT[]);

INSERT INTO planets(name, moons)
VALUES
('Earth',  '{"The Moon"}'), 
('Mars', '{"Phobos", "Deimos"}'),
('Venus', '{}'),
('Neptune', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
('Proxima Centauri b', '{}'),
('Gliese 876 b', '{}');

CREATE TABLE galaxy
(id SERIAL PRIMARY KEY, 
name TEXT NOT NULL);

INSERT INTO galaxy(name)
VALUES ('Milky Way');

CREATE TABLE stars
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
galaxy_id INTEGER REFERENCES galaxy
);

INSERT INTO stars (galaxy_id, name)
VALUES 
((select id from galaxy where name = 'Milky Way'), 'The Sun'), 
((select id from galaxy where name = 'Milky Way'), 'Proxima Centauri'),
((select id from galaxy where name = 'Milky Way'), 'Gliese 876');

CREATE TABLE solar_system
(id SERIAL PRIMARY KEY,
planet_id INTEGER REFERENCES planets ,
star_id INTEGER REFERENCES stars,
yrs FLOAT NOT NULL);

INSERT INTO solar_system (planet_id, star_id, yrs)
VALUES
((select id from planets where name = 'Earth'),(select id from stars where name = 'The Sun'),1), 
((select id from planets where name = 'Mars'),(select id from stars where name = 'The Sun'),1.88), 
((select id from planets where name = 'Venus'),(select id from stars where name = 'The Sun'),0.62),
((select id from planets where name = 'Neptune'),(select id from stars where name = 'The Sun'),164.8), 
((select id from planets where name = 'Proxima Centauri b'),(select id from stars where name = 'Proxima Centauri'),0.03), 
((select id from planets where name = 'Gliese 876 b'),(select id from stars where name = 'Gliese 876'),0.23);

