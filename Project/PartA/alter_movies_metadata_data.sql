CREATE TABLE public."Collection" 
(collection text,
 id text,
 name text,
 poster_path text,
 backdrop_path text);
 
INSERT INTO public."Collection" (collection)
SELECT belongs_to_collection FROM public."Movies_Metadata";
 
UPDATE public."Collection"
SET collection = REPLACE (collection, '[', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, ']', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, '"', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, '''', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, ':', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, 'id', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, 'name', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, 'poster_path', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, 'backdrop_path', '');

DELETE FROM public."Collection" WHERE collection = '';

INSERT INTO public."Collection"
SELECT regexp_split_to_table(collection, '}')
FROM public."Collection";

DELETE FROM public."Collection" WHERE collection = '';

DELETE FROM public."Collection" WHERE collection IS NULL;

UPDATE public."Collection"
SET collection = REPLACE (collection, ', { ', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, '{ ', '');

UPDATE public."Collection"
SET collection = REPLACE (collection, '}', '');

INSERT INTO public."Collection" (id, name, poster_path, backdrop_path)
SELECT split_part(collection::TEXT, ', ', 1) AS id,
split_part(collection::TEXT, ', ', 2) AS name,
split_part(collection::TEXT, ', ', 3) AS poster_path,
split_part(collection::TEXT, ', ', 4) AS backdrop_path
FROM public."Collection"; /*Twice*/
 
ALTER TABLE public."Collection" DROP COLUMN collection RESTRICT;

DELETE FROM public."Collection" WHERE id IS NULL;

UPDATE public."Collection"
SET id = REPLACE (id, ' ', '');

UPDATE public."Collection"
SET poster_path = REPLACE (poster_path, ' ', '');

UPDATE public."Collection"
SET backdrop_path = REPLACE (backdrop_path, ' ', '');

ALTER TABLE public."Collection"
ALTER COLUMN id TYPE int USING id::int,
ALTER COLUMN name TYPE varchar(50) USING name::varchar(50),
ALTER COLUMN poster_path TYPE varchar(50) USING poster_path::varchar(50),
ALTER COLUMN backdrop_path TYPE varchar(50) USING backdrop_path::varchar(50);

ALTER TABLE public."Movies_Metadata" DROP COLUMN belongs_to_collection RESTRICT;


CREATE TABLE public."Genres" 
(genres text,
 id text,
 name text);

INSERT INTO public."Genres" (genres)
SELECT genres FROM public."Movies_Metadata";

UPDATE public."Genres"
SET genres = REPLACE (genres, '[', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, ']', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, '"', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, '''', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, ':', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, 'id', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, 'name', '');

DELETE FROM public."Genres" WHERE genres = '';

INSERT INTO public."Genres"
SELECT regexp_split_to_table(genres, '}')
FROM public."Genres";

DELETE FROM public."Genres" WHERE genres = '';

UPDATE public."Genres"
SET genres = REPLACE (genres, ', { ', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, '{ ', '');

UPDATE public."Genres"
SET genres = REPLACE (genres, '}', '');

INSERT INTO public."Genres" (id, name)
SELECT split_part(genres::TEXT, ', ', 1) AS id,
split_part(genres::TEXT, ', ', 2) AS name
FROM public."Genres";

ALTER TABLE public."Genres" DROP COLUMN genres RESTRICT;

DELETE FROM public."Genres" WHERE id IS NULL;

DELETE FROM public."Genres" WHERE id = '';

UPDATE public."Genres"
SET id = REPLACE (id, ' ', '');

ALTER TABLE public."Genres"
ALTER COLUMN id TYPE int USING id::int,
ALTER COLUMN name TYPE varchar(20) USING name::varchar(20);

ALTER TABLE public."Movies_Metadata" DROP COLUMN genres RESTRICT;


CREATE TABLE public."Production_Companies" 
(production_companies text,
 name text,
 id text);
 
INSERT INTO public."Production_Companies" (production_companies)
SELECT production_companies FROM public."Movies_Metadata";
 
UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, '[', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, ']', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, '"', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, '''', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, ':', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, 'id', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, 'name', '');

DELETE FROM public."Production_Companies" WHERE production_companies = '';

INSERT INTO public."Production_Companies"
SELECT regexp_split_to_table(production_companies, '}')
FROM public."Production_Companies";

DELETE FROM public."Production_Companies" WHERE production_companies = '';

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, ', { ', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, '{ ', '');

UPDATE public."Production_Companies"
SET production_companies = REPLACE (production_companies, '}', '');

INSERT INTO public."Production_Companies" (name, id)
SELECT split_part(production_companies::TEXT, ', ', 1) AS name,
split_part(production_companies::TEXT, ', ', 2) AS id
FROM public."Production_Companies";
 
ALTER TABLE public."Production_Companies" DROP COLUMN production_companies RESTRICT;

DELETE FROM public."Production_Companies" WHERE id IS NULL;

UPDATE public."Production_Companies"
SET id = REPLACE (id, ' ', '');

ALTER TABLE public."Movies_Metadata" DROP COLUMN production_companies RESTRICT;


CREATE TABLE public."Production_Countries" 
(production_countries text,
 iso_3166_1 text,
 name text);
 
INSERT INTO public."Production_Countries" (production_countries)
SELECT production_countries FROM public."Movies_Metadata";
 
UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, '[', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, ']', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, '"', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, '''', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, ':', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, 'iso_3166_1', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, 'name', '');

DELETE FROM public."Production_Countries" WHERE production_countries = '';

INSERT INTO public."Production_Countries"
SELECT regexp_split_to_table(production_countries, '}')
FROM public."Production_Countries";

DELETE FROM public."Production_Countries" WHERE production_countries = '';

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, ', { ', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, '{ ', '');

UPDATE public."Production_Countries"
SET production_countries = REPLACE (production_countries, '}', '');

INSERT INTO public."Production_Countries" (iso_3166_1, name)
SELECT split_part(production_countries::TEXT, ', ', 1) AS iso_3166_1,
split_part(production_countries::TEXT, ', ', 2) AS name
FROM public."Production_Countries";
 
ALTER TABLE public."Production_Countries" DROP COLUMN production_countries RESTRICT;

DELETE FROM public."Production_Countries" WHERE iso_3166_1 IS NULL;

UPDATE public."Production_Countries"
SET iso_3166_1 = REPLACE (iso_3166_1, ' ', '');

ALTER TABLE public."Movies_Metadata" DROP COLUMN production_countries RESTRICT;

ALTER TABLE public."Production_Countries"
ALTER COLUMN iso_3166_1 TYPE varchar(2) USING iso_3166_1::varchar(2),
ALTER COLUMN name TYPE varchar(25) USING name::varchar(25);

CREATE TABLE public."Spoken_Languages" 
(spoken_languages text,
 iso_639_1 text,
 name text);
 
INSERT INTO public."Spoken_Languages" (spoken_languages)
SELECT spoken_languages FROM public."Movies_Metadata";
 
UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, '[', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, ']', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, '"', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, '''', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, ':', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, 'iso_639_1', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, 'name', '');

DELETE FROM public."Spoken_Languages" WHERE spoken_languages = '';

INSERT INTO public."Spoken_Languages"
SELECT regexp_split_to_table(spoken_languages, '}')
FROM public."Spoken_Languages";

DELETE FROM public."Spoken_Languages" WHERE spoken_languages = '';

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, ', { ', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, '{ ', '');

UPDATE public."Spoken_Languages"
SET spoken_languages = REPLACE (spoken_languages, '}', '');

INSERT INTO public."Spoken_Languages" (iso_639_1, name)
SELECT split_part(spoken_languages::TEXT, ', ', 1) AS iso_639_1,
split_part(spoken_languages::TEXT, ', ', 2) AS name
FROM public."Spoken_Languages";
 
ALTER TABLE public."Spoken_Languages" DROP COLUMN spoken_languages RESTRICT;

DELETE FROM public."Spoken_Languages" WHERE iso_639_1 IS NULL;

UPDATE public."Spoken_Languages"
SET iso_639_1 = REPLACE (iso_639_1, ' ', '');

ALTER TABLE public."Movies_Metadata" DROP COLUMN spoken_languages RESTRICT;

ALTER TABLE public."Spoken_Languages"
ALTER COLUMN iso_639_1 TYPE varchar(2) USING iso_639_1::varchar(2),
ALTER COLUMN name TYPE varchar(25) USING name::varchar(25);