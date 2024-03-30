DROP DATABASE IF EXISTS air_traffic_solution;

CREATE DATABASE air_traffic_solution;

\c air_traffic_solution;

CREATE TABLE countries
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL);

INSERT INTO countries(name)
VALUES 
('United States'), ('Japan'), ('France'), ('UAE'), ('Brazil'), ('United Kingdom'), ('Mexico'), ('Morocco'), ('China'), ('Chile');

CREATE TABLE city_country
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL,
country_id INTEGER REFERENCES countries);

INSERT INTO city_country(name, country_id)
VALUES
('Washington DC', (select id from countries where name = 'United States')),
('Tokyo', (select id from countries where name = 'Japan')),
('Los Angeles',(select id from countries where name = 'United States')),
('Seattle',(select id from countries where name = 'United States')),
('Paris',(select id from countries where name = 'France')),
('Dubai',(select id from countries where name = 'UAE')),
('New York',(select id from countries where name = 'United States')),
('Cedar Rapids',(select id from countries where name = 'United States')),
('Charlotte',(select id from countries where name = 'United States')),
('Sao Paolo',(select id from countries where name = 'Brazil')),
('London',(select id from countries where name = 'United Kingdom')),
('Las Vegas',(select id from countries where name = 'United States')),
('Mexico City',(select id from countries where name = 'Mexico')),
('Casablanca',(select id from countries where name = 'Morocco')),
('Beijing',(select id from countries where name = 'China')),
('Chicago',(select id from countries where name = 'United States')),
('New Orleans',(select id from countries where name = 'United States')),
('Santiago',(select id from countries where name = 'Chile'));

CREATE TABLE airlines
(id SERIAL PRIMARY KEY,
name TEXT NOT NULL);

INSERT INTO airlines(name)
VALUES
('United'),('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

CREATE TABLE airline_info
(id SERIAL PRIMARY KEY,
airline_id INTEGER REFERENCES airlines,
seat VARCHAR(3),
departure TIMESTAMP,
arrival TIMESTAMP,
from_id INTEGER REFERENCES city_country,
to_id INTEGER REFERENCES city_country);

INSERT INTO airline_info(airline_id,seat,departure,arrival,from_id,to_id)
VALUES
((select id from airlines where name = 'United'),'33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', (select id from city_country where name ='Washington DC'), (select id from city_country where name = 'Seattle')),
((select id from airlines where name = 'British Airways'),'8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', (select id from city_country where name ='Tokyo'), (select id from city_country where name = 'London')),
((select id from airlines where name = 'Delta'),'12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', (select id from city_country where name ='Los Angeles'), (select id from city_country where name = 'Las Vegas')),
((select id from airlines where name = 'Delta'),'20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', (select id from city_country where name ='Seattle'), (select id from city_country where name = 'Mexico City')),
((select id from airlines where name = 'TUI Fly Belgium'),'23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', (select id from city_country where name ='Paris'), (select id from city_country where name = 'Casablanca')),
((select id from airlines where name = 'Air China'),'18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', (select id from city_country where name ='Dubai'), (select id from city_country where name = 'Beijing')),
((select id from airlines where name = 'United'),'9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', (select id from city_country where name ='New York'), (select id from city_country where name = 'Charlotte')),
((select id from airlines where name = 'American Airlines'),'1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', (select id from city_country where name ='Cedar Rapids'), (select id from city_country where name = 'Chicago')),
((select id from airlines where name = 'American Airlines'),'32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', (select id from city_country where name ='Charlotte'), (select id from city_country where name = 'New Orleans')),
((select id from airlines where name = 'Avianca Brasil'),'10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', (select id from city_country where name ='Sao Paolo'), (select id from city_country where name = 'Santiago'));

CREATE TABLE travelers
(id SERIAL PRIMARY KEY,
first_name TEXT NOT NULL,
last_name TEXT NOT NULL);

INSERT INTO travelers(first_name,last_name)
VALUES
('Jennifer', 'Finch'),
('Thadeus', 'Gathercoal'),
('Sonja', 'Pauley'),
('Waneta' ,'Skeleton'),
('Berkie', 'Wycliff'),
('Alvin','Leathes'),
('Cory','Squibbes');

CREATE TABLE traveling_info
(id SERIAL PRIMARY KEY,
traveler_id INTEGER REFERENCES travelers,
airline_info_id INTEGER REFERENCES airline_info
 );

INSERT INTO traveling_info(traveler_id,airline_info_id)
VALUES
((select id from travelers where first_name = 'Jennifer'), (select id from airline_info where seat = '33B')),
((select id from travelers where first_name = 'Thadeus'), (select id from airline_info where seat = '8A')),
((select id from travelers where first_name = 'Sonja'), (select id from airline_info where seat = '12F')),
((select id from travelers where first_name = 'Jennifer'), (select id from airline_info where seat = '20A')),
((select id from travelers where first_name = 'Waneta'), (select id from airline_info where seat = '23D')),
((select id from travelers where first_name = 'Thadeus'), (select id from airline_info where seat = '18C')),
((select id from travelers where first_name = 'Berkie'), (select id from airline_info where seat = '9E')),
((select id from travelers where first_name = 'Alvin'), (select id from airline_info where seat = '1A')),
((select id from travelers where first_name = 'Berkie'), (select id from airline_info where seat = '32B')),
((select id from travelers where first_name = 'Cory'), (select id from airline_info where seat = '10D'));