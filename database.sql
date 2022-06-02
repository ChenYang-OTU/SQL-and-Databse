/*
Created: 10/19/2021
Modified: 10/19/2021
Model: PostgreSQL 12
Database: PostgreSQL 12
*/

-- Create tables section -------------------------------------------------

-- Table movie

CREATE TABLE "movie"
(
  "id" Bigint NOT NULL,
  "title" Character varying NOT NULL,
  "release_date" Date NOT NULL,
  "rating" Double precision NOT NULL,
  "budget" Double precision NOT NULL,
  "gross" Double precision
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie" ADD CONSTRAINT "PK_movie" PRIMARY KEY ("id")
;

-- Table genre

CREATE TABLE "genre"
(
  "id" Bigint NOT NULL,
  "name" Character varying NOT NULL,
  "description" Text NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "genre" ADD CONSTRAINT "PK_genre" PRIMARY KEY ("id")
;

-- Table actor

CREATE TABLE "actor"
(
  "id" Bigint NOT NULL,
  "home_town" Bigint NOT NULL,
  "university_id" Bigint,
  "dept_id" Bigint,
  "first_name" Character varying NOT NULL,
  "last_name" Character varying NOT NULL,
  "date_of_birth" Date NOT NULL,
  "eye_color" Character varying
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship10" ON "actor" ("home_town")
;

CREATE INDEX "IX_Relationship12" ON "actor" ("university_id","dept_id")
;

ALTER TABLE "actor" ADD CONSTRAINT "PK_actor" PRIMARY KEY ("id")
;

-- Table director

CREATE TABLE "director"
(
  "id" Bigint NOT NULL,
  "home_town" Bigint NOT NULL,
  "university_id" Bigint,
  "dept_id" Bigint,
  "first_name" Character varying NOT NULL,
  "last_name" Character varying NOT NULL,
  "birth_year" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship11" ON "director" ("home_town")
;

CREATE INDEX "IX_Relationship13" ON "director" ("university_id","dept_id")
;

ALTER TABLE "director" ADD CONSTRAINT "PK_director" PRIMARY KEY ("id")
;

-- Table movie_genres

CREATE TABLE "movie_genres"
(
  "genre_id" Bigint NOT NULL,
  "movie_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "movie_genres" ADD CONSTRAINT "PK_movie_genres" PRIMARY KEY ("genre_id","movie_id")
;

-- Table acting_jobs

CREATE TABLE "acting_jobs"
(
  "movie_id" Bigint NOT NULL,
  "actor_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "acting_jobs" ADD CONSTRAINT "PK_acting_jobs" PRIMARY KEY ("movie_id","actor_id")
;

-- Table directing_jobs

CREATE TABLE "directing_jobs"
(
  "movie_id" Bigint NOT NULL,
  "director_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "directing_jobs" ADD CONSTRAINT "PK_directing_jobs" PRIMARY KEY ("movie_id","director_id")
;

-- Table location

CREATE TABLE "location"
(
  "id" Bigint NOT NULL,
  "city" Character varying NOT NULL,
  "state" Character varying NOT NULL,
  "country" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "location" ADD CONSTRAINT "PK_location" PRIMARY KEY ("id")
;

-- Table department

CREATE TABLE "department"
(
  "dept_id" Bigint NOT NULL,
  "university_id" Bigint NOT NULL,
  "name" Character varying NOT NULL,
  "population" Bigint NOT NULL,
  "desc" Text
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "department" ADD CONSTRAINT "PK_department" PRIMARY KEY ("university_id","dept_id")
;

-- Table university

CREATE TABLE "university"
(
  "id" Bigint NOT NULL,
  "name" Character varying NOT NULL,
  "population" Bigint NOT NULL,
  "color" Character varying NOT NULL,
  "private" Boolean NOT NULL,
  "desc" Text
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "university" ADD CONSTRAINT "PK_university" PRIMARY KEY ("id")
;

-- Table festival

CREATE TABLE "festival"
(
  "id" Bigint NOT NULL,
  "name" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "festival" ADD CONSTRAINT "PK_festival" PRIMARY KEY ("id")
;

-- Table award

CREATE TABLE "award"
(
  "id" Bigint NOT NULL,
  "show" Character varying NOT NULL,
  "category" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "award" ADD CONSTRAINT "PK_award" PRIMARY KEY ("id")
;

-- Table winner

CREATE TABLE "winner"
(
  "year" Bigint NOT NULL,
  "award_id" Bigint NOT NULL,
  "movie_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "winner" ADD CONSTRAINT "PK_winner" PRIMARY KEY ("award_id","movie_id","year")
;

-- Table screening

CREATE TABLE "screening"
(
  "festival_id" Bigint NOT NULL,
  "movie_id" Bigint NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "screening" ADD CONSTRAINT "PK_screening" PRIMARY KEY ("festival_id","movie_id")
;

-- Table cinema

CREATE TABLE "cinema"
(
  "id" Bigint NOT NULL,
  "city" Bigint NOT NULL,
  "name" Character varying NOT NULL,
  "address" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

CREATE INDEX "IX_Relationship21" ON "cinema" ("city")
;

ALTER TABLE "cinema" ADD CONSTRAINT "PK_cinema" PRIMARY KEY ("id")
;

-- Table showtime

CREATE TABLE "showtime"
(
  "date" Date NOT NULL,
  "time" Time NOT NULL,
  "movie_id" Bigint NOT NULL,
  "cinema_id" Bigint NOT NULL,
  "duration" Time NOT NULL,
  "price" Double precision NOT NULL,
  "hall_type" Character varying NOT NULL
)
WITH (
  autovacuum_enabled=true)
;

ALTER TABLE "showtime" ADD CONSTRAINT "PK_showtime" PRIMARY KEY ("movie_id","cinema_id","date","time")
;

-- Create foreign keys (relationships) section -------------------------------------------------

ALTER TABLE "movie_genres"
  ADD CONSTRAINT "includes"
    FOREIGN KEY ("genre_id")
    REFERENCES "genre" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "movie_genres"
  ADD CONSTRAINT "belongs_to"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "acting_jobs"
  ADD CONSTRAINT "have"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "acting_jobs"
  ADD CONSTRAINT "acts_in"
    FOREIGN KEY ("actor_id")
    REFERENCES "actor" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "directing_jobs"
  ADD CONSTRAINT "have"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "directing_jobs"
  ADD CONSTRAINT "directs_in"
    FOREIGN KEY ("director_id")
    REFERENCES "director" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "actor"
  ADD CONSTRAINT "born_in"
    FOREIGN KEY ("home_town")
    REFERENCES "location" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "director"
  ADD CONSTRAINT "born_in"
    FOREIGN KEY ("home_town")
    REFERENCES "location" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "actor"
  ADD CONSTRAINT "attended"
    FOREIGN KEY ("university_id", "dept_id")
    REFERENCES "department" ("university_id", "dept_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "director"
  ADD CONSTRAINT "attended"
    FOREIGN KEY ("university_id", "dept_id")
    REFERENCES "department" ("university_id", "dept_id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "department"
  ADD CONSTRAINT "belongs_to"
    FOREIGN KEY ("university_id")
    REFERENCES "university" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "winner"
  ADD CONSTRAINT "won"
    FOREIGN KEY ("award_id")
    REFERENCES "award" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "winner"
  ADD CONSTRAINT "won_by"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "screening"
  ADD CONSTRAINT "screened_at"
    FOREIGN KEY ("festival_id")
    REFERENCES "festival" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "screening"
  ADD CONSTRAINT "screened"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "cinema"
  ADD CONSTRAINT "Relationship21"
    FOREIGN KEY ("city")
    REFERENCES "location" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "showtime"
  ADD CONSTRAINT "showing_at"
    FOREIGN KEY ("movie_id")
    REFERENCES "movie" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

ALTER TABLE "showtime"
  ADD CONSTRAINT "playing"
    FOREIGN KEY ("cinema_id")
    REFERENCES "cinema" ("id")
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
;

