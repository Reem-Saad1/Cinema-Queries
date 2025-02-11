use project;
-- 1. Retrieve all records from `cleaned_file`
SELECT * FROM cleaned_file;

-- 2. Count the total records in `cleaned_file`
SELECT COUNT(*) FROM cleaned_file;

-- 3. Retrieve all unique genres in `cleaned_file`
SELECT DISTINCT genre FROM cleaned_file;

-- 4. Find the top 5 highest-rated places
SELECT name, rating FROM cleaned_file ORDER BY rating DESC LIMIT 5;

-- 5. Count how many places have a rating of 4 or higher
SELECT COUNT(*) FROM cleaned_file WHERE rating >= 4;

-- 6. Find locations with missing `best_comment`
SELECT name, location FROM cleaned_file WHERE best_comment IS NULL;

-- 7. Retrieve all records where review_count is greater than 9900
SELECT * FROM cleaned_file WHERE review_count > 9900;

-- 8. Find the number of locations per genre
SELECT genre, COUNT(*) AS total FROM cleaned_file GROUP BY genre;

-- 9. Find the average rating for movie theaters
SELECT AVG(rating) FROM cleaned_file WHERE genre = 'Movie theater';

-- 10. Find all places located in Saudi Arabia
SELECT name, location FROM cleaned_file WHERE location LIKE '%Saudi Arabia%';

-- 11. Find all locations with a rating of 0
SELECT name, location FROM cleaned_file WHERE rating = 0;



#Bonus

DELIMITER $$

CREATE FUNCTION average_rating(cinema_name VARCHAR(255)) 
RETURNS DECIMAL(3,2)
DETERMINISTIC
BEGIN
  DECLARE avg_rating DECIMAL(3,2);
  
  SELECT AVG(rating) INTO avg_rating
  FROM cleaned_file
  WHERE cinema_name = cinema_name;
  
  RETURN avg_rating;
END $$

DELIMITER ;




SELECT average_rating('CineMax') AS avg_rating;

