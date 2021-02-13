/*1. Find all rentings from all hosts with response time an hour and response rate 100%
Output: 6695 rows affected.*/
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
  
/*2. Find all rentings of Rooms with 2 bedrooms
Output: 3265 rows affected.*/
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
  ORDER BY public."Price".price ;

/*3.Finds all neighbourhoods with geometry coordinates (0,0,0,0)
Output: 45 rows affected.*/

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

/*4.Top 10 hosts by listed houses.
Output: 735 rows affected.*/
SELECT 
public."Host".id,
public."Host".name,
COUNT(public."Host".id)
FROM public."Host"
INNER JOIN public."Listing"
ON public."Host".id = public."Listing".host_id
GROUP BY public."Host".id, public."Host".name
HAVING COUNT(public."Host".id) > 2
ORDER BY COUNT(public."Host".id) desc
limit 10;

/*5. Ratings of amenities starting with S letter
Output: 25 rows affected.*/
SELECT
public."Amenity".amenity_id,
public."Amenity".amenity_name
FROM public."Amenity"
INNER JOIN public."Amenity_Room"
ON public."Amenity".amenity_id = public."Amenity_Room".amenity_id
WHERE public."Amenity".amenity_name LIKE 'S%'
ORDER BY public."Amenity".amenity_name;