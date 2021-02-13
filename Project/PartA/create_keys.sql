CREATE TABLE Public."Keywords_temp" AS
SELECT DISTINCT id, keywords
FROM public."Keywords";

DROP TABLE public."Keywords";

ALTER TABLE public."Keywords_temp" RENAME TO Keywords;

ALTER TABLE public."Keywords"
ADD PRIMARY KEY (id);

ALTER TABLE public."Links"
ADD PRIMARY KEY (movieid);

CREATE TABLE Public."Movies_Metadata_temp" AS
SELECT DISTINCT adult, belongs_to_collection, budget, genres, homepage, id, imdb_id, original_language,
   original_title, overview, popularity, poster_path, production_companies, production_countries, release_date, revenue,
   runtime, spoken_languages, status, tagline, title, video, vote_average, vote_count
FROM public."Movies_Metadata";

DROP TABLE public."Movies_Metadata";

ALTER TABLE public."Movies_Metadata_temp" RENAME TO Movies_Metadata;

DELETE FROM public."Movies_Metadata" a USING public."Movies_Metadata" b
WHERE a.popularity < b.popularity AND a.id = b.id;

ALTER TABLE public."Movies_Metadata"
ADD PRIMARY KEY (id);

CREATE TABLE Public."Credits_temp" AS
SELECT DISTINCT actors, id, crew
FROM public."Credits";

DROP TABLE public."Credits";

ALTER TABLE public."Credits_temp" RENAME TO Credits;

ALTER TABLE public."Links"
ADD FOREIGN KEY (movieid) REFERENCES public."Movies_Metadata"(id);

ALTER TABLE public."Credits"
ADD FOREIGN KEY (id) REFERENCES public."Keywords"(id);