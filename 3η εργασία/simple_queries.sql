/*1. Find all rentings from all houses that will take place in the
31st of December 2020 and are available
Output: 6841 rows*/
SELECT * FROM public."Calendar"
  INNER JOIN public."Listings"
  ON public."Listings".id = public."Calendar".listing_id
  WHERE public."Calendar".available = true
  ORDER BY public."Calendar".listing_id;
  LIMIT 1000;
  
  
/*2. Find all neighbourhoods that their names start with "A"
and their geometry_coordinates (0, 0, 50, 0) are greater than 23.73 degrees*/
SELECT properties_neighbourhood, geometry_coordinates_0_0_50_0
FROM public."Geolocation"
WHERE properties_neighbourhood LIKE 'Α%'
  AND (geometry_coordinates_0_0_50_0 LIKE '23.73%'
	   OR geometry_coordinates_0_0_50_0 LIKE '23.74%'
	   OR geometry_coordinates_0_0_50_0 LIKE '23.75%')
  ORDER BY geometry_coordinates_0_0_50_0;
  
  
/*3. Find all rooms and their prices in neighbourhoods that their names start with "Π"*/
SELECT name, neighbourhood, price
FROM public."Listings_Summary"
WHERE public."Listings_Summary".neighbourhood LIKE 'Π%'
ORDER BY price;


/*4. Find all comments from all houses that includes the word 'Cathy'
Output: 5 rows affected */
SELECT
  public."Reviews".listing_id,
  public."Reviews".date,
  public."Reviews".comments,
  public."Reviews_Summary".listing_id,
  public."Reviews_Summary".date
  FROM public."Reviews"
  INNER JOIN public."Reviews_Summary"
  ON public."Reviews".listing_id = public."Reviews_Summary".listing_id AND public."Reviews".date = public."Reviews_Summary".date
  WHERE 
  public."Reviews".comments LIKE '%Cathy%'
  ORDER BY public."Reviews".listing_id;
  
  
/*5. Find all reviewers with name starting from 'S'
Output: 33932 rows affected*/
SELECT
  public."Reviews".listing_id,
  public."Reviews".date,
  public."Reviews".comments,
  public."Reviews".reviewer_name,
  public."Reviews_Summary".listing_id,
  public."Reviews_Summary".date
  FROM public."Reviews"
  INNER JOIN public."Reviews_Summary"
  ON public."Reviews".listing_id = public."Reviews_Summary".listing_id AND public."Reviews".date = public."Reviews_Summary".date
  WHERE public."Reviews".reviewer_name LIKE '%S%'
  ORDER BY public."Reviews".listing_id
  LIMIT 100;
  
  
/*6. Find all reviews from all houses that are reviewed by people whose name starts with 'L'
Output: 19953 rows affected*/
SELECT
  public."Reviews".reviewer_id,
  public."Reviews".reviewer_name,  
  public."Reviews".comments,
  public."Reviews_Summary".listing_id,
  public."Reviews_Summary".date
  FROM public."Reviews"
  FULL OUTER JOIN public."Reviews_Summary"
  ON public."Reviews".listing_id = public."Reviews_Summary".listing_id AND public."Reviews".date = public."Reviews_Summary".date
  WHERE public."Reviews".reviewer_name LIKE 'L%'
  ORDER BY public."Reviews".listing_id
  LIMIT 100;


/*7. Find all houses that are available 365 days and the price is under $50
Output: 7441 rows affected*/
   SELECT 
   public."Listings".id,
   public."Listings".city,
   public."Listings".first_review ,
   public."Listings".last_review ,
   public."Listings".availability_365,
   public."Listings".host_id,
   public."Listings".host_name,
   public."Listings".host_location,
   public."Listings".price,
   public."Listings".review_scores_cleanliness,
   public."Listings".review_scores_checkin,
   public."Listings".review_scores_communication,
   public."Listings".review_scores_location,
   public."Listings_Summary".id,
   public."Listings_Summary".name
   
   FROM public."Listings" 
   FULL OUTER JOIN public."Listings_Summary"
   ON  public."Listings".id = public."Listings_Summary".id 
   WHERE public."Listings".price < '50'
   ORDER BY public."Listings".id 
   LIMIT 50;


/*8.Find all rentigs with price under $100 and whose took a place 01/01/2019 
Output: 261 rows affected*/
SELECT 
public."Listings_Summary".id,
public."Listings_Summary".name,
public."Listings_Summary".host_name,
public."Listings_Summary".neighbourhood,
public."Listings_Summary".room_type,
public."Listings_Summary".price,
public."Listings_Summary".minimum_nights,
public."Listings_Summary".availability_365,
public."Reviews_Summary".listing_id,
public."Reviews_Summary".date

FROM public."Listings_Summary"
 FULL OUTER JOIN  public."Reviews_Summary"
 ON  public."Listings_Summary".id = public."Reviews_Summary".listing_id 
 WHERE public."Listings_Summary".price < '100' AND public."Reviews_Summary".date = '2019-01-01'
ORDER BY public."Listings_Summary".id 
LIMIT 50;


/*9. Calculate the amount of rentings with price under $50
Output: 1 rows affected*/
SELECT COUNT(public."Calendar".price) FROM public."Calendar"
WHERE public."Calendar".price < '50';


/*10. Show all reviews from houses that are available for max 30 days
Output: 187577 rows affected*/
SELECT 
  public."Listings".id,
  public."Listings".name,
  public."Listings".neighbourhood,
  public."Listings".city,
  public."Listings".availability_30,
  public."Listings".number_of_reviews,
  public."Reviews".listing_id,
  public."Reviews".date,
  public."Reviews".comments
  FROM public."Listings"
  LEFT OUTER JOIN public."Reviews"
  ON public."Listings".id = public."Reviews".listing_id
  WHERE public."Listings".number_of_reviews <'100'
  ORDER BY public."Listings".id
  LIMIT 50;
  
  
/*11.Finds all spaces of neighbourhoods between 23 and 24 square kilometers with gemeotry coordinete (0,0,10,0)
Output: 45 rows affected*/
SELECT 
public."Geolocation".type,
public."Geolocation".geometry_type,
public."Geolocation".geometry_coordinates_0_0_10_0,
public."Neighbourhoods".neighbourhood
FROM public."Geolocation"
RIGHT OUTER JOIN public."Neighbourhoods"
ON public."Geolocation".properties_neighbourhood = public."Neighbourhoods".neighbourhood
WHERE public."Geolocation".geometry_coordinates_0_0_10_0 BETWEEN '23%' AND '24%'
ORDER BY public."Neighbourhoods".neighbourhood;

/*12. Finds all house prices from $30 to $50
Output: 191716 rows affected*/
SELECT 
public."Listings_Summary".host_name,
public."Listings_Summary".neighbourhood,
public."Listings_Summary".longitude,
public."Listings_Summary".room_type,
public."Listings_Summary".price,
public."Listings_Summary".minimum_nights,
public."Reviews".reviewer_id,
public."Reviews".reviewer_name,
public."Reviews".comments

FROM public."Listings_Summary"
FULL OUTER JOIN public."Reviews"
ON public."Listings_Summary".id = public."Reviews".listing_id
WHERE public."Listings_Summary".price BETWEEN '30' AND '50'
ORDER BY public."Listings_Summary".price 
limit 100;