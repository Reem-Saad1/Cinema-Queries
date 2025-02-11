# Working-with-Cinema-Data-Set-in-MySQL-from-Scratch

You will get to know the common mistakes and then how to correct them as you progress.

# 🧠 Let`s learn how to load a csv file in MySQL
Step 1: Create or Select a Database Open MySQL Workbench. Create a new database or select an existing one.
<img width="393" alt="Screenshot 1446-08-12 at 3 50 00 pm" src="https://github.com/user-attachments/assets/b02434ef-71f6-4db2-93fd-aaa96fc50ef0" />

Step 2: Use the Table Data Import Wizard Right-click on the database in the Navigator panel. Select Table Data Import Wizard from the context menu.
<img width="861" alt="Screenshot 1446-08-12 at 3 50 33 pm" src="https://github.com/user-attachments/assets/4d5797a4-58a5-4f20-b686-cf3587c2fbd1" />

Step 3: Select the CSV File In the wizard, browse to and select the CSV file you want to import. Click Next.

# Let’s learn how we can play with this cinema dataset using some questions:

# 1. Retrieve all records from `cleaned_file`

```mysql
SELECT * FROM cleaned_file;

```
<img width="691" alt="Screenshot 1446-08-12 at 3 59 42 pm" src="https://github.com/user-attachments/assets/2a9b662f-a095-4d17-8814-5160959a8e65" />

# 2. Count the total records in `cleaned_file`

```mysql
SELECT COUNT(*) FROM cleaned_file;

```
<img width="450" alt="Screenshot 1446-08-12 at 4 07 55 pm" src="https://github.com/user-attachments/assets/ffd52dff-2141-4c9c-86ef-48534a0af398" />

# 3. Retrieve all unique genres in `cleaned_file`

```mysql
SELECT DISTINCT genre FROM cleaned_file;

```
<img width="496" alt="Screenshot 1446-08-12 at 4 09 08 pm" src="https://github.com/user-attachments/assets/877a4579-75e6-42cb-90c1-315e74591b54" />

# 4. Find the top 5 highest-rated places
```mysql
SELECT name, rating FROM cleaned_file ORDER BY rating DESC LIMIT 5;

```
<img width="595" alt="Screenshot 1446-08-12 at 4 09 36 pm" src="https://github.com/user-attachments/assets/fcd29ad4-f3a6-4de1-9203-a550835dcddc" />

# 5. Count how many places have a rating of 4 or higher
```mysql
SELECT COUNT(*) FROM cleaned_file WHERE rating >= 4;
```
<img width="498" alt="Screenshot 1446-08-12 at 4 10 27 pm" src="https://github.com/user-attachments/assets/498ccb06-a374-4b94-94d4-c2e58024fea5" />

# 6. Find locations with missing `best_comment`
```mysql
SELECT name, location FROM cleaned_file WHERE best_comment IS NULL;
```
<img width="625" alt="Screenshot 1446-08-12 at 4 11 38 pm" src="https://github.com/user-attachments/assets/f5722359-dcf1-4b72-84d1-4af14c4f1740" />


# 7. Retrieve all records where review_count is greater than 9900
```mysql
SELECT * FROM cleaned_file WHERE review_count > 9900;

```
<img width="753" alt="Screenshot 1446-08-12 at 4 13 20 pm" src="https://github.com/user-attachments/assets/e0667d39-4e94-4a42-bf08-02e2fece41ff" />

# 8. Find the number of locations per genre

```mysql
SELECT genre, COUNT(*) AS total FROM cleaned_file GROUP BY genre;

```
<img width="644" alt="Screenshot 1446-08-12 at 4 14 00 pm" src="https://github.com/user-attachments/assets/fe095df0-12a9-4de6-9f9f-56394403ef8d" />

# 9. Find the average rating for movie theaters

```mysql
SELECT genre, COUNT(*) AS total FROM cleaned_file GROUP BY genre;

```
<img width="705" alt="Screenshot 1446-08-12 at 4 14 34 pm" src="https://github.com/user-attachments/assets/c07c26ab-ff41-49cf-b49a-d1a1bdcb32a9" />

# 10. Find all places located in Saudi Arabia

```mysql
SELECT name, location FROM cleaned_file WHERE location LIKE '%Saudi Arabia%';

```
<img width="700" alt="Screenshot 1446-08-12 at 4 15 22 pm" src="https://github.com/user-attachments/assets/b50b813d-52ca-4868-823f-2a4913a6d916" />


# 11. Find all locations with a rating of 0

```mysql
SELECT name, location FROM cleaned_file WHERE rating = 0;

```
<img width="629" alt="Screenshot 1446-08-12 at 4 16 02 pm" src="https://github.com/user-attachments/assets/8d75b706-37dd-46f9-8643-1d44bbf7a72e" />

# Calculate Average Rating for a Specific Cinema 
```mysql

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
```

<img width="485" alt="Screenshot 1446-08-12 at 4 16 32 pm" src="https://github.com/user-attachments/assets/34821d00-4287-40f4-9b95-28a7fb627827" />







