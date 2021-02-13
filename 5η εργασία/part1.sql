CREATE TABLE Amenity(
amenity_id SERIAL PRIMARY KEY,
amenity_name varchar(100)
);

CREATE TABLE Amenity2(
amenity_id SERIAL PRIMARY KEY,
amenity_name varchar(100)
);

ALTER TABLE public."Room" ADD amenities2 varchar(1660);

UPDATE public."Room" SET amenities2 = amenities;

UPDATE public."Room"
SET amenities2 = REPLACE (amenities2, '{', '');

UPDATE public."Room"
SET amenities2 = REPLACE (amenities2, '}', '');

UPDATE public."Room"
SET amenities2 = REPLACE (amenities2, '"', '');

INSERT INTO public."Amenity2" (amenity_name)
SELECT regexp_split_to_table(amenities2, ',')
FROM public."Room";

DELETE FROM public."Amenity2" a USING public."Amenity2" b
WHERE a.amenity_id < b.amenity_id AND a.amenity_name = b.amenity_name;

INSERT INTO public."Amenity" (amenity_name)
SELECT amenity_name
FROM public."Amenity2";

DROP TABLE public."Amenity2";

/*This table will connect Room and Amenity with foreign keys.*/
CREATE TABLE public."Amenity_Room"(
amenity_id INTEGER,
id INTEGER
);

INSERT INTO public."Amenity_Room" (amenity_id)
SELECT amenity_id
FROM public."Amenity";

INSERT INTO public."Amenity_Room" (id)
SELECT id
FROM public."Room";

ALTER TABLE public."Amenity_Room" ADD CONSTRAINT
amenity_fk FOREIGN KEY (amenity_id) REFERENCES public."Amenity" (amenity_id);

/*no unique constraint matching given keys for referenced table "Room"*/
ALTER TABLE public."Amenity_Room" ADD CONSTRAINT
room_fk FOREIGN KEY (id) REFERENCES public."Room" (id);

ALTER TABLE public."Room" DROP COLUMN amenities2 RESTRICT;
ALTER TABLE public."Room" DROP COLUMN amenities RESTRICT;