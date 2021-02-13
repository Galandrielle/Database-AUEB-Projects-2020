CREATE TABLE public."Room" AS
SELECT id, accommodates, bathrooms, bedrooms, beds, bed_type,
amenities, square_feet, price, weekly_price, monthly_price, security_deposit
FROM public."Listings";

ALTER TABLE public."Room"
ADD FOREIGN KEY (id) REFERENCES public."Listings"(id);

ALTER TABLE public."Listings" DROP COLUMN accommodates RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN bathrooms RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN bedrooms RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN beds RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN bed_type RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN amenities RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN square_feet RESTRICT;
/*ALTER TABLE public."Listings" DROP COLUMN price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN weekly_price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN monthly_price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN security_deposit RESTRICT;*/