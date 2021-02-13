CREATE TABLE Public."Host" AS
SELECT DISTINCT host_id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count 
FROM public."Listings";

ALTER TABLE public."Host" RENAME COLUMN host_id TO id;
ALTER TABLE public."Host" RENAME COLUMN host_url TO url;
ALTER TABLE public."Host" RENAME COLUMN host_name TO name;
ALTER TABLE public."Host" RENAME COLUMN host_since TO since;
ALTER TABLE public."Host" RENAME COLUMN host_location TO location;
ALTER TABLE public."Host" RENAME COLUMN host_about TO about;
ALTER TABLE public."Host" RENAME COLUMN host_response_time TO response_time;
ALTER TABLE public."Host" RENAME COLUMN host_response_rate TO response_rate;
ALTER TABLE public."Host" RENAME COLUMN host_acceptance_rate TO acceptance_rate;
ALTER TABLE public."Host" RENAME COLUMN host_is_superhost TO is_superhost;
ALTER TABLE public."Host" RENAME COLUMN host_thumbnail_url TO thumbnail_url;
ALTER TABLE public."Host" RENAME COLUMN host_picture_url TO picture_url;
ALTER TABLE public."Host" RENAME COLUMN host_neighbourhood TO neighbourhood;
ALTER TABLE public."Host" RENAME COLUMN host_listings_count TO listings_count;
ALTER TABLE public."Host" RENAME COLUMN host_total_listings_count TO total_listings_count;
ALTER TABLE public."Host" RENAME COLUMN host_verifications TO verifications;
ALTER TABLE public."Host" RENAME COLUMN host_has_profile_pic TO has_profile_pic;
ALTER TABLE public."Host" RENAME COLUMN host_identity_verified TO identity_verified;
ALTER TABLE public."Host" RENAME COLUMN calculated_host_listings_count TO calculated_listings_count;

ALTER TABLE public."Listings" DROP COLUMN host_url RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_name RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_since RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_location RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_about RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_response_time RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_response_rate RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_acceptance_rate RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_is_superhost RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_thumbnail_url RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_picture_url RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_neighbourhood RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_listings_count RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_total_listings_count RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_verifications RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_has_profile_pic RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN host_identity_verified RESTRICT;
ALTER TABLE public."Listings" DROP COLUMN calculated_host_listings_count RESTRICT;

ALTER TABLE public."Host"
ADD PRIMARY KEY (id);

ALTER TABLE public."Listings"
ADD FOREIGN KEY (host_id) REFERENCES public."Host"(id);