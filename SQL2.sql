a. Select avg(2021 - Extract(year From birth_date))
   From "Actors";

b. Select Count(distinct(country_name)) from
(Select "Location".country_name, movie_actors.movie_title
 From movie_actors
Join "Actors" ON "Actors".actor_name = movie_actors.actor_name
Join "Location" ON "Location".city_name = "Actors".birth_location
) as limit1
Where
movie_title = 'Jhon Wick';

c. Select count(actor_name) From "Actors"
Where eye_color = 'Green';

d.Select count(movie_title) from movie_director
Where director_name = 'Mike Amma';

e.Select movie_title, min(budget), avg(budget), max(budget)
  From "Movie"
  Group by movie_title;

f. Select avg(rating) From "Movie"
   Where "Movie".movie_title in (Select "Director".birth_location, "Director".director_name, movie_director.director_name From "Director", movie_director Where 
   "Director".birth_location = 'Toronto' AND "Director".eye_color = 'Blue');        [it is not working since my director database doesn't have eye_color, meanwhile, rating in my database is charactervarying value with "PG-%"] 

g. Select movie_title
   From (Select movie_actors.movie_title, "Actors".birth_location
	 From movie_actors
	 Inner Join "Actors" On movie_actors.actor_name = "Actors".actor_name) as limit1
   group by movie_title
   Having count(birth_location) >= 2;

h. Select movie_title, count(reward_name) From reward_movie
   group by movie_title
   Order by count(reward_name) DESC;