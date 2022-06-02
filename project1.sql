/*
Created: 2021-09-22
Modified: 2021-10-09
Model: Movie
Database: PostgreSQL 10
*/

-- Create tables section -------------------------------------------------

-- Table Movie

CREATE TABLE "Movie"
(
  "movie_title" Character varying NOT NULL,
  "release_date" Date NOT NULL,
  "rating" Character varying NOT NULL,
  "budget" Bigint NOT NULL,
  "gross" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Movie" ADD CONSTRAINT "PK_Movie" PRIMARY KEY ("movie_title")
;

-- Table Director

CREATE TABLE "Director"
(
  "director_name" Character varying NOT NULL,
  "location_id" UUID NOT NULL,
  "University_name" Character varying,
  "birth_date" Date NOT NULL,
  "birth_location" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship6" ON "Director" ("University_name")
;

CREATE INDEX "IX_Relationship12" ON "Director" ("location_id")
;

ALTER TABLE "Director" ADD CONSTRAINT "PK_Director" PRIMARY KEY ("director_name")
;

-- Table Actors

CREATE TABLE "Actors"
(
  "actor_name" Character varying NOT NULL,
  "University_name" Character varying,
  "location_id" UUID NOT NULL,
  "birth_date" Date NOT NULL,
  "birth_location" Character varying NOT NULL,
  "eye_color" Character varying
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship5" ON "Actors" ("University_name")
;

CREATE INDEX "IX_Relationship11" ON "Actors" ("location_id")
;

ALTER TABLE "Actors" ADD CONSTRAINT "PK_Actors" PRIMARY KEY ("actor_name")
;

-- Table movie_director

CREATE TABLE "movie_director"
(
  "movie_title" Character varying NOT NULL,
  "director_name" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie_director" ADD CONSTRAINT "PK_movie_director" PRIMARY KEY ("movie_title","director_name")
;

-- Table movie_actors

CREATE TABLE "movie_actors"
(
  "movie_title" Character varying NOT NULL,
  "actor_name" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie_actors" ADD CONSTRAINT "PK_movie_actors" PRIMARY KEY ("movie_title","actor_name")
;

-- Table Location

CREATE TABLE "Location"
(
  "location_id" UUID NOT NULL,
  "city_name" Bigint NOT NULL,
  "state_name" Bigint NOT NULL,
  "country_name" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Location" ADD CONSTRAINT "PK_Location" PRIMARY KEY ("location_id")
;

-- Table educational_department

CREATE TABLE "educational_department"
(
  "University_name" Character varying NOT NULL,
  "location_id" UUID NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship1" ON "educational_department" ("location_id")
;

ALTER TABLE "educational_department" ADD CONSTRAINT "PK_educational_department" PRIMARY KEY ("University_name")
;

-- Table genre

CREATE TABLE "genre"
(
  "genre_name" Character varying NOT NULL,
  "description" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "genre" ADD CONSTRAINT "PK_genre" PRIMARY KEY ("genre_name")
;

-- Table movie_genre

CREATE TABLE "movie_genre"
(
  "movie_title" Character varying NOT NULL,
  "genre_name" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie_genre" ADD CONSTRAINT "PK_movie_genre" PRIMARY KEY ("movie_title","genre_name")
;

-- Table Cinemas

CREATE TABLE "Cinemas"
(
  "cinema_name" Character varying NOT NULL,
  "location_id" UUID NOT NULL,
  "location_name" Character varying NOT NULL,
  "type_cinema" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Cinemas" ADD CONSTRAINT "PK_Cinemas" PRIMARY KEY ("cinema_name","location_id")
;

-- Table ticket

CREATE TABLE "ticket"
(
  "movie_name" Character varying NOT NULL,
  "cinema_name" Character varying NOT NULL,
  "location_id" UUID NOT NULL,
  "price" Bigint NOT NULL,
  "time" Bigint NOT NULL,
  "duration" Bigint NOT NULL,
  "date" Date NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "ticket" ADD CONSTRAINT "PK_ticket" PRIMARY KEY ("movie_name","cinema_name","location_id")
;

-- Table cinema_movice

CREATE TABLE "cinema_movice"
(
  "cinema_name" Character varying NOT NULL,
  "movie_title" Character varying NOT NULL,
  "location_id" UUID NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "cinema_movice" ADD CONSTRAINT "PK_cinema_movice" PRIMARY KEY ("cinema_name","movie_title","location_id")
;

-- Table reward

CREATE TABLE "reward"
(
  "reward_name" Character varying NOT NULL,
  "category" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "reward" ADD CONSTRAINT "PK_reward" PRIMARY KEY ("reward_name")
;

-- Table reward_movie

CREATE TABLE "reward_movie"
(
  "reward_name" Character varying NOT NULL,
  "movie_title" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "reward_movie" ADD CONSTRAINT "PK_reward_movie" PRIMARY KEY ("reward_name","movie_title")
;

-- Table Festival

CREATE TABLE "Festival"
(
  "festival_name" Character varying NOT NULL,
  "description" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "Festival" ADD CONSTRAINT "PK_Festival" PRIMARY KEY ("festival_name")
;

-- Table festival_movie

CREATE TABLE "festival_movie"
(
  "festival_name" Character varying NOT NULL,
  "movie_title" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "festival_movie" ADD CONSTRAINT "PK_festival_movie" PRIMARY KEY ("festival_name","movie_title")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "movie_director"
  ADD CONSTRAINT "needs to be organized"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_director"
  ADD CONSTRAINT "directs"
    FOREIGN KEY ("director_name")
    REFERENCES "Director" ("director_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_actors"
  ADD CONSTRAINT "needs"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_actors"
  ADD CONSTRAINT "participate"
    FOREIGN KEY ("actor_name")
    REFERENCES "Actors" ("actor_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actors"
  ADD CONSTRAINT "graduates from"
    FOREIGN KEY ("University_name")
    REFERENCES "educational_department" ("University_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "graduates from"
    FOREIGN KEY ("University_name")
    REFERENCES "educational_department" ("University_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_genre"
  ADD CONSTRAINT "belongs"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_genre"
  ADD CONSTRAINT "goes to"
    FOREIGN KEY ("genre_name")
    REFERENCES "genre" ("genre_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "cinema_movice"
  ADD CONSTRAINT "offer watching"
    FOREIGN KEY ("cinema_name", "location_id")
    REFERENCES "Cinemas" ("cinema_name", "location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "cinema_movice"
  ADD CONSTRAINT "holds in"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "reward_movie"
  ADD CONSTRAINT "be gained"
    FOREIGN KEY ("reward_name")
    REFERENCES "reward" ("reward_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "reward_movie"
  ADD CONSTRAINT "won"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Cinemas"
  ADD CONSTRAINT "locates"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "festival_movie"
  ADD CONSTRAINT "plays"
    FOREIGN KEY ("festival_name")
    REFERENCES "Festival" ("festival_name")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "festival_movie"
  ADD CONSTRAINT "be played"
    FOREIGN KEY ("movie_title")
    REFERENCES "Movie" ("movie_title")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "ticket"
  ADD CONSTRAINT "sells"
    FOREIGN KEY ("cinema_name", "location_id")
    REFERENCES "Cinemas" ("cinema_name", "location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Actors"
  ADD CONSTRAINT "born from"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "Director"
  ADD CONSTRAINT "born from"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "educational_department"
  ADD CONSTRAINT "locates"
    FOREIGN KEY ("location_id")
    REFERENCES "Location" ("location_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

