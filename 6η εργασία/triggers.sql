CREATE FUNCTION update_listings_count() RETURNS TRIGGER AS $BODY$
BEGIN
      IF (TG_OP = 'INSERT') THEN
         UPDATE Host
         SET listings_count = listings_count + 1;
      ELSIF (TG_OP = 'DELETE') THEN
         UPDATE Host
         SET listings_count = listings_count - 1;
      END IF;
      RETURN NULL;
END;
$BODY$ LANGUAGE  plpgsql;

CREATE TRIGGER update_listing
AFTER INSERT OR DELETE ON public."Listing"
   FOR EACH ROW EXECUTE PROCEDURE update_listings_count();


CREATE FUNCTION append() RETURNS TRIGGER AS $BODY$
BEGIN 
     IF (TG_OP = 'INSERT') THEN 
        IF NEW.listing_id NOT IN (SELECT listing_id FROM Review_Summary) THEN
            INSERT INTO Review_Summary(listing_id,date)
            VALUES(NEW.listing_id,NEW.date);
        END IF;
     END IF;
     RETURN NULL;
END;
$BODY$ LANGUAGE  plpgsql;


CREATE TRIGGER rev_sum_update
BEFORE INSERT ON public."Review"
    FOR EACH ROW EXECUTE PROCEDURE append();

/*Το παραπάνω trigger με την είσοδο δεδομένων στον πίνακα Review και τις αντιγράφει στον πίνακα Review_Summary.*/
            
