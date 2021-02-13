CREATE TABLE public."Actors" 
(actors text,
 cast_id int,
 character varchar(100),
 credit_id varchar(100),
 gender int,
 id int,
 name varchar(50),
 order_by int,
 profile_path varchar(100));
 
INSERT INTO public."Actors" (actors)
SELECT actors FROM public."Credits";
 
UPDATE public."Actors"
SET actors = REPLACE (actors, '[', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, ']', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, '"', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, '''', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, ':', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'cast_id', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'character', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'credit_id', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'gender', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'id', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'name', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'order', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, 'profile_path', '');

DELETE FROM public."Actors" WHERE actors = '';

INSERT INTO public."Actors"
SELECT regexp_split_to_table(actors, '}') /*three times*/
FROM public."Actors";

DELETE FROM public."Actors" WHERE actors = '';

UPDATE public."Actors"
SET actors = REPLACE (actors, ', { ', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, '{ ', '');

UPDATE public."Actors"
SET actors = REPLACE (actors, '}', '');

ALTER TABLE public."Actors"
ALTER COLUMN cast_id TYPE text USING cast_id::text,
ALTER COLUMN character TYPE text USING character::text,
ALTER COLUMN credit_id TYPE text USING credit_id::text,
ALTER COLUMN gender TYPE text USING gender::text,
ALTER COLUMN id TYPE text USING id::text,
ALTER COLUMN name TYPE text USING name::text,
ALTER COLUMN order_by TYPE text USING order_by::text,
ALTER COLUMN profile_path TYPE text USING profile_path::text;

INSERT INTO public."Actors" (cast_id, character, credit_id, gender, id, name, order_by, profile_path)
SELECT split_part(actors::TEXT, ', ', 1) AS cast_id,
split_part(actors::TEXT, ', ', 2) AS character,
split_part(actors::TEXT, ', ', 3) AS credit_id,
split_part(actors::TEXT, ', ', 4) AS gender,
split_part(actors::TEXT, ', ', 5) AS id,
split_part(actors::TEXT, ', ', 6) AS name,
split_part(actors::TEXT, ', ', 7) AS order_by,
split_part(actors::TEXT, ', ', 8) AS profile_path
FROM public."Actors"; /*Twice*/
 
ALTER TABLE public."Actors" DROP COLUMN actors RESTRICT;

DELETE FROM public."Actors" WHERE id IS NULL;

UPDATE public."Actors"
SET cast_id = REPLACE (cast_id, ' ', '');

UPDATE public."Actors"
SET credit_id = REPLACE (credit_id, ' ', '');

UPDATE public."Actors"
SET gender = REPLACE (gender, ' ', '');

UPDATE public."Actors"
SET id = REPLACE (id, ' ', '');

UPDATE public."Actors"
SET order_by = REPLACE (order_by, ' ', '');

UPDATE public."Actors"
SET profile_path = REPLACE (profile_path, ' ', '');

ALTER TABLE public."Credits" DROP COLUMN actors RESTRICT;


CREATE TABLE public."Crew" 
(crew text,
 credit_id text,
 department text,
 gender text,
 id text,
 job text,
 name text,
 profile_path text);

INSERT INTO public."Crew" (crew)
SELECT crew FROM public."Credits";

UPDATE public."Crew"
SET crew = REPLACE (actors, '[', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, ']', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, '"', '');

UPDATE public."Crew"
SET crew= REPLACE (crew, '''', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, ':', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'credit_id', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'department', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'gender', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'id', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'job', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'name', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, 'profile_path', '');

DELETE FROM public."Crew" WHERE crew = '';

INSERT INTO public."Crew"
SELECT regexp_split_to_table(crew, '}') /*three times*/
FROM public."Crew";

UPDATE public."Crew"
SET crew = REPLACE (crew, ', { ', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, '{ ', '');

UPDATE public."Crew"
SET crew = REPLACE (crew, '}', '');

INSERT INTO public."Crew" (credit_id,department, gender, id, job , name, profile_path)
SELECT split_part(crew::TEXT, ', ', 1) AS credit_id,
split_part(crew::TEXT, ', ', 2) AS department,
split_part(crew::TEXT, ', ', 3) AS gender,
split_part(crew::TEXT, ', ', 4) AS id,
split_part(crew::TEXT, ', ', 5) AS job,
split_part(crew::TEXT, ', ', 6) AS name,
split_part(crew::TEXT, ', ', 7) AS profile_path
FROM public."Crew";

ALTER TABLE public."Crew" DROP COLUMN crew RESTRICT;

DELETE FROM public."Crew" WHERE id IS NULL;

UPDATE public."Crew"
SET credit_id = REPLACE (credit_id, ' ', '');

UPDATE public."Crew"
SET department = REPLACE (department, ' ', '');

UPDATE public."Crew"
SET gender = REPLACE (gender, ' ', '');

UPDATE public."Crew"
SET job = REPLACE (job, ' ', '');

UPDATE public."Crew"
SET name = REPLACE (name, ' ', '');

UPDATE public."Crew"
SET profile_path = REPLACE (profile_path, ' ', '');

ALTER TABLE public."Crew"
ALTER COLUMN credit_id TYPE varchar(50) USING credit_id::varchar(50),
ALTER COLUMN department TYPE varchar(25) USING department::varchar(25),
ALTER COLUMN gender TYPE int USING gender::int,
ALTER COLUMN id TYPE int USING id::int,
ALTER COLUMN job TYPE varchar(50) USING job::varchar(50),
ALTER COLUMN name TYPE varchar(50) USING name::varchar(50),
ALTER COLUMN profile_path TYPE varchar(100) USING profile_path::varchar(100);

ALTER TABLE public."Credits" DROP COLUMN crew RESTRICT;