-- Exercises


-- 2.

USE albums_db;

SELECT DATABASE();

SHOW tables;


-- 3.

DESCRIBE albums;

SHOW albums;

SELECT *
	FROM albums;
-- There are 31 rows.

SELECT DISTINCT artist
FROM albums;
-- There are 23 rows of unique artists.

DESCRIBE albums;
-- The primary key is id.

SELECT *
	FROM albums
	ORDER BY release_date;
-- The oldest release date is 1967.
-- The most recent release date is 2011


-- 4.

SELECT *
	FROM albums
	WHERE artist = 'Pink Floyd';
-- The albums are named The Dark Side of the Moon and The Walls

SELECT *
	FROM albums
	WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- The year is 1967

SELECT *
	FROM albums
	WHERE name = "Nevermind";
-- The genre is grunge, alternative rock

SELECT `name`,
			release_date
	FROM albums
	WHERE release_date between 1990 and 1999;
/*	
The Bodyguard	1992
Jagged Little Pill	1995
Come On Over	1997
Falling into You	1996
Let's Talk About Love	1997
Dangerous	1991
The Immaculate Collection	1990
Titanic: Music from the Motion Picture	1997
Metallica	1991
Nevermind	1991
Supernatural	1999
*/
	
SELECT *
	FROM albums
	WHERE sales < 20;
	

SELECT *
	FROM albums
	WHERE genre = 'Rock';
-- The 'Rock' variable is different specifically from 'Hard Rock' and 'Progressive rock'



	
