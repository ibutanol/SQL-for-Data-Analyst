--Database erstellen mit name"book_shop" und ein table erstellen mit dem namen books
--INSERT INTO books(1,2,3,4) mit Values(1,2,3,4) erstellen!
-- Schritt für Schritt SQL Befehle(queries) lernen!


CREATE TABLE books 
	(
		book_id INT AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

--STRING FUNCTIONS


--CONCAT
SELECT CONCAT('pi', 'ckle');

SELECT CONCAT(author_fname,' ', author_lname) AS author_name FROM books;

SELECT CONCAT_WS('-',title, author_fname, author_lname) FROM books;


--SUBSTRING
SELECT SUBSTRING('Hello World', 1, 4);

SELECT SUBSTRING('Hello World', 7);

SELECT SUBSTRING('Hello World', -3);

SELECT SUBSTRING(title, 1, 10) AS 'short title' FROM books;
 
SELECT SUBSTR(title, 1, 10) AS 'short title' FROM books;

SELECT CONCAT
    (
        SUBSTRING(title, 1, 10),
        '...'
    ) AS 'short title'
FROM books;


--REPLACE
SELECT REPLACE('Hello World', 'Hell', '%$#@');
 
SELECT REPLACE('Hello World', 'l', '7');
 
SELECT REPLACE('Hello World', 'o', '0');
 
SELECT REPLACE('HellO World', 'o', '*');
 
SELECT
  REPLACE('cheese bread coffee milk', ' ', ' and ');
 
SELECT REPLACE(title, 'e ', '3') FROM books;

SELECT REPLACE(title, ' ', '-') FROM books;


--REVERSE und CONCAT VERSCHACHTELT
SELECT REVERSE('Hello World');
 
SELECT REVERSE('meow meow');
 
SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT('woof', REVERSE('woof'));
 
SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;


--CHARLENGTH
SELECT CHAR_LENGTH('Hello World');

SELECT CHAR_LENGTH(title) as length, title FROM books;
 
SELECT author_lname, CHAR_LENGTH(author_lname) AS 'length' FROM books;
 
SELECT CONCAT(author_lname, ' is ', CHAR_LENGTH(author_lname), ' characters long') FROM books;


--UPPER und CONCAT VERSCHACHTELT
SELECT UPPER('Hello World');
 
SELECT LOWER('Hello World');
 
SELECT UPPER(title) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', UPPER(title)) FROM books;
 
SELECT CONCAT('MY FAVORITE BOOK IS ', LOWER(title)) FROM books;


--ZUSATZ 
SELECT INSERT('Hello Bobby', 6, 0, 'There'); 

SELECT LEFT('omghahalol!', 3);

SELECT RIGHT('omghahalol!', 4);

SELECT REPEAT('ha', 4);

SELECT TRIM('  pickle  ');



--LÖSUNGEN ZUM TEST STRING FUNCTIONS 


--AUFGABE 1: Reverse and Uppercase the following sentence--

--"Why does my cat look at me with such hatred?"--

--LÖSUNG AUFGABE 1:

SELECT REVERSE(UPPER('Why does my cat look at me with such hatred?'));

------------------------------------------------------------------------------------------
----AUFGABE 2: Replace spaces in titles with '->'

--+--------------------------------------------------------------+
--| title                                                        |
--+--------------------------------------------------------------+
--| The->Namesake                                                |
--| Norse->Mythology                                             |
--| American->Gods                                               |
--| Interpreter->of->Maladies                                    |
--| A->Hologram->for->the->King:->A->Novel                       |
--| The->Circle                                                  |
--| The->Amazing->Adventures->of->Kavalier->&->Clay              |
--| Just->Kids                                                   |
--| A->Heartbreaking->Work->of->Staggering->Genius:              |
--| Coraline                                                     |
--| What->We->Talk->About->When->We->Talk->About->Love:->Stories |
--| Where->I'm->Calling->From:->Selected->Stories                |
--| White->Noise                                                 |
--| Cannery->Row                                                 |
--| Oblivion:->Stories                                           |
--| Consider->the->Lobster                                       |
--+--------------------------------------------------------------+    
----LÖSUNG AUFGABE 2:

SELECT REPLACE(title, ' ', '->') AS title FROM books;
------------------------------------------------------------------------------------------

--AUFGABE 3: Print this Out

--+----------------+----------------+
--| forwards       | backwards      |
--+----------------+----------------+
--| Lahiri         | irihaL         |
--| Gaiman         | namiaG         |
--| Gaiman         | namiaG         |
--| Lahiri         | irihaL         |
--| Eggers         | sreggE         |
--| Eggers         | sreggE         |
--| Chabon         | nobahC         |
--| Smith          | htimS          |
--| Eggers         | sreggE         |
--| Gaiman         | namiaG         |
--| Carver         | revraC         |
--| Carver         | revraC         |
--| DeLillo        | olliLeD        |
--| Steinbeck      | kcebnietS      |
--| Foster Wallace | ecallaW retsoF |
--| Foster Wallace | ecallaW retsoF |
--| Smith          | htimS          |
--+----------------+----------------+

--LÖSUNG AUFGABE 3:

SELECT 
    author_lname AS forwards, REVERSE(author_lname) AS backwards
FROM
    books;
------------------------------------------------------------------------------------------

--AUFGABE 4: Print this Out

--+----------------------+
--| full name in caps    |
--+----------------------+
--| JHUMPA LAHIRI        |
--| NEIL GAIMAN          |
--| NEIL GAIMAN          |
--| JHUMPA LAHIRI        |
--| DAVE EGGERS          |
--| DAVE EGGERS          |
--| MICHAEL CHABON       |
--| PATTI SMITH          |
--| DAVE EGGERS          |
--| NEIL GAIMAN          |
--| RAYMOND CARVER       |
--| RAYMOND CARVER       |
--| DON DELILLO          |
--| JOHN STEINBECK       |
--| DAVID FOSTER WALLACE |
--| DAVID FOSTER WALLACE |
--| ADAM SMITH           |
--+----------------------+

--LÖSUNG AUFGABE 4:

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS 'full name in caps' FROM books;

------------------------------------------------------------------------------------------
----AUFGABE 5: Make this happen!
--+--------------------------------------------------------------------------+
--| blurb                                                                    |
--+--------------------------------------------------------------------------+
--| The Namesake was released in 2003                                        |
--| Norse Mythology was released in 2016                                     |
--| American Gods was released in 2001                                       |
--| Interpreter of Maladies was released in 1996                             |
--| A Hologram for the King: A Novel was released in 2012                    |
--| The Circle was released in 2013                                          |
--| The Amazing Adventures of Kavalier & Clay was released in 2000           |
--| Just Kids was released in 2010                                           |
--| A Heartbreaking Work of Staggering Genius: was released in 2001          |
--| Coraline was released in 2003                                            |
--| What We Talk About When We Talk About Love: Stories was released in 1981 |
--| Where I'm Calling From: Selected Stories was released in 1989            |
--| White Noise was released in 1985                                         |
--| Cannery Row was released in 1945                                         |
--| Oblivion: Stories was released in 2004                                   |
--| Consider the Lobster was released in 2005                                |
--+--------------------------------------------------------------------------+

--LÖSUNG AUFGABE 5:

SELECT CONCAT(title, ' was released in ', released_year) AS blurb FROM books;
------------------------------------------------------------------------------------------

--AUFGABE 6: Print book titles and the length of each title!

--+-----------------------------------------------------+-----------------+
--| title                                               | character count |
--+-----------------------------------------------------+-----------------+
--| The Namesake                                        |              12 |
--| Norse Mythology                                     |              15 |
--| American Gods                                       |              13 |
--| Interpreter of Maladies                             |              23 |
--| A Hologram for the King: A Novel                    |              32 |
--| The Circle                                          |              10 |
--| The Amazing Adventures of Kavalier & Clay           |              41 |
--| Just Kids                                           |               9 |
--| A Heartbreaking Work of Staggering Genius:          |              42 |
--| Coraline                                            |               8 |
--| What We Talk About When We Talk About Love: Stories |              51 |
--| Where I'm Calling From: Selected Stories            |              40 |
--| White Noise                                         |              11 |
--| Cannery Row                                         |              11 |
--| Oblivion: Stories                                   |              17 |
--| Consider the Lobster                                |              20 |
--+-----------------------------------------------------+-----------------+
--
--LÖSUNG AUFGABE 6:

SELECT title, CHAR_LENGTH(title) AS character_count FROM books;
------------------------------------------------------------------------------------------
--AUFGABE 7 : 
--+---------------+-------------+--------------+
--| short title   | author      | quantity     |
--+---------------+-------------+--------------+
--| American G... | Gaiman,Neil | 12 in stock  |
--| A Heartbre... | Eggers,Dave | 104 in stock |
--+---------------+-------------+--------------+

--LÖSUNG AUFGABE 7:

SELECT 
    CONCAT(SUBSTR(title, 1, 10), '...') AS short_title,
    CONCAT(author_lname, ',', author_fname) AS author,
    CONCAT(stock_quantity, ' in stock') AS quantity
FROM
    books;
------------------------------------------------------------------------------------------
--MYSQL ALLE BEFEHLE ----> https://dev.mysql.com/doc/refman/8.0/en/string-functions.html <


