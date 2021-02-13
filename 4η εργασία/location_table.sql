CREATE TABLE public."Location" AS
SELECT id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact
FROM public."Listings";

ALTER TABLE public."Location"
ADD FOREIGN KEY (id) REFERENCES public."Listings"(id);

ALTER TABLE public."Listings" DROP COLUMN street RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN neighbourhood RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN neighbourhood_cleansed RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN city RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN state RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN zipcode RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN market RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN smart_location RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN country_code RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN country RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN latitude RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN longitude RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN is_location_exact RESTRICT;

ALTER TABLE public."Location"
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES public."Neighbourhoods"(neighbourhood);