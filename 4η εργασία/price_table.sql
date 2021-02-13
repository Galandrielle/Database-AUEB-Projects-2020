CREATE TABLE public."Price" AS
SELECT id, price, weekly_price, monthly_price, security_deposit, cleaning_fee,
guests_included, extra_people, minimum_nights, maximum_nights,
minimum_minimum_nights, maximum_minimum_nights, minimum_maximum_nights,
maximum_maximum_nights, minimum_nights_avg_ntm, maximum_nights_avg_ntm
FROM public."Listings";

UPDATE public."Price"
SET price = REPLACE (price, '$', '');

UPDATE public."Price"
SET weekly_price = REPLACE (weekly_price, '$', '');

UPDATE public."Price"
SET monthly_price = REPLACE (monthly_price, '$', '');

UPDATE public."Price"
SET security_deposit = REPLACE (security_deposit, '$', '');

UPDATE public."Price"
SET cleaning_fee = REPLACE (cleaning_fee, '$', '');

UPDATE public."Price"
SET extra_people = REPLACE (extra_people, '$', '');

UPDATE public."Price"
SET price = REPLACE (price, ',', '');

UPDATE public."Price"
SET weekly_price = REPLACE (weekly_price, ',', '');

UPDATE public."Price"
SET monthly_price = REPLACE (monthly_price, ',', '');

UPDATE public."Price"
SET security_deposit = REPLACE (security_deposit, ',', '');

UPDATE public."Price"
SET cleaning_fee = REPLACE (cleaning_fee, ',', '');

UPDATE public."Price"
SET extra_people = REPLACE (extra_people, ',', '');

ALTER TABLE public."Price"
ALTER COLUMN price TYPE numeric USING price::numeric,
ALTER COLUMN weekly_price TYPE numeric USING weekly_price::numeric,
ALTER COLUMN monthly_price TYPE numeric USING monthly_price::numeric,
ALTER COLUMN security_deposit TYPE numeric USING security_deposit::numeric,
ALTER COLUMN cleaning_fee TYPE numeric USING cleaning_fee::numeric,
ALTER COLUMN extra_people TYPE numeric USING extra_people::numeric,
ALTER COLUMN minimum_nights_avg_ntm TYPE numeric USING minimum_nights_avg_ntm::numeric,
ALTER COLUMN maximum_nights_avg_ntm TYPE numeric USING maximum_nights_avg_ntm::numeric;

ALTER TABLE public."Price"
ADD FOREIGN KEY (id) REFERENCES public."Listings"(id);

ALTER TABLE public."Listings" DROP COLUMN price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN weekly_price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN monthly_price RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN security_deposit RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN cleaning_fee RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN guests_included RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN extra_people RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN minimum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN maximum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN minimum_minimum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN maximum_minimum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN minimum_maximum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN maximum_maximum_nights RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN minimum_nights_avg_ntm RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN maximum_nights_avg_ntm RESTRICT;