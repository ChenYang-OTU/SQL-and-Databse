a. Select director_name From "Director"
   Where birth_location in (Select city_name From "Location" Where country_name ='Canada');

b. Select movie_title From movie_director
   Where director_name = 'Mike Amma';

c. 
  i.Select actor_name, budget *1.3 As "CAD" 
    From movie_actors, "Movie"
    Where movie_actors.movie_title = "Movie".movie_title AND ("Movie".budget>1000000);

  ii.Select actor_name, budget *113 As "JPY" 
     From movie_actors, "Movie"
     Where movie_actors.movie_title = "Movie".movie_title AND ("Movie".budget>1000000);

  iii. Select actor_name, budget *70 As "RUB" 
       From movie_actors, "Movie"
       Where movie_actors.movie_title = "Movie".movie_title AND ("Movie".budget>1000000);

  iv.  Select actor_name, budget *0.86 As "EUR" 
       From movie_actors, "Movie"
       Where movie_actors.movie_title = "Movie".movie_title AND ("Movie".budget>1000000);

   v. Select actor_name, budget *0.91 As "CHF" 
      From movie_actors, "Movie"
      Where movie_actors.movie_title = "Movie".movie_title AND ("Movie".budget>1000000);

d. Select director_name From "Director"
   Where director_name Like '%A%' OR (director_name Like '%D%');

e. Select movie_title From movie_genre Where genre_name = 'Comedy'
   Intersect
   Select movie_title From (Select movie_actors.movie_title, "Actors".birth_date From movie_actors Join "Actors" ON movie_actors.actor_name = "Actors".actor_name) as limit1
   Where 2021 - (SELECT EXTRACT(YEAR FROM birth_date) as limit2) <= 40;

f.Select a1.actor_name, a2.actor_name
  From "Actors" a1,  "Actors" a2
  Where a1.eye_color = a2.eye_color AND a1.eye_color = 'BLUE' AND a1.eye_color<a2.eye_color;