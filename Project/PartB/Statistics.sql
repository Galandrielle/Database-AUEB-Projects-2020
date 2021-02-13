/*Number of movies by year*/
SELECT COUNT(EXTRACT(YEAR FROM release_date)), EXTRACT(YEAR FROM release_date) AS release_year FROM public."Movies_Metadata"
GROUP BY release_year
ORDER BY release_year;

/*Number of movies by genre*/
SELECT COUNT(name), name FROM public."Genres"
GROUP BY name
ORDER BY name;

/*Number of movies by genre and by year*/
SELECT COUNT(*),
EXTRACT(YEAR FROM public."Movies_Metadata".release_date) AS release_year,
public."Genres".name
FROM public."Movies_Metadata"
INNER JOIN public."Genres"
ON public."Movies_Metadata".id = public."Genres".id
GROUP BY release_year, public."Genres".name
ORDER BY COUNT(*); /*Error without inner join: could not write block 777846 of temporary file: No space left on device*/

/*Average rating by movie genre*/
ALTER TABLE public."Ratings_Small"
ALTER COLUMN rating TYPE numeric USING rating::numeric;

SELECT public."Genres".name, AVG(public."Ratings_Small".rating) AS average_rating
FROM public."Ratings_Small"
INNER JOIN public."Genres"
ON public."Ratings_Small".movieid = public."Genres".id
GROUP BY public."Genres".name
ORDER BY public."Genres".name;

/*Number of ratings by user (userid)*/
SELECT COUNT(userid), userid FROM public."Ratings_Small"
GROUP BY userid
ORDER BY userid;

/*Average rating by user (userid)*/
SELECT userid, AVG(rating) AS average_rating FROM public."Ratings_Small"
GROUP BY userid
ORDER BY userid;

/*View tables creation*/
CREATE VIEW user_rating_number AS (
SELECT COUNT(userid), userid FROM public."Ratings_Small"
GROUP BY userid
ORDER BY COUNT(userid));

CREATE VIEW user_rating_average AS (
SELECT COUNT(*), userid, AVG(rating) AS average_rating FROM public."Ratings_Small"
GROUP BY userid
ORDER BY average_rating);