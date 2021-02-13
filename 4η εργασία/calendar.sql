UPDATE public."Calendar"
SET price = REPLACE (price, '$', '');

UPDATE public."Calendar"
SET adjusted_price = REPLACE (price, '$', '');

UPDATE public."Calendar"
SET price = REPLACE (price, ',', '');

UPDATE public."Calendar"
SET adjusted_price = REPLACE (price, ',', '');

ALTER TABLE public."Calendar"
ALTER COLUMN price TYPE numeric USING price::numeric,
ALTER COLUMN adjusted_price TYPE numeric USING price::numeric;