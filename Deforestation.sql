DROP VIEW IF EXISTS forestation;
CREATE VIEW forestation
AS
WITH forest_land AS
     (SELECT f.*, l.*, r.*
      FROM forest_area f
      LEFT JOIN land_area l
      ON f.country_code = l.country_code
      AND f.year = l.year
      INNER JOIN regions r
      ON f.country_code = l.country_code)
(SELECT SUM(f.forest_area_sqkm) * 100 / SUM(total_area_sq_mi * 2.59) AS f_percentage
FROM forestation)
