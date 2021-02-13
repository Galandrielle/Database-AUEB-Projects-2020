ALTER TABLE public."Calendar"
ADD PRIMARY KEY (listing_id, date);

ALTER TABLE public."Listings"
ADD PRIMARY KEY (id);

ALTER TABLE public."Reviews"
ADD PRIMARY KEY (id);

ALTER TABLE public."Listings_Summary"
ADD PRIMARY KEY (id);

ALTER TABLE public."Neighbourhoods"
ADD PRIMARY KEY (neighbourhood);

ALTER TABLE public."Geolocation"
ADD PRIMARY KEY (geometry_coordinates_0_0_0_0);


ALTER TABLE  public."Listings"
ADD FOREIGN KEY (listing_id) REFERENCES public."Listings_Summary"(id);

ALTER TABLE public."Listings_Summary"
ADD FOREIGN KEY (id) REFERENCES public."Listings"(id);

ALTER TABLE public."Reviews"
ADD FOREIGN KEY (listing_id) REFERENCES public."Listings_Summary"(id);

ALTER TABLE public."Reviews"
ADD FOREIGN KEY (listing_id) REFERENCES public."Listings"(id);

ALTER TABLE public."Reviews_Summary"
ADD FOREIGN KEY (listing_id) REFERENCES public."Listings_Summary"(id);

ALTER TABLE public."Reviews_Summary"
ADD FOREIGN KEY (listing_id) REFERENCES public."Listings"(id);

ALTER TABLE public."Geolocation"
ADD FOREIGN KEY (properties_neighbourhood) REFERENCES public."Neighbourhoods"(neighbourhood);