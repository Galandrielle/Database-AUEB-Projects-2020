EXPLAIN ANALYZE
SELECT "Host".id, COUNT(*) FROM "Listing", "Host" WHERE
"Host".id = "Listing".host_id GROUP BY "Host".id;

CREATE INDEX Query_1 ON "Host"
USING btree (id ASC);


EXPLAIN ANALYZE
SELECT "Listing".id, "Price".price FROM "Listing", "Price" WHERE guests_included > 5
AND price > 40;

CREATE INDEX Query_2 ON "Price"
USING btree (price ASC);

CREATE INDEX Query_2a ON "Listing"
USING btree (id ASC);


EXPLAIN ANALYZE
SELECT 
  public."Host".id,
  public."Host".name,
  public."Host".location,
  public."Host".response_time,
  public."Host".response_rate,
  public."Host".neighbourhood
  FROM public."Host"
  FULL OUTER JOIN public."Listing"
  ON public."Host".id = public."Listing".host_id
  WHERE public."Host".response_time LIKE 'within an hour' AND public."Host".response_rate LIKE '100%';
  
CREATE INDEX Query_3 ON "Host"
USING btree (id, name ASC);
  
  
EXPLAIN ANALYZE
SELECT
 public."Price".price,
 public."Price".minimum_nights,
 public."Price".maximum_nights,
 public."Room".bathrooms,
 public."Room".bedrooms,
 public."Room".security_deposit
 FROM public."Price"
 FULL OUTER JOIN public."Room"
 ON public."Price".id = public."Room".id
  WHERE public."Room".bedrooms = '2'
  ORDER BY public."Price".price;
  
CREATE INDEX Query_4 ON "Room"
USING btree (security_deposit ASC);
  
  
EXPLAIN ANALYZE
SELECT
 public."Geolocation".geometry_coordinates_0_0_0_0,
 public."Geolocation".type,
 public."Geolocation".geometry_type,
 public."Geolocation".properties_neighbourhood,
 public."Neighbourhood".neighbourhood

 FROM public."Geolocation"
 INNER JOIN public."Neighbourhood"
 ON public."Geolocation".properties_neighbourhood = public."Neighbourhood".neighbourhood
 GROUP BY public."Geolocation".geometry_coordinates_0_0_0_0,
 public."Geolocation".type, public."Geolocation".geometry_type,
 public."Geolocation".properties_neighbourhood,
 public."Neighbourhood".neighbourhood;
 
CREATE INDEX Query_5 ON "Neighbourhood"
USING btree (neighbourhood ASC);

CREATE INDEX Query_5a ON "Geolocation"
USING btree (properties_neighbourhood ASC);
 
 
EXPLAIN ANALYZE
SELECT 
public."Host".id,
public."Host".name,
COUNT(public."Host".id)
FROM public."Host"
INNER JOIN public."Listing"
ON public."Host".id = public."Listing".host_id
GROUP BY public."Host".id, public."Host".name
HAVING COUNT(public."Host".id) > 2
ORDER BY COUNT(public."Host".id) desc;

CREATE INDEX Query_6 ON "Listing"
USING btree (host_id ASC);


EXPLAIN ANALYZE
SELECT
public."Amenity".amenity_id,
public."Amenity".amenity_name
FROM public."Amenity"
INNER JOIN public."Amenity_Room"
ON public."Amenity".amenity_id = public."Amenity_Room".amenity_id
WHERE public."Amenity".amenity_name LIKE 'S%'
ORDER BY public."Amenity".amenity_name;

CREATE INDEX Query_7 ON "Amenity"
USING btree (amenity_id, amenity_name ASC);