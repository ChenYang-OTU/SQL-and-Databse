INSERT INTO "Movie" (movie_title, release_date, rating, budget, gross) VALUES
    ('The Hobbit', '2012-11-28', 'PG-13', 1335500000, 45850000),
    ('Jhon Wick', '2014-12-05', 'PG-18', 458060200, 48900000),
    ('A Star is Born', '2018-06-18', 'PG-16', 4560008, 67890000);

INSERT INTO genre VALUES ('Horror', 'very scary');
INSERT INTO genre VALUES ('Romance', 'love story');
INSERT INTO genre VALUES ('Action', 'boosting adrenaline');
INSERT INTO genre VALUES ('Drama','story twisting');
INSERT INTO genre VALUES ('Comedy','laughing at night');

INSERT INTO "Festival" (festival_name, description) VALUES
	('Cannes','France movie festival'),
	('Oscars','American movie festival'),
	('Venice','Ltalian movie festival');
	
INSERT INtO reward (reward_name, category) VALUES
	('Best director', 'director'),
	('Best story telling', 'story'),
	('Best Action Movie', 'Action');

INSERT INtO "Location" (city_name, state_name, country_name) VALUES
	('Toronto', 'Ontario', 'Canada'),
	('Vancouver', 'British Columbia', 'Canada'),
	('Ottawa', 'Ontario', 'Canada');
	
insert into educational_department ("University_name", location_id) VAlues
	('University of Toronto', (SELECT location_id From "Location" Where city_name = 'Toronto')),
	('University of Vancouver', (SELECT location_id From "Location" Where city_name = 'Vancouver')),
	('University of Ottawa', (SELECT location_id From "Location" Where city_name = 'Ottawa'));
	
insert into "Actors" (actor_name, "University_name", location_id, birth_date, birth_location, eye_color) VALUES
	('James Asmon', (SELECT "University_name" From educational_department Where "University_name"='University of Toronto'), (SELECT location_id From "Location" Where city_name = 'Toronto'), '2000-01-09', 'Toronto', 'Blue'),
	('John Jackson', (SELECT "University_name" From educational_department Where "University_name"='University of Vancouver'), (SELECT location_id From "Location" Where city_name = 'Vancouver'), '2002-11-29', 'New York', 'Green'),
	('Nova Ackon', (SELECT "University_name" From educational_department Where "University_name"='University of Ottawa'), (SELECT location_id From "Location" Where city_name = 'Ottawa'), '1997-06-05', 'Oshawa', 'Yellow');
	
Insert into "Director" (director_name, location_id, "University_name", birth_date, birth_location) VALUES
	('Mike Amma', (SELECT location_id From "Location" Where city_name = 'Toronto'), (SELECT "University_name" From educational_department Where "University_name"='University of Toronto'), '1989-05-08', 'London'),
	('Peter Elkon', (SELECT location_id From "Location" Where city_name = 'Vancouver'), (SELECT "University_name" From educational_department Where "University_name"='University of Vancouver'), '1975-05-08', 'Miami'),
	('Harry Lion', (SELECT location_id From "Location" Where city_name = 'Ottawa'), (SELECT "University_name" From educational_department Where "University_name"='University of Ottawa'), '1989-09-07', 'Paris'),
	('Nick Yang', (SELECT location_id From "Location" Where city_name = 'Toronto'), (SELECT "University_name" From educational_department Where "University_name"='University of Toronto'), '1980-09-12', 'Toronto');
Insert into "Cinemas" (cinema_name, location_id, location_name, type_cinema) Values
	('Steel City', (SELECT location_id From "Location" Where city_name = 'Toronto'), 'North York', 'Children Friendly'),
	('Osaka Taste', (SELECT location_id From "Location" Where city_name = 'Vancouver'), 'Vancouver Island', 'Japanese Vibe'),
	('Cineplex', (SELECT location_id From "Location" Where city_name = 'Ottawa'), 'Center Town', 'Horror');
	
Insert into ticket (movie_name, cinema_name, location_id, price, time, duration, date) Values
	('Dream', (SELECT cinema_name From "Cinemas" Where location_name = 'North York'), (SELECT location_id From "Location" Where city_name = 'Toronto'), 26, 1202, 90, '2021-08-25'),
	('It', (SELECT cinema_name From "Cinemas" Where location_name = 'Vancouver Island'), (SELECT location_id From "Location" Where city_name = 'Vancouver'), 25, 1420, 120, '2021-09-12'),
	('Dream', (SELECT cinema_name From "Cinemas" Where location_name = 'Center Town'), (SELECT location_id From "Location" Where city_name = 'Ottawa'), 20, 1005, 135, '2021-04-20');

Insert into cinema_movice (cinema_name, movie_title, location_id)Values
	((Select cinema_name From "Cinemas" Where cinema_name= 'Steel City'), (Select movie_title From "Movie" Where movie_title= 'The Hobbit'), (Select location_id From "Location" Where city_name= 'Toronto')),
	((Select cinema_name From "Cinemas" Where cinema_name= 'Osaka Taste'), (Select movie_title From "Movie" Where movie_title= 'Jhon Wick'), (Select location_id From "Location" Where city_name= 'Vancouver')),
	((Select cinema_name From "Cinemas" Where cinema_name= 'Cineplex'), (Select movie_title From "Movie" Where movie_title= 'A Star is Born'), (Select location_id From "Location" Where city_name= 'Ottawa'));

Insert into festival_movie (festival_name, movie_title)Values
	((Select festival_name From "Festival" Where festival_name='Cannes'),(Select movie_title From "Movie" Where movie_title = 'The Hobbit')),
	((Select festival_name From "Festival" Where festival_name='Oscars'),(Select movie_title From "Movie" Where movie_title = 'Jhon Wick')),
	((Select festival_name From "Festival" Where festival_name='Venice'),(Select movie_title From "Movie" Where movie_title = 'A Star is Born'));

Insert into movie_actors (movie_title, actor_name) Values
	((Select movie_title From "Movie" Where movie_title = 'The Hobbit'),(Select actor_name From "Actors" Where actor_name='James Asmon')),
	((Select movie_title From "Movie" Where movie_title = 'Jhon Wick'),(Select actor_name From "Actors" Where actor_name='John Jackson')),
	((Select movie_title From "Movie" Where movie_title = 'A Star is Born'),(Select actor_name From "Actors" Where actor_name='Nova Ackon'));

Insert into movie_director (movie_title, director_name) Values
	((Select movie_title From "Movie" Where movie_title = 'The Hobbit'),(Select director_name From "Director" Where director_name='Mike Amma')),
	((Select movie_title From "Movie" Where movie_title = 'Jhon Wick'),(Select director_name From "Director" Where director_name='Peter Elkon')),
	((Select movie_title From "Movie" Where movie_title = 'A Star is Born'),(Select director_name From "Director" Where director_name='Harry Lion'));

Insert into movie_genre (movie_title, genre_name) Values
	((Select movie_title From "Movie" Where movie_title = 'The Hobbit'), (Select genre_name From genre Where genre_name = 'Drama')),
	((Select movie_title From "Movie" Where movie_title = 'Jhon Wick'), (Select genre_name From genre Where genre_name = 'Action')),
	((Select movie_title From "Movie" Where movie_title = 'A Star is Born'), (Select genre_name From genre Where genre_name = 'Romance'));

Insert into reward_movie (reward_name, movie_title) values
	((Select reward_name From reward Where reward_name = 'Best director'), (Select movie_title From "Movie" Where movie_title = 'Jhon Wick')),
	((Select reward_name From reward Where reward_name = 'Best Action Movie'), (Select movie_title From "Movie" Where movie_title = 'Jhon Wick')),
	((Select reward_name From reward Where reward_name = 'Best story telling'), (Select movie_title From "Movie" Where movie_title = 'The Hobbit'));