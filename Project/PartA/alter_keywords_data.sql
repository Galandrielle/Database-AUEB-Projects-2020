CREATE TABLE public."Keywords_Info" 
(keywords_info text,
 id text,
 name text);
 
INSERT INTO public."Keywords_Info" (keywords_info)
SELECT keywords FROM public."Keywords";
 
UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, '[', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, ']', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, '"', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, '''', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, ':', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, 'id', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, 'name', '');

DELETE FROM public."Keywords_Info" WHERE keywords_info = '';

INSERT INTO public."Keywords_Info"
SELECT regexp_split_to_table(keywords_info, '}')
FROM public."Keywords_Info";

DELETE FROM public."Keywords_Info" WHERE keywords_info = '';

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, ', { ', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, '{ ', '');

UPDATE public."Keywords_Info"
SET keywords_info = REPLACE (keywords_info, '}', '');

INSERT INTO public."Keywords_Info" (id, name)
SELECT split_part(keywords_info::TEXT, ', ', 1) AS id,
split_part(keywords_info::TEXT, ', ', 2) AS name
FROM public."Keywords_Info";
 
ALTER TABLE public."Keywords_Info" DROP COLUMN keywords_info RESTRICT;

DELETE FROM public."Keywords_Info" WHERE id IS NULL;

UPDATE public."Keywords_Info"
SET id = REPLACE (id, ' ', '');

ALTER TABLE public."Keywords_Info"
ALTER COLUMN id TYPE int USING id::int,
ALTER COLUMN name TYPE varchar(50) USING name::varchar(50);